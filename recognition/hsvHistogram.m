function sol=hsvHistogram(path_to_image, count_bins)
  A=imread(path_to_image);
  [H S V]=RGB2HSV(A);
  H=H*360;
  S=S*100;
  V=V*100;
  [l k]=size(H);
  sol=zeros(1,3*count_bins);
  for i=1:l
    for j=1:k
      m=floor(H(i,j)/361*count_bins)+1;
      ++sol(m);
      m=floor(S(i,j)/101*count_bins)+count_bins+1;
      ++sol(m);
      m=floor(V(i,j)/101*count_bins)+2*count_bins+1;
      ++sol(m);
    endfor
  endfor
endfunction
  
