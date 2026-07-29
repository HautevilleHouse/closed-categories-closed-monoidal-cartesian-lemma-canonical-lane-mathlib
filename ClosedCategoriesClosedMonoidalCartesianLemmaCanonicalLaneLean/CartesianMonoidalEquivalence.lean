import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean

structure CartesianMonoidalEquivalence (C : CartesianCategory) (D : ClosedMonoidalCategory) where
  F : C.obj → D.obj
  G : D.obj → C.obj
  unit : ∀ (a : C.obj), C.hom a (G (F a))
  counit : ∀ (b : D.obj), D.hom (F (G b)) b
  preservesProd : ∀ (a b : C.obj), D.tensor (F a) (F b) ≅ F (C.prod a b)
  preservesTerminal : D.tensorUnit ≅ F C.terminal
  compatibleWithInternalHom : ∀ (a b : C.obj), D.internalHom (F a) (F b) ≅ F (C.internalHom a b)
  adjunctionEquivalence : Prop
  adjunctionEquivalenceTerm : adjunctionEquivalence

structure CartesianMonoidalEquivalenceEvidence {C : CartesianCategory} {D : ClosedMonoidalCategory} (E : CartesianMonoidalEquivalence C D) where
  preservesProdClosed : ∀ (a b : C.obj), Nonempty (D.tensor (E.F a) (E.F b) ≅ E.F (C.prod a b))
  preservesTerminalClosed : Nonempty (D.tensorUnit ≅ E.F C.terminal)
  compatibleWithInternalHomClosed : ∀ (a b : C.obj), Nonempty (D.internalHom (E.F a) (E.F b) ≅ E.F (C.internalHom a b))
  adjunctionEquivalenceClosed : E.adjunctionEquivalence

def CartesianMonoidalEquivalenceClosed {C : CartesianCategory} {D : ClosedMonoidalCategory} (E : CartesianMonoidalEquivalence C D) : Prop :=
  (∀ (a b : C.obj), Nonempty (D.tensor (E.F a) (E.F b) ≅ E.F (C.prod a b))) ∧
  Nonempty (D.tensorUnit ≅ E.F C.terminal) ∧
  (∀ (a b : C.obj), Nonempty (D.internalHom (E.F a) (E.F b) ≅ E.F (C.internalHom a b))) ∧
  E.adjunctionEquivalence

theorem cartesian_monoidal_equivalence_closed_from_evidence
    {C : CartesianCategory} {D : ClosedMonoidalCategory} (E : CartesianMonoidalEquivalence C D)
    (Ev : CartesianMonoidalEquivalenceEvidence E) : CartesianMonoidalEquivalenceClosed E := by
  exact And.intro Ev.preservesProdClosed (And.intro Ev.preservesTerminalClosed (And.intro Ev.compatibleWithInternalHomClosed Ev.adjunctionEquivalenceClosed))

end ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean
end HautevilleHouse