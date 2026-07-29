import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean

structure MonoidalStructure where
  tensorProduct : Type u → Type u → Type u
  unitObject : Type u
  associator : (α β γ : Type u) → tensorProduct (tensorProduct α β) γ ≅ tensorProduct α (tensorProduct β γ)
  leftUnitor : (α : Type u) → tensorProduct unitObject α ≅ α
  rightUnitor : (α : Type u) → tensorProduct α unitObject ≅ α
  pentagonCondition : (α β γ δ : Type u) → Prop
  triangleCondition : (α β : Type u) → Prop

structure MonoidalEvidence (M : MonoidalStructure) where
  pentagonConditionClosed : ∀ (α β γ δ : Type u), M.pentagonCondition α β γ δ
  triangleConditionClosed : ∀ (α β : Type u), M.triangleCondition α β

def MonoidalClosed (M : MonoidalStructure) : Prop :=
  (∀ (α β γ δ : Type u), M.pentagonCondition α β γ δ) ∧
  (∀ (α β : Type u), M.triangleCondition α β)

theorem monoidal_closed_from_evidence (M : MonoidalStructure) (E : MonoidalEvidence M) :
  MonoidalClosed M := by
  exact And.intro E.pentagonConditionClosed E.triangleConditionClosed

end ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean
end HautevilleHouse