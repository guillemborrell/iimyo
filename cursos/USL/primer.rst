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

* Product: ``*``.

* Division: ``/``.

* Power: ``^``.

There are many other operators.  We will know about them later.

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

.. admonition:: Exercise
 
  Define three variables with the following values: a = 1.5, b = 3.4
  and c = 5.2.  Find the value of d for
  :math:`d=\frac{a}{\frac{b}{c^a}-\frac{c}{b^a}}`

.. admonition:: Exercise

  There is no :math:`\infty` in Matlab.  But there is a built in
  constant ``Inf`` that is a number big enough to be infinity in
  practice.  There is another interesting built in constant called
  ``pi``, and you can guess its value.  The :math:`\tan` function
  links both constants with the following expression: :math:`\infty =
  \tan(\frac{\pi}{2})`.  If you use the expression to compute the
  infinity in Matlab you don't get a number that big.  Can you give an
  explanation?

.. [1] Technically you can save your progress using a log that records
       all your commands but never use it as a script because it is
       not.

.. [2] Actually this help is not from Matlab but from Octave.  Both
       ``quad`` functions are used the same way in both interpreters
