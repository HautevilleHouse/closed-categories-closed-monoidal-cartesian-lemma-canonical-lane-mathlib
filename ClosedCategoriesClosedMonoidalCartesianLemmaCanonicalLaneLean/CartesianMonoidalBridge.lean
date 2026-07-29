import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean

structure ClosedCartesianMonoidalPackage where
  monoidalClosedStructure : Prop
  cartesianProduct : Prop
  internalHom : Prop
  evaluationMap : Prop
  compositionMap : Prop

structure ClosedCartesianMonoidalEvidence (C : ClosedCartesianMonoidalPackage) where
  monoidalClosedStructureClosed : C.monoidalClosedStructure
  cartesianProductClosed : C.cartesianProduct
  internalHomClosed : C.internalHom
  evaluationMapClosed : C.evaluationMap
  compositionMapClosed : C.compositionMap

def ClosedCartesianMonoidalClosed (C : ClosedCartesianMonoidalPackage) : Prop :=
  C.monoidalClosedStructure ∧ C.cartesianProduct ∧ C.internalHom ∧ C.evaluationMap ∧ C.compositionMap

theorem closed_cartesian_monoidal_closed_from_evidence
    (C : ClosedCartesianMonoidalPackage) (E : ClosedCartesianMonoidalEvidence C) :
    ClosedCartesianMonoidalClosed C := by
  exact And.intro E.monoidalClosedStructureClosed
    (And.intro E.cartesianProductClosed
      (And.intro E.internalHomClosed
        (And.intro E.evaluationMapClosed E.compositionMapClosed)))

end ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean
end HautevilleHouse