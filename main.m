%Principal fonction du programme, elle apelle toutes les autres fonctions
%Elle prend en argument l'image son rang dans le sous-dossier ainsi que la
%liste des filtres de gabor

function [energy] = main(I,i,g)

%recherche de l'iris
[center,radius1,radius2]=irisDetection(I);

%deroulement de l'image 
Ntheta=1024;Nr=256;
[deroul]=Unrolling( I , center, radius1, radius2 ,Ntheta,Nr);
%Extraction de la partie de l'iris sous la pupille
deroul=deroul(1:128 , 1:512);
%figure, imshow(deroul,[min(I(:)) max(I(:))]), title('Image unroled');

%egalisation d'histogramme
deroul= histeq(mat2gray(deroul));
%figure,imshow(deroul), title(strcat(filename,'  unroled'));


%calcul de la signature
energy=signature(deroul,g,i);

end