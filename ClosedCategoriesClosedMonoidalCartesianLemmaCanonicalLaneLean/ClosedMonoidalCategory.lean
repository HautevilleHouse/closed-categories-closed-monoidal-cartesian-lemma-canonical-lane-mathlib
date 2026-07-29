import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean

structure ClosedMonoidalCategory where
  obj : Type u
  hom : obj → obj → Type v
  id : ∀ (A : obj), hom A A
  comp : ∀ {A B C : obj}, hom A B → hom B C → hom A C
  tensor : obj → obj → obj
  internalHom : obj → obj → obj
  tensorUnit : obj
  tensorHom : ∀ {A B C D : obj}, hom A B → hom C D → hom (tensor A C) (tensor B D)
  leftUnitor : ∀ (A : obj), hom (tensor tensorUnit A) A
  rightUnitor : ∀ (A : obj), hom (tensor A tensorUnit) A
  associator : ∀ (A B C : obj), hom (tensor (tensor A B) C) (tensor A (tensor B C))
  internalHomAdjunction : ∀ (A B C : obj), hom (tensor A B) C ≃ hom A (internalHom B C)
  idLaw : ∀ (A : obj) (f : hom A A), comp (id A) f = f
  compLaw : ∀ {A B C D : obj} (f : hom A B) (g : hom B C) (h : hom C D), comp (comp f g) h = comp f (comp g h)

structure ClosedMonoidalCategoryEvidence (C : ClosedMonoidalCategory) where
  idLawClosed : ∀ (A : C.obj) (f : C.hom A A), C.comp (C.id A) f = f
  compLawClosed : ∀ {A B C D : C.obj} (f : C.hom A B) (g : C.hom B C) (h : C.hom C D), C.comp (C.comp f g) h = C.comp f (C.comp g h)
  internalHomAdjunctionClosed : ∀ (A B C : C.obj), (C.hom (C.tensor A B) C) ≃ (C.hom A (C.internalHom B C))

def ClosedMonoidalCategoryClosed (C : ClosedMonoidalCategory) : Prop :=
  (∀ (A : C.obj) (f : C.hom A A), C.comp (C.id A) f = f) ∧
  (∀ {A B C D : C.obj} (f : C.hom A B) (g : C.hom B C) (h : C.hom C D), C.comp (C.comp f g) h = C.comp f (C.comp g h)) ∧
  (∀ (A B C : C.obj), (C.hom (C.tensor A B) C) ≃ (C.hom A (C.internalHom B C)))

theorem closed_monoidal_category_closed_from_evidence (C : ClosedMonoidalCategory) (E : ClosedMonoidalCategoryEvidence C) : ClosedMonoidalCategoryClosed C := by
  exact And.intro E.idLawClosed (And.intro E.compLawClosed E.internalHomAdjunctionClosed)

end ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean
end HautevilleHouse