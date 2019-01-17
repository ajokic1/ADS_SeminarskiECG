function r=dwt_rr(ecgSig)
tm=1:length(ecgSig); %vrijeme
wt = modwt(val,'coif1',5);
wtrec = zeros(size(wt));
wtrec(4:5,:) = wt(4:5,:);
y = imodwt(wtrec,'coif1');
y = abs(y).^2;
[~,r] = findpeaks(y,tm,'MinPeakHeight',1,...
    'MinPeakDistance',200);63.