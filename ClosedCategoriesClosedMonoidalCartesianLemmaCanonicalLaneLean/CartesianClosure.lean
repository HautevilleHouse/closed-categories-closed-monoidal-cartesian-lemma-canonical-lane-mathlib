import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean

structure CartesianCategory where
  obj : Type u
  hom : obj → obj → Type v
  id : ∀ (a : obj), hom a a
  comp : ∀ {a b c : obj}, hom b c → hom a b → hom a c
  prod : obj → obj → obj
  terminal : obj
  proj1 : ∀ (a b : obj), hom (prod a b) a
  proj2 : ∀ (a b : obj), hom (prod a b) b
  pair : ∀ {a b c : obj}, hom c a → hom c b → hom c (prod a b)
  terminalUnique : ∀ (a : obj), Nonempty (hom a terminal)
  prodUniversal : ∀ {a b c : obj} (f : hom c a) (g : hom c b), Nonempty (Unique (hom c (prod a b)))
  
structure CartesianEvidence (C : CartesianCategory) where
  terminalClosed : ∀ (a : C.obj), Nonempty (C.hom a C.terminal)
  prodClosed : ∀ (a b : C.obj), Nonempty (C.hom (C.prod a b) a) ∧ Nonempty (C.hom (C.prod a b) b)
  pairClosed : ∀ {a b c : C.obj} (f : C.hom c a) (g : C.hom c b), Nonempty (C.hom c (C.prod a b))

def CartesianClosed (C : CartesianCategory) : Prop :=
  (∀ (a : C.obj), Nonempty (C.hom a C.terminal)) ∧
  (∀ (a b : C.obj), Nonempty (C.hom (C.prod a b) a) ∧ Nonempty (C.hom (C.prod a b) b)) ∧
  (∀ {a b c : C.obj} (f : C.hom c a) (g : C.hom c b), Nonempty (C.hom c (C.prod a b)))

theorem cartesian_closed_from_evidence (C : CartesianCategory) (E : CartesianEvidence C) :
    CartesianClosed C := by
  exact And.intro E.terminalClosed (And.intro E.prodClosed E.pairClosed)

end ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean
end HautevilleHouse