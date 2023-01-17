clear all;
clc;
close all;

outputFolder='C:\Users\InzamamMashood\Downloads\BelgiumTSC_Training\';
rootFolder = fullfile(outputFolder, 'Training');
allfoldernames= struct2table(dir(rootFolder));
for (i=3:height(allfoldernames))
    new(i-2)=allfoldernames.name(i);
end
clear i
categories=new;
imds = imageDatastore(fullfile(rootFolder, categories), 'LabelSource','foldernames');
tbl = countEachLabel(imds);
highestClass = max(tbl{:,2});
isBalanced = false;
operation = 0;
while(isBalanced~= true)
    imds = imageDatastore(fullfile(rootFolder, categories), 'LabelSource','foldernames');
    tbl = countEachLabel(imds);
    index = 1;
    nonBalancedClasses = categorical();
    for i = 1:height(tbl)
        Difference = (highestClass/tbl{i,2});
        if(Difference>1)
            nonBalancedClasses(index) = tbl{i,1};
            index = index + 1;
        end
    end
    if(isempty(nonBalancedClasses))
            isBalanced = true;
    else
       for j = 1:length(nonBalancedClasses)
            createFolderPath = [rootFolder '\' cellstr(nonBalancedClasses(j))];
            currentFolder = cell2mat(createFolderPath);
            filePattern = fullfile(currentFolder);
            jpegFiles = dir(filePattern);
            for k = 3:length(jpegFiles)
                baseFileName = jpegFiles(k).name;
                fullFileName = fullfile(currentFolder, baseFileName);
                [filepath,name,ext] = fileparts(fullFileName);
                Img = imread(fullFileName);
                if (operation == 0)
                    Flipped = flip(Img ,2);
                    new_name = ['X_F_',name];
                    imwrite(Flipped, [currentFolder '\' new_name ext], ext(2:end));
                elseif (operation == 1)
                    Gamma = imadjust(Img,[],[],0.3);
                    new_name = ['Y_G_',name];
                    imwrite(Gamma, [currentFolder '\' new_name ext], ext(2:end));
                elseif (operation == 2)
                    Noise = imnoise(Img,'gaussian', 0.02);
                    new_name = ['Z_N_',name];
                    imwrite(Noise, [currentFolder '\' new_name ext], ext(2:end));
                end
            end
       end
        operation = operation + 1;
    end
end