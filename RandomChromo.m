function [ BestChromosome ] = RandomChromo( )
x = randi([0 1],1,1024);
BestChromosome = uint8(x);
end