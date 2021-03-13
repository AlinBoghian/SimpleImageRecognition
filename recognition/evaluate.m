function [percentage]=evaluate(path_to_testset,w,histogram,count_bins)
  [X,y]=preprocess(path_to_testset,histogram,count_bins);
  [l k]= size(X);
  X=[X ones(l,1)];
  corecte=0;
  for i=1:l
    z=X(i,:)*(w');
    if((z>=0 && y(i)>0)||(z<0 && y(i)<0))
      corecte++;
    endif
  endfor
  percentage=100*corecte/l;
endfunction
