function [ SecretImage ] = RetSecretImage( SecretBits )
    SecretImage = zeros(256, 256);
    for i = 1 : 512
        for j = 1 : 1024
            Seri = mod((j - 1) , 4);
            Seri = (Seri * 64);
            ByteNo = floor((i - 1) / 8) + 1;
            BitNo = mod((i - 1) , 8) + 1;
            RowNumber = floor((j - 1) / 4) + 1;
            MaskValue = 2 ^ (BitNo - 1);
            SecretImage(RowNumber , Seri + ByteNo) = SecretImage(RowNumber , Seri + ByteNo) + MaskValue * SecretBits(i , j); 
            SecretImage = uint8(SecretImage);
        end   
    end
    figure('name','Secret Image'); 
    imshow(SecretImage); 
end

