import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

structure LambdaTerm where
  var : String
  app : LambdaTerm → LambdaTerm → LambdaTerm
  lam : String → LambdaTerm → LambdaTerm

def betaReduction (t s : LambdaTerm) : LambdaTerm := sorry

def etaReduction (t : LambdaTerm) : LambdaTerm := sorry

structure CombinatoryLogicBase where
  primitiveCombinators : List LambdaTerm
  reductionRules : List (LambdaTerm × LambdaTerm)
  strongNormalization : Prop

def CombinatoryWitnessClosed (O : CombinatoryLogicBase) : Prop := O.strongNormalization

end CombinatoryLogicLambdaLemmaCanonicalLaneLean
end HautevilleHouse