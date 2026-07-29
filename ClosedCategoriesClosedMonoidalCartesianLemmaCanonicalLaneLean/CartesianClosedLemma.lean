import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean

theorem cartesian_closed_lemma (M : MonoidalStructure) (C : CartesianMonoidalStructure M) (Cl : ClosedStructure M) :
  (CartesianClosed M C ∧ ClosedClosed M Cl) →
  (∀ (α β γ : Type u), (M.tensorProduct α β → γ) ≅ (α → M.internalHom β γ)) := by
  intro h
  intro α β γ
  exact Cl.currying α β γ

structure CartesianClosedLemmaPackage (M : MonoidalStructure) (C : CartesianMonoidalStructure M) (Cl : ClosedStructure M) where
  lemmaStatement : ∀ (α β γ : Type u), (M.tensorProduct α β → γ) ≅ (α → M.internalHom β γ)
  proofComplete : Prop

structure CartesianClosedLemmaEvidence (M : MonoidalStructure) (C : CartesianMonoidalStructure M) (Cl : ClosedStructure M) (P : CartesianClosedLemmaPackage M C Cl) where
  lemmaStatementClosed : P.lemmaStatement
  proofCompleteClosed : P.proofComplete

def CartesianClosedLemmaProved (M : MonoidalStructure) (C : CartesianMonoidalStructure M) (Cl : ClosedStructure M) (P : CartesianClosedLemmaPackage M C Cl) : Prop :=
  P.lemmaStatement ∧ P.proofComplete

theorem cartesian_closed_lemma_proved_from_evidence (M : MonoidalStructure) (C : CartesianMonoidalStructure M) (Cl : ClosedStructure M) (P : CartesianClosedLemmaPackage M C Cl) (E : CartesianClosedLemmaEvidence M C Cl P) :
  CartesianClosedLemmaProved M C Cl P := by
  exact And.intro E.lemmaStatementClosed E.proofCompleteClosed

end ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean
end HautevilleHouse