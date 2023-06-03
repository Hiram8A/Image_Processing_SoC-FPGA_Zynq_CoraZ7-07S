%{
||----------------------------------------------------------||
|| Nombre del Archivo:      viewImgBin.m                    ||
|| Versión del Programa:    MATLAB R2021a                   ||
|| Escuela:                 TECNM - Campus Chihuahua 		||
|| Description:             Visualizador de Archivos        ||
||                          Binarios a Imagen               ||
||                                                          ||
|| Autores:                 Kizheppatt Vipin                ||
||                          Hiram Ochoa     				||       
|| Fecha:                   03/06/2023						||
||----------------------------------------------------------||
%}
clear all; close all; clc; %#ok<CLALL>

%% Introduce el Nombre del Archivo a leer (incluir .bin)
fileID = fopen('P1_out.bin','r');
data=fread(fileID);

%% Solicitud de Parametros al Usuario
prompt = "Introduce el Ancho de la Imagen: ";
width = input(prompt)
%imageWidth = 256;
imageWidth = width;

prompt = "Introduce el Alto de la Imagen: ";
height = input(prompt)
%imageHeight = 256;
imageHeight = height;

%%
numColor = 1;

newData = uint8(zeros(imageWidth*imageHeight*numColor,1));
l=1;
for i = 1:imageWidth %for i 0 to maxColumn
    for j = 1:imageHeight %for j 0 to maxRow
        for k = 1:numColor
            newData(l+(k-1)*(imageWidth*imageHeight)) = data(imageWidth*(j-1)*numColor+(i-1)*numColor+k);  %newData[k] = imageData[maxColumn*j+i]
        end
        l=l+1;
    end
end

fclose(fileID);
finalData = reshape(newData,[imageHeight,imageWidth,numColor]);

imshow(finalData)
fontSize = 18;
title ('Imagen Procesada', 'FontSize', fontSize);
disp(fileID)