function [H S V]=RGB2HSV(A)
  A=double(A);
  R=A(:,:,1);
  G=A(:,:,2);
  B=A(:,:,3);
  R=R/255;
  G=G/255;
  B=B/255;
  Cmax=max(R,max(G,B));
  Cmin=min(R,min(G,B));
  delta=Cmax-Cmin;
  H=zeros(size(delta));
  S=H;
  X=(delta!=0 & Cmax==R);
  Y=(delta!=0 & Cmax==G);
  Z=(delta!=0 & Cmax==B);
  H+=60*mod((G.*X-B.*X)./((delta-1).*X+1),6);
  H+=60*((B.*Y-R.*Y)./((delta-1).*Y+1)+Y*2);
  H+=60*((R.*Z-G.*Z)./((delta-1).*Z+1)+Z*4);
  H=H./360;  
  S(Cmax!=0)=delta(Cmax!=0)./Cmax(Cmax!=0);
  V=Cmax;
endfunction