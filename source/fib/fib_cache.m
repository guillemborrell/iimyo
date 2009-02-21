function y = fib_cache(n)

  Fnm1 = 1;
  Fnm2 = 1;
  
  if n == 1
    y = 1;
  elseif n == 2
    y = 1;
  else
    for i=3:n
      y = Fnm1+Fnm2;
      Fnm2 = Fnm1;
      Fnm1 = y;
    end
  end
