%1 For loop cropping out the two patches, and separating them into the three R, G and B layers.
for i=1:1200
    pic=Contrast(i); 
    rgb=RGB(pic,300,400); %Cropping a patch at the wrist
    
    r_1(i)=rgb(1,:);
    g_1(i)=rgb(2,:);
    b_1(i)=rgb(3,:);
end

for i=1:1200
    pic=Contrast(i); 
    rgb=RGB(pic,1000,1100); %Cropping a patch at the bend of the arm
    
    r_2(i)=rgb(1,:);
    g_2(i)=rgb(2,:);
    b_2(i)=rgb(3,:);
end  

%%
%2.1 Normalising the matrices for the two patches for the red layer
R1 = r_1;
R2 = r_2;

R1 = (R1-mean(R1))/std(R1);
R2 = (R2-mean(R2))/std(R2);

%%
%2.2 Adapting a Fourier series to the normalized data
framediffsR = [];

for i = 1:200
%disp(i)
[a1,b1] = Fseries(1:length(R1),R1,i);
fit1 = Fseriesval(a1,b1,1:length(R1));
[a2,b2] = Fseries(1:length(R2),R2,i);
fit2 = Fseriesval(a2,b2,1:length(R2));
figure(1)
plot(R1,'k.'); hold on; plot(fit1,'g--'); plot(fit2,'r--'); drawnow; hold off;% pause(0.5);

diffs = [];
for j=-10:10
    diffs = [diffs,sum((fit1(20+j:end-20+j)-fit2(20:end-20)).^2)];
end

%figure(2); plot(a,'g'); hold on; plot(b,'k'); xlim([1,length(a)]); hold off;
%%
%2.3 Adapting a second degree polinomial to the resulting difference between the graphs squared

parabola = polyfit(1:length(diffs),diffs,2);
inp = linspace(1,length(diffs),10000);
appr = parabola(1)*inp.^2 + parabola(2)*inp + parabola(3);
[M,I] = min(appr);
I = I/length(inp)*21-10;

framediffsR = [framediffsR,I];

end
figure(18); hold off;
plot(framediffsR,'r'); hold on;

%%
%3 Doing the same procedure (2.1-2.3) for the green layer

G1 = g_1;
G2 = g_2;

G1 = (G1-mean(G1))/std(G1);
G2 = (G2-mean(G2))/std(G2);

framediffsG = [];

for i = 1:200
%disp(i)
[a1,b1] = Fseries(1:length(G1),G1,i);
fit1 = Fseriesval(a1,b1,1:length(G1));
[a2,b2] = Fseries(1:length(G2),G2,i);
fit2 = Fseriesval(a2,b2,1:length(G2));
figure(1)
plot(G1,'k.'); hold on; plot(fit1,'g--'); plot(fit2,'r--'); drawnow; hold off;% pause(0.5);

diffs = [];
for j=-10:10
    diffs = [diffs,sum((fit1(20+j:end-20+j)-fit2(20:end-20)).^2)];
end

%figure(2); plot(a,'g'); hold on; plot(b,'k'); xlim([1,length(a)]); hold off;

parabola = polyfit(1:length(diffs),diffs,2);
inp = linspace(1,length(diffs),10000);
appr = parabola(1)*inp.^2 + parabola(2)*inp + parabola(3);
[M,I] = min(appr);
I = I/length(inp)*21-10;

framediffsG = [framediffsG,I];

end
figure(18);
plot(framediffsG,'g'); hold on;

%%
%4 Doing the same procedure (2.1-2.3) for the blue layer

B1 = b_1;
B2 = b_2;

B1 = (B1-mean(B1))/std(B1);
B2 = (B2-mean(B2))/std(B2);

framediffsB = [];

for i = 1:200
%disp(i)
[a1,b1] = Fseries(1:length(B1),B1,i);
fit1 = Fseriesval(a1,b1,1:length(B1));
[a2,b2] = Fseries(1:length(B2),B2,i);
fit2 = Fseriesval(a2,b2,1:length(B2));
figure(1)
plot(B1,'k.'); hold on; plot(fit1,'g--'); plot(fit2,'r--'); drawnow; hold off;% pause(0.5);

diffs = [];
for j=-10:10
    diffs = [diffs,sum((fit1(20+j:end-20+j)-fit2(20:end-20)).^2)];
end

%figure(2); plot(a,'g'); hold on; plot(b,'k'); xlim([1,length(a)]); hold off;

parabola = polyfit(1:length(diffs),diffs,2);
inp = linspace(1,length(diffs),10000);
appr = parabola(1)*inp.^2 + parabola(2)*inp + parabola(3);
[M,I] = min(appr);
I = I/length(inp)*21-10;

framediffsB = [framediffsB,I];

end
%%
%5 Plotting the framediffs
figure(18);
plot(framediffsB,'b'); hold on;

    

    
