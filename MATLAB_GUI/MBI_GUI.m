%Date modified: 2017-06-15
%Author: Wendy
%Modifications: Added image calibration 
function varargout = MBI_GUI(varargin)
% MBI_GUI MATLAB code for MBI_GUI.fig
%      MBI_GUI, by itself, creates a new MBI_GUI or raises the existing
%      singleton*.
%
%      H = MBI_GUI returns the handle to a new MBI_GUI or the handle to
%      the existing singleton*.
%
%      MBI_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MBI_GUI.M with the given input arguments.
%
%      MBI_GUI('Property','Value',...) creates a new MBI_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MBI_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MBI_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MBI_GUI

% Last Modified by GUIDE v2.5 19-Jun-2017 16:35:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MBI_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @MBI_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before MBI_GUI is made visible.
function MBI_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MBI_GUI (see VARARGIN)

% initializing parameters
handles.obj.ptr=0;
handles.savedImgNum=0;
handles.savedVidNum=0;
handles.pattern=0;
handles.exp = 0;
handles.numPat = 0;

global showHist;
showHist = 0;
global imgCalib;
imgCalib = 0;
global mysave;
mysave=0;
global mysaveMulti;
mysaveMulti=0;
global savedMultiImgNum;
savedMultiImgNum=0;
global savedMultiFolderNum;
savedMultiFolderNum=0;
global MultiTotalImgs;
MultiTotalImgs=100;
global MultifoldernameB1;
MultifoldernameB1='';
global MultifoldernameB2;
MultifoldernameB2='';
global Multiprefix;
Multiprefix='';
global mysaveVideo;
mysaveVideo=0;

global v1;
global v2;

global Z1_temp;
Z1_temp=zeros(160,184);
global Z2_temp;
Z2_temp=zeros(160,184);

global DispFrame;
DispFrame=0;

% enable zoom for axes 1 & 2
zoom on
linkaxes([handles.axes1, handles.axes2],'xy');

% Choose default command line output for MBI_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MBI_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MBI_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in BitfileLoadBtn.
function BitfileLoadBtn_Callback(hObject, eventdata, handles)
% hObject    handle to BitfileLoadBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% This function browses and loads the selected bit file to the board

% file browsing
[filename, pathname] = uigetfile('*.bit', 'Select a bit file');
if ~isequal(filename,0)
   handles.bitfile=fullfile(pathname, filename);

   if ~handles.obj.ptr
       % if no bit file is already loaded, call XEM_Initialization function       
       % to loadlibrary, open board, and load bit file
       handles.obj = XEM_Initialization( handles.bitfile );
   else
       % if bit file is already loaded, unload library and reload the
       % library and bit file using XEM_Initialization function
       calllib('okFrontPanel', 'okFrontPanel_Destruct', handles.obj.ptr);
       unloadlibrary('okFrontPanel');
       handles.obj = XEM_Initialization( handles.bitfile );
   end

end

% Update handles structure
guidata(hObject, handles);




% --- Executes on button press in LoadPatternFile.
function LoadPatternFile_Callback(hObject, eventdata, handles)
% hObject    handle to LoadPatternFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% This function browses a csv file contating the patterns and store the
% patterns into a fifo 

if handles.obj.ptr~=0
    % file browsing
    [filename, pathname] = uigetfile('*.csv', 'Select a camera pattern file');
    if ~isequal(filename,0)
        % read the pattern from the csv files
        handles.patternfile = fullfile(pathname, filename);
        handles.pattern = uint8(csvread(handles.patternfile));
        
        % reset the fifo
        ok.setwireinvalue(handles.obj,hex2dec('10'),hex2dec('ff'), 3);
        ok.updatewireins(handles.obj);
        ok.setwireinvalue(handles.obj,hex2dec('10'),hex2dec('00'), 3);
        ok.updatewireins(handles.obj);
        
        % write the pattern into the fifo thru a pipeout endpoint
        ok.writetopipein(handles.obj, hex2dec('80'), handles.pattern, length(handles.pattern));
        inputPattern = handles.pattern;
        % read the pattern saved to fifo thru a pipein endpoint
        patternReading = ok.readfrompipeout(handles.obj, hex2dec('B0'), 16);
    end
