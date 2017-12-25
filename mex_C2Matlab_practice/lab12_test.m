
A = rand(100,100,100);
B = [(0:0.01:0.99)' (0.01:0.01:1)'];
tic
C = lab12c(A, B);
toc

tic
C = lab12m(A, B);
toc