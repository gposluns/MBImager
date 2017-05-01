function [ obj ] = XEM_Initialization( bitfileName )
% This funtion loads the library, opens the boar, configures FPGA

    % load library
    if ~libisloaded('okFrontPanel')
        loadlibrary('okFrontPanel', 'okFrontPanelDLL.h', 'notempdir');
    end

    obj.ptr = calllib('okFrontPanel', 'okFrontPanel_Construct');

    % open and configure FPGA
    while ok.isfrontpanelenabled(obj) == 0
        ok.openbyserial(obj, '');
        ok.configurefpga(obj, bitfileName);
    end


end