else
    msgbox('Please load bitfile first.');
end

% Update handles structure
guidata(hObject, handles);



% --- Executes on button press in DisplayImgTogglebtn.
function DisplayImgTogglebtn_Callback(hObject, eventdata, handles)
% hObject    handle to DisplayImgTogglebtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of DisplayImgTogglebtn

% This function reads from the fifo and displays the images
    
global mysave;
global mysaveMulti;
global mysaveVideo;
global expStr;
global numPatStr;
global MaskChngStr;
global MaskChngPerStr;
global DispFrame;
global imgCalib;
global showHist;

if get(hObject,'Value') % if this toggle button is pressed
    
    if handles.obj.ptr~=0  % if there's a bit file loaded
        expDark = load('expDark.mat');
        expWhite = load('expWhite.mat');
        
        set(hObject, 'BackgroundColor',[1 1 0]);
        set(hObject,'String','Display Image - Stop');
        
        % read from the exposure and number of patterns fields
        expStr=get(handles.ExposureEdit, 'String');
        numPatStr=get(handles.NumPatternsEdit, 'String');
        MaskChngStr=get(handles.NumMaskEdit, 'String');
        MaskChngPerStr=get(handles.MaskCngSubcEdit, 'String');
        
        % determine if the input of exposure field is a valid number
        if ~isempty(str2num(expStr))
            if length(size(str2num(expStr)))==2
                if size(str2num(expStr))==[1 1]
                    % valid
                    handles.exp=str2num(expStr);
                end
            else 
                % invalid
            end
            
        else
            % no valid input
        end
        
        % determine if the input of number of patterns field is a valid number
        if ~isempty(str2num(numPatStr))
            if length(size(str2num(numPatStr)))==2
                if size(str2num(numPatStr))==[1 1]
                    % valid
                    handles.numPat=str2num(numPatStr);
                end
            else 
                % invalid
            end
            
        else
            % no valid input
        end
        
        % determine if the input of number of Mask changes field is a valid number
        if ~isempty(str2num(MaskChngPerStr))
            if length(size(str2num(MaskChngPerStr)))==2
                if size(str2num(MaskChngPerStr))==[1 1]
                    if (str2num(MaskChngPerStr)>0)
                        % valid
                        handles.MaskChngPer=str2num(MaskChngPerStr);
                    else
                        handles.MaskChngPer=2*str2num(numPatStr);
                    end
                end
            else 
                % invalid
            end
            
        else
            % no valid input
        end
        
        % determine if the input of number of Mask change subscene field is a valid number
        if ~isempty(str2num(MaskChngStr))
            if length(size(str2num(MaskChngStr)))==2
                if size(str2num(MaskChngStr))==[1 1]
                    handles.MaskChng=str2num(MaskChngStr);
                    if handles.MaskChng*handles.MaskChngPer > handles.numPat
                        handles.MaskChng = handles.numPat/handles.MaskChngPer;
                    end
                end
            else 
                % invalid
            end
            
        else
            % no valid input
        end
        %find masking percent
        if handles.MaskChng == 0
            handles.percent = 100;
        elseif mod(handles.MaskChng,2) ==0 %even
            handles.percent = (1-handles.MaskChng*handles.MaskChngPer/(2*handles.numPat))*100;
        else %odd
            handles.percent = (handles.MaskChng+1)*handles.MaskChngPer*100/(2*handles.numPat);
        end
        %array of exposure times of calibration
        expArray = [16390, 32780, 11920, 28310, 7450, 23840, 2980, 19370, 35760, 14900, 31290, 10430, 26820, 5960, 22350, 1490, 17880, 34270, 13410, 29800, 8940, 25330, 4470, 20860];
        %find closest exposure time
        totExp = handles.numPat*(28.8+handles.exp);
        tmp = abs(expArray- totExp);
        [c index] = min(tmp);
        calibExp = expArray(index);
        handles.darkimg1 = zeros(79,60);
        handles.darkimg2 = zeros(79,60);
        handles.whiteimg1 = zeros(79,60);
        handles.whiteimg2 = zeros(79,60);
        for row = 1:79
            for col = 1:60
                handles.darkimg1(row,col) = polyval(reshape(expDark.(strcat('x',int2str(calibExp)))(1,row,col,:),[1,6]),handles.percent);
                handles.darkimg2(row,col) = polyval(reshape(expDark.(strcat('x',int2str(calibExp)))(2,row,col,:),[1,6]),handles.percent);
                handles.whiteimg1(row,col) = polyval(reshape(expWhite.(strcat('x',int2str(calibExp)))(1,row,col,:),[1,6]),handles.percent);
                handles.whiteimg2(row,col) = polyval(reshape(expWhite.(strcat('x',int2str(calibExp)))(2,row,col,:),[1,6]),handles.percent);
            end
        end
        
        % write the exposure value into a wirein endpoint
        ok.setwireinvalue(handles.obj,hex2dec('11'),handles.exp, hex2dec('ffff'));
        % write the number of patterns value into a wirein endpoint
        ok.setwireinvalue(handles.obj,hex2dec('12'),handles.numPat, hex2dec('ffff'));
        % write the number of pattern changes into a wirein endpoint
        ok.setwireinvalue(handles.obj,hex2dec('13'),handles.MaskChng, hex2dec('ffff'));
        % write the number of subscene that the mask change should happen into a wirein endpoint
        ok.setwireinvalue(handles.obj,hex2dec('14'),handles.MaskChngPer, hex2dec('ffff'));
        % write the number of subscene that the mask change should happen into a wirein endpoint
        ok.setwireinvalue(handles.obj,hex2dec('15'),hex2dec('fff003ff'), hex2dec('ffffffff'));
        ok.updatewireins(handles.obj);
        
        % read the exposure and number of patterns values from two wireout
        % endpoints
