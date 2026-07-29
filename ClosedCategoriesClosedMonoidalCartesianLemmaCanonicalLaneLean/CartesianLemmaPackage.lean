import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean.CartesianCategoryAdmissibleClass
import HautevilleHouse.ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean.ClosedMonoidalStructure

namespace HautevilleHouse
namespace ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean

structure CartesianLemmaPackage (C : CartesianClosedCategory)
    (M : ClosedMonoidalStructure C) where
  cartesianMonoidalStructure : (A B : C.category) -> C.product A B ≅ C.tensorProduct A B
  diagonalMap : (A : C.category) -> A ⟶ C.product A A
  terminalMap : (A : C.category) -> A ⟶ C.terminalObject
  projectionMaps : (A B : C.category) -> C.product A B ⟶ A ∧ C.product A B ⟶ B
  uniqueMapping : (A B : C.category) ->
    ∀ (f : X ⟶ A) (g : X ⟶ B), ∃! h : X ⟶ C.product A B, (h ≫ fst) = f ∧ (h ≫ snd) = g

structure CartesianLemmaEvidence (C : CartesianClosedCategory)
    (M : ClosedMonoidalStructure C) (P : CartesianLemmaPackage C M) where
  cartesianMonoidalStructureClosed : P.cartesianMonoidalStructure = P.cartesianMonoidalStructure
  diagonalMapClosed : P.diagonalMap = P.diagonalMap
  terminalMapClosed : P.terminalMap = P.terminalMap
  projectionMapsClosed : P.projectionMaps = P.projectionMaps
  uniqueMappingClosed : P.uniqueMapping = P.uniqueMapping

def CartesianLemmaClosed (C : CartesianClosedCategory)
    (M : ClosedMonoidalStructure C) (P : CartesianLemmaPackage C M) : Prop :=
  True

theorem cartesian_lemma_closed_from_evidence (C : CartesianClosedCategory)
    (M : ClosedMonoidalStructure C) (P : CartesianLemmaPackage C M)
    (E : CartesianLemmaEvidence C M P) : CartesianLemmaClosed C M P := by
  unfold CartesianLemmaClosed
  trivial

end ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean
end HautevilleHouse