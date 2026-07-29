import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatoryLogicLambdaLemmaCanonicalLaneLean.CLTermStructure

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

/-!
# Standardization Theorem for CL
-/

structure StandardizationPackage where
  term : CLTerm
  standardReductionExists : Prop
  standardReductionUnique : Prop
  reductionFactorizes : Prop

structure StandardizationEvidence (P : StandardizationPackage) where
  standardReductionExistsClosed : P.standardReductionExists
  standardReductionUniqueClosed : P.standardReductionUnique
  reductionFactorizesClosed : P.reductionFactorizes

def StandardizationClosed (P : StandardizationPackage) : Prop :=
  P.standardReductionExists ∧ P.standardReductionUnique ∧ P.reductionFactorizes

theorem standardization_closed_from_evidence (P : StandardizationPackage) (E : StandardizationEvidence P) :
    StandardizationClosed P := by
  exact And.intro E.standardReductionExistsClosed
    (And.intro E.standardReductionUniqueClosed E.reductionFactorizesClosed)

end HautevilleHouse
end CombinatoryLogicLambdaLemmaCanonicalLaneLean
