function [output] = RT60(alpha,volume,area)
%RT60 Calculates the reverberation time (in seconds) of the room, based on 1125.33 ft/s for c.
%   Format: RT60(alpha,volume,area) in FEET
output = (0.049*volume)/(alpha*area);
end

