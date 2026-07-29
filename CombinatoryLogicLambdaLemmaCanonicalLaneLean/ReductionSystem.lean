import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatoryLogicLambdaLemmaCanonicalLaneLean.LambdaCalculusSyntax

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

structure ReductionRule where
  lhs : LambdaTerm
  rhs : LambdaTerm
  name : String

structure ReductionSystem where
  rules : List ReductionRule
  isConfluent : Prop
  isTerminating : Prop

structure ReductionEvidence (R : ReductionSystem) where
  isConfluentClosed : R.isConfluent
  isTerminatingClosed : R.isTerminating

def ReductionSystemClosed (R : ReductionSystem) : Prop :=
  R.isConfluent ∧ R.isTerminating

theorem reduction_system_closed_from_evidence (R : ReductionSystem) (E : ReductionEvidence R) :
    ReductionSystemClosed R := by
  exact And.intro E.isConfluentClosed E.isTerminatingClosed

end CombinatoryLogicLambdaLemmaCanonicalLaneLean
end HautevilleHouse