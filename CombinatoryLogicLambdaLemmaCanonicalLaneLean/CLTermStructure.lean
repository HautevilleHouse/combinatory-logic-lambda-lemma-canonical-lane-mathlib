import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoryLogicLambdaLemmaCanonicalLaneLean

/-!
# CL Term Structure
Basic definitions for combinatory logic terms: S, K, I, application, and reduction.
-/

inductive CLTerm : Type where
  | S : CLTerm
  | K : CLTerm
  | I : CLTerm
  | app : CLTerm → CLTerm → CLTerm
  deriving DecidableEq, Repr

inductive CLReduction : CLTerm → CLTerm → Prop where
  | K_reduce : ∀ x y : CLTerm, CLReduction (CLTerm.app (CLTerm.app CLTerm.K x) y) x
  | S_reduce : ∀ x y z : CLTerm, CLReduction (CLTerm.app (CLTerm.app (CLTerm.app CLTerm.S x) y) z)
                  (CLTerm.app (CLTerm.app x z) (CLTerm.app y z))
  | I_reduce : ∀ x : CLTerm, CLReduction (CLTerm.app CLTerm.I x) x
  | app_l : ∀ t1 t1' t2 : CLTerm, CLReduction t1 t1' → CLReduction (CLTerm.app t1 t2) (CLTerm.app t1' t2)
  | app_r : ∀ t1 t2 t2' : CLTerm, CLReduction t2 t2' → CLReduction (CLTerm.app t1 t2) (CLTerm.app t1 t2')

def CLTermReduction (t1 t2 : CLTerm) : Prop := CLReduction t1 t2

end HautevilleHouse
end CombinatoryLogicLambdaLemmaCanonicalLaneLean
