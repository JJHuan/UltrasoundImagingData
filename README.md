# UltrasoundImagingData
Data07102023_1.zip to Data07102023_8.zip contains all the 500 images and the image pixel data. 
250 of them are the image with 1 target and the rest have no target.
In each image pixel data file, the first 3 lines are the headers to explain the parameters used for CPWC imaging and the target information. 
Image pixel data start from the 9th line.

GeneratingImageData.m, CPWC.m and cyst_pht.m are the MATLAB code to generate the CPWC imaging data. GeneratingImageData.m is the top level code. Please download Field II library and add the code to Field II folder path.  Please also download and install Ultrasound toolbox (USTB) to run the code.

Ultrasound_Software_and_Book_Information.pptx contains the software and book information you will need for new simulation and Ultrasound imaging knowledge.