%         ok.updatewireouts(handles.obj);
%         exposureReading = ok.getwireoutvalue(handles.obj, hex2dec('22'))
%         numPatternReading = ok.getwireoutvalue(handles.obj, hex2dec('23'))
%         MaskPatChange = ok.getwireoutvalue(handles.obj, hex2dec('24'))

        % rest and start the counter
        ShowBWImages(handles.obj);
        
        stuck_cnt=0;
        full=0;
        % while ~full
        % for i = 1:200
        while get(hObject,'Value')
            % read from the exposure and number of patterns fields
%             expStr=get(handles.ExposureEdit, 'String');
%             numPatStr=get(handles.NumPatternsEdit, 'String');
%             MaskChngStr=get(handles.NumMaskEdit, 'String');
%             MaskChngPerStr=get(handles.MaskCngSubcEdit, 'String');
% 
%             % determine if the input of exposure field is a valid number
%             if ~isempty(str2num(expStr))
%                 if length(size(str2num(expStr)))==2
%                     if size(str2num(expStr))==[1 1]
%                         % valid
%                         handles.exp=str2num(expStr);
%                     end
%                 end
%             end
%             % determine if the input of number of patterns field is a valid number
%             if ~isempty(str2num(numPatStr))
%                 if length(size(str2num(numPatStr)))==2
%                     if size(str2num(numPatStr))==[1 1]
%                         % valid
%                         handles.numPat=str2num(numPatStr);
%                     end
%                 end
%             end
%             % determine if the input of number of Mask changes field is a valid number
%             if ~isempty(str2num(MaskChngPerStr))
%                 if length(size(str2num(MaskChngPerStr)))==2
%                     if size(str2num(MaskChngPerStr))==[1 1]
%                         if (str2num(MaskChngPerStr)>0)
%                             % valid
%                             handles.MaskChngPer=str2num(MaskChngPerStr);
%                         else
%                             handles.MaskChngPer=2*str2num(numPatStr);
%                         end
%                     end
%                 end
%             end
%         
%             % determine if the input of number of Mask change subscene field is a valid number
%             if ~isempty(str2num(MaskChngStr))
%                 if length(size(str2num(MaskChngStr)))==2
%                     if size(str2num(MaskChngStr))==[1 1]
%                         handles.MaskChng=str2num(MaskChngStr);
%                     end
%                 end
%             end
% 
%             % write the exposure value into a wirein endpoint
%             ok.setwireinvalue(handles.obj,hex2dec('11'),handles.exp, hex2dec('ffff'));
%             % write the number of patterns value into a wirein endpoint
%             ok.setwireinvalue(handles.obj,hex2dec('12'),handles.numPat, hex2dec('ffff'));
%             % write the number of pattern changes into a wirein endpoint
%             ok.setwireinvalue(handles.obj,hex2dec('13'),handles.MaskChng, hex2dec('ffff'));
%             % write the number of subscene that the mask change should happen into a wirein endpoint
%             ok.setwireinvalue(handles.obj,hex2dec('14'),handles.MaskChngPer, hex2dec('ffff'));
%             ok.updatewireins(handles.obj);

            % read if full/oneFrameReady flag is triggered
            ok.updatetriggerouts(handles.obj);          
            full = ok.istriggered(handles.obj,hex2dec('6A'), 1); % full
            oneFrameReady = ok.istriggered(handles.obj,hex2dec('6A'), 2); % one frame ready
            pause(0.001)
            stuck_cnt = stuck_cnt + 1;
            if stuck_cnt>=50;
                stuck_cnt = 1;
            	ShowBWImages(handles.obj);
                %ok.activatetriggerin(handles.obj, hex2dec('53'), 2);
            elseif full
                stuck_cnt = 1;
                % read from and clear the fifo
                fullFrame = ok.readfrompipeout(handles.obj, hex2dec('A0'),262144);
                % save the scale of the zooming
                XL=xlim;
                YL=ylim;
                % display the first arrangement in axes1
                axes(handles.axes1);
