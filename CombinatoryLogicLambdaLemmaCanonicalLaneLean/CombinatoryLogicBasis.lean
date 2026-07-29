import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

structure Combinator where
  symbol : String
  arity : Nat
  reductionRule : LambdaTerm → LambdaTerm
  application : LambdaTerm → LambdaTerm → LambdaTerm
  symbolUnique : symbol ≠ symbol  -- placeholder

structure CombinatoryBasis where
  combinators : List Combinator
  skBasis : S ∈ combinators ∧ K ∈ combinators
  completeness : ∀ t : LambdaTerm, ∃ c : Combinator, c.reductionRule t = t
  completenessProof : completeness
  skBasisProof : skBasis

structure BasisConversion where
  sourceBasis : CombinatoryBasis
  targetBasis : CombinatoryBasis
  translation : LambdaTerm → LambdaTerm
  soundness : ∀ t, translation (targetBasis.completeness t) = sourceBasis.completeness t
  soundnessProof : soundness

theorem combinatory_basis_closed (B : CombinatoryBasis) : CombinatoryBasis.closed := by
  exact And.intro B.skBasis B.completeness

end CombinatoryLogicLambdaLemmaCanonicalLaneLean
end HautevilleHouse