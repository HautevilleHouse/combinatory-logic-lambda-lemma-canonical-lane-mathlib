import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatoryLogicLambdaLemmaCanonicalLaneLean.CLTermStructure
import HautevilleHouse.CombinatoryLogicLambdaLemmaCanonicalLaneLean.CLStandardization

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

/-!
# Lambda Lemma for Combinatory Logic
-/

structure LambdaLemmaPackage where
  clTerm : CLTerm
  lambdaTerm : Type
  translationExists : Prop
  translationPreservesReduction : Prop
  translationInjective : Prop

structure LambdaLemmaEvidence (P : LambdaLemmaPackage) where
  translationExistsClosed : P.translationExists
  translationPreservesReductionClosed : P.translationPreservesReduction
  translationInjectiveClosed : P.translationInjective

def LambdaLemmaClosed (P : LambdaLemmaPackage) : Prop :=
  P.translationExists ∧ P.translationPreservesReduction ∧ P.translationInjective

theorem lambda_lemma_closed_from_evidence (P : LambdaLemmaPackage) (E : LambdaLemmaEvidence P) :
    LambdaLemmaClosed P := by
  exact And.intro E.translationExistsClosed
    (And.intro E.translationPreservesReductionClosed E.translationInjectiveClosed)

end HautevilleHouse
end CombinatoryLogicLambdaLemmaCanonicalLaneLean
