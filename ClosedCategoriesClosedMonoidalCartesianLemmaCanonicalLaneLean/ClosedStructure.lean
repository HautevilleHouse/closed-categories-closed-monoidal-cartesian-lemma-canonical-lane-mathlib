import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean

structure ClosedStructure (M : MonoidalStructure) where
  internalHom : Type u → Type u → Type u
  evaluation : (α β : Type u) → M.tensorProduct (internalHom α β) α → β
  coevaluation : (α β : Type u) → β → internalHom α (M.tensorProduct β α)
  currying : (α β γ : Type u) → (M.tensorProduct α β → γ) ≅ (α → internalHom β γ)
  naturalityCurrying : Prop
  naturalityCoevaluation : Prop

structure ClosedEvidence (M : MonoidalStructure) (C : ClosedStructure M) where
  naturalityCurryingClosed : C.naturalityCurrying
  naturalityCoevaluationClosed : C.naturalityCoevaluation

def ClosedClosed (M : MonoidalStructure) (C : ClosedStructure M) : Prop :=
  C.naturalityCurrying ∧ C.naturalityCoevaluation

theorem closed_closed_from_evidence (M : MonoidalStructure) (C : ClosedStructure M) (E : ClosedEvidence M C) :
  ClosedClosed M C := by
  exact And.intro E.naturalityCurryingClosed E.naturalityCoevaluationClosed

end ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean
end HautevilleHouse