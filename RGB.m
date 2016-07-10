function [rgb] = RGB(bild,x_1,x_2)
%Kom ihåg att ändra koordinatsiffrorna här!

im=bild; %L�ser in bilden %im=imread(namn); innan
y_1 = 250; %Mellan vilka v�rden som bilden ska zoomas
y_2 = 350;

bildzoom=im(y_1:y_2,x_1:x_2,:); %skapar en ny, zoomad bild

r=bildzoom(:,:,1); %tar ut r,g och b matriser ur zoom bilden
g=bildzoom(:,:,2);
b=bildzoom(:,:,3);

r_mean = mean(mean(r));
g_mean = mean(mean(g));
b_mean = mean(mean(b));

rgb=[r_mean;g_mean;b_mean];

end
