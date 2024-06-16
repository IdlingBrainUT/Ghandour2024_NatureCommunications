function ca_filt_data = funcHF_ca_filt_3z(ca_raw_data);

%% filtering code

    highpass = 0.01; % 30 sec highpass filter
    Ca_fs    = 20; % 20hz
    
    ca_temp_data = ca_raw_data   ;      %�@vlocked�f�[�^�̑�� ca �c�F���ԁ@���@���F�זE
   
        [b,a] = butter(1, highpass /(Ca_fs/2),'high'); %
        %[b,a] = cheby2(1, 10, highpass /(Ca_fs/2), 'high');% highpass =0.01 good  
        dataOut = filtfilt(b,a,ca_temp_data); %�[���ʑ�filtfilt�� �n�C�p�X�@�t�B���^�[��ʂ�
        
%% zscore������
% 	dataIn1 = zscore(dataOut(1:7200,:)); 	    %�@�c�Ƀt�B���^�[��������
%     dataIn2 = zscore(dataOut(7201:19200,:)); 	%�@�c�Ƀt�B���^�[��������
%     dataIn3 = zscore(dataOut(19201:31200,:)); 	%�@�c�Ƀt�B���^�[��������
%     dataIn4 = zscore(dataOut(31201:43200,:)); 	%�@�c�Ƀt�B���^�[��������
%     dataIn5 = zscore(dataOut(43201:50400,:)); 	%�@�c�Ƀt�B���^�[��������
%     dataIn6 = zscore(dataOut(50401:57600,:)); 	%�@�c�Ƀt�B���^�[�������� 

%         dataIn = [dataIn1; dataIn2; dataIn3; dataIn4; dataIn5; dataIn6];

           dataIn =  zscore(dataOut(:,:));
        
%%
            ca_filt_data = (dataIn);

                negative = find(ca_filt_data<2); % 2SD�ȉ����J�b�g
    ca_filt_data(negative) = zeros(size(negative));
    
%         % 3SD��� -3 �Ńx�[�X���C���ɖ߂��R�[�h
%     ca_filt_data_zero = ca_filt_data-3;                
%     negative = find(ca_filt_data_zero<3);
%     ca_filt_data_zero(negative) = zeros(size(negative));
   
%%
    
end