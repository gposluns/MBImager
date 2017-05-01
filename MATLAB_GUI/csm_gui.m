function varargout = csm_gui(varargin)
%CSM_GUI M-file for csm_gui.fig
%      CSM_GUI, by itself, creates a new CSM_GUI or raises the existing
%      singleton*.
%
%      H = CSM_GUI returns the handle to a new CSM_GUI or the handle to
%      the existing singleton*.
%
%      CSM_GUI('Property','Value',...) creates a new CSM_GUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to csm_gui_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      CSM_GUI('CALLBACK') and CSM_GUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in CSM_GUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help csm_gui

% Last Modified by GUIDE v2.5 13-Sep-2015 17:19:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct( ...
                'gui_Name',       mfilename, ...
                'gui_Singleton',  gui_Singleton, ...
                'gui_OpeningFcn', @csm_gui_OpeningFcn, ...
                'gui_OutputFcn',  @csm_gui_OutputFcn, ...
                'gui_LayoutFcn',  [], ...
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


% --- Executes just before csm_gui is made visible.
function csm_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for csm_gui
handles.output = hObject; % Stores figure handle in output
handles.callbackObj = csm_callbacks;
handles.Imdiv = 0;
handles.TimerUpdateRate = 0.001;

csm_display('csm_main', handles);

% This MUST be the last handle added
handles.Timer = timer( ...
                'BusyMode', 'drop', ...
                'ExecutionMode', 'fixedSpacing', ...
                'Period', handles.TimerUpdateRate, ...
                'TimerFcn', {@timerUpdate, hObject});
                % 'ErrorFcn', @timerError);
% Update handles structure
guidata(hObject, handles);

%%
% PARAMETERS

setappdata(0, 'hMain', gcf);
setappdata(gcf, 'enAutoSave', 0);

% initialize some values
setappdata(gcf, 'frameStabilized', 0);
setappdata(gcf, 'isDark', 0);
setappdata(gcf, 'isBright', 0);
setappdata(gcf, 'enAutoSave', 0);

% UIWAIT makes csm_gui wait for user response (see UIRESUME)
% uiwait(handles.mainfig);


% --- Outputs from this function are returned to the command line.
function varargout = csm_gui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

start(handles.Timer);

handles.test = 0;
handles.callbackObj.start(hObject);

guidata(hObject, handles);


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.callbackObj.save(handles);


% --- Executes when user attempts to close mainfig.
function mainfig_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to mainfig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
stop(handles.Timer);
delete(handles.Timer);
handles.callbackObj.close();
delete(hObject);

function timerUpdate(varargin)
% varargin   unrecognized PropertyName/PropertyValue pairs
myhObject = varargin{3};
myhandles = guidata(myhObject);
updatedhandle = myhandles.callbackObj.timerUpdate(myhandles);
guidata(myhObject, updatedhandle);

% run scrolling function code 
hMain = getappdata(0, 'hMain');
hDisplay = getappdata(0, 'hDisplay');

% isRead = 1: refresh image
% isRead = 2: scroll image

switch getappdata(hMain, 'isRead')
    case 1
        fshowIm = getappdata(hDisplay, 'fImShow');
        feval(fshowIm);
    case 2
        runscroll = getappdata(hDisplay, 'scrollFunc');
        feval(runscroll);
end
setappdata(hMain', 'isRead', 0);

if isappdata(hMain, 'Shutdown') && getappdata(hMain, 'Shutdown') == 1
    stop(myhandles.Timer);
    delete(myhandles.Timer);
    myhandles.callbackObj.close();
    delete(hObject);
end


% --- Executes when selected object is changed in bgSplit.
function bgSplit_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in bgSplit 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

switch get(eventdata.NewValue, 'Tag')
    case 'rbRawData'
        handles.Imdiv = 0;
    case 'rbInterlaced'
        handles.Imdiv = 1;
    case 'rbSplit'
        handles.Imdiv = 2;
    case 'rbSplitSS'
        handles.Imdiv = 3;
end 

guidata(hObject, handles);


% --- Executes on button press in btnAutosave.
function btnAutosave_Callback(hObject, eventdata, handles)
% hObject    handle to btnAutosave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hMain = getappdata(0, 'hMain');
setappdata(hMain, 'enAutoSave', 1);
set(hObject, 'Enable', 'off');


% --- Executes on button press in btnDarkframe.
function btnDarkframe_Callback(hObject, eventdata, handles)
% hObject    handle to btnDarkframe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hMain = getappdata(0, 'hMain');
hDisplay = getappdata(0, 'hDisplay');
rundark = getappdata(hDisplay, 'setDarkImage');
feval(rundark);
setappdata(hMain, 'isDark', 1);
setappdata(hMain, 'frameStabilized', 0);
set(hObject, 'Enable', 'off');


% --- Executes on button press in btnBrightframe.
function btnBrightframe_Callback(hObject, eventdata, handles)
% hObject    handle to btnBrightframe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hMain = getappdata(0, 'hMain');
hDisplay = getappdata(0, 'hDisplay');
runbright = getappdata(hDisplay, 'setBrightImage');
feval(runbright);
setappdata(hMain, 'isBright', 1);
setappdata(hMain, 'frameStabilized', 0);
set(hObject, 'Enable', 'off');


