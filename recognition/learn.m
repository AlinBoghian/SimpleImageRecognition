function [w]=learn(X,y)
  [l k]=size(X);
  X=[X ones(l,1)];
  [Q R]=Householder(X,y);
  y=Q'*y;
  w=SST(R,y);
  w=w';
endfunction
