
clear
clc

disp('Select Host Image>>');
[HostImageName, HostImagePath] = uigetfile('.png', '.bmp');
HostImage = imread(strcat(HostImagePath,HostImageName));
figure('name','Host Image'); imshow(HostImage); 
[SecretImageName, SecretImagePath] = uigetfile('.jpg', '.bmp');
disp('Select Secret Image>>');
SecretImage = imread(strcat(SecretImagePath, SecretImageName));
figure('name','Secret Image'); imshow(SecretImage); 
%Generate Random Chromosomes
[ BestChromosome ] = RandomChromo( );
%Return Secret Bits
[ SecretBits ] = RetSecretBits( SecretImage );
%Embed Secret
[ StegoImage ] = EnbedSecret( HostImage, SecretBits, BestChromosome );
%Return Secret Bits
[ SecretBits ] = ExtractSecret( StegoImage, BestChromosome );
%Return Secret Image
[ SecretImage ] = RetSecretImage( SecretBits );
%Calculate PSNR Value 
[ PSNR ] = CalcPSNR( HostImage , StegoImage );

%Compiled By Tusshar Alagh