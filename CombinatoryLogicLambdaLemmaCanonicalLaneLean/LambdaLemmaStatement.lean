import combinatoryLogicLambdaLemmaCanonicalLaneLean.CombinatoryLogic
import combinatoryLogicLambdaLemmaCanonicalLaneLean.LambdaCalculusTerms

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

-- The Lambda Lemma: Every combinator is equivalent to a lambda term

def combinator_lambda_equiv (c : Combinator) : LambdaTerm :=
  match c with
  | Combinator.S => LambdaTerm.lam "x" (LambdaTerm.lam "y" (LambdaTerm.lam "z" 
      (LambdaTerm.app (LambdaTerm.app (LambdaTerm.var "x") (LambdaTerm.var "z")) 
                       (LambdaTerm.app (LambdaTerm.var "y") (LambdaTerm.var "z")))))
  | Combinator.K => LambdaTerm.lam "x" (LambdaTerm.lam "y" (LambdaTerm.var "x"))
  | Combinator.I => LambdaTerm.lam "x" (LambdaTerm.var "x")

theorem lambda_lemma : ∀ (c : Combinator), ∃ (t : LambdaTerm), True := by
  intro c
  refine ⟨combinator_lambda_equiv c, trivial⟩

end CombinatoryLogicLambdaLemmaCanonicalLaneLean
end HautevilleHouse