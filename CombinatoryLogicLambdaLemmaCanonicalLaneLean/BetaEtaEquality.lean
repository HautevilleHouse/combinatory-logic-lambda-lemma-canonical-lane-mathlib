import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

structure BetaEtaEqualityPackage (A : AdmissibleClass) where
  betaReduction : Prop
  etaExpansion : Prop
  betaEtaConversion : Prop
  extensionality : Prop

structure BetaEtaEqualityEvidence (A : AdmissibleClass) (P : BetaEtaEqualityPackage A) where
  betaReductionClosed : P.betaReduction
  etaExpansionClosed : P.etaExpansion
  betaEtaConversionClosed : P.betaEtaConversion
  extensionalityClosed : P.extensionality

def BetaEtaEqualityClosed (A : AdmissibleClass) (P : BetaEtaEqualityPackage A) : Prop :=
  P.betaReduction ∧ P.etaExpansion ∧ P.betaEtaConversion ∧ P.extensionality

theorem beta_eta_equality_closed_from_evidence (A : AdmissibleClass) (P : BetaEtaEqualityPackage A) (E : BetaEtaEqualityEvidence A P) : BetaEtaEqualityClosed A P :=
  And.intro E.betaReductionClosed (And.intro E.etaExpansionClosed (And.intro E.betaEtaConversionClosed E.extensionalityClosed))

end CombinatoryLogicLambdaLemmaCanonicalLaneLean
end HautevilleHouse