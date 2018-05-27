%Fonction permettant d'extraire la signature (caracteristique de la
%texture)de l'image. cette texture est en realite l'energie moyenne de
%chaque filtre de gabor

function [energy] = signature(I,g,i)
%%division en petit bou
    %for k
    %Calcul de l'image filtrer par les filtres de Gabor (renvoi le resultat
    %sous forme de tableau a trois dimensions)
        gab(:,:,:,i)= imgaborfilt(I,g);
    
        %On parcours chacune des images filtre pour calculer son energie 
        for p = 1 : size(g,2)
            %extraction de l'image (+convertion en integral pour pouvoir calculer l'energie)
            gabi=int8(gab(:,:,p,i));
            
            %calcul de l'energie
            stats = graycoprops(gabi,'energy');
            energy(p)=stats.Energy;
            %figure,imshow(gabi,[]);
            %title('images after gabor');
        end
    %end
end








%    figure;
%    subplot(2,2,1)
%     for p = 1:length(g)
%         subplot(4,4,p);
%         imshow(real(g(p).SpatialKernel),[]);
%         lambda = g(p).Wavelength;
%         theta  = g(p).Orientation;
%         title(sprintf('Re[h(x,y)], \\lambda = %d, \\theta = %d',lambda,theta));
%     end