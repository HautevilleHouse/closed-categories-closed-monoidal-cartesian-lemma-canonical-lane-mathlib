import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean.ClosedMonoidalCategory
import HautevilleHouse.ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean.CartesianClosedCategory

/-!
# Monoidal Closed Equivalence Package
-/

namespace HautevilleHouse
namespace ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean

structure MonoidalClosedEquivalencePackage {C : ClosedMonoidalCategoryPackage}
    (CC : CartesianClosedCategoryPackage C) where
  curryingNatural : Prop
  evalNatural : Prop
  coevalNatural : Prop
  adjunctionTriangle : Prop

structure MonoidalClosedEquivalenceEvidence {C : ClosedMonoidalCategoryPackage}
    {CC : CartesianClosedCategoryPackage C} (E : MonoidalClosedEquivalencePackage CC) where
  curryingNaturalClosed : E.curryingNatural
  evalNaturalClosed : E.evalNatural
  coevalNaturalClosed : E.coevalNatural
  adjunctionTriangleClosed : E.adjunctionTriangle

def MonoidalClosedEquivalenceClosed {C : ClosedMonoidalCategoryPackage}
    {CC : CartesianClosedCategoryPackage C} (E : MonoidalClosedEquivalencePackage CC) : Prop :=
  E.curryingNatural ∧ E.evalNatural ∧ E.coevalNatural ∧ E.adjunctionTriangle

theorem monoidal_closed_equivalence_closed_from_evidence
    {C : ClosedMonoidalCategoryPackage} {CC : CartesianClosedCategoryPackage C}
    (E : MonoidalClosedEquivalencePackage CC)
    (Ev : MonoidalClosedEquivalenceEvidence E) : MonoidalClosedEquivalenceClosed E := by
  exact And.intro Ev.curryingNaturalClosed
    (And.intro Ev.evalNaturalClosed
      (And.intro Ev.coevalNaturalClosed Ev.adjunctionTriangleClosed))

end ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean
end HautevilleHouse