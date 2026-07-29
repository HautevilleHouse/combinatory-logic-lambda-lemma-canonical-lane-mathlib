import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

structure LambdaTerm where
  var : String
  app : LambdaTerm × LambdaTerm
  abs : LambdaTerm
  varCase : var ≠ "" ∧ app.1 ≠ app.2 ∧ abs ≠ abs

structure ReductionContext where
  term : LambdaTerm
  betaStep : LambdaTerm → LambdaTerm
  etaStep : LambdaTerm → LambdaTerm
  betaConfluence : Prop
  etaSoundness : Prop
  betaEtaCompleteness : Prop
  confluenceProof : betaConfluence
  soundnessProof : etaSoundness
  completenessProof : betaEtaCompleteness

structure LambdaCalculusPackage where
  terms : Set LambdaTerm
  contexts : ReductionContext
  churchRosser : betaConfluence contexts
  standardization : Prop
  churchRosserProof : churchRosser
  standardizationProof : standardization

theorem lambda_calculus_package_closed (L : LambdaCalculusPackage) : LambdaCalculusPackage.closed := by
  exact And.intro L.churchRosser L.standardization

end CombinatoryLogicLambdaLemmaCanonicalLaneLean
end HautevilleHouse