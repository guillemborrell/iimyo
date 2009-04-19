function y = fib_recur(n)
  if n == 1
    y = 1;
  elseif n == 0
    y = 0;
  else
    y = fib_recur(n-1) + fib_recur(n-2);
  end
