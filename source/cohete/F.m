function y = F(t,h)

  if t <= 3.26
    y = 5750+5000;
  elseif 3.26 < t && t < 14.12
    y = 1018;
  else
    y = 0;
  end
      
