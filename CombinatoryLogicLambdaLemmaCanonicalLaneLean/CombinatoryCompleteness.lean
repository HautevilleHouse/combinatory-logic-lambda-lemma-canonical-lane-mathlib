import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

structure CombinatoryCompletenessPackage (A : AdmissibleClass) where
  combinatoryAlgebra : Prop
  lambdaAbstraction : Prop
  combinatoryCompleteness : Prop
  translationEquivalence : Prop

structure CombinatoryCompletenessEvidence (A : AdmissibleClass) (P : CombinatoryCompletenessPackage A) where
  combinatoryAlgebraClosed : P.combinatoryAlgebra
  lambdaAbstractionClosed : P.lambdaAbstraction
  combinatoryCompletenessClosed : P.combinatoryCompleteness
  translationEquivalenceClosed : P.translationEquivalence

def CombinatoryCompletenessClosed (A : AdmissibleClass) (P : CombinatoryCompletenessPackage A) : Prop :=
  P.combinatoryAlgebra ∧ P.lambdaAbstraction ∧ P.combinatoryCompleteness ∧ P.translationEquivalence

theorem combinatory_completeness_closed_from_evidence (A : AdmissibleClass) (P : CombinatoryCompletenessPackage A) (E : CombinatoryCompletenessEvidence A P) : CombinatoryCompletenessClosed A P :=
  And.intro E.combinatoryAlgebraClosed (And.intro E.lambdaAbstractionClosed (And.intro E.combinatoryCompletenessClosed E.translationEquivalenceClosed))

end CombinatoryLogicLambdaLemmaCanonicalLaneLean
end HautevilleHouse