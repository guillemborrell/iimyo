function y = fib_vec(n)

vec = ones(n,1);

for i = 3:n
  vec(i) = vec(i-1)+vec(i-2);
end

y = vec(n);
