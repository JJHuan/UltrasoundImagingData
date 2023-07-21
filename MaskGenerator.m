clc;
clear;
close;
N1=251;
N2=500;
%{
for i = N1:N2
    filename1=['C:\JJ\USTB\DataNewHeader\' num2str(i) '.csv'];
    filename2=['C:\JJ\USTB\DataNewHeader\mask' num2str(i) '.csv'];
    data=importdata(filename1); 
    image=data.data;
    row=size(image,1);
    column=size(image,2);
    text=data.textdata(3);
    text=string(text);
    text=convertStringsToChars(text);
    text1=text(37:48);
    r_mm=str2double(text1);
    text2=text(75:87);
    r=row*r_mm/60;
    x_mm=str2double(text2);
    %x_mm=-1;
    x=column/2+(x_mm)/40;
    
    len=length(text);
    
   
    if (len>110)
        text3=text(100:112);
    else
        text3=text(100:102);
    end
    
   
    z_mm=str2double(text3);
    
    %z_mm=78;
    z=row*(z_mm-30)/60;
    
    
    subplot(2,1,1)
    imshow(image);
    mask = createCirclesMask(image, [x, z], r/2);
    subplot(2,1,2)
    imshow(mask);
     %save the mask image pixel data.
    dlmwrite(filename2,mask);
    
end
%}

for i = N1:N2
    filename1=['C:\JJ\USTB\DataNewHeader\' num2str(i) '.csv'];
    filename2=['C:\JJ\USTB\DataNewHeader\mask' num2str(i) '.csv'];
    data=importdata(filename1); 
    image=data.data;
    row=size(image,1);
    column=size(image,2);
    mask=zeros(row,column);
    subplot(2,1,1)
    imshow(image);
    subplot(2,1,2)
    imshow(mask);
    %save the mask image pixel data.
    dlmwrite(filename2,mask);
    
end
