function D=chargementHH(rep)
filename = [rep '\MC_SHH_re.txt'];
delimiter = {','};
startRow = 20;
%formatSpec = '%s%*s%[^\n\r]';
formatSpec = '%s';
fileID = fopen(filename,'r');
textscan(fileID, '%[^\n\r]', startRow-1, 'ReturnOnError', false);
dataArray = textscan(fileID, formatSpec, 'Delimiter',',','ReturnOnError', false);
fclose(fileID);
for i=1:length(dataArray{1,1})
    Dre(i,:)=str2num(cell2mat(dataArray{1,1}(i)));
end
filename = [rep '\MC_SHH_im.txt'];
delimiter = {','};
startRow = 20;
%formatSpec = '%s%*s%[^\n\r]';
formatSpec = '%s';
fileID = fopen(filename,'r');
textscan(fileID, '%[^\n\r]', startRow-1, 'ReturnOnError', false);
dataArray = textscan(fileID, formatSpec, 'Delimiter',',','ReturnOnError', false);
fclose(fileID);
for i=1:length(dataArray{1,1})
    Dim(i,:)=str2num(cell2mat(dataArray{1,1}(i)));
end
D=Dre+sqrt(-1)*Dim;
end