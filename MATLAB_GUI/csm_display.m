function varargout = csm_display(varargin)
% CSM_DISPLAY MATLAB code for csm_display.fig
%      CSM_DISPLAY, by itself, creates a new CSM_DISPLAY or raises the existing
%      singleton*.
%
%      H = CSM_DISPLAY returns the handle to a new CSM_DISPLAY or the handle to
%      the existing singleton*.
%
%      CSM_DISPLAY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CSM_DISPLAY.M with the given input arguments.
%
%      CSM_DISPLAY('Property','Value',...) creates a new CSM_DISPLAY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before csm_display_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to csm_display_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help csm_display

% Last Modified by GUIDE v2.5 25-Sep-2015 17:01:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @csm_display_OpeningFcn, ...
                   'gui_OutputFcn',  @csm_display_OutputFcn, ...
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


% --- Executes just before csm_display is made visible.
function csm_display_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to csm_display (see VARARGIN)

mainGuiInput = find(strcmp(varargin, 'csm_main'));
if (~isempty(mainGuiInput)) && (length(varargin) > mainGuiInput)
    % || (~ishandle(varargin{mainGuiInput+1}))
    handles.maingui = varargin{mainGuiInput+1};
    main = handles.maingui;
    % handles.scrollYN = main.scrollImage;
    handles.guiHandle = main;
end


handles.TimerUpdateRate = 1;
% handles.Timer = timer( ...
%         'BusyMode', 'drop', ...
%         'ExecutionMode', 'fixedSpacing', ...
%         'Period', handles.TimerUpdateRate, ...
%         'TimerFcn', {@timerUpdate, hObject});
%
% Choose default command line output for csm_display
handles.output = hObject;


% Update handles structure
guidata(hObject, handles);
% start(handles.Timer);

image_for_scrolling = imread('D14.bmp');  % 255 is needed for .bmp format
% image_for_scrolling = imread('800alignment.jpg');  
darkImage = imread('darkframe.jpg');
brightImage = imread('brightframe.jpg');

setappdata(0, 'hDisplay', gcf);
setappdata(gcf, 'Image', image_for_scrolling);
setappdata(gcf, 'darkImage', darkImage);
setappdata(gcf, 'setDarkImage', @setDarkImage);

setappdata(gcf, 'brightImage', brightImage);
setappdata(gcf, 'setBrightImage', @setBrightImage);

setappdata(gcf, 'hDispAxes', handles.disp_axes);
setappdata(gcf, 'scrollFunc', @scrollImage);
setappdata(gcf, 'fImShow', @showImage);
setappdata(gcf, 'test', 1);

imshow(image_for_scrolling, 'parent', handles.disp_axes);

% UIWAIT makes csm_display wait for user response (see UIRESUME)
% uiwait(handles.csm_display);


% --- Outputs from this function are returned to the command line.
function varargout = csm_display_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function timerUpdate(varargin)
myhObject = varargin{3};
myhandles = guidata(myhObject);

% scroll image toggle from main gui is active
% if (myhandles.scrollYN)
%     myhandles.Image = scrollImage(myhandles.Image);
% end
% imshow(myhandles.Image, 'parent', myhandles.disp_axes);

guidata(myhObject, myhandles);

function showImage
hDisplay = getappdata(0, 'hDisplay');
iFrame = getappdata(hDisplay, 'Image');
disp_axes = getappdata(hDisplay, 'hDispAxes');

if isempty(iFrame)
    disp('Something is bonkers, image is empty.');
else
    imshow(iFrame, 'parent', disp_axes);
end


function setDarkImage
hDisplay = getappdata(0, 'hDisplay');
iFrame = getappdata(hDisplay, 'darkImage');
disp_axes = getappdata(hDisplay, 'hDispAxes');

if isempty(iFrame)
    disp('Something is bonkers, image is empty.');
else
    imshow(iFrame, 'parent', disp_axes);
end

function setBrightImage
hDisplay = getappdata(0, 'hDisplay');
iFrame = getappdata(hDisplay, 'brightImage');
disp_axes = getappdata(hDisplay, 'hDispAxes');

if isempty(iFrame)
    disp('Something is bonkers, image is empty.');
else
    imshow(iFrame, 'parent', disp_axes);
end


function scrollImage
% scroll, bringing from bottom to top

scrollsize = 2;

hDisplay = getappdata(0, 'hDisplay');
iFrame = getappdata(hDisplay, 'Image');
disp_axes = getappdata(hDisplay, 'hDispAxes');

if isempty(iFrame)
    disp('Something is bonkers, image is empty.');
else
    fs = size(iFrame);
    oFrame = iFrame;
    oFrame(scrollsize + 1:fs(1), :) = iFrame(1:fs(1)-scrollsize, :);
    oFrame(1:scrollsize, :) = iFrame(fs(1)-scrollsize+1:fs(1), :);

    setappdata(hDisplay, 'Image', oFrame);
    imshow(oFrame, 'parent', disp_axes);
end


% --- Executes when user attempts to close csm_display.
function csm_display_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to csm_display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
% stop(handles.Timer);
% delete(handles.Timer);
delete(hObject);


% --- Executes when csm_display is resized.
function csm_display_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to csm_display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
