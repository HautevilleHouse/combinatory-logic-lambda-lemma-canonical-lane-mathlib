import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

structure CombinatorAdmittedObject where
  term : Type u
  reductionSystem : term -> term -> Prop
  confluenceProperty : Prop
  normalizationProperty : Prop
  conclusion : confluenceProperty ∧ normalizationProperty

structure AdmissibleClass where
  object : CombinatorAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.conclusion) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CombinatoryLogicLambdaLemmaCanonicalLaneLean
end HautevilleHouse