import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatoryLogicLambdaLemmaCanonicalLaneLean.CLTermStructure
import HautevilleHouse.CombinatoryLogicLambdaLemmaCanonicalLaneLean.CLStandardization
import HautevilleHouse.CombinatoryLogicLambdaLemmaCanonicalLaneLean.CLLambdaLemma
import HautevilleHouse.CombinatoryLogicLambdaLemmaCanonicalLaneLean.CLStrongNormalization
import HautevilleHouse.CombinatoryLogicLambdaLemmaCanonicalLaneLean.CLFixedPoint

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

/-!
# Constrained Theorem Closure for Combinatory Logic Lambda Lemma
-/

def ConstrainedCLLambdaLemmaClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_cl_lambda_lemma_endgame (A : AdmissibleClass) :
    ConstrainedCLLambdaLemmaClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end HautevilleHouse
end CombinatoryLogicLambdaLemmaCanonicalLaneLean
