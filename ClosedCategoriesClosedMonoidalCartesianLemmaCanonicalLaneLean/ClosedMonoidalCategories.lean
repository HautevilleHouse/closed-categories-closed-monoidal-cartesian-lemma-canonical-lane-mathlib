import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean

structure ClosedMonoidalCategory where
  obj : Type u
  hom : obj → obj → Type v
  id : ∀ (a : obj), hom a a
  comp : ∀ {a b c : obj}, hom b c → hom a b → hom a c
  tensor : obj → obj → obj
  internalHom : obj → obj → obj
  adjunction : ∀ (a b c : obj), hom (tensor a b) c ≃ hom a (internalHom b c)
  tensorUnit : obj
  leftUnitor : ∀ (a : obj), tensor tensorUnit a ≅ a
  rightUnitor : ∀ (a : obj), tensor a tensorUnit ≅ a
  associator : ∀ (a b c : obj), tensor (tensor a b) c ≅ tensor a (tensor b c)
  coherence : Prop
  coherenceTerm : coherence

structure ClosedMonoidalEvidence (C : ClosedMonoidalCategory) where
  adjunctionClosed : ∀ (a b c : C.obj), Nonempty (C.hom (C.tensor a b) c ≃ C.hom a (C.internalHom b c))
  coherenceClosed : C.coherence
  tensorUnitClosed : ∀ (a : C.obj), Nonempty (C.tensor C.tensorUnit a ≅ a)
  associatorClosed : ∀ (a b c : C.obj), Nonempty (C.tensor (C.tensor a b) c ≅ C.tensor a (C.tensor b c))

def ClosedMonoidalClosed (C : ClosedMonoidalCategory) : Prop :=
  (∀ (a b c : C.obj), Nonempty (C.hom (C.tensor a b) c ≃ C.hom a (C.internalHom b c))) ∧
  C.coherence ∧
  (∀ (a : C.obj), Nonempty (C.tensor C.tensorUnit a ≅ a)) ∧
  (∀ (a b : C.obj), Nonempty (C.tensor a C.tensorUnit ≅ a)) ∧
  (∀ (a b c : C.obj), Nonempty (C.tensor (C.tensor a b) c ≅ C.tensor a (C.tensor b c)))

theorem closed_monoidal_closed_from_evidence (C : ClosedMonoidalCategory) (E : ClosedMonoidalEvidence C) :
    ClosedMonoidalClosed C := by
  refine And.intro E.adjunctionClosed (And.intro E.coherenceClosed ?_)
  refine And.intro (fun a => E.tensorUnitClosed a) (And.intro (fun a b => ?_) E.associatorClosed)
  -- Need to prove existence of right unitor for all a b
  have h : ∀ (a : C.obj), Nonempty (C.tensor a C.tensorUnit ≅ a) := by
    intro a
    -- Use the leftUnitor of the closed monoidal category, which gives tensorUnit ⊗ a ≅ a
    -- We need the other side: a ⊗ tensorUnit ≅ a
    -- Since we have the rightUnitor field, we can use that
    exact Nonempty.intro (C.rightUnitor a)
  exact h

end ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean
end HautevilleHouse