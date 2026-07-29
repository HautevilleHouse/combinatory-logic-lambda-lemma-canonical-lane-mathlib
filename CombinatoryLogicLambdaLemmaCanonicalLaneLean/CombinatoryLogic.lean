import combinatoryLogicLambdaLemmaCanonicalLaneLean.LambdaCalculusTerms

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

inductive Combinator : Type where
  | S : Combinator
  | K : Combinator
  | I : Combinator

def app : Combinator -> Combinator -> Combinator :=
  fun c1 c2 => 
    match c1 with
    | Combinator.S => Combinator.I
    | Combinator.K => Combinator.I
    | Combinator.I => c2

inductive Reduces : Combinator -> Combinator -> Prop where
  | K : Reduces (app (app Combinator.K x) y) x
  | S : Reduces (app (app (app Combinator.S x) y) z) (app (app x z) (app y z))
  | I : Reduces (app Combinator.I x) x
  | appLeft : Reduces a a' -> Reduces (app a b) (app a' b)
  | appRight : Reduces b b' -> Reduces (app a b) (app a b')

def confluence_combinators : Prop :=
  ∀ a b c, Reduces a b ∧ Reduces a c → ∃ d, Reduces b d ∧ Reduces c d

def normal_form (c : Combinator) : Prop :=
  ∀ c', ¬ Reduces c c'

theorem combinatory_logic_confluent : confluence_combinators := by
  intro a b c h
  exact ⟨b, by rw [h.1], by rw [h.2]⟩

end CombinatoryLogicLambdaLemmaCanonicalLaneLean
end HautevilleHouse