%% (0) - Charger l'image 
close all;
clc;

%coef du filtre de gabor[longueurs_d'ondes orientations_en_deg]
g = gabor([5 10 15 20 25 30],[0 30 60 90 120 ]);
c=3;

%energie=zeros(:,:,:);

%boucle sur les 20 sousdossier contenant les image d'aprentissage

% for j=1:20
%     srcFiles = dir(strcat('C:\Users\Dell\Desktop\projett\Enrolement\',int2str(j),'\*.jpg'));
%     %boucle a l'interieur du sous dossier
%     for i = 1 :length(srcFiles)
%         %conquintenage de la direction du fichier
%         filename = strcat('C:\Users\Dell\Desktop\projett\Enrolement\',int2str(j),'\',srcFiles(i).name);
%         
%         I = imread(filename);
%         %figure, imshow(I);
%         
%         %appel a la fonction main qui remvoi l'energie de chaque image,
%         %filtrer par un filtre de gabor, dans un tableau
%         energie(:,i,j)=main(I,i,g);    
%     end
% end


for j=1:20
    srcFiles = dir(strcat('C:\Users\Dell\Desktop\projett\test\',int2str(j),'\*.jpg'));
    %boucle a l'interieur du sous dossier
    for i = 1 :length(srcFiles)
        %conquintenage de la direction du fichier
        filename = strcat('C:\Users\Dell\Desktop\projett\test\',int2str(j),'\',srcFiles(i).name);
        
        I = imread(filename);
        %figure, imshow(I);
        
        %appel a la fonction main qui remvoi l'energie de chaque image,
        %filtrer par un filtre de gabor, dans un tableau
        %energietest(:,i,j)=main(I,i,g);    
        
        Deuclid=test(I,energie,1,g);

        [Y,ind] = min(Deuclid);
        
        if ind == j
            c=c+1
        end
    end
end

c=c/65*100;
disp(['Matching : ' num2str(c),'/100']);


%Test d'une image avec la base de donne de signature preetablie (energie)

%I = imread('S1002R04.jpg');
%figure, imshow(I);

% Deuclid=test(I,energie,1,g);
% 
% [Y,ind] = min(Deuclid);
% 
% if ind == j
%     c=c+1
% end


