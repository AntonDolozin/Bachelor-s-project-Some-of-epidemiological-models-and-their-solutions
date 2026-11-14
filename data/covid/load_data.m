clc;
clear;
close all;


url = 'https://githubusercontent.com';
options = detectImportOptions(url);
covidData = readtable(url, options);
head(covidData);