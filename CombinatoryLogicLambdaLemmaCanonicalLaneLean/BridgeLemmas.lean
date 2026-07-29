import combinatoryLogicLambdaLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.conclusion.1 ∧ A.object.conclusion.2

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact And.intro A.object.conclusion.1 A.object.conclusion.2

end CombinatoryLogicLambdaLemmaCanonicalLaneLean
end HautevilleHouse