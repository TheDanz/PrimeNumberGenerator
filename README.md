# PrimeNumberGenerator
PrimeNumberGenerator is a easy-to-use app for generating prime numbers.

## Method
The method is based on Diemitko's theorem.

Let `n = qR + 1`, where `q` is a prime number, `R` is even, `R < 4(q + 1)`.

If there is `a < n`:
1. $a^{n-1} \equiv 1 \pmod n$; 
2. $a^{\frac{n-1}{q}} \not\equiv 1 \pmod n$,
then `n` is a prime number.

## Algorithm
Input: `t` - the required number length in bits, `q` - a prime number of length $\left[ \frac{t}{2} \right]$ bits

1. Calculate $N = \frac{2^{t-1}}{q} + \frac{2^{t-1}\xi}{q}$. If `N` is odd, then `N = N + 1`
2. `u = 0`
3. Calculate `p = (N + u)q + 1`
4. If $p > 2^t$, go to step 1
5. If $2^{n-1} \equiv 1 \pmod n$ and $2^{N + u} \not\equiv 1 \pmod n$, then go out
6. Calculate `u = u + 2`. Go to step 3

Output: `p` - a prime number
