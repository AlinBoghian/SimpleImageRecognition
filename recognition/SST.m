function x=SST(A,b)
  [l k]=size(A);
  x=zeros(k,1);
  for i=k:-1:1
    x(i)=(b(i)-A(i,i+1:k)*x(i+1:k))/A(i,i);
  endfor
endfunction
