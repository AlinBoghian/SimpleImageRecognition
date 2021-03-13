function sol=rgbHistogram(path_to_image, count_bins)
  A=imread(path_to_image);
  [n z]=size(A(:,:,1));
  sol=zeros(1,3*count_bins);
  solaux=zeros(1,3*256);
  for k=1:3
    for j=1:z
      for i=1:n
          m=double(A(i,j,k))+1+double(256*(k-1));
          solaux(m)++;
      endfor
    endfor
  endfor
  for i=1:(count_bins*3)
    v=floor(floor((i-1)*256/count_bins+1):i*256/count_bins);
    sol(i)=sum(solaux(v));
  endfor
endfunction
