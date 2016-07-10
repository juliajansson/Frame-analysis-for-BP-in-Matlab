function [rgb] = Contrast(i)
%Används för kontrastförstärkning
t(i,:)= ['a' num2str(i) '.png'];
filename=['/Users/samueltober/Desktop/Referens_filmer/Bea/121_75/' t(i,:)]

y=imread(filename);

c = 0;

y=double(y);

b=y(:,:,3);
g=y(:,:,2);
r=y(:,:,1);

r=r/max(max(r));
g=g/max(max(g));
b=b/max(max(b));

bb=adapthisteq(b, 'clipLimit',c);
gg=adapthisteq(g, 'clipLimit',c);
rr=adapthisteq(r, 'clipLimit',c);

rgb(:,:,1)=rr;
rgb(:,:,2)=gg;
rgb(:,:,3)=bb; 

end

