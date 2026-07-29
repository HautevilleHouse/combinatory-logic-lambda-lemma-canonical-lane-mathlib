import CombinatoryLogicLambdaLemmaCanonicalLaneLean.StandardizationTheorem

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

structure ChurchRosserPackage {L : LambdaTerm} (S : StandardizationPackage L) where
  diamondProperty : Prop
  confluence : Prop
  uniqueNormalForms : Prop

structure ChurchRosserEvidence {L : LambdaTerm} {S : StandardizationPackage L} (C : ChurchRosserPackage S) where
  diamondPropertyClosed : C.diamondProperty
  confluenceClosed : C.confluence
  uniqueNormalFormsClosed : C.uniqueNormalForms

def ChurchRosserClosed {L : LambdaTerm} {S : StandardizationPackage L} (C : ChurchRosserPackage S) : Prop :=
  C.diamondProperty ∧ C.confluence ∧ C.uniqueNormalForms

theorem church_rosser_closed_from_evidence {L : LambdaTerm} {S : StandardizationPackage L} (C : ChurchRosserPackage S) (E : ChurchRosserEvidence C) : ChurchRosserClosed C := by
  exact And.intro E.diamondPropertyClosed (And.intro E.confluenceClosed E.uniqueNormalFormsClosed)

end CombinatoryLogicLambdaLemmaCanonicalLaneLean
end HautevilleHouse