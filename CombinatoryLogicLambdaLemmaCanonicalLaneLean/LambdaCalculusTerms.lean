import combinatoryLogicLambdaLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

structure LambdaTerm where
  var : String
  app : LambdaTerm -> LambdaTerm -> LambdaTerm
  lam : String -> LambdaTerm -> LambdaTerm

def subst (t : LambdaTerm) (x : String) (s : LambdaTerm) : LambdaTerm :=
  match t with
  | LambdaTerm.var y => if y = x then s else t
  | LambdaTerm.app t1 t2 => LambdaTerm.app (subst t1 x s) (subst t2 x s)
  | LambdaTerm.lam y t' => 
    if y = x then t else LambdaTerm.lam y (subst t' x s)

inductive BetaReduction : LambdaTerm -> LambdaTerm -> Prop where
  | beta : BetaReduction (LambdaTerm.app (LambdaTerm.lam x t) s) (subst t x s)
  | appL : BetaReduction t1 t1' -> BetaReduction (LambdaTerm.app t1 t2) (LambdaTerm.app t1' t2)
  | appR : BetaReduction t2 t2' -> BetaReduction (LambdaTerm.app t1 t2) (LambdaTerm.app t1 t2')
  | lam : BetaReduction t t' -> BetaReduction (LambdaTerm.lam x t) (LambdaTerm.lam x t')

def confluent : Prop :=
  ∀ t u v, BetaReduction t u ∧ BetaReduction t v → ∃ w, BetaReduction u w ∧ BetaReduction v w

def normalizing : Prop :=
  ∀ t, ∃ n, BetaReduction t n ∧ (∀ n', ¬ BetaReduction n n')

structure ConfluenceResult where
  confluent : confluent
  normalizing : normalizing

end CombinatoryLogicLambdaLemmaCanonicalLaneLean
end HautevilleHouse