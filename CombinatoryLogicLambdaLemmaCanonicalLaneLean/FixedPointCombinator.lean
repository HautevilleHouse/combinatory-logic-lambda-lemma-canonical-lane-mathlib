import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

structure FixedPointCombinatorPackage (A : AdmissibleClass) where
  yCombinatorExists : Prop
  fixedPointProperty : Prop
  recursionTheorem : Prop
  churchRosserProperty : Prop

structure FixedPointCombinatorEvidence (A : AdmissibleClass) (P : FixedPointCombinatorPackage A) where
  yCombinatorExistsClosed : P.yCombinatorExists
  fixedPointPropertyClosed : P.fixedPointProperty
  recursionTheoremClosed : P.recursionTheorem
  churchRosserPropertyClosed : P.churchRosserProperty

def FixedPointCombinatorClosed (A : AdmissibleClass) (P : FixedPointCombinatorPackage A) : Prop :=
  P.yCombinatorExists ∧ P.fixedPointProperty ∧ P.recursionTheorem ∧ P.churchRosserProperty

theorem fixed_point_combinator_closed_from_evidence (A : AdmissibleClass) (P : FixedPointCombinatorPackage A) (E : FixedPointCombinatorEvidence A P) : FixedPointCombinatorClosed A P :=
  And.intro E.yCombinatorExistsClosed (And.intro E.fixedPointPropertyClosed (And.intro E.recursionTheoremClosed E.churchRosserPropertyClosed))

end CombinatoryLogicLambdaLemmaCanonicalLaneLean
end HautevilleHouse