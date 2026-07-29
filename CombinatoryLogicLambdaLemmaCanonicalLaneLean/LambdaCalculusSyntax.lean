import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

inductive LambdaTerm where
  | var (name : String)
  | app (fn arg : LambdaTerm)
  | abs (var : String) (body : LambdaTerm)
deriving Repr, DecidableEq

structure LambdaTermStructure where
  term : LambdaTerm
  isClosed : Prop
  isWellTyped : Prop

structure LambdaTermEvidence (T : LambdaTermStructure) where
  isClosedClosed : T.isClosed
  isWellTypedClosed : T.isWellTyped

def LambdaTermClosed (T : LambdaTermStructure) : Prop :=
  T.isClosed ∧ T.isWellTyped

theorem lambda_term_closed_from_evidence (T : LambdaTermStructure) (E : LambdaTermEvidence T) :
    LambdaTermClosed T := by
  exact And.intro E.isClosedClosed E.isWellTypedClosed

end CombinatoryLogicLambdaLemmaCanonicalLaneLean
end HautevilleHouse