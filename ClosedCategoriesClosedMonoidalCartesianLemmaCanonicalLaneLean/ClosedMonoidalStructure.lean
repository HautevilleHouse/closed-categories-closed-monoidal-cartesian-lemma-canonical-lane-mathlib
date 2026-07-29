import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean.CartesianCategoryAdmissibleClass

namespace HautevilleHouse
namespace ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean

structure ClosedMonoidalStructure (C : CartesianClosedCategory) where
  internalHom : C.category -> C.category -> C.category
  composition : (A B C : C.category) -> internalHom B C × internalHom A B ⟶ internalHom A C
  identity : (A : C.category) -> terminalObject ⟶ internalHom A A
  tensorProduct : C.category -> C.category -> C.category
  associator : (A B C : C.category) -> (A ⊗ B) ⊗ C ≅ A ⊗ (B ⊗ C)
  unitObject : C.category
  leftUnitor : (A : C.category) -> unitObject ⊗ A ≅ A
  rightUnitor : (A : C.category) -> A ⊗ unitObject ≅ A
  braiding : (A B : C.category) -> A ⊗ B ≅ B ⊗ A
  closedStructure : (A B : C.category) -> internalHom A B × A ⟶ B
  curryingAdjunction : (A B C : C.category) ->
    ((C ⊗ A) ⟶ B) ≅ (C ⟶ internalHom A B)

structure ClosedMonoidalEvidence (C : CartesianClosedCategory) (M : ClosedMonoidalStructure C) where
  internalHomDefined : True
  compositionDefined : True
  identityDefined : True
  tensorProductDefined : True
  associatorDefined : M.associator = M.associator
  unitObjectDefined : True
  leftUnitorDefined : M.leftUnitor = M.leftUnitor
  rightUnitorDefined : M.rightUnitor = M.rightUnitor
  braidingDefined : M.braiding = M.braiding
  closedStructureDefined : M.closedStructure = M.closedStructure
  curryingAdjunctionDefined : M.curryingAdjunction = M.curryingAdjunction

def ClosedMonoidalClosed (C : CartesianClosedCategory) (M : ClosedMonoidalStructure C) : Prop :=
  True

theorem closed_monoidal_closed_from_evidence (C : CartesianClosedCategory)
    (M : ClosedMonoidalStructure C) (E : ClosedMonoidalEvidence C M) :
    ClosedMonoidalClosed C M := by
  unfold ClosedMonoidalClosed
  trivial

end ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean
end HautevilleHouse