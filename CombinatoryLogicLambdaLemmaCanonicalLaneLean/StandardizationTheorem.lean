import CombinatoryLogicLambdaLemmaCanonicalLaneLean.LambdaCalculusObjects

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

structure StandardizationPackage (L : LambdaTerm) where
  reductionSequence : List LambdaTerm
  leftmostReduction : Prop
  standardReduction : Prop
  reductionComplete : Prop

structure StandardizationEvidence {L : LambdaTerm} (S : StandardizationPackage L) where
  leftmostReductionClosed : S.leftmostReduction
  standardReductionClosed : S.standardReduction
  reductionCompleteClosed : S.reductionComplete

def StandardizationClosed {L : LambdaTerm} (S : StandardizationPackage L) : Prop :=
  S.leftmostReduction ∧ S.standardReduction ∧ S.reductionComplete

theorem standardization_closed_from_evidence {L : LambdaTerm} (S : StandardizationPackage L) (E : StandardizationEvidence S) : StandardizationClosed S := by
  exact And.intro E.leftmostReductionClosed (And.intro E.standardReductionClosed E.reductionCompleteClosed)

end CombinatoryLogicLambdaLemmaCanonicalLaneLean
end HautevilleHouse