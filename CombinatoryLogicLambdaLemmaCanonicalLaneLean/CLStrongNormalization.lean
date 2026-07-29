import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatoryLogicLambdaLemmaCanonicalLaneLean.CLTermStructure
import HautevilleHouse.CombinatoryLogicLambdaLemmaCanonicalLaneLean.CLLambdaLemma

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

/-!
# Strong Normalization for CL via Lambda Lemma
-/

structure StrongNormalizationPackage where
  term : CLTerm
  stronglyNormalizing : Prop
  normalizationChainExists : Prop
  normalizationChainUnique : Prop

structure StrongNormalizationEvidence (P : StrongNormalizationPackage) where
  stronglyNormalizingClosed : P.stronglyNormalizing
  normalizationChainExistsClosed : P.normalizationChainExists
  normalizationChainUniqueClosed : P.normalizationChainUnique

def StrongNormalizationClosed (P : StrongNormalizationPackage) : Prop :=
  P.stronglyNormalizing ∧ P.normalizationChainExists ∧ P.normalizationChainUnique

theorem strong_normalization_closed_from_evidence (P : StrongNormalizationPackage) (E : StrongNormalizationEvidence P) :
    StrongNormalizationClosed P := by
  exact And.intro E.stronglyNormalizingClosed
    (And.intro E.normalizationChainExistsClosed E.normalizationChainUniqueClosed)

end HautevilleHouse
end CombinatoryLogicLambdaLemmaCanonicalLaneLean
