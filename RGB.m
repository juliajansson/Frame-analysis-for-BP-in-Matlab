function [rgb] = RGB(bild,x_1,x_2)

im=bild; %Reads in the image
y_1 = 250; %The y values that the image should be zoomed within
y_2 = 350;

bildzoom=im(y_1:y_2,x_1:x_2,:); %Creates a new, cropped pictur

r=bildzoom(:,:,1); %Takes out r,g och b matrices from the cropped picture
g=bildzoom(:,:,2);
b=bildzoom(:,:,3);

r_mean = mean(mean(r)); %Calculates the means of the layers
g_mean = mean(mean(g));
b_mean = mean(mean(b));

rgb=[r_mean;g_mean;b_mean]; %Creates a new matrix with the means of the layers

end
