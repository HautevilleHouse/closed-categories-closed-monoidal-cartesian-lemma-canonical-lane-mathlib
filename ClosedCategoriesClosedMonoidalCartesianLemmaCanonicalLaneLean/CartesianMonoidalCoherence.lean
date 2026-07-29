import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean.CartesianClosedCategory

/-!
# Cartesian Monoidal Coherence Package
-/

namespace HautevilleHouse
namespace ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean

structure CartesianMonoidalCoherencePackage {C : ClosedMonoidalCategoryPackage}
    (CC : CartesianClosedCategoryPackage C) where
  associatorNatural : Prop
  leftUnitorNatural : Prop
  rightUnitorNatural : Prop
  pentagonIdentity : Prop
  triangleIdentity : Prop

structure CartesianMonoidalCoherenceEvidence {C : ClosedMonoidalCategoryPackage}
    {CC : CartesianClosedCategoryPackage C} (Co : CartesianMonoidalCoherencePackage CC) where
  associatorNaturalClosed : Co.associatorNatural
  leftUnitorNaturalClosed : Co.leftUnitorNatural
  rightUnitorNaturalClosed : Co.rightUnitorNatural
  pentagonIdentityClosed : Co.pentagonIdentity
  triangleIdentityClosed : Co.triangleIdentity

def CartesianMonoidalCoherenceClosed {C : ClosedMonoidalCategoryPackage}
    {CC : CartesianClosedCategoryPackage C} (Co : CartesianMonoidalCoherencePackage CC) : Prop :=
  Co.associatorNatural ∧ Co.leftUnitorNatural ∧ Co.rightUnitorNatural ∧
  Co.pentagonIdentity ∧ Co.triangleIdentity

theorem cartesian_monoidal_coherence_closed_from_evidence
    {C : ClosedMonoidalCategoryPackage} {CC : CartesianClosedCategoryPackage C}
    (Co : CartesianMonoidalCoherencePackage CC)
    (E : CartesianMonoidalCoherenceEvidence Co) : CartesianMonoidalCoherenceClosed Co := by
  exact And.intro E.associatorNaturalClosed
    (And.intro E.leftUnitorNaturalClosed
      (And.intro E.rightUnitorNaturalClosed
        (And.intro E.pentagonIdentityClosed E.triangleIdentityClosed)))

end ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean
end HautevilleHouse