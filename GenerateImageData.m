clc;
close all;
clear;

N1=1;
N2=250;
for i = N1:N2
    
    %randomly sample the radius from 5mm to 7mm
    r1 = 5:0.01:7;
    ra=randsample(r1,1);
  
    %randomly sample the z-axis position of the sphere center from 30mm to
    %50mm. Note taht the final z-axis positon is zca+30mm.
    zc1 = 30:0.1:50;
    zca=randsample(zc1,1);
  
    %randomly sample the x-axis position of the sphere center from -1mm to
    %1mm.
    xc1 = -1:0.01:1;
    xca=randsample(xc1,1);
    
    %define the filenames where the data are saved.
    filename=['C:\JJ\USTB\DataNewHeader\' num2str(i) '.jpg'];
    filename1=['C:\JJ\USTB\DataNewHeader\' num2str(i) '.csv'];
    
    [b_data,channel_data, Na] = CPWC(ra, zca, xca); % call CPCW function by reference
    %plot(channel_data);
    
    %plot beamformed data.
    b_data.plot();
    
    %turn off the axis, the colorbar and the title.
    axis off;
    colorbar off;
    title('');
    
    %save the plot with a minimum white space.
    ax = gca;
    exportgraphics(ax,filename)
    
    %import the saved image again. 
    image=importdata(filename);
    
    %convert the RGB image to a gray-scale image.
    image = im2gray(image);

    %remove all white space from the image.
    image=RemoveWhiteSpace(image);
    
    %headers to be added at the top of the data file.
    lines = "CPWC: %d angles from -26.5° to 26.5°.\n10000 small scatterers with random amplitude and position.\n1 dark sphere target with radius of %d mm and position: X axis: %d mm; Z axis: %d mm.\n\n\n\n\n\n";
    %lines = "CPWC: %d angles from -26.5° to 26.5°.\n10000 small scatterers with random amplitude and position.\nNo target.\n\n\n\n\n\n";
    
    %save the headers first.
    fid = fopen(filename1,'wt');
    fprintf(fid, lines, Na, ra, xca, zca+30);
    %fprintf(fid, lines, Na);
    fclose(fid);
    
    %save the image pixel data after the headers.
    dlmwrite(filename1,image,'delimiter',',','-append');
    
end