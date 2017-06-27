clear all; close all;

StartAddr = 1024;
Data = imread('circles.bmp');
DataSize = length(Data);
Data1D = reshape(Data, 1, []);
Data1DSize = length(Data1D);
for i = 1:Data1DSize/8
    Data1DBytes(i) = bi2de(Data1D(((i-1)*8)+1:i*8));
end
ByteSize = length(Data1DBytes);
EndAddr = ceil((StartAddr + ByteSize)/32)*32;

XEM6310.obj = XEM_Initialization('mbimager_ddr.bit')


ok.setwireinvalue(XEM6310.obj,hex2dec('00'), bin2dec('11'),hex2dec('ffffffff'));        % Reset signals
ok.setwireinvalue(XEM6310.obj,hex2dec('01'), Data1DSize,hex2dec('ffffffff'));        	% Read length
ok.setwireinvalue(XEM6310.obj,hex2dec('02'), StartAddr,hex2dec('ffffffff'));            % start_rd_addr_i
ok.setwireinvalue(XEM6310.obj,hex2dec('03'), StartAddr,hex2dec('ffffffff'));            % start_wr_addr_i
ok.setwireinvalue(XEM6310.obj,hex2dec('04'), EndAddr,hex2dec('ffffffff'));              % end_wr_addr_i
ok.updatewireins(XEM6310.obj);

% Deassert the reset signals
ok.setwireinvalue(XEM6310.obj,hex2dec('00'), bin2dec('0'),hex2dec('ffffffff'));        
ok.updatewireins(XEM6310.obj);

% write the pattern into the fifo at DDR2_p0
ok.updatewireouts(XEM6310.obj);
FPGAflags = de2bi(ok.getwireoutvalue(XEM6310.obj, hex2dec('30')))
if FPGAflags(1) == 1
    % assert write request to p0
    ok.setwireinvalue(XEM6310.obj,hex2dec('00'), bin2dec('00001000'),hex2dec('ffffffff'));        
    ok.updatewireins(XEM6310.obj);
    pause(0.01);
    ok.writetopipein(XEM6310.obj, hex2dec('80'),Data1D, ByteSize);
else
    ok.setwireinvalue(XEM6310.obj,hex2dec('00'), bin2dec('11'),hex2dec('ffffffff'));        % Reset signals
    ok.updatewireins(XEM6310.obj);
    ok.setwireinvalue(XEM6310.obj,hex2dec('00'), bin2dec('0'),hex2dec('ffffffff'));        % Reset signals
end

% deassert write request and assert read request to p0
ok.setwireinvalue(XEM6310.obj,hex2dec('00'), bin2dec('00000100'),hex2dec('ffffffff'));        
ok.updatewireins(XEM6310.obj);

while(1)
    ok.updatewireouts(XEM6310.obj);
    FPGAflags = de2bi(ok.getwireoutvalue(XEM6310.obj, hex2dec('30')))
    FIFOdataBytes = bi2de(FPGAflags(19:11))
    returnData = cat(1,returnData,ok.readfrompipeout(XEM6310.obj, hex2dec('A0'),FIFOdataBytes));
end


returnData2D = reshape(returnData,size(Data,1),size(Data,2));
figure;
imshow(returenData2D);

calllib('okFrontPanel', 'okFrontPanel_Destruct', XEM6310.obj.ptr);
unloadlibrary('okFrontPanel');

% % read the pattern saved to fifo thru a pipein endpoint
% patternReading = ok.readfrompipeout(XEM6310, hex2dec('B0'), 16)
% 
% 
% % write the exposure value into a wirein endpoint
% ok.setwireinvalue(XEM6310,hex2dec('11'),handles.exp, hex2dec('ffff'));
% % write the number of patterns value into a wirein endpoint
% ok.setwireinvalue(XEM6310,hex2dec('12'),handles.numPat, hex2dec('ffff'));
% % write the number of pattern changes into a wirein endpoint
% ok.setwireinvalue(XEM6310,hex2dec('13'),handles.MaskChng, hex2dec('ffff'));
% % write the number of subscene that the mask change should happen into a
% % wirein endpoint
% ok.setwireinvalue(XEM6310,hex2dec('14'),handles.MaskChngPer, hex2dec('ffff'));
% ok.updatewireins(XEM6310);
%         
% % read the exposure and number of patterns values from two wireout
% % endpoints
% ok.updatewireouts(XEM6310);
% exposureReading = ok.getwireoutvalue(XEM6310, hex2dec('22'))
% numPatternReading = ok.getwireoutvalue(XEM6310, hex2dec('23'))
% MaskPatChange = ok.getwireoutvalue(XEM6310, hex2dec('24'))
% 
% % rest and start the counter
% ShowBWImages(XEM6310);
%         
% full = ok.istriggered(XEM6310,hex2dec('6A'), 1); % full
% oneFrameReady = ok.istriggered(XEM6310,hex2dec('6A'), 2); % one frame ready
% pause(0.001)
% 
% fullFrame = ok.readfrompipeout(XEM6310, hex2dec('A0'),262144);
% handles.Z1=showOneFrame( fullFrame, 1 ,DispFrame,handles);
% 
% ok.activatetriggerin(XEM6310, hex2dec('53'), 1);    