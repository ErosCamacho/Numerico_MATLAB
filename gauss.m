clear
clc
A=[1,2,2,2;1,2,1,1;2,4,-1,-5;1,2,-3,-7];
B=[1,2,3,2];
for k=1:3 
   for i=k+1:4
       m=A(i,k)/A(k,k);
       A(i,k)=0;
       B(i)=B(i)-m*B(k);
   end
   for j=k+1:4
       A(i,j)=A(i,j)-m*A(k,j);
   end
end