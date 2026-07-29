import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean.ClosedMonoidalCategory

/-!
# Cartesian Closed Category Package
-/

namespace HautevilleHouse
namespace ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean

structure CartesianClosedCategoryPackage {C : ClosedMonoidalCategoryPackage} where
  finiteProducts : Prop
  productMapsDefined : Prop
  cartesianMonoidalStructure : Prop
  exponentialFromInternalHom : Prop

structure CartesianClosedCategoryEvidence {C : ClosedMonoidalCategoryPackage}
    (CC : CartesianClosedCategoryPackage C) where
  finiteProductsClosed : CC.finiteProducts
  productMapsDefinedClosed : CC.productMapsDefined
  cartesianMonoidalStructureClosed : CC.cartesianMonoidalStructure
  exponentialFromInternalHomClosed : CC.exponentialFromInternalHom

def CartesianClosedCategoryClosed {C : ClosedMonoidalCategoryPackage}
    (CC : CartesianClosedCategoryPackage C) : Prop :=
  CC.finiteProducts ∧ CC.productMapsDefined ∧
  CC.cartesianMonoidalStructure ∧ CC.exponentialFromInternalHom

theorem cartesian_closed_category_closed_from_evidence
    {C : ClosedMonoidalCategoryPackage} (CC : CartesianClosedCategoryPackage C)
    (E : CartesianClosedCategoryEvidence CC) : CartesianClosedCategoryClosed CC := by
  exact And.intro E.finiteProductsClosed
    (And.intro E.productMapsDefinedClosed
      (And.intro E.cartesianMonoidalStructureClosed E.exponentialFromInternalHomClosed))

end ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean
end HautevilleHouse