%% Segundo test de rendimiento de bucles

a = rand(100,100);
b = rand(100,100);
c = zeros(100,100);

tic;
for i = 1:100
  for j = 1:100
    c(i,j) = a(i,j) + b(i,j);
  end
end
toc
