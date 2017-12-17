function varargout = lab9(varargin)
% LAB9 MATLAB code for lab9.fig
%      LAB9, by itself, creates a new LAB9 or raises the existing
%      singleton*.
%
%      H = LAB9 returns the handle to a new LAB9 or the handle to
%      the existing singleton*.
%
%      LAB9('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAB9.M with the given input arguments.
%
%      LAB9('Property','Value',...) creates a new LAB9 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lab9_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lab9_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lab9

% Last Modified by GUIDE v2.5 14-Dec-2017 10:26:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lab9_OpeningFcn, ...
                   'gui_OutputFcn',  @lab9_OutputFcn, ...
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


% --- Executes just before lab9 is made visible.
function lab9_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lab9 (see VARARGIN)

% Choose default command line output for lab9
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lab9 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lab9_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
global datavalue;
set(handles.slider1,'Value',0);
path=get(handles.popupmenu2,'String');
datavalue=get(handles.popupmenu2,'Value')
foldername=path(datavalue);
foldername=char(foldername)
imagefiles = dir(strcat(foldername,'/*.jpg'));
nfiles=length(imagefiles)
if nfiles >= 1
currentfilename = imagefiles(mod(get(handles.slider1,'Value'),nfiles)+1).name;
s=strcat(foldername,'/');
s=strcat(s,currentfilename);
image = imread(s);
imsize=size(image)
x=imsize(1);
y=imsize(2);
zoom=1;
if imsize(1)>480
    image=imresize(image,480/imsize(1));
    zoom=zoom*(480/imsize(1));
end
imsize=size(image)
if imsize(2)>640
    image=imresize(image,640/imsize(2));
    zoom=zoom*(640/imsize(2));
end
imsize=size(image)
if imsize(1)==480
    image=padarray(image,[0 ceil((640-imsize(2))/2)],'both');
elseif imsize(2)==640
    image=padarray(image,[ceil((480-imsize(1))/2) 0],'both');
else
    image=padarray(image,[ceil((480-imsize(1))/2) ceil((640-imsize(2))/2)],'both');    
    
end
axes(handles.axImage);
imshow(image);
cla(handles.axHighlight);
tit=strcat({'picture'},{'1'},{' of '},{num2str(nfiles)},{' '},{currentfilename},{' '},{num2str(x)},{'x'},{num2str(y)},{' '},{num2str(zoom*100)},{'%'});
set(handles.st_text,'String',tit);
end



% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global datavalue;
set(handles.slider1,'Value',0);
foldername=uigetdir;
current=cellstr(get(handles.popupmenu2,'String'));
current{end+1}=foldername;
sz=size(current);
datavalue=sz(1);
set(handles.popupmenu2,'String',current);
imagefiles = dir(strcat(foldername,'/*.jpg'));
nfiles=length(imagefiles)
if nfiles >= 1
currentfilename = imagefiles(mod(get(handles.slider1,'Value'),nfiles)+1).name;
s=strcat(foldername,'/');
s=strcat(s,currentfilename);
image = imread(s);
imsize=size(image);
x=imsize(1);
y=imsize(2);
zoom=1;
if imsize(1)>480
    image=imresize(image,480/imsize(1));
    zoom=zoom*(480/imsize(1));
end
imsize=size(image)
if imsize(2)>640
    image=imresize(image,640/imsize(2));
    zoom=zoom*(640/imsize(2));
end
imsize=size(image)
if imsize(1)==480
    image=padarray(image,[0 ceil((640-imsize(2))/2)],'both');
elseif imsize(2)==640
    image=padarray(image,[ceil((480-imsize(1))/2) 0],'both');
else
    image=padarray(image,[ceil((480-imsize(1))/2) ceil((640-imsize(2))/2)],'both');    
    
end
axes(handles.axImage);
imshow(image);
cla(handles.axHighlight);
tit=strcat({'picture'},{'1'},{' of '},{num2str(nfiles)},{' '},{currentfilename},{' '},{num2str(x)},{'x'},{num2str(y)},{' '},{num2str(zoom*100)},{'%'});
set(handles.st_text,'String',tit);
end




% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global datavalue;

current=cellstr(get(handles.popupmenu2,'String'))
foldername=current{datavalue};
imagefiles = dir(strcat(foldername,'/*.jpg'));

nfiles=length(imagefiles)
if nfiles>=1
currentfilename = imagefiles(mod(ceil(get(handles.slider1,'Value')),nfiles)+1).name;
s=strcat(foldername,'/');
s=strcat(s,currentfilename);
image = imread(s);
imsize=size(image)
x=imsize(1);
y=imsize(2);
zoom=1;
if imsize(1)>480
    image=imresize(image,480/imsize(1));
    zoom=zoom*(480/imsize(1));
end
imsize=size(image)
if imsize(2)>640
    image=imresize(image,640/imsize(2));
    zoom=zoom*(640/imsize(2));
end
imsize=size(image)
if imsize(1)==480
    image=padarray(image,[0 ceil((640-imsize(2))/2)],'both');
elseif imsize(2)==640
    image=padarray(image,[ceil((480-imsize(1))/2) 0],'both');
else
    image=padarray(image,[ceil((480-imsize(1))/2) ceil((640-imsize(2))/2)],'both');    
    
end
axes(handles.axImage);
imshow(image);
cla(handles.axHighlight);
tit=strcat({'picture'},{num2str(mod(get(handles.slider1,'Value'),nfiles)+1)},{' of '},{num2str(nfiles)},{' '},{currentfilename},{' '},{num2str(x)},{'x'},{num2str(y)},{' '},{num2str(zoom*100)},{'%'});
set(handles.st_text,'String',tit);
end


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function st_text_Callback(hObject, eventdata, handles)
% hObject    handle to st_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of st_text as text
%        str2double(get(hObject,'String')) returns contents of st_text as a double
tit=strcat({'picture'},{num2str()},{' of '},{num2str(nfiles)},{' '},{imagefiles(ii).name},{' '},{num2str(x)},{'x'},{num2str(y)},{' '},{num2str(zoom*100)},{'%'});

% --- Executes during object creation, after setting all properties.
function st_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to st_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pb_up.
function pb_up_Callback(hObject, eventdata, handles)
% hObject    handle to pb_up (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pt;
global bksz;
pt(2)=pt(2)-10;
current=cellstr(get(handles.popupmenu2,'String'));
foldername=current{end}
imagefiles = dir(strcat(foldername,'/*.jpg'));

nfiles=length(imagefiles)
if nfiles>=1
currentfilename = imagefiles(mod(get(handles.slider1,'Value'),nfiles)+1).name;
s=strcat(foldername,'/');
s=strcat(s,currentfilename);
image = imread(s);
imsize=size(image)
x=imsize(1);
y=imsize(2);
zoom=1;
if imsize(1)>480
    image=imresize(image,480/imsize(1));
    zoom=zoom*(480/imsize(1));
end
imsize=size(image)
if imsize(2)>640
    image=imresize(image,640/imsize(2));
    zoom=zoom*(640/imsize(2));
end
imsize=size(image)
if imsize(1)==480
    image=padarray(image,[0 ceil((640-imsize(2))/2)],'both');
elseif imsize(2)==640
    image=padarray(image,[ceil((480-imsize(1))/2) 0],'both');
else
    image=padarray(image,[ceil((480-imsize(1))/2) ceil((640-imsize(2))/2)],'both');    
    
end
axes(handles.axImage);
image(pt(2)-bksz:pt(2)+bksz,pt(1)-bksz,:)=1;
image(pt(2)-bksz:pt(2)+bksz,pt(1)+bksz,:)=1;
image(pt(2)-bksz,pt(1)-bksz:pt(1)+bksz,:)=1;
image(pt(2)+bksz,pt(1)-bksz:pt(1)+bksz,:)=1;
imshow(image);
image2=image(pt(2)-bksz:pt(2)+bksz,pt(1)-bksz:pt(1)+bksz,:);
image2=imresize(image2,3);
axes(handles.axHighlight);
imshow(image2);
tit=strcat({'picture'},{num2str(mod(get(handles.slider1,'Value'),nfiles)+1)},{' of '},{num2str(nfiles)},{' '},{currentfilename},{' '},{num2str(x)},{'x'},{num2str(y)},{' '},{num2str(zoom*100)},{'%'});
set(handles.st_text,'String',tit);
end


% --- Executes on button press in pb_right.
function pb_right_Callback(hObject, eventdata, handles)
% hObject    handle to pb_right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pt;
global bksz;
pt(1)=pt(1)+10;
current=cellstr(get(handles.popupmenu2,'String'));
foldername=current{end}
imagefiles = dir(strcat(foldername,'/*.jpg'));

nfiles=length(imagefiles)
if nfiles>=1
currentfilename = imagefiles(mod(get(handles.slider1,'Value'),nfiles)+1).name;
s=strcat(foldername,'/');
s=strcat(s,currentfilename);
image = imread(s);
imsize=size(image)
x=imsize(1);
y=imsize(2);
zoom=1;
if imsize(1)>480
    image=imresize(image,480/imsize(1));
    zoom=zoom*(480/imsize(1));
end
imsize=size(image)
if imsize(2)>640
    image=imresize(image,640/imsize(2));
    zoom=zoom*(640/imsize(2));
end
imsize=size(image)
if imsize(1)==480
    image=padarray(image,[0 ceil((640-imsize(2))/2)],'both');
elseif imsize(2)==640
    image=padarray(image,[ceil((480-imsize(1))/2) 0],'both');
else
    image=padarray(image,[ceil((480-imsize(1))/2) ceil((640-imsize(2))/2)],'both');    
    
end
axes(handles.axImage);
image(pt(2)-bksz:pt(2)+bksz,pt(1)-bksz,:)=1;
image(pt(2)-bksz:pt(2)+bksz,pt(1)+bksz,:)=1;
image(pt(2)-bksz,pt(1)-bksz:pt(1)+bksz,:)=1;
image(pt(2)+bksz,pt(1)-bksz:pt(1)+bksz,:)=1;
imshow(image);
image2=image(pt(2)-bksz:pt(2)+bksz,pt(1)-bksz:pt(1)+bksz,:);
image2=imresize(image2,3);
axes(handles.axHighlight);
imshow(image2);
tit=strcat({'picture'},{num2str(mod(get(handles.slider1,'Value'),nfiles)+1)},{' of '},{num2str(nfiles)},{' '},{currentfilename},{' '},{num2str(x)},{'x'},{num2str(y)},{' '},{num2str(zoom*100)},{'%'});
set(handles.st_text,'String',tit);
end


% --- Executes on button press in pb_left.
function pb_left_Callback(hObject, eventdata, handles)
% hObject    handle to pb_left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pt;
global bksz;
pt(1)=pt(1)-10;
current=cellstr(get(handles.popupmenu2,'String'));
foldername=current{end}
imagefiles = dir(strcat(foldername,'/*.jpg'));

nfiles=length(imagefiles)
if nfiles>=1
currentfilename = imagefiles(mod(get(handles.slider1,'Value'),nfiles)+1).name;
s=strcat(foldername,'/');
s=strcat(s,currentfilename);
image = imread(s);
imsize=size(image)
x=imsize(1);
y=imsize(2);
zoom=1;
if imsize(1)>480
    image=imresize(image,480/imsize(1));
    zoom=zoom*(480/imsize(1));
end
imsize=size(image)
if imsize(2)>640
    image=imresize(image,640/imsize(2));
    zoom=zoom*(640/imsize(2));
end
imsize=size(image)
if imsize(1)==480
    image=padarray(image,[0 ceil((640-imsize(2))/2)],'both');
elseif imsize(2)==640
    image=padarray(image,[ceil((480-imsize(1))/2) 0],'both');
else
    image=padarray(image,[ceil((480-imsize(1))/2) ceil((640-imsize(2))/2)],'both');    
    
end
axes(handles.axImage);
image(pt(2)-bksz:pt(2)+bksz,pt(1)-bksz,:)=1;
image(pt(2)-bksz:pt(2)+bksz,pt(1)+bksz,:)=1;
image(pt(2)-bksz,pt(1)-bksz:pt(1)+bksz,:)=1;
image(pt(2)+bksz,pt(1)-bksz:pt(1)+bksz,:)=1;
imshow(image);
image2=image(pt(2)-bksz:pt(2)+bksz,pt(1)-bksz:pt(1)+bksz,:);
image2=imresize(image2,3);
axes(handles.axHighlight);
imshow(image2);
tit=strcat({'picture'},{num2str(mod(get(handles.slider1,'Value'),nfiles)+1)},{' of '},{num2str(nfiles)},{' '},{currentfilename},{' '},{num2str(x)},{'x'},{num2str(y)},{' '},{num2str(zoom*100)},{'%'});
set(handles.st_text,'String',tit);
end


% --- Executes on button press in pb_down.
function pb_down_Callback(hObject, eventdata, handles)
% hObject    handle to pb_down (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pt;
global bksz;
pt(2)=pt(2)+10;
current=cellstr(get(handles.popupmenu2,'String'));
foldername=current{end}
imagefiles = dir(strcat(foldername,'/*.jpg'));

nfiles=length(imagefiles)
if nfiles>=1
currentfilename = imagefiles(mod(get(handles.slider1,'Value'),nfiles)+1).name;
s=strcat(foldername,'/');
s=strcat(s,currentfilename);
image = imread(s);
imsize=size(image)
x=imsize(1);
y=imsize(2);
zoom=1;
if imsize(1)>480
    image=imresize(image,480/imsize(1));
    zoom=zoom*(480/imsize(1));
end
imsize=size(image)
if imsize(2)>640
    image=imresize(image,640/imsize(2));
    zoom=zoom*(640/imsize(2));
end
imsize=size(image)
if imsize(1)==480
    image=padarray(image,[0 ceil((640-imsize(2))/2)],'both');
elseif imsize(2)==640
    image=padarray(image,[ceil((480-imsize(1))/2) 0],'both');
else
    image=padarray(image,[ceil((480-imsize(1))/2) ceil((640-imsize(2))/2)],'both');    
    
end
axes(handles.axImage);
image(pt(2)-bksz:pt(2)+bksz,pt(1)-bksz,:)=1;
image(pt(2)-bksz:pt(2)+bksz,pt(1)+bksz,:)=1;
image(pt(2)-bksz,pt(1)-bksz:pt(1)+bksz,:)=1;
image(pt(2)+bksz,pt(1)-bksz:pt(1)+bksz,:)=1;
imshow(image);
image2=image(pt(2)-bksz:pt(2)+bksz,pt(1)-bksz:pt(1)+bksz,:);
image2=imresize(image2,3);
axes(handles.axHighlight);
imshow(image2);
tit=strcat({'picture'},{num2str(mod(get(handles.slider1,'Value'),nfiles)+1)},{' of '},{num2str(nfiles)},{' '},{currentfilename},{' '},{num2str(x)},{'x'},{num2str(y)},{' '},{num2str(zoom*100)},{'%'});
set(handles.st_text,'String',tit);
end


% --- Executes on button press in pb_plus.
function pb_plus_Callback(hObject, eventdata, handles)
% hObject    handle to pb_plus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pt;
global bksz;
bksz=bksz+10;
current=cellstr(get(handles.popupmenu2,'String'));
foldername=current{end}
imagefiles = dir(strcat(foldername,'/*.jpg'));

nfiles=length(imagefiles)
if nfiles>=1
currentfilename = imagefiles(mod(get(handles.slider1,'Value'),nfiles)+1).name;
s=strcat(foldername,'/');
s=strcat(s,currentfilename);
image = imread(s);
imsize=size(image)
x=imsize(1);
y=imsize(2);
zoom=1;
if imsize(1)>480
    image=imresize(image,480/imsize(1));
    zoom=zoom*(480/imsize(1));
end
imsize=size(image)
if imsize(2)>640
    image=imresize(image,640/imsize(2));
    zoom=zoom*(640/imsize(2));
end
imsize=size(image)
if imsize(1)==480
    image=padarray(image,[0 ceil((640-imsize(2))/2)],'both');
elseif imsize(2)==640
    image=padarray(image,[ceil((480-imsize(1))/2) 0],'both');
else
    image=padarray(image,[ceil((480-imsize(1))/2) ceil((640-imsize(2))/2)],'both');    
    
end
axes(handles.axImage);
image(pt(2)-bksz:pt(2)+bksz,pt(1)-bksz,:)=1;
image(pt(2)-bksz:pt(2)+bksz,pt(1)+bksz,:)=1;
image(pt(2)-bksz,pt(1)-bksz:pt(1)+bksz,:)=1;
image(pt(2)+bksz,pt(1)-bksz:pt(1)+bksz,:)=1;
imshow(image);
image2=image(pt(2)-bksz:pt(2)+bksz,pt(1)-bksz:pt(1)+bksz,:);
image2=imresize(image2,3);
axes(handles.axHighlight);
imshow(image2);
tit=strcat({'picture'},{num2str(mod(get(handles.slider1,'Value'),nfiles)+1)},{' of '},{num2str(nfiles)},{' '},{currentfilename},{' '},{num2str(x)},{'x'},{num2str(y)},{' '},{num2str(zoom*100)},{'%'});
set(handles.st_text,'String',tit);
end

% --- Executes on button press in pb_minus.
function pb_minus_Callback(hObject, eventdata, handles)
% hObject    handle to pb_minus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pt;
global bksz;
bksz=bksz-10;
current=cellstr(get(handles.popupmenu2,'String'));
foldername=current{end}
imagefiles = dir(strcat(foldername,'/*.jpg'));

nfiles=length(imagefiles)
if nfiles>=1
currentfilename = imagefiles(mod(get(handles.slider1,'Value'),nfiles)+1).name;
s=strcat(foldername,'/');
s=strcat(s,currentfilename);
image = imread(s);
imsize=size(image)
x=imsize(1);
y=imsize(2);
zoom=1;
if imsize(1)>480
    image=imresize(image,480/imsize(1));
    zoom=zoom*(480/imsize(1));
end
imsize=size(image)
if imsize(2)>640
    image=imresize(image,640/imsize(2));
    zoom=zoom*(640/imsize(2));
end
imsize=size(image)
if imsize(1)==480
    image=padarray(image,[0 ceil((640-imsize(2))/2)],'both');
elseif imsize(2)==640
    image=padarray(image,[ceil((480-imsize(1))/2) 0],'both');
else
    image=padarray(image,[ceil((480-imsize(1))/2) ceil((640-imsize(2))/2)],'both');    
    
end
axes(handles.axImage);
image(pt(2)-bksz:pt(2)+bksz,pt(1)-bksz,:)=1;
image(pt(2)-bksz:pt(2)+bksz,pt(1)+bksz,:)=1;
image(pt(2)-bksz,pt(1)-bksz:pt(1)+bksz,:)=1;
image(pt(2)+bksz,pt(1)-bksz:pt(1)+bksz,:)=1;
imshow(image);
image2=image(pt(2)-bksz:pt(2)+bksz,pt(1)-bksz:pt(1)+bksz,:);
image2=imresize(image2,3);
axes(handles.axHighlight);
imshow(image2);
tit=strcat({'picture'},{num2str(mod(get(handles.slider1,'Value'),nfiles)+1)},{' of '},{num2str(nfiles)},{' '},{currentfilename},{' '},{num2str(x)},{'x'},{num2str(y)},{' '},{num2str(zoom*100)},{'%'});
set(handles.st_text,'String',tit);
end


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pt;
global bksz;
global datavalue;
bksz=50;
r = get(gca, 'CurrentPoint');
pt = r(1, 1:2);
pt=ceil(pt)% coordinates in 2-D

current=cellstr(get(handles.popupmenu2,'String'));
foldername=current{datavalue};
imagefiles = dir(strcat(foldername,'/*.jpg'));

nfiles=length(imagefiles)
if nfiles>=1
currentfilename = imagefiles(mod(ceil(get(handles.slider1,'Value')),nfiles)+1).name;
s=strcat(foldername,'/');
s=strcat(s,currentfilename);
image = imread(s);
imsize=size(image)
x=imsize(1);
y=imsize(2);
zoom=1;
if imsize(1)>480
    image=imresize(image,480/imsize(1));
    zoom=zoom*(480/imsize(1));
end
imsize=size(image)
if imsize(2)>640
    image=imresize(image,640/imsize(2));
    zoom=zoom*(640/imsize(2));
end
imsize=size(image)
if imsize(1)==480
    image=padarray(image,[0 ceil((640-imsize(2))/2)],'both');
elseif imsize(2)==640
    image=padarray(image,[ceil((480-imsize(1))/2) 0],'both');
else
    image=padarray(image,[ceil((480-imsize(1))/2) ceil((640-imsize(2))/2)],'both');    
    
end
axes(handles.axImage);
image(pt(2)-bksz:pt(2)+bksz,pt(1)-bksz,:)=1;
image(pt(2)-bksz:pt(2)+bksz,pt(1)+bksz,:)=1;
image(pt(2)-bksz,pt(1)-bksz:pt(1)+bksz,:)=1;
image(pt(2)+bksz,pt(1)-bksz:pt(1)+bksz,:)=1;

imshow(image);
image2=image(pt(2)-bksz:pt(2)+bksz,pt(1)-bksz:pt(1)+bksz,:);
image2=imresize(image2,3);
axes(handles.axHighlight);
imshow(image2);
tit=strcat({'picture'},{num2str(mod(get(handles.slider1,'Value'),nfiles)+1)},{' of '},{num2str(nfiles)},{' '},{currentfilename},{' '},{num2str(x)},{'x'},{num2str(y)},{' '},{num2str(zoom*100)},{'%'});
set(handles.st_text,'String',tit);
end
