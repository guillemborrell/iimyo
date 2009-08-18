Matlab Primer
=============

The next step in any programming course is to give an overview of the
language reference, to talk about expressions, operators,
constructs...  This is not our case.  Our goal is to acquire the basic
skills to turn Matlab into a useful tool an to write beautiful code.
We will learn the language while trying to solve simple problems.

Scripts and interactive sessions
--------------------------------

We must be aware that anything we do in an interactive session is
lost.  There is a question that most of novices do after their first
contact in matlab: 'I have been working with the Matlab's command line
for an hour and now I need to save all my work.  How can I do it? -The
answer is simple: you should have never done that [1]_.

The command line, also called console, is there for simple
computations an to interact with your scripts.  If you want your code
to persist in any way write a script with the editor and save it as an
m file. Before writing any command in Matlab you should learn how to
use the editor, or at least any editor that can deal with matlab code.

We won't need the editor during this small introduction but you are
under advice.  We will learn about editors, scripts and shortcuts
later.

Basic operations
----------------

We can use Matlab as a mind numbing powerful calculator to perform
basic arithmetic operations and to apply basic functions.  A sum is as
simple as it could be

.. code-block:: matlab

  >> 2 + 2
  ans = 4

Remember that a variable is our way to store and manage memory

.. code-block:: matlab

  >> a = 4;
  >> a + 2
  ans = 6
  
.. important::

   Matlab's default behaviour is to output always.  This happens
   in interactive sessions and scripts too.  The second case is
   particularly disturbing because tons of information might be dumped
   to the console.  To prevent a command to show its output we can
   write a semicolon at its end.

The usual mathematical operators are expressed in Matlab by the
following symbols:

* Sum: ``+``.

* Substraction: ``-``.  The minus sign is used as a prefix to
  distinguish between positive and negative numbers

* Product: ``.*`` [3]_ .

* Division: ``./``.

* Power: ``.^``.

There are many other operators.  We will know about them later.

Matlab has support for complex numbers.  The imaginary constant
:math:`i` is also a constant in Matlab named ``i``. Any complex number
will be divided in two components, real and imaginary.  The imaginary
one will be a number multiplied by the constant ``i``.  For example

.. code-block:: matlab

  > a = 1;
  > b = 1*i;
  > a+b
  ans =  1 + 1i
  > a*b
  ans =  0 + 1i

What makes Matlab a powerful tool is the huge library of
functions. Any function has input and output arguments and Matlab
deals with them in such a peculiar way.  Simple functions have only
one input and output argument, for example trigonometric functions

.. code-block:: matlab

  >> sin(1.4)
  ans =  0.98545

  >> sqrt(4)
  ans = 2

We have not assigned the output argument to any variable and Matlab
has assigned the result to the variable ``ans``.  There are functions
that have more input and output arguments.  The ``quad`` function, for
example, computes the numerical integration of a function between two
given boundaries and has five input arguments and four ouput
arguments. You may wonder how can anyone know that.  Every single
function in the standard library has docstrings you can read with the
``help`` function.  It is by far the most used function in Matlab. For
example [2]_

