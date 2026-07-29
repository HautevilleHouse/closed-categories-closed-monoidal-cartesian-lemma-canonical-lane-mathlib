import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean

structure MonoidalAdjunction (C D : ClosedMonoidalCategory) where
  F : C.obj → D.obj
  G : D.obj → C.obj
  unit : ∀ (a : C.obj), C.hom a (G (F a))
  counit : ∀ (b : D.obj), D.hom (F (G b)) b
  tensorCompatibility : Prop
  internalHomCompatibility : Prop
  adjunctionTriangle : Prop
  tensorCompatibilityTerm : tensorCompatibility
  internalHomCompatibilityTerm : internalHomCompatibility
  adjunctionTriangleTerm : adjunctionTriangle

structure MonoidalAdjunctionEvidence {C D : ClosedMonoidalCategory} (M : MonoidalAdjunction C D) where
  tensorCompatibilityClosed : M.tensorCompatibility
  internalHomCompatibilityClosed : M.internalHomCompatibility
  adjunctionTriangleClosed : M.adjunctionTriangle

def MonoidalAdjunctionClosed {C D : ClosedMonoidalCategory} (M : MonoidalAdjunction C D) : Prop :=
  M.tensorCompatibility ∧ M.internalHomCompatibility ∧ M.adjunctionTriangle

theorem monoidal_adjunction_closed_from_evidence {C D : ClosedMonoidalCategory} (M : MonoidalAdjunction C D) (E : MonoidalAdjunctionEvidence M) :
    MonoidalAdjunctionClosed M := by
  exact And.intro E.tensorCompatibilityClosed (And.intro E.internalHomCompatibilityClosed E.adjunctionTriangleClosed)

end ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean
end HautevilleHouse