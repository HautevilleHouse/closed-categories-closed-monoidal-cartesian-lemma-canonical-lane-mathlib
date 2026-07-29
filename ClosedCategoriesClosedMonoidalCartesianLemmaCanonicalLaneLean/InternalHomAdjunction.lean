import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean.ClosedMonoidalCategory

namespace HautevilleHouse
namespace ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean

structure InternalHomAdjunctionPackage {C : ClosedMonoidalCategory} where
  homEquiv : ∀ (A B : C.obj), C.hom (C.tensor A B) C.internalHom A B
  homEquivNatural : Prop
  unit : ∀ (A B : C.obj), C.hom A (C.internalHom B (C.tensor A B))
  counit : ∀ (A B : C.obj), C.hom (C.tensor (C.internalHom A B) A) B
  triangleIdentities : Prop

structure InternalHomAdjunctionEvidence {C : ClosedMonoidalCategory} (P : InternalHomAdjunctionPackage C) where
  homEquivNaturalClosed : P.homEquivNatural
  triangleIdentitiesClosed : P.triangleIdentities

def InternalHomAdjunctionClosed {C : ClosedMonoidalCategory} (P : InternalHomAdjunctionPackage C) : Prop :=
  P.homEquivNatural ∧ P.triangleIdentities

theorem internal_hom_adjunction_closed_from_evidence {C : ClosedMonoidalCategory} (P : InternalHomAdjunctionPackage C) (E : InternalHomAdjunctionEvidence P) : InternalHomAdjunctionClosed P := by
  exact And.intro E.homEquivNaturalClosed E.triangleIdentitiesClosed

theorem internal_hom_adjunction_provides_hom_equiv {C : ClosedMonoidalCategory} (P : InternalHomAdjunctionPackage C) (A B : C.obj) : C.hom (C.tensor A B) C.internalHom A B :=
  P.homEquiv A B

end ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean
end HautevilleHouse