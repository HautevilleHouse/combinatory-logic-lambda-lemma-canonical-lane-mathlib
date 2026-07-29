import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

structure ChurchRosserPackage (A : AdmissibleClass) where
  diamondProperty : Prop
  confluence : Prop
  uniqueNormalForms : Prop
  reductionEquivalence : Prop

structure ChurchRosserEvidence (A : AdmissibleClass) (P : ChurchRosserPackage A) where
  diamondPropertyClosed : P.diamondProperty
  confluenceClosed : P.confluence
  uniqueNormalFormsClosed : P.uniqueNormalForms
  reductionEquivalenceClosed : P.reductionEquivalence

def ChurchRosserClosed (A : AdmissibleClass) (P : ChurchRosserPackage A) : Prop :=
  P.diamondProperty ∧ P.confluence ∧ P.uniqueNormalForms ∧ P.reductionEquivalence

theorem church_rosser_closed_from_evidence (A : AdmissibleClass) (P : ChurchRosserPackage A) (E : ChurchRosserEvidence A P) : ChurchRosserClosed A P :=
  And.intro E.diamondPropertyClosed (And.intro E.confluenceClosed (And.intro E.uniqueNormalFormsClosed E.reductionEquivalenceClosed))

end CombinatoryLogicLambdaLemmaCanonicalLaneLean
end HautevilleHouse