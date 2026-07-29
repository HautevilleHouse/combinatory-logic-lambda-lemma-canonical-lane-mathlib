import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

structure StandardizationPackage (A : AdmissibleClass) where
  leftmostReduction : Prop
  standardReductionSequence : Prop
  standardizationTheorem : Prop
  reductionStrategy : Prop

structure StandardizationEvidence (A : AdmissibleClass) (P : StandardizationPackage A) where
  leftmostReductionClosed : P.leftmostReduction
  standardReductionSequenceClosed : P.standardReductionSequence
  standardizationTheoremClosed : P.standardizationTheorem
  reductionStrategyClosed : P.reductionStrategy

def StandardizationClosed (A : AdmissibleClass) (P : StandardizationPackage A) : Prop :=
  P.leftmostReduction ∧ P.standardReductionSequence ∧ P.standardizationTheorem ∧ P.reductionStrategy

theorem standardization_closed_from_evidence (A : AdmissibleClass) (P : StandardizationPackage A) (E : StandardizationEvidence A P) : StandardizationClosed A P :=
  And.intro E.leftmostReductionClosed (And.intro E.standardReductionSequenceClosed (And.intro E.standardizationTheoremClosed E.reductionStrategyClosed))

end CombinatoryLogicLambdaLemmaCanonicalLaneLean
end HautevilleHouse