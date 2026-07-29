import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatoryLogicLambdaLemmaCanonicalLaneLean.CombinatoryLogic

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

structure LambdaLemmaStatement where
  combinatoryLogicCompleteImpliesLambdaDefinability : Prop
  lambdaDefinableImplementsCombinatoryLogic : Prop
  equivalenceProof : Prop

structure LambdaLemmaEvidence (L : LambdaLemmaStatement) where
  combinatoryLogicCompleteImpliesLambdaDefinabilityClosed : L.combinatoryLogicCompleteImpliesLambdaDefinability
  lambdaDefinableImplementsCombinatoryLogicClosed : L.lambdaDefinableImplementsCombinatoryLogic
  equivalenceProofClosed : L.equivalenceProof

def LambdaLemmaClosed (L : LambdaLemmaStatement) : Prop :=
  L.combinatoryLogicCompleteImpliesLambdaDefinability ∧
  L.lambdaDefinableImplementsCombinatoryLogic ∧
  L.equivalenceProof

theorem lambda_lemma_closed_from_evidence (L : LambdaLemmaStatement) (E : LambdaLemmaEvidence L) :
    LambdaLemmaClosed L := by
  exact And.intro E.combinatoryLogicCompleteImpliesLambdaDefinabilityClosed
    (And.intro E.lambdaDefinableImplementsCombinatoryLogicClosed E.equivalenceProofClosed)

end CombinatoryLogicLambdaLemmaCanonicalLaneLean
end HautevilleHouse