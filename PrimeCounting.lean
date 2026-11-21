import LiouvilleEnergyRH.Closure
import LiouvilleEnergyRH.PrimeCount.Theta
import AveragedChowla

/-!
# Prime counting under Hypothesis H

Hypothesis H (no Dirichlet `L`-function vanishes in `re s > 1/2`) gives, for every `η > 0`,

* `ψ(x) = x + O_η(x^{1/2 + η})` (`psi_bound_of_H`, von Koch);
* `θ(x) = x + O_η(x^{1/2 + η})` (`theta_bound_of_H`);
* a prime in every interval `(x, x + x^{1/2 + η}]` for `x ≥ x₀(η)` (`prime_gap_of_H`, the
  `ε`-form of Cramér's conditional bound for gaps between consecutive primes).

The only input from H is the zero-free half-plane of `ζ`, `zeta_ne_zero_of_H`.
-/

namespace LiouvilleEnergyRH

/-- **Von Koch.** Under Hypothesis H, `|ψ(x) - x| ≤ K x^{1/2 + η}` for `x ≥ 1`. -/
theorem psi_bound_of_H (h : HypothesisH) {η : ℝ} (hη : 0 < η) :
    ∃ K : ℝ, ∀ x : ℝ, 1 ≤ x → |Chebyshev.psi x - x| ≤ K * x ^ (1 / 2 + η) :=
  PrimeCount.psi_bound (zeta_ne_zero_of_H h) hη

/-- Under Hypothesis H, `|θ(x) - x| ≤ K x^{1/2 + η}` for `x ≥ 1`. -/
theorem theta_bound_of_H (h : HypothesisH) {η : ℝ} (hη : 0 < η) :
    ∃ K : ℝ, 0 ≤ K ∧ ∀ x : ℝ, 1 ≤ x → |Chebyshev.theta x - x| ≤ K * x ^ (1 / 2 + η) :=
  PrimeCount.theta_bound (zeta_ne_zero_of_H h) hη

/-- **Prime gaps (Cramér, `ε`-form).** Under Hypothesis H, every interval
`(x, x + x^{1/2 + η}]` with `x ≥ x₀(η)` contains a prime. -/
theorem prime_gap_of_H (h : HypothesisH) {η : ℝ} (hη : 0 < η) (hη1 : η ≤ 1 / 2) :
    ∃ x₀ : ℝ, ∀ x : ℝ, x₀ ≤ x →
      ∃ p : ℕ, p.Prime ∧ x < p ∧ (p : ℝ) ≤ x + x ^ (1 / 2 + η) :=
  PrimeCount.prime_in_short_interval (zeta_ne_zero_of_H h) hη hη1

end LiouvilleEnergyRH
