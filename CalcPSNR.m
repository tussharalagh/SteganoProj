function [ PSNR ] = CalcPSNR( HostImage , StegoImage )
    if (size(HostImage) ~= size(StegoImage))
       error('The size of the 2 matrix are unequal')
    elseif (HostImage == StegoImage)
       disp('Images are identical: PSNR has infinite value')
       PSNR = Inf;
       return;   
    else

        maxValue = double(max(HostImage(:)));

        % Calculate MSE, mean square error.
        mseImage = (double(HostImage) - double(StegoImage)) .^ 2;
        [rows, columns] = size(HostImage);

        mse = sum(mseImage(:)) / (rows * columns);

        % Calculate PSNR (Peak Signal to noise ratio)
        PSNR = 10 * log10( 255^2 / mse);
    end
end

