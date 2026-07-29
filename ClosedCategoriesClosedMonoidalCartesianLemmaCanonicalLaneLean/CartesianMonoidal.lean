import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean

structure CartesianMonoidalStructure (M : MonoidalStructure) where
  cartesianProduct : Type u → Type u → Type u
  projectionLeft : (α β : Type u) → cartesianProduct α β → α
  projectionRight : (α β : Type u) → cartesianProduct α β → β
  pairing : (α β γ : Type u) → (γ → α) → (γ → β) → (γ → cartesianProduct α β)
  terminalObject : Type u
  terminalMorphism : (α : Type u) → α → terminalObject
  productUniversal : (α β γ : Type u) → Prop
  terminalUniversal : (α : Type u) → Prop

structure CartesianEvidence (M : MonoidalStructure) (C : CartesianMonoidalStructure M) where
  productUniversalClosed : ∀ (α β γ : Type u), C.productUniversal α β γ
  terminalUniversalClosed : ∀ (α : Type u), C.terminalUniversal α

def CartesianClosed (M : MonoidalStructure) (C : CartesianMonoidalStructure M) : Prop :=
  (∀ (α β γ : Type u), C.productUniversal α β γ) ∧
  (∀ (α : Type u), C.terminalUniversal α)

theorem cartesian_closed_from_evidence (M : MonoidalStructure) (C : CartesianMonoidalStructure M) (E : CartesianEvidence M C) :
  CartesianClosed M C := by
  exact And.intro E.productUniversalClosed E.terminalUniversalClosed

end ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean
end HautevilleHouse