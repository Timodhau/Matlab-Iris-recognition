%Fonctoin permettant de derouler l'image de l'iris grace au coordoner et
%aux rayons preetablie. Pour derouler l'iris on utilise la transformer mise
%au point par Daugman
%interpolation bilineaire a rajouter

function [Imde] = Unrolling( Im , center, r1, r2 ,Ntheta,Nr)
%figure,imshow(Im);
Imde=zeros(Nr,Ntheta);

for i = 1:Ntheta
    for j = 1:Nr
        %calcul de rk et theta
        rk = j/Nr;
        theta = (i*2*pi)/Ntheta;
        %calculs des coordoner dans l'image resultat
        x = center(1) + rk*cos(theta)*r2  + (1-rk)*cos(theta)*r1;
        y = center(2) + rk*sin(theta)*r2  + (1-rk)*sin(theta)*r1;
        x=round(x);
        y=round(y);
        %cen = [x,y];
        %viscircles(cen, 1,'EdgeColor','r');
        %inscriptions des valeurs
        Imde(j,i)=Im(y,x);
        
    end
end

%figure, imshow(Imde,[min(Im(:)) max(Im(:))]), title('Image unroled');
% figure,histogram(Imde);
% Imd=imadjust(Imde);
% figure, imshow(Imd,[min(Im(:)) max(Im(:))]), title('Image deroule');
% figure,histogram(Imd);
end

