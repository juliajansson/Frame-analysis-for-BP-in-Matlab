function [rgb] = Contrast(i)
%This function normalizes and splits the layers
t(i,:)= ['a' num2str(i) '.png']; %Reads in pictures starting with a and then a number, such as a1.png
filename=['Directory' t(i,:)]; 
y=imread(filename); %Reads in pictures from a given Directory at the computer

y=double(y);

%Separates the r, g and b layers
b=y(:,:,3);
g=y(:,:,2);
r=y(:,:,1);

%Normalizes
r=r/max(max(r));
g=g/max(max(g));
b=b/max(max(b));

rgb(:,:,1)=rr;
rgb(:,:,2)=gg;
rgb(:,:,3)=bb; 

end

