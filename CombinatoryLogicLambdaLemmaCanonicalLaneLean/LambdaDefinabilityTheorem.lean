import CombinatoryLogicLambdaLemmaCanonicalLaneLean.ChurchRosserTheorem

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

structure LambdaDefinabilityPackage {L : LambdaTerm} {S : StandardizationPackage L} (C : ChurchRosserPackage S) where
  recursiveFunctionsRepresented : Prop
  fixpointCombinatorExists : Prop
  undecidabilityProof : Prop

structure LambdaDefinabilityEvidence {L : LambdaTerm} {S : StandardizationPackage L} {C : ChurchRosserPackage S} (D : LambdaDefinabilityPackage C) where
  recursiveFunctionsRepresentedClosed : D.recursiveFunctionsRepresented
  fixpointCombinatorExistsClosed : D.fixpointCombinatorExists
  undecidabilityProofClosed : D.undecidabilityProof

def LambdaDefinabilityClosed {L : LambdaTerm} {S : StandardizationPackage L} {C : ChurchRosserPackage S} (D : LambdaDefinabilityPackage C) : Prop :=
  D.recursiveFunctionsRepresented ∧ D.fixpointCombinatorExists ∧ D.undecidabilityProof

theorem lambda_definability_closed_from_evidence {L : LambdaTerm} {S : StandardizationPackage L} {C : ChurchRosserPackage S} (D : LambdaDefinabilityPackage C) (E : LambdaDefinabilityEvidence D) : LambdaDefinabilityClosed D := by
  exact And.intro E.recursiveFunctionsRepresentedClosed (And.intro E.fixpointCombinatorExistsClosed E.undecidabilityProofClosed)

end CombinatoryLogicLambdaLemmaCanonicalLaneLean
end HautevilleHouse