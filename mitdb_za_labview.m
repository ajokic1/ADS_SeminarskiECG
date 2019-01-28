clear
clc
close all
disp('Ucitavanje signala iz MIT-BIH baze...')
M=108000;
signali=[100:109 111:119 121:124 200:203 205 207:210 212:215 217 219:223];
N=length(signali);

for i=1:N
    s=['mitdb/' int2str(signali(i))];
    [RR,tm]=ann2rr(s,'atr',M);
    fileID = fopen(['rr/' int2str(signali(i))],'w');
    fprintf(fileID,'%f\r\n',RR);
    fclose(fileID);
end