.. code-block:: matlab

   >> help(quad)

   -- Loadable Function: [V, IER, NFUN, ERR] = quad (F, A, B, TOL, SING)
   Integrate a nonlinear function of one variable using Quadpack.
   The first argument is the name of the function, the function
   handle or the inline function to call to compute the value of the
   integrand.  It must have the form

        y = f (x)

   where Y and X are scalars.

   The second and third arguments are limits of integration.  Either
   or both may be infinite.

   The optional argument TOL is a vector that specifies the desired
   accuracy of the result.  The first element of the vector is the
   desired absolute tolerance, and the second element is the desired
   relative tolerance.  To choose a relative test only, set the
   absolute tolerance to zero.  To choose an absolute test only, set
   the relative tolerance to zero.

   The optional argument SING is a vector of values at which the
   integrand is known to be singular.

   The result of the integration is returned in V and IER contains an
   integer error code (0 indicates a successful integration).  The
   value of NFUN indicates how many function evaluations were
   required, and ERR contains an estimate of the error in the
   solution.

   You can use the function `quad_options' to set optional parameters
   for `quad'.

   It should be noted that since `quad' is written in Fortran it
   cannot be called recursively.

Most of functions operate with real and complex arguments:

.. code-block:: matlab

  > a = 1.6;
  > b = 3.4*i;
  > exp(b)
  ans = -0.96680 - 0.25554i
  
.. admonition:: Exercise
 
  Define three variables with the following values: a = 1.5, b = 3.4
  and c = 5.2.  Find the value of d for
  :math:`d=\frac{a}{\frac{b}{c^a}-\frac{c}{b^a}}`

.. admonition:: Exercise

  Mathematicians voted :math:`1=e^{-i\pi}` as the most beautiful
  formula in Mathematics.  Check that the Maths in Matlab are not
  broken. You may need a constant available in matlab called ``pi``.

.. admonition:: Exercise

  Check that the product of two complex numbers is equal to the
  product of their magnitudes and the sum of their arguments. You may
  need the functions ``angle`` and ``abs``.

.. admonition:: Exercise

  There is no :math:`\infty` in Matlab.  But there is a built in
  constant ``Inf`` that is a number big enough to be infinity in
  practice.  There is another interesting built in constant called
  ``pi``, and you can guess its value.  The :math:`\tan` function
  links both constants with the following expression: :math:`\infty =
  \tan(\frac{\pi}{2})`.  If you use the expression to compute the
  infinity in Matlab you don't get a number that big.  Can you give an
  explanation?

Function definition
-------------------

Now we can operate with scalars and use simple functions.  The next
thing we must know is how to define our own functions.  There are two
ways to define a function in Matlab.  We can create a separate file
that starts with the keyword ``function`` and that should be written
following some syntax rules. That is too complex at this moment.  If
we are fine with only one output argument we can define a function
using the ``@()`` operator:

.. code-block:: matlab

  > fsin = @(x) x - x.^3/6
  fsin =
  
  @(x) x - x .^ 3 / 6
  > fsin(pi)
  ans =  8.3093

This new function can use other functions too.

.. code-block:: matlab

  > comp = @(x) fsin(x) - sin(x)
  comp =
  
  @(x) fsin (x) - sin (x)
  > comp(0.1)
  ans = 3.3325e-004
  
.. note::

  What this operator creates is not technically a function.  It is
  called anonymous function and is slightly different from a true
  function.

Vectors
-------

The vector is the most basic built in type of Matlab. It is an array
of numbers ordered in a single row.  The most important feature of a
vector is that it is indexable, we can pick a single element or a
slice.

The easiest way to create a vector is using its literal:

.. code-block:: matlab

  > v = [11,12,13,14,15,16,17,18,19]
  v =
  
     11   12   13   14   15   16   ...

We index a vector calling it as it was a function itself.

.. code-block:: matlab
  
  > v(2)
  ans =  12

Slicing is as easy as indexing. Just write a colon between the first
and the last index of the slice.

.. code-block:: matlab

  > v(2:4)
  ans =
  
     12   13   14
  
We can use another vector to specify individual indices

.. code-block:: matlab

  > v([2,4,6,7])
  ans =
  
     12   14   16   17

We won't type a vector in a console or in a script often because there
is a huge collection of functions to create vectors of any kind.  The
most basic two are ``linspace`` and ``logspace``.

.. function:: linspace(base, limit, N)

  Return a row vector with *N* linearly spaced elements between *base*
  and *limit*.

  Example::

    >> linspace(0,10,11)
    ans = 

        0  1  2  3  4  5  6  7  8  9 10


.. function:: logspace(base, limit, N)

  Similar to ``linspace`` except that the values are logarithmically
  spaced from :math:`10^{base}` and :math:`10^{limit}`.

Example
-------

The Taylor expansion is a power series that fit a given function with
the desired order around a given point. The general formula is

.. math::

  f(x) = f(0) + \sum_{n=0}^{\infty} \frac{f^{(n)}(0)}{n!}x^n

where :math:`f^{(n)}` means the *n* derivative of the function *f*.
It is very helpful to know what is happening to a function where it is
close to the point where we are computing the expansion. For example,
the expansion of the :math:`e^x` function is 

.. math::

  e^x = 1 + \frac{x}{1!} + \frac{x^2}{2!} + \frac{x^3}{3!} +
  \frac{x^4}{4!} + \cdots \forall x \in \Re

There is no way to implement an infinite series for this function in
Matlab but we can implement the truncated series to the order *n*
using the ``@`` operator. Any algorithm that involves summations is
easily implemented using the function ``sum``

.. function:: sum(x,dim)

  Sum of elements along dimension *dim*.  If the argument *dim* is
  omitted it defaults to 1, column-wise sum.

The first step is to generate a vector where every term corresponds to
a term in the expansion: the first element will be 1, the second
:math:`\frac{x}{1!}`, the third :math:`\frac{x^2}{2!}`...  One trick
to create that vector is 

To understand better what we are talking about it is helpful to plot

.. [1] Technically you can save your progress using a log that records
       all your commands but never use it as a script because it is
       **not**.

.. [2] Actually this help is not from Matlab but from Octave.  Both
       ``quad`` functions are used the same way in both interpreters

.. [3] The dot before the star, the slash and the wedge sign is very
       important when we define scalar functions.  We will learn about
       this dot when we talk about arrays and matrices.