%                 [handles.Z1, handles.Z3]=showTwoFrame( fullFrame, 1 );
                handles.Z1=showOneFrame( fullFrame, 1 ,DispFrame,handles, imgCalib, showHist);
                % rescale due to the zooming function
%                 if XL<=10
%                     xlim(XL*184);
%                     ylim(YL*160);
%                 else
%                     xlim(XL);
%                     ylim(YL);
%                 end
                % display the second arrangement in axes2
                axes(handles.axes2);
%                 [handles.Z2, handles.Z4]=showTwoFrame( fullFrame, 2 );
                handles.Z2=showOneFrame( fullFrame, 2 ,DispFrame,handles, imgCalib,showHist);
                % rescale due to the zooming function
%                 if XL<=10
%                     xlim(XL*184);
%                     ylim(YL*160);
%                 else
%                     xlim(XL);
%                     ylim(YL);
%                 end
                % if save one image button is pressed
                if mysave
                    storeImgs(hObject, eventdata, handles);
                end
                % if save multiple images button is pressed
                if mysaveMulti
                    storeMultiImgs(hObject, eventdata, handles);
                end  
                % if record video toggle button is pressed
                if mysaveVideo
                    writeVids(hObject, eventdata, handles);
                end
                pause(0.001);
%                 ok.activatetriggerin(handles.obj, hex2dec('53'), 1);
            elseif oneFrameReady
                stuck_cnt = 1;
                % read one frame from the fifo
                oneFrame = ok.readfrompipeout(handles.obj, hex2dec('A0'),176640);
                % save the scale of the zooming
                %XL=xlim;
                %YL=ylim;
                % display the first arrangement in axes1
                axes(handles.axes1);
%                 [handles.Z1, handles.Z3]=showTwoFrame( oneFrame, 1 );
                handles.Z1=showOneFrame( oneFrame, 1,DispFrame,handles, imgCalib, showHist );
                % rescale due to the zooming function
%                if XL<=10
%                     xlim(XL*184);
%                     ylim(YL*160);
%                else
%                     xlim(XL);
%                     ylim(YL);
%                end
                % display the second arrangement in axes2
                axes(handles.axes2);
                [handles.Z2, handles.Z4]=showTwoFrame( oneFrame, 2 );
                handles.Z2=showOneFrame( oneFrame, 2 ,DispFrame,handles, imgCalib, showHist);
                % rescale due to the zooming function
%                 if XL<=10
%                     xlim(XL*184);
%                     ylim(YL*160);
%                 else
%                     xlim(XL);
%                     ylim(YL);
%                 end
                % if save one image button is pressed
                if mysave
                    storeImgs(hObject, eventdata, handles);
                end
                % if save multiple images button is pressed
                if mysaveMulti
                    storeMultiImgs(hObject, eventdata, handles);
                end
                % if record video toggle button is pressed
                if mysaveVideo
                    writeVids(hObject, eventdata, handles);
                end
                pause(0.001);
            end
            
        end
               
    else
        set(hObject,'Value',0);
        msgbox('Please load bitfile first.');
    end
    
