function varargout = lab3(varargin)
% LAB3 M-file for lab3.fig
%      LAB3, by itself, creates a new LAB3 or raises the existing
%      singleton*.
%
%      H = LAB3 returns the handle to a new LAB3 or the handle to
%      the existing singleton*.
%
%      LAB3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAB3.M with the given input arguments.
%
%      LAB3('Property','Value',...) creates a new LAB3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lab3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lab3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lab3

% Last Modified by GUIDE v2.5 24-Oct-2011 20:24:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lab3_OpeningFcn, ...
                   'gui_OutputFcn',  @lab3_OutputFcn, ...
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


% --- Executes just before lab3 is made visible.
function lab3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lab3 (see VARARGIN)
% Choose default command line output for lab3
handles.output = hObject;

Hfig = handles.figure1;
handles.t = timer('ExecutionMode', 'FixedRate', 'Period', 1);
set(handles.t, 'TimerFcn', @(obj, event)tmrfcn(obj, event, Hfig));
set(handles.axes1, 'xtick', []);
set(handles.axes1, 'ytick', []);

global cc;
cc = hsv(12);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lab3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lab3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutto
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s;

s = serial('/dev/ttyUSB0');
set(s,'BaudRate', 115200);
fopen(s);

start(handles.t);

guidata(hObject, handles);


% --- Executes on button press in Stop_pushbutton.
function Stop_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Stop_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.t);

guidata(hObject, handles);
