import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean.ClosedMonoidalCategory

namespace HautevilleHouse
namespace ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean

structure CartesianMonoidalCategory extends ClosedMonoidalCategory where
  diagonal : ∀ (A : obj), hom A (tensor A A)
  terminal : obj
  terminalHom : ∀ (A : obj), hom A terminal
  diagonalNatural : Prop
  terminalUnique : Prop
  productUniversal : ∀ (A B C : obj) (f : hom C A) (g : hom C B), ∃! h : hom C (tensor A B), comp h (projectionLeft A B) = f ∧ comp h (projectionRight A B) = g
  projectionLeft : obj → obj → hom (tensor A B) A
  projectionRight : obj → obj → hom (tensor A B) B

theorem cartesian_monoidal_category_product_universal (C : CartesianMonoidalCategory) (A B C : C.obj) (f : C.hom C A) (g : C.hom C B) : ∃! h : C.hom C (C.tensor A B), C.comp h (C.projectionLeft A B) = f ∧ C.comp h (C.projectionRight A B) = g :=
  C.productUniversal A B C f g

def CartesianMonoidalCategoryClosed (C : CartesianMonoidalCategory) : Prop :=
  ClosedMonoidalCategoryClosed C.toClosedMonoidalCategory ∧
  (∀ (A : C.obj), ∃! h : C.hom (C.tensor A A) A, true) ∧
  C.diagonalNatural

theorem cartesian_monoidal_category_closed_implies_closed_monoidal (C : CartesianMonoidalCategory) : CartesianMonoidalCategoryClosed C := by
  refine And.intro ?_ (And.intro ?_ C.diagonalNatural)
  · exact closed_monoidal_category_closed_from_evidence C.toClosedMonoidalCategory (by
      exact {
        idLawClosed := C.idLaw
        compLawClosed := C.compLaw
        internalHomAdjunctionClosed := C.internalHomAdjunction
      })
  · intro A
    refine ExistsUnique.intro (C.projectionLeft A A) ?_ ?_
    · trivial
    · intro h hh
      exact hh