else
    
     set(hObject, 'BackgroundColor',[0 1 0]);
     set(hObject,'String','Display Image - Start');
     % if the display is stopped while recording video, stop recording
     if mysaveVideo
            set(handles.RecordVidToggleBtn,'Value',0);
            set(handles.RecordVidToggleBtn,'BackgroundColor',[0 1 0])
            set(handles.RecordVidToggleBtn,'String','Record Video - Start');
            mysaveVideo=0;
            closeVids();
     end
     
     % if the display is stopped while saving multiple images, stop saving
     if mysaveMulti
         mysaveMulti=0;
     end
     
end
    
% Update handles structure
guidata(hObject, handles);
    

    
% --- Executes on button press in SaveImgBtn.
function SaveImgBtn_Callback(hObject, eventdata, handles)
% hObject    handle to SaveImgBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% This funtion sets mysave variable to 1 if the display is on

global mysave;

if get(handles.DisplayImgTogglebtn, 'Value')
    mysave=1;
end

% Update handles structure
guidata(hObject, handles);


function storeImgs(hObject, eventdata, handles)
% This function saves two arrangements into two image files

global mysave;
% Identify the next available name for saving images
handles.savedImgNum=handles.savedImgNum+1;
while (exist(['defaultImage' num2str(handles.savedImgNum) '_Arrangment1.png'], 'file')) || (exist(['defaultImage' num2str(handles.savedImgNum) '_Arrangment2.png'], 'file'))
    handles.savedImgNum=handles.savedImgNum+1;
end

% write the 1st frame's two buckets
imwrite(handles.Z1,['defaultImage_Bucket1' num2str(handles.savedImgNum) '.png']);
imwrite(handles.Z2,['defaultImage_Bucket2' num2str(handles.savedImgNum) '.png'])

% % write the 2nd frame's two buckets
% handles.savedImgNum=handles.savedImgNum+1;
% imwrite(handles.Z3,['defaultImage_Bucket1' num2str(handles.savedImgNum) '.png']);
% imwrite(handles.Z4,['defaultImage_Bucket2' num2str(handles.savedImgNum) '.png'])

% reset mysave variable 
mysave=0;

% Update handles structure
guidata(hObject, handles);



% --- Executes on button press in SaveMultiImgsBtn.
function SaveMultiImgsBtn_Callback(hObject, eventdata, handles)
% hObject    handle to SaveMultiImgsBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% This funtion sets mysaveMulti variable to 1 while display is on, and it 
% creates a folder with the timestamp, and it reads from the number of 
% images field

global mysaveMulti;
global savedMultiFolderNum;
global savedMultiImgNum;
global MultiTotalImgs;
global MultifoldernameB1;
global MultifoldernameB2;
global Multiprefix;
savedMultiImgNum=0;
global expStr;
global numPatStr;
global MaskChngStr;
global MaskChngPerStr;

if get(handles.DisplayImgTogglebtn, 'Value')
    % set mysaveMulti variable to 1
    mysaveMulti=1;
    
    % make a folder with timestamp
    t=fix(clock);
    savedMultiFolderNum=savedMultiFolderNum+1;
%     MultifoldernameB1=['Images_Analysis_' num2str(t(1)) num2str(t(2),'%02i') num2str(t(3),'%02i') '_' num2str(t(4),'%02i') num2str(t(5),'%02i') num2str(t(6),'%02i') '_B1'];
%     MultifoldernameB2=['Images_Analysis_' num2str(t(1)) num2str(t(2),'%02i') num2str(t(3),'%02i') '_' num2str(t(4),'%02i') num2str(t(5),'%02i') num2str(t(6),'%02i') '_B2'];
    MultifoldernameB1=['DataCollect/Images_Analysis_Exp' expStr '_NoPat' numPatStr '_' MaskChngStr '_' MaskChngPerStr '_B1'];
    MultifoldernameB2=['DataCollect/Images_Analysis_Exp' expStr '_NoPat' numPatStr '_' MaskChngStr '_' MaskChngPerStr '_B2'];
    Multiprefix='Images_Analysis_';
    mkdir(MultifoldernameB1);
    mkdir(MultifoldernameB2);
    
    % read and validate the input of the number of images field
    numImgStr=get(handles.NumImgSavedEdit, 'String');
    MultiTotalImgs=100;
    if ~isempty(str2num(numImgStr))
        if length(size(str2num(numImgStr)))==2
            if size(str2num(numImgStr))==[1 1]
                % valid
                MultiTotalImgs=str2num(numImgStr);
            end
        else
            % invalid
        end
        
    else
        % no valid input
    end
    
