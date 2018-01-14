function varargout = P1(varargin)
% P1 MATLAB code for P1.fig
%      P1, by itself, creates a new P1 or raises the existing
%      singleton*.
%
%      H = P1 returns the handle to a new P1 or the handle to
%      the existing singleton*.
%
%      P1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in P1.M with the given input arguments.
%
%      P1('Property','Value',...) creates a new P1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before P1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to P1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help P1

% Last Modified by GUIDE v2.5 08-Jan-2018 10:39:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @P1_OpeningFcn, ...
                   'gui_OutputFcn',  @P1_OutputFcn, ...
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


% --- Executes just before P1 is made visible.
function P1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to P1 (see VARARGIN)

% Choose default command line output for P1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes P1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = P1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
n=get(handles.listbox1,'Value');
a=get(handles.listbox1,'String');
xy= str2num(a(n,:))

a=str2num(a)
s=size(a)
a(1,1)
a(2,1)
axes(handles.axes1);
cla(handles.axes1);

for ii=2:s(1)
    hold on;
    plot([a(ii,1),a(ii-1,1)],[a(ii,2),a(ii-1,2)],'-o','color','r')
end
plot([xy(1)-0.1,xy(1)+0.1],[xy(2)-0.1,xy(2)-0.1],'color','g')
plot([xy(1)-0.1,xy(1)+0.1],[xy(2)+0.1,xy(2)+0.1],'color','g')
plot([xy(1)+0.1,xy(1)+0.1],[xy(2)-0.1,xy(2)+0.1],'color','g')
plot([xy(1)-0.1,xy(1)-0.1],[xy(2)-0.1,xy(2)+0.1],'color','g')
hold off;


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=load('cF2017finalP1.mat');
a=a.pt;
s=size(a)
a(2)
axes(handles.axes1);
cla(handles.axes1);
hold on
plot([a(1,1)-0.1,a(1,1)+0.1],[a(1,2)-0.1,a(1,2)-0.1],'color','g')
plot([a(1,1)-0.1,a(1,1)+0.1],[a(1,2)+0.1,a(1,2)+0.1],'color','g')
plot([a(1,1)+0.1,a(1,1)+0.1],[a(1,2)-0.1,a(1,2)+0.1],'color','g')
plot([a(1,1)-0.1,a(1,1)-0.1],[a(1,2)-0.1,a(1,2)+0.1],'color','g')
for ii=2:s(1)
    plot([a(ii,1),a(ii-1,1)],[a(ii,2),a(ii-1,2)],'-o','color','r')
end
a=num2str(a);
set(handles.listbox1,'Value',1);

hold off


set(handles.listbox1,'String',a);



% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.listbox1,'String');
a=str2num(a)
pt=a;  


save('cF2017finalP1.mat','pt')






% --- Executes on button press in UP.
function UP_Callback(hObject, eventdata, handles)
% hObject    handle to UP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=get(handles.listbox1,'Value');
a=get(handles.listbox1,'String');
xy= str2num(a(n,:))
select=a(n,:);
up=a(n-1,:);
a(n,:)=up;
a(n-1,:)=select
set(handles.listbox1,'String',a);

a=get(handles.listbox1,'String')
a=str2num(a)
s=size(a)
a(1,1)
a(2,1)
axes(handles.axes1);
cla(handles.axes1);

for ii=2:s(1)
    hold on;
    plot([a(ii,1),a(ii-1,1)],[a(ii,2),a(ii-1,2)],'-o','color','r')
end
plot([xy(1)-0.1,xy(1)+0.1],[xy(2)-0.1,xy(2)-0.1],'color','g')
plot([xy(1)-0.1,xy(1)+0.1],[xy(2)+0.1,xy(2)+0.1],'color','g')
plot([xy(1)+0.1,xy(1)+0.1],[xy(2)-0.1,xy(2)+0.1],'color','g')
plot([xy(1)-0.1,xy(1)-0.1],[xy(2)-0.1,xy(2)+0.1],'color','g')
set(handles.listbox1,'Value',n-1);
hold off;




% --- Executes on button press in down.
function down_Callback(hObject, eventdata, handles)
% hObject    handle to down (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=get(handles.listbox1,'Value');
a=get(handles.listbox1,'String');
xy= str2num(a(n,:))

select=a(n,:);
up=a(n+1,:);
a(n,:)=up;
a(n+1,:)=select;
set(handles.listbox1,'String',a);

a=get(handles.listbox1,'String');
a=str2num(a);
s=size(a);
a(1,1);
a(2,1);
axes(handles.axes1);
cla(handles.axes1);

for ii=1:s(1)-1
    hold on;
    plot([a(ii,1),a(ii+1,1)],[a(ii,2),a(ii+1,2)],'-o','color','r')
end
plot([xy(1)-0.1,xy(1)+0.1],[xy(2)-0.1,xy(2)-0.1],'color','g')
plot([xy(1)-0.1,xy(1)+0.1],[xy(2)+0.1,xy(2)+0.1],'color','g')
plot([xy(1)+0.1,xy(1)+0.1],[xy(2)-0.1,xy(2)+0.1],'color','g')
plot([xy(1)-0.1,xy(1)-0.1],[xy(2)-0.1,xy(2)+0.1],'color','g')
set(handles.listbox1,'Value',n+1);
hold off;
