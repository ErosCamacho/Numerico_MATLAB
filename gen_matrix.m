function [A]=gen_matrix(D)
for i=1:D
for j=1:i
A(i,j)=rand;
A(j,i)=A(i,j);
end
end
end