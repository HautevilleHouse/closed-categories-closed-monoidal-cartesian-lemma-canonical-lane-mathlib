import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean.CartesianCategoryAdmissibleClass

namespace HautevilleHouse
namespace ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.gateClosed

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateClosed

end ClosedCategoriesClosedMonoidalCartesianLemmaCanonicalLaneLean
end HautevilleHouse
