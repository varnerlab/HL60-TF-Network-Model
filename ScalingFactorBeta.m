%==========================================================================%

% ScalingFactorBeta.m

% This scaling factor is taken from the Sethna group. 
% [Brown, KS & Sethna, JP. Phys Rev E Stat Nonlin Soft Matter Phys 
% 68, 021904 (2003)]

% This function takes a matrix DATA with the form [EXP ERROR SIM] [SIM EXP ERROR]
% SIM and EXP are the simulation and experimental points we are comparing
% ERROR is the error associated with the experimental point.

% Inputs:
% DATA - Matrix containing simulation and experimental data points

% Output:
% SCALE - multiplicative scaling factor

%==========================================================================%

function [SCALE] = ScalingFactorBeta(DATA)

	SCALE = sum(DATA(:,4).*DATA(:,2)./(DATA(:,3).^2))/sum((DATA(:,4)./DATA(:,3)).^2);

return;