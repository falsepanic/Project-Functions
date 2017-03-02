function [srt,idx] = roomModes(width,length,height)
%roomModes.m Calculates room modes.
%   roomModes(width,length,height)

c  = 1125.33; % speed of sound (ft/s)
w  = width;
L  = length;
h  = height;
% Axial Modes
n = 1:9;
fL = c/2 .* n/L;
fw = c/2 .* n/w;
fh = c/2 .* n/h;
% Tangential modes
nL = 1:4;
nw = 1:4;
nh = 1:4;
fLw = c/2 * sqrt(bsxfun(@plus, (nL.'/L).^2, (nw/w).^2));
fwh = c/2 * sqrt(bsxfun(@plus, (nw.'/w).^2, (nh/h).^2));
fLh = c/2 * sqrt(bsxfun(@plus, (nL.'/L).^2, (nh/h).^2));
% Oblique Modes
fLwh = c/2 * sqrt(bsxfun(@plus,(fLw(1:2,1:2) * 2/c).^2, permute(nh(1:2)/h,[3 1 2]).^2));
[srt,idx] = sort([fL(:);fw(:);fh(:);fLw(:);fwh(:);fLh(:);fLwh(:)]);
end

