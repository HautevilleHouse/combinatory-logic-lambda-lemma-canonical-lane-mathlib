import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

structure TermReductionPackage (A : AdmissibleClass) where
  combinatorialReduction : Prop
  weakLambdaReduction : Prop
  diamondProperty : Prop
  confluence : Prop

structure TermReductionEvidence (A : AdmissibleClass) (P : TermReductionPackage A) where
  combinatorialReductionClosed : P.combinatorialReduction
  weakLambdaReductionClosed : P.weakLambdaReduction
  diamondPropertyClosed : P.diamondProperty
  confluenceClosed : P.confluence

def TermReductionClosed (A : AdmissibleClass) (P : TermReductionPackage A) : Prop :=
  P.combinatorialReduction ∧ P.weakLambdaReduction ∧ P.diamondProperty ∧ P.confluence

theorem term_reduction_closed_from_evidence (A : AdmissibleClass) (P : TermReductionPackage A) (E : TermReductionEvidence A P) : TermReductionClosed A P :=
  And.intro E.combinatorialReductionClosed (And.intro E.weakLambdaReductionClosed (And.intro E.diamondPropertyClosed E.confluenceClosed))

end CombinatoryLogicLambdaLemmaCanonicalLaneLean
end HautevilleHouse