figure(1)
clf
hold on

open = load('googopen.dat');
clse = load('googclse.dat');

tailcheck(open,clse,0,30);
tailcheck(open,clse,1,30);
tailcheck(open,clse,4,30);
tailcheck(open,clse,9,30);

legend('0 dias','1 dia','5 dias','9 dias')