import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean

structure CartesianClosureLemmaPackage where
  diagonalMap : Prop
  projectionMaps : Prop
  uniquenessOfProduct : Prop
  functoriality : Prop

structure CartesianClosureLemmaEvidence (L : CartesianClosureLemmaPackage) where
  diagonalMapClosed : L.diagonalMap
  projectionMapsClosed : L.projectionMaps
  uniquenessOfProductClosed : L.uniquenessOfProduct
  functorialityClosed : L.functoriality

def CartesianClosureLemmaClosed (L : CartesianClosureLemmaPackage) : Prop :=
  L.diagonalMap ∧ L.projectionMaps ∧ L.uniquenessOfProduct ∧ L.functoriality

theorem cartesian_closure_lemma_closed_from_evidence
    (L : CartesianClosureLemmaPackage) (E : CartesianClosureLemmaEvidence L) :
    CartesianClosureLemmaClosed L := by
  exact And.intro E.diagonalMapClosed
    (And.intro E.projectionMapsClosed
      (And.intro E.uniquenessOfProductClosed E.functorialityClosed))

end ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean
end HautevilleHouse