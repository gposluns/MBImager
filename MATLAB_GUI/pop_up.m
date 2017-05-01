function varargout = pop_up(varargin)
% POP_UP MATLAB code for pop_up.fig
%      POP_UP, by itself, creates a new POP_UP or raises the existing
%      singleton*.
%
%      H = POP_UP returns the handle to a new POP_UP or the handle to
%      the existing singleton*.
%
%      POP_UP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POP_UP.M with the given input arguments.
%
%      POP_UP('Property','Value',...) creates a new POP_UP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pop_up_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pop_up_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pop_up

% Last Modified by GUIDE v2.5 25-Jan-2017 15:37:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pop_up_OpeningFcn, ...
                   'gui_OutputFcn',  @pop_up_OutputFcn, ...
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


% --- Executes just before pop_up is made visible.
function pop_up_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pop_up (see VARARGIN)

% Choose default command line output for pop_up
handles.output = hObject;

global Z1_temp;

global Z2_temp;

global x_val_ceptof;
x_val_ceptof=0;
global x_val_tg;
x_val_tg=0;
global y_val_px;
y_val_px=0;

global x_val;
x_val=0;
global y_val;
y_val=0;



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes pop_up wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = pop_up_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
global x_val_ceptof;
x_val_ceptof=0;





% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
global x_val_ceptof;
x_val_ceptof=1;



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z1_temp;
global Z2_temp;
cep = zeros(4,15,'uint8');
cep2 = zeros(4,15,'uint8');
nbins=256;
xbins=[0:1:255];

global y_val;
global x_val;
global x_val_ceptof;
global x_val_tg;

x_val=30*x_val_ceptof+15*x_val_tg;

cep=Z1_temp(81+y_val:84+y_val,3+x_val:17+x_val);
axes(handles.axes1);
hist(cep(:),xbins);
axes(handles.axes2);
imshow(cep);
cep2=Z2_temp(81+y_val:84+y_val,3+x_val:17+x_val);
axes(handles.axes11);
hist(cep2(:),xbins);
axes(handles.axes12);
imshow(cep2);

cep=Z1_temp(85+y_val:88+y_val,3+x_val:17+x_val);
axes(handles.axes3);
hist(cep(:),xbins);
axes(handles.axes4);
imshow(cep);
cep2=Z2_temp(85+y_val:88+y_val,3+x_val:17+x_val);
axes(handles.axes13);
hist(cep2(:),xbins);
axes(handles.axes14);
imshow(cep2);

cep=Z1_temp(89+y_val:92+y_val,3+x_val:17+x_val);
axes(handles.axes5);
hist(cep(:),xbins);
axes(handles.axes6);
imshow(cep);
cep2=Z2_temp(89+y_val:92+y_val,3+x_val:17+x_val);
axes(handles.axes15);
hist(cep2(:),xbins);
axes(handles.axes16);
imshow(cep2);


cep=Z1_temp(93+y_val:96+y_val,3+x_val:17+x_val);
axes(handles.axes7);
hist(cep(:),xbins);
axes(handles.axes8);
imshow(cep);
cep2=Z2_temp(93+y_val:96+y_val,3+x_val:17+x_val);
axes(handles.axes17);
hist(cep2(:),xbins);
axes(handles.axes18);
imshow(cep2);


cep=Z1_temp(97+y_val:100+y_val,3+x_val:17+x_val);
axes(handles.axes9);
hist(cep(:),xbins);
axes(handles.axes10);
imshow(cep);
cep2=Z2_temp(97+y_val:100+y_val,3+x_val:17+x_val);
axes(handles.axes19);
hist(cep2(:),xbins);
axes(handles.axes20);
imshow(cep2);


% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8
global x_val_tg;
x_val_tg=0;



% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9
global x_val_tg;
x_val_tg=1;



% --- Executes on button press in radiobutton10.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton10
global y_val;
y_val=0;


% --- Executes on button press in radiobutton11.
function radiobutton11_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton11
global y_val;
y_val=20;
