
function [ StegoImage ] = EnbedSecret( HostImage, SecretBits, BestChromosome )
    StegoImage = HostImage;
    Index = 1;
    for i=1:512
        temp = bitxor(transpose(SecretBits(: ,Index)),BestChromosome(1:512))*2;
        StegoImage(i,:) = bitand(StegoImage(i,:),253) + temp;
        Index = Index + 1;
        temp = bitxor(transpose(SecretBits(: ,Index)),BestChromosome(513:1024));
        StegoImage(i,:) = bitand(StegoImage(i,:),254) + temp;
        Index = Index + 1;               
    end
    figure('name','Stego Image'); 
    imshow(StegoImage); 
end       

