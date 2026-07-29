import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatoryLogicLambdaLemmaCanonicalLaneLean.CLTermStructure

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

/-!
# Fixed Point Combinator in CL
-/

structure FixedPointPackage where
  fixedPointCombinator : CLTerm
  fixedPointProperty : Prop
  combinatorFromSK : Prop
  derivedFromY : Prop

structure FixedPointEvidence (P : FixedPointPackage) where
  fixedPointPropertyClosed : P.fixedPointProperty
  combinatorFromSKClosed : P.combinatorFromSK
  derivedFromYClosed : P.derivedFromY

def FixedPointClosed (P : FixedPointPackage) : Prop :=
  P.fixedPointProperty ∧ P.combinatorFromSK ∧ P.derivedFromY

theorem fixed_point_closed_from_evidence (P : FixedPointPackage) (E : FixedPointEvidence P) :
    FixedPointClosed P := by
  exact And.intro E.fixedPointPropertyClosed
    (And.intro E.combinatorFromSKClosed E.derivedFromYClosed)

end HautevilleHouse
end CombinatoryLogicLambdaLemmaCanonicalLaneLean
