function [center,radius1,radius2 ] = irisDetection( Im )
%figure,imshow(Im);
%seuillage pour garder lapupille
I=Im<100;

%recherche du cercle et affichage
[centers, radius1, metric] = imfindcircles(I,[30 60]);
%figure,imshow(Im);
%title('images with iris detected');
%viscircles(centers, radius1,'EdgeColor','b');

%ajustements
center=round(centers);
radius1=round(radius1)+4;

%filtrage par arrondissement pourensuite chercher le 2eme cercle
h=fspecial('average',10); 
C=filter2(h,Im);
%figure, imshow(C);

%gradient sur l'horizontale droite a partir du centre
LigneVertical=C(center(2),(center(1)+radius1+10):300);
LigneVertical = double(LigneVertical);
Grad = gradient(LigneVertical);
Grad = Grad+abs(min(Grad));
%recherche du bord
[maxi,indm]=max(Grad);
%ajustements
radius2=radius1+indm+5;

%viscircles(center, radius2,'EdgeColor','r');

end

