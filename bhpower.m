function [pband,ptot,per_power] = bhpower(filepath, Fs,freqRange)
%BHPOWER
%   Calculates percentage of power in a specified frequency range, such as
%   that of a breath-hold task.
%   Reference: https://www.mathworks.com/help/signal/ref/bandpower.html

%%%%%%%%%%%
% Inputs:
%%%%%%%%%%
% filepath = full path to input signal
% Fs = sampling frequency, in Hz
% freqRange = frequency range of interest, e.g. [0.014,0.02]

%%%%%%%%%%%
% Outputs:
%%%%%%%%%%
% pband = power in frequency range of interest
% ptot = total power
% per_power = percentage of power in frequency range of interest

data = load(filepath);
N = length(data);

% Maximum freq for total power = Fs*(N-1)/(2*N), where N is number of samples
% in input signal
maxFreq = Fs*(N-1)/(2*N);

pband=bandpower(data,Fs,freqRange);
ptot=bandpower(data,Fs,[0,maxFreq]);
per_power=pband/ptot*100;

end

