# ContinuedFractionConvergence

Consider the equation x = 7 - 12/(7 - 12/(7 - 12/(...   ...)))))) where the ... indicate that the pattern repeats infinitely many times.

This can be rewritten as x = 7 - 12/x which can be solved to find the answers 3 and 4.  
However, one would think that the continued fraction should resolve to a single real number.
Think of the continued fraction as an iterated algorithm.  
Start with almost any value s and repeatedly apply the operation 7-12/s.
This sequence will converge to 4.
However, if you start with 3, the sequence remains constant at 3 and never converges to 4.
I was interested in investigating this in the complex plane.
This shiny app allows you to set the values of a and b in the recursive algorithm f(n) = a+b-ab/f(n-1).
You can then animate it to watch how the point moves around the complex plane.

