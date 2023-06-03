%{
||----------------------------------------------------------||
|| Nombre del Archivo:      saveImgBin.m                    ||
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

%% Solicitud de Parametros al Usuario
prompt = "Introduce el Ancho de la Imagen: ";
width = input(prompt)
%imageWidth = 512;
imageWidth = width;

prompt = "Introduce el Alto de la Imagen: ";
height = input(prompt)
%imageHeight = 512;
imageHeight = height;

%%
numColor = 3;

% Introduce el Nombre del Archivo a leer (incluir .bin)
i=imread('P1.jpg');

% Introduce el Nombre del Archivo a guardar (incluir .bin)
fileID = fopen('P1_color.bin','w');
for r = 1:imageHeight
    for c = 1:imageWidth
        for m = 1:numColor
            fwrite(fileID,i(r,c,m));
        end
    end
end
fclose(fileID);