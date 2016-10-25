function varargout = window(varargin)
% WINDOW MATLAB code for window.fig
%      WINDOW, by itself, creates a new WINDOW or raises the existing
%      singleton*.
%
%      H = WINDOW returns the handle to a new WINDOW or the handle to
%      the existing singleton*.
%
%      WINDOW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WINDOW.M with the given input arguments.
%
%      WINDOW('Property','Value',...) creates a new WINDOW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before window_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to window_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help window

% Last Modified by GUIDE v2.5 24-Oct-2016 22:51:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @window_OpeningFcn, ...
                   'gui_OutputFcn',  @window_OutputFcn, ...
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


% --- Executes just before window is made visible.
function window_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to window (see VARARGIN)

% Choose default command line output for window
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes window wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = window_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnplot.
function btnplot_Callback(hObject, eventdata, handles)
% hObject    handle to btnplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 pole1 = str2double(get(handles.pole1,'String')); %edit1 being Tag of ur edit box
 pole2 = str2double(get(handles.pole2,'String'));
 gain =  str2double(get(handles.gain,'String'));
 tss =  str2double(get(handles.tss,'String'));
 mp =  str2double(get(handles.mp,'String'));
 if isempty(pole1)
    fprintf('User please enter the value first\n');
 else
     fprintf('The pole 1 is : %s', pole1)
     fpid = @pid
     fpid(pole1, pole2 , gain, tss, mp)
   % Write code for computation you want to do 
 end

% --- Executes on button press in btnclean.
function btnclean_Callback(hObject, eventdata, handles)
% hObject    handle to btnclean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function pole1_Callback(hObject, eventdata, handles)
% hObject    handle to pole1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pole1 as text
%        str2double(get(hObject,'String')) returns contents of pole1 as a double


% --- Executes during object creation, after setting all properties.
function pole1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pole1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pole2_Callback(hObject, eventdata, handles)
% hObject    handle to pole2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pole2 as text
%        str2double(get(hObject,'String')) returns contents of pole2 as a double


% --- Executes during object creation, after setting all properties.
function pole2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pole2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gain_Callback(hObject, eventdata, handles)
% hObject    handle to gain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gain as text
%        str2double(get(hObject,'String')) returns contents of gain as a double


% --- Executes during object creation, after setting all properties.
function gain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function f = pid(pole1, pole2 , gain, tss, Mp)


    %define the zeros, poles and gain  
    zeros = [];     
    polos = [pole1 pole2];
    [nums,dens] = zp2tf(zeros,polos,gain);

    %Get some parameters  for create the transfer function 
    Wn = sqrt(dens(3)); %check is the pos 3 exist
    K = nums(3) ;
    Z =  dens(2) / (2 * Wn); 

    %Create the transfer function based on the parameters
    num = [K*(Wn^2)];
    den = [1 2*Z*Wn Wn^2];
    Gs = tf(num,den)
    step(Gs)
    grid on


    Kd = 1;
    Zd = abs(log(Mp)) /  sqrt ( pi^2 + log(Mp)^2);
    Wnd =  4 / (Zd*tss);
    numd = [Kd*(Wnd^2)];
    dend = [1 2*Zd*Wnd Wnd^2];
    Gd = tf(numd,dend)

    hold on
    step(Gd)
    
    %Calc the transfer function
    %based on the dominant pole 
    dominant_pole =-5*max(real(roots(dend)));
    Gnd = tf([dominant_pole],[1 dominant_pole])

    %Now the multiplication of the transfer 
    %functions for could compare among the functions
    Gd3 = series(Gd, Gnd)

    %Create another figure
    figure(2)
   
    step(Gd)
    grid on 
    hold on
    step(Gd3)

    
    %Now the values of the PID
    Kd = (Gd3.den{1}(2)- Gs.den{1}(2)) / Gs.num{1}(3);
    Kp = (Gd3.den{1}(3)-  Gs.den{1}(3)) / Gs.num{1}(3);
    Ki = Gd3.den{1}(4) / Gs.num{1}(3);
    
    Cs = tf([Kd Kp Ki], [1 0])
     %Now get the desire function
    Glc = feedback(series(Gs, Cs), 1)
    step(Glc)



function tss_Callback(hObject, eventdata, handles)
% hObject    handle to tss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tss as text
%        str2double(get(hObject,'String')) returns contents of tss as a double


% --- Executes during object creation, after setting all properties.
function tss_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mp_Callback(hObject, eventdata, handles)
% hObject    handle to mp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mp as text
%        str2double(get(hObject,'String')) returns contents of mp as a double


% --- Executes during object creation, after setting all properties.
function mp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
