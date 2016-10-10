function [ SecretBits ] = RetSecretBits( SecretImage )
    SecretBits = zeros(512, 1024);
    for i = 1 : 512
        for j = 1 : 1024
            Seri = mod((j - 1) , 4);
            Seri = (Seri * 64);
            ByteNo = floor((i - 1) / 8) + 1;
            BitNo = mod((i - 1) , 8) + 1;
            RowNumber = floor((j - 1) / 4) + 1;
            SelectedByte = SecretImage(RowNumber , Seri + ByteNo);
            MaskValue = 2 ^ (BitNo - 1);
            SecretBits(i , j) = bitand(SelectedByte , MaskValue) / MaskValue;
        end      
    end
    SecretBits = uint8(SecretBits);
end