end


% Update handles structure
guidata(hObject, handles);


function storeMultiImgs(hObject, eventdata, handles)
% This function saves two arrangements of the image into two image files
% as long as the number of images saved does not exceed the total number
% specified

global mysaveMulti;
global MultifoldernameB1;
global MultifoldernameB2;
global MultiTotalImgs;
global Multiprefix;
global savedMultiImgNum;
% savedMultiImgNum=savedMultiImgNum+1;
savedMultiImgNum=savedMultiImgNum+1;

if savedMultiImgNum<=MultiTotalImgs
    imwrite(handles.Z1,[MultifoldernameB1 '/' Multiprefix 'Image' num2str(savedMultiImgNum) '_B1.png']);
    imwrite(handles.Z2,[MultifoldernameB2 '/' Multiprefix 'Image' num2str(savedMultiImgNum) '_B2.png']);
%     imwrite(handles.Z3,[MultifoldernameB1 '/' Multiprefix 'Image' num2str(savedMultiImgNum+1) '_B1.png']);
%     imwrite(handles.Z4,[MultifoldernameB2 '/' Multiprefix 'Image' num2str(savedMultiImgNum+1) '_B2.png']);
else
    mysaveMulti=0;
end


% Update handles structure
guidata(hObject, handles);



% --- Executes on button press in RecordVidToggleBtn.
function RecordVidToggleBtn_Callback(hObject, eventdata, handles)
% hObject    handle to RecordVidToggleBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RecordVidToggleBtn

% This funtion sets mysaveVideo variable to 1 and creates videoWriter 
% objects when the toggle button is pressed and the display is on. It resets 
% mysaveVideo variable and closes videoWriter objects when the toggle button 
% is unpressed

global mysaveVideo;

if get(handles.DisplayImgTogglebtn, 'Value')
     
    if get(hObject,'Value')
        set(hObject, 'BackgroundColor',[1 1 0]);
        set(hObject,'String','Record Video - Stop');
        mysaveVideo=1;
        createVids(hObject, eventdata, handles);
    else
        set(hObject, 'BackgroundColor',[0 1 0]);
        set(hObject,'String','Record Video - Start');
        mysaveVideo=0;
        closeVids();
    end
    
else
    % if display is off, this toggle button cannot be pressed
    mysaveVideo=0;
    if get(hObject,'Value')
%         set(hObject,'String','No Data Available');      
        set(hObject,'Value',0);
%         pause(1);
%         set(hObject,'String','Record Video - Start');
    end
end

% Update handles structure
guidata(hObject, handles);


function createVids(hObject, eventdata, handles)
% This funtion creates videoWriter objects with distinguished names
global v1;
global v2;

handles.savedVidNum=handles.savedVidNum+1;

% Identify the next available names for the video files
% while (exist(['defaultVideo' num2str(handles.savedVidNum) '_Arrangment1.mp4'], 'file'))||(exist(['defaultVideo' num2str(handles.savedVidNum) '_Arrangment2.mp4'], 'file'))
while (exist(['defaultVideo' num2str(handles.savedVidNum) '_Arrangment1.avi'], 'file'))||(exist(['defaultVideo' num2str(handles.savedVidNum) '_Arrangment2.avi'], 'file'))
    handles.savedVidNum=handles.savedVidNum+1;
end

% Create the videoWriter objects
% v1 = VideoWriter(['defaultVideo' num2str(handles.savedVidNum) '_Arrangment1.mp4'],'MPEG-4');
% v2 = VideoWriter(['defaultVideo' num2str(handles.savedVidNum) '_Arrangment2.mp4'],'MPEG-4');
v1 = VideoWriter(['defaultVideo' num2str(handles.savedVidNum) '_Arrangment1.avi'],'Motion JPEG AVI');
v1.Quality=100;
open(v1);
v2 = VideoWriter(['defaultVideo' num2str(handles.savedVidNum) '_Arrangment2.avi'],'Motion JPEG AVI');
v2.Quality=100;
open(v2);

