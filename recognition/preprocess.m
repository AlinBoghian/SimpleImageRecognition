function [X y]=preprocess(path_to_dataset,histogram,count_bins)
  imglist=dir([path_to_dataset,"cats/*.jpg"]);
  imglist2=dir([path_to_dataset,"not_cats/*.jpg"]);
  l2=length(imglist2);
  l=length(imglist);
  X=zeros(l+l2,count_bins*3);
  y=ones(l+l2,1);
  y(l+1:l+l2)=-1;
  for i=1:l
    path=[path_to_dataset,"cats/",imglist(i).name];
    if(histogram=='RGB')
      sol=rgbHistogram(path,count_bins);
    else
      sol=hsvHistogram(path,count_bins);
    endif
    X(i,:)=sol;
  endfor
  for i=1:l2
    path=[path_to_dataset,"not_cats/",imglist2(i).name];
    if(histogram=='RGB')
      sol=rgbHistogram(path,count_bins);
    else
      sol=hsvHistogram(path,count_bins);
    endif
    X(l+i,:)=sol;
  endfor
endfunction
