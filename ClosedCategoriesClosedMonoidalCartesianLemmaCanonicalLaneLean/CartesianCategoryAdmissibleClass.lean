import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean

structure CartesianClosedCategory where
  category : Type u
  terminalObject : category
  product : category -> category -> category
  exponential : category -> category -> category
  evaluation : (A B : category) -> exponential A B × A ⟶ B
  currying : (A B C : category) -> ((C × A) ⟶ B) → (C ⟶ exponential A B)

structure AdmissibleClass where
  object : CartesianClosedCategory
  bridgeClosed : Prop
  gateClosed : Prop
  closureCondition : bridgeClosed ∧ gateClosed

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.bridgeClosed

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.bridgeClosed

def gateClosed (A : AdmissibleClass) : Prop :=
  A.gateClosed

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateClosed

end ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean
end HautevilleHouse