% Update handles structure
guidata(hObject, handles);


function writeVids(hObject, eventdata, handles)
% This funtion writes two arrangements of the image into the videoWriter
% objects that are open

global v1;
global v2;
writeVideo(v1, handles.Z1);
writeVideo(v2, handles.Z2);

% Update handles structure
guidata(hObject, handles);


function closeVids()
% This funtion closes videoWriter objects

global v1;
global v2;
close(v1);
close(v2);



function NumImgSavedEdit_Callback(hObject, eventdata, handles)
% hObject    handle to NumImgSavedEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumImgSavedEdit as text
%        str2double(get(hObject,'String')) returns contents of NumImgSavedEdit as a double


% --- Executes during object creation, after setting all properties.
function NumImgSavedEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumImgSavedEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ExposureEdit_Callback(hObject, eventdata, handles)
% hObject    handle to ExposureEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ExposureEdit as text
%        str2double(get(hObject,'String')) returns contents of ExposureEdit as a double


% --- Executes during object creation, after setting all properties.
function ExposureEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ExposureEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NumPatternsEdit_Callback(hObject, eventdata, handles)
% hObject    handle to NumPatternsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumPatternsEdit as text
%        str2double(get(hObject,'String')) returns contents of NumPatternsEdit as a double


% --- Executes during object creation, after setting all properties.
function NumPatternsEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumPatternsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% This funtion unloads the library when the GUI is closed

if handles.obj.ptr~=0
    calllib('okFrontPanel', 'okFrontPanel_Destruct', handles.obj.ptr);
    unloadlibrary('okFrontPanel');
end
% Hint: delete(hObject) closes the figure
delete(hObject);



function NumMaskEdit_Callback(hObject, eventdata, handles)
% hObject    handle to NumMaskEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumMaskEdit as text
%        str2double(get(hObject,'String')) returns contents of NumMaskEdit as a double


% --- Executes during object creation, after setting all properties.
function NumMaskEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumMaskEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MaskCngSubcEdit_Callback(hObject, eventdata, handles)
% hObject    handle to MaskCngSubcEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MaskCngSubcEdit as text
%        str2double(get(hObject,'String')) returns contents of MaskCngSubcEdit as a double


% --- Executes during object creation, after setting all properties.
function MaskCngSubcEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MaskCngSubcEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z1_temp;
global Z2_temp;

%store the the output into a global variable that can be
%uesd in another GUI
Z1_temp=handles.Z1;
Z2_temp=handles.Z2;

pop_up('pop_up',handles);



% --- Executes on selection change in Resolution_Pop.
function Resolution_Pop_Callback(hObject, eventdata, handles)
% hObject    handle to Resolution_Pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Resolution_Pop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Resolution_Pop
global NumRow;
global NumCol;
global DispFrame;

res = get(hObject,'Value');
if res == 1
    NumRow = 160;
    NumCol = 184;
    DispFrame = 0
elseif res == 2
    NumRow = 80;
    NumCol = 60;
    DispFrame = 1
else
    NumRow = 160;
    NumCol = 120;
    DispFrame = 2
end

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function Resolution_Pop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Resolution_Pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over DisplayImgTogglebtn.
function DisplayImgTogglebtn_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to DisplayImgTogglebtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on DisplayImgTogglebtn and none of its controls.
function DisplayImgTogglebtn_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to DisplayImgTogglebtn (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ImageCalibToggle.
function ImageCalibToggle_Callback(hObject, eventdata, handles)
% hObject    handle to ImageCalibToggle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ImageCalibToggle
global imgCalib
imgCalib = get(hObject,'Value');

guidata(hObject, handles);


% --- Executes on button press in histtoggle.
function histtoggle_Callback(hObject, eventdata, handles)
% hObject    handle to histtoggle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global showHist
showHist = get(hObject, 'Value');

% Hint: get(hObject,'Value') returns toggle state of histtoggle
