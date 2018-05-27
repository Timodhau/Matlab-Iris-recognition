%La fonction test refait tout le traitement que fait normalement la
%fonction main mais elle 

function [Deuclid] = test(I,energie,i,g)

[center,radius1,radius2]=irisDetection(I);

Ntheta=1024;
Nr=256;
[deroul]=Unrolling( I , center, radius1, radius2 ,Ntheta,Nr);
deroul=deroul(1:128 , 1:512);
%figure, imshow(deroul,[min(I(:)) max(I(:))]), title('Image unroled');
deroul= histeq(mat2gray(deroul));

%figure,imshow(deroul), title(strcat(filename,'  unroled'));

energytest=signature(deroul,g,i);
energytest=energytest';


dist=zeros(1,size(energie,3));

for j = 1 : size(energie,3)
    for i = 1 : size(g,2)
        for k=1 : size(energie,2)
            dist(j)=dist(j)+(energytest(i)-energie(i,k,j))^2;
        end
    end
    dist(j)=sqrt(dist(j));
    Deuclid(j)=sum(dist(j));
end


end