clc;clear all;
%
addpath('D:\Auditory Analy\codeyy');
% load data
area = {'VISl','VISpm','VISp'};
decoder = {'SVM','KNN','TREE','LOGI','BAYE'};
for f = 1:3
    pick_area = area{f};
    pick_num = 15;
    
    folder_path = ['D:\HULK\mat\','VISl']; 
    file_list = dir(folder_path); 
    folder_list = {};
    for i = 1:length(file_list)
        if file_list(i).isdir && ~strcmp(file_list(i).name, '.') && ~strcmp(file_list(i).name, '..') 
            folder_list{end+1} = fullfile(folder_path, file_list(i).name); 
        end 
    end 
    
    %subfolder_path = folder_list{1}; 
    file_list = dir(fullfile(folder_path, '*.mat')); 
    save_folder_path = 'D:\Frontiers_Analysis';

    accresult=[];param={};levout=[];neuron_num=[];image_depth=[]; creline={}; flag = [];
    file_set = {};
    for i = 1:length(file_list)
       file_path = fullfile(folder_path, file_list(i).name); 
       load(file_path); 
       neuron_max = 500;
       %if f == 1
       [accresult(end+1),levout(end+1),neuron_num(end+1),flag(end+1)] = decoder_fitcecoc_same_nn(dff_traces, stim_table,neuron_max,pick_num);
       %elseif f == 2
       %[accresult(end+1),levout(end+1),neuron_num(end+1),flag(end+1)] = decoder_fitcknn_same_nn(dff_traces, stim_table,neuron_max,neuron_num);
       %elseif f == 3
       %[accresult(end+1),levout(end+1),neuron_num(end+1),flag(end+1)] = decoder_fitctree_same_nn(dff_traces, stim_table,neuron_max,neuron_num);
       %end
       file_set{end+1} = file_path(end-5:end);
       creline{end+1}=cre_line; 
       image_depth(end+1)=imagedepth;
    end
    save_file_name = [save_folder_path,'\','TF_',num2str(pick_num),pick_area,'_SVM_',num2str(neuron_max),'.mat']; 
    save(save_file_name, 'creline','image_depth','accresult','param','levout',"time","neuron_num"); 
end
