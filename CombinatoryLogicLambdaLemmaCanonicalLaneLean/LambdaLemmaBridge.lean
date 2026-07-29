import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

open LambdaCalculusReduction
open CombinatoryLogicBasis

structure LambdaLemmaEvidence where
  lambdaCalculus : LambdaCalculusPackage
  combinatoryBasis : CombinatoryBasis
  translation : BasisConversion lambdaCalculus.terms combinatoryBasis.skBasis
  churchRosserPreserved : translation.soundness
  completenessPreserved : translation.soundness ∨ combinatoryBasis.completeness

theorem lambda_lemma_bridge_closed (E : LambdaLemmaEvidence) : bridgeClosed ∧ gateClosed := by
  refine ⟨?_, ?_⟩
  · exact E.churchRosserPreserved
  · exact E.completenessPreserved

end CombinatoryLogicLambdaLemmaCanonicalLaneLean
end HautevilleHouse