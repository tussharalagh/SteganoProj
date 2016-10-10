function [ SecretBits ] = ExtractSecret( StegoImage, BestChromosome )
    SecretBits = uint8(zeros(512, 1024));
    Index = 1;
    for i=1:512
        temp = bitand(StegoImage(i ,:) ,2)/2;
        SecretBits(: ,Index) = bitxor(temp,BestChromosome(1:512));
        Index = Index + 1;
        temp = bitand(StegoImage(i ,:) ,1);
        SecretBits(: ,Index) = bitxor(temp,BestChromosome(513:1024));
        Index = Index + 1;
    end
    SecretBits = uint8(SecretBits);
end