function y = m(t)
  if 3.26 >= t
    y = 133-26.01*t+200;
  elseif 3.26 < t && t < 14.12
    y = 48.2-4.44*(t-3.26)+200;
  else
    y = 199.98;
  end
 
