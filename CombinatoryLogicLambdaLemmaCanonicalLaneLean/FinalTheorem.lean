import canonicalLaneMathlib.AdmissibleClass
import CombinatoryLogicLambdaLemmaCanonicalLaneLean.LambdaLemmaBridge

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

def ConstrainedLambdaLemmaClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_lambda_lemma_endgame (A : AdmissibleClass) : ConstrainedLambdaLemmaClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CombinatoryLogicLambdaLemmaCanonicalLaneLean
end HautevilleHouse