function varargout = file(varargin)
% FILE MATLAB code for file.fig
%      FILE, by itself, creates a new FILE or raises the existing
%      singleton*.
%
%      H = FILE returns the handle to a new FILE or the handle to
%      the existing singleton*.
%
%      FILE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FILE.M with the given input arguments.
%
%      FILE('Property','Value',...) creates a new FILE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before file_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to file_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help file

% Last Modified by GUIDE v2.5 27-Nov-2016 22:48:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @file_OpeningFcn, ...
                   'gui_OutputFcn',  @file_OutputFcn, ...
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


% --- Executes just before file is made visible.
function file_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to file (see VARARGIN)

% Choose default command line output for file
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes file wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.path_text2, 'String', 'Full Audio File Path Will Be Shown Here');
set(handles.path_text1, 'String', 'Full Audio File Path Will Be Shown Here');


% --- Outputs from this function are returned to the command line.
function varargout = file_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in import_button.
function import_button_Callback(hObject, eventdata, handles)
% hObject    handle to import_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename pathname] = uigetfile({'*.wav'}, 'File Selector - Audio File 1');

if isequal(filename,0)
    disp('No File Selected - Audio Browser 1')
else  
    global full;
    full = strcat (pathname, filename);
    set(handles.path_text1, 'String', full);
    global y;
    global Fs;
    [y,Fs] = audioread(full);
    global player; 
    player = audioplayer(y, Fs);
    axes(handles.axes1);
    plot(y);
end


% --- Executes during object creation, after setting all properties.
function path_text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to path_text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in play_button.
function play_button_Callback(hObject, eventdata, handles)
% hObject    handle to play_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%REFERENCE 1 BEGIN 
%https://www.mathworks.com/matlabcentral/answers/99704-how-can-i-interrupt-the-playback-of-an-audio-file-that-has-been-initiated-using-wavplay-in-matlab-7
global player;
play(player);
%REFERENCE 1 END


% --- Executes on button press in stop_button.
function stop_button_Callback(hObject, eventdata, handles)
% hObject    handle to stop_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% clear sound;
global player;
stop(player);


% --- Executes on button press in pause_button.
function pause_button_Callback(hObject, eventdata, handles)
% hObject    handle to pause_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
pause(player);


% --- Executes on button press in resume_button.
function resume_button_Callback(hObject, eventdata, handles)
% hObject    handle to resume_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
resume(player);


% --- Executes on button press in import2_buton.
function import2_buton_Callback(hObject, eventdata, handles)
% hObject    handle to import2_buton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname] = uigetfile({'*.wav'}, 'File Selector - Audio File 2');

if isequal(filename,0)
    disp('No file selected - Audio Browser 1');
else 
    global full2;
    full2 = strcat (pathname, filename);
    set(handles.path_text2, 'String', full2);
    global y2;
    global Fs2;
    [y2,Fs2] = audioread(full2);
    global player_2; 
    player_2 = audioplayer(y2, Fs2);
    axes(handles.axes2);
    plot(y2);
end


% --- Executes on button press in play2_button.
function play2_button_Callback(hObject, eventdata, handles)
% hObject    handle to play2_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_2;
play(player_2);


% --- Executes on button press in stop2_button.
function stop2_button_Callback(hObject, eventdata, handles)
% hObject    handle to stop2_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_2;
stop(player_2);


% --- Executes on button press in pause2_button.
function pause2_button_Callback(hObject, eventdata, handles)
% hObject    handle to pause2_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_2;
pause(player_2);


% --- Executes on button press in resume2_button.
function resume2_button_Callback(hObject, eventdata, handles)
% hObject    handle to resume2_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_2;
resume(player_2);


% --- Executes during object deletion, before destroying properties.
function path_text1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to path_text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure

global y;
global Fs;

y=0;
Fs=44100;
global player; 
player = audioplayer(y, Fs);
delete(hObject);


% --- Executes on button press in join_button.
function join_button_Callback(hObject, eventdata, handles)
% hObject    handle to join_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y;
global y2;
global y3;
global Fs;
y3 = [y;y2];
global player_3; 
player_3 = audioplayer(y3, Fs);
axes(handles.axes3);
plot(y3);


% --- Executes on button press in play3_join.
function play3_join_Callback(hObject, eventdata, handles)
% hObject    handle to play3_join (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_3;
play(player_3);


% --- Executes on button press in stop3_join.
function stop3_join_Callback(hObject, eventdata, handles)
% hObject    handle to stop3_join (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_3;
stop(player_3);


% --- Executes on button press in pause3_join.
function pause3_join_Callback(hObject, eventdata, handles)
% hObject    handle to pause3_join (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_3;
pause(player_3);


% --- Executes on button press in resume3_join.
function resume3_join_Callback(hObject, eventdata, handles)
% hObject    handle to resume3_join (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_3;
resume(player_3);


% --- Executes on button press in export_join.
function export_join_Callback(hObject, eventdata, handles)
% hObject    handle to export_join (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y3;
global Fs;
[file,path] = uiputfile('*.wav','Save WAV Audio File As');
if isequal(file,0) | isequal(path,0)
    disp('Operation Cancelled');
else 
    full3 = strcat (path, file);
    audiowrite(full3,y3,Fs);
end


% --- Executes on button press in merge_button.
function merge_button_Callback(hObject, eventdata, handles)
% hObject    handle to merge_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%REFERENCE 2 BEGIN 
%
global y;
global Fs;
global y2;
global y4;
global player_4;
% https://uk.mathworks.com/matlabcentral/newsreader/view_thread/165046
% https://uk.mathworks.com/matlabcentral/newsreader/view_thread/111181
audio1Left = y(:,1);
audio2Left = y2(:,1);

if length(audio1Left) > length(audio2Left)    
    % Audio 1 has to be longer than audio 2 for this to work
    audio2Left = [audio2Left; zeros(length(audio1Left) - length(audio2Left),1)];    
    y4 = audio1Left + audio2Left;
    player_4 = audioplayer(y4, Fs);
end

if length(audio1Left) < length(audio2Left)
    % Audio 2 has to be longer than audio 1 for this to work
    audio1Left = [audio1Left; zeros(length(audio2Left) - length(audio1Left),1)];
    y4 = audio1Left + audio2Left;    
    player_4 = audioplayer(y4, Fs);
end
%REFERENCE 2 END


% --- Executes on button press in export_merge.
function export_merge_Callback(hObject, eventdata, handles)
% hObject    handle to export_merge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y4;
global Fs;
[file,path] = uiputfile('*.wav','Save WAV Audio File As');
if isequal(file,0) || isequal(path,0)
    disp('Operation Cancelled');
else 
    full4 = strcat (path, file);
    audiowrite(full4,y4,Fs);
end


% --- Executes on button press in clear1_button.
function clear1_button_Callback(hObject, eventdata, handles)
% hObject    handle to clear1_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1, 'reset')
global y;
global Fs;

y=0;
Fs=44100;
global player; 
player = audioplayer(y, Fs);


% --- Executes on button press in apply_button.
function apply_button_Callback(hObject, eventdata, handles)
% hObject    handle to apply_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y;
global Fs;
global Fs2new;
global player_5; 

global y2;
global Fs2;
global Fs3new;

if(get(handles.rb_audio1,'Value') == 1 && get(handles.rb_audio2,'Value') == 0 ) 
    Fs2new=Fs;
    switch get(get(handles.uibuttongroup5,'SelectedObject'),'Tag')
      case 'radiobutton1',  Fs2new = Fs/2;
      case 'radiobutton2',  Fs2new = Fs/3;
      case 'radiobutton3',  Fs2new = Fs/4;
      case 'radiobutton4',  Fs2new = Fs*2;
      case 'radiobutton5',  Fs2new = Fs*3;
      case 'radiobutton6',  Fs2new = Fs*4;
      case 'radiobutton7',  Fs2new = Fs;  
    end
player_5 = audioplayer(y, Fs2new);    
end

if(get(handles.rb_audio1,'Value') == 0 && get(handles.rb_audio2,'Value') == 1 ) 
    Fs3new=Fs2;
    switch get(get(handles.uibuttongroup5,'SelectedObject'),'Tag')
      case 'radiobutton1',  Fs3new = Fs2/2;
      case 'radiobutton2',  Fs3new = Fs2/3;
      case 'radiobutton3',  Fs3new = Fs2/4;
      case 'radiobutton4',  Fs3new = Fs2*2;
      case 'radiobutton5',  Fs3new = Fs2*3;
      case 'radiobutton6',  Fs3new = Fs2*4;
      case 'radiobutton7',  Fs3new = Fs2;  
    end
    player_5 = audioplayer(y2, Fs3new);  
end

% --- Executes on button press in play_speed.
function play_speed_Callback(hObject, eventdata, handles)
% hObject    handle to play_speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_5;
play(player_5);


% --- Executes on button press in stop_speed.
function stop_speed_Callback(hObject, eventdata, handles)
% hObject    handle to stop_speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_5;
stop(player_5);


% --- Executes on button press in pause_speed.
function pause_speed_Callback(hObject, eventdata, handles)
% hObject    handle to pause_speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_5;
pause(player_5);

% --- Executes on button press in resume_speed.
function resume_speed_Callback(hObject, eventdata, handles)
% hObject    handle to resume_speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_5;
resume(player_5);

% --- Executes on button press in export_speed.
function export_speed_Callback(hObject, eventdata, handles)
% hObject    handle to export_speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y;
global Fs2new;

global y2;
global Fs3new;
if(get(handles.rb_audio1,'Value') == 1 && get(handles.rb_audio2,'Value') == 0 ) 
    [file,path] = uiputfile('*.wav','Save WAV Audio File As');
    if isequal(file,0) || isequal(path,0)
        disp('Operation Cancelled');
    else 
        full5 = strcat (path, file);
        audiowrite(full5,y,Fs2new);
    end
end

if(get(handles.rb_audio1,'Value') == 0 && get(handles.rb_audio2,'Value') == 1 ) 
     [file,path] = uiputfile('*.wav','Save WAV Audio File As');
    if isequal(file,0) || isequal(path,0)
        disp('Operation Cancelled');
    else 
        full5 = strcat (path, file);
        audiowrite(full5,y2,Fs3new);
    end
end

% --- Executes on button press in pushbutton38.
function pushbutton38_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in radiobutton2.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7


% --- Executes on button press in rb_audio1.
function rb_audio1_Callback(hObject, eventdata, handles)
% hObject    handle to rb_audio1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rb_audio1


% --- Executes on button press in rb_audio2.
function rb_audio2_Callback(hObject, eventdata, handles)
% hObject    handle to rb_audio2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rb_audio2


% --- Executes on button press in r_apply.
function r_apply_Callback(hObject, eventdata, handles)
% hObject    handle to r_apply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y;
global Fs;
global ynew;
global player_6; 

global y2;
global Fs2;
global y2new;

if(get(handles.r_rb_audio1,'Value') == 1 && get(handles.r_rb_audio2,'Value') == 0 )
    ynew = y;
    switch get(get(handles.uibuttongroup9,'SelectedObject'),'Tag')
      case 'r_rb_default',  ynew = y;
          % REFERENCE 1 BEGIN
          % https://uk.mathworks.com/help/matlab/ref/flipud.html
      case 'r_rb_reverse',  ynew = flipud(y);
          % REFERENCE 1 END
    end
    player_6 = audioplayer(ynew, Fs);  
end

if(get(handles.r_rb_audio1,'Value') == 0 && get(handles.r_rb_audio2,'Value') == 1 )
    y2new = y2;
    switch get(get(handles.uibuttongroup9,'SelectedObject'),'Tag')
      case 'r_rb_default',  y2new = y2;
      case 'r_rb_reverse',  y2new = flipud(y2);
    end
    player_6 = audioplayer(y2new, Fs2);
end

% --- Executes on button press in r_play.
function r_play_Callback(hObject, eventdata, handles)
% hObject    handle to r_play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_6;
play(player_6);

% --- Executes on button press in r_stop.
function r_stop_Callback(hObject, eventdata, handles)
% hObject    handle to r_stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_6;
stop(player_6);


% --- Executes on button press in r_pause.
function r_pause_Callback(hObject, eventdata, handles)
% hObject    handle to r_pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_6;
pause(player_6);


% --- Executes on button press in r_resume.
function r_resume_Callback(hObject, eventdata, handles)
% hObject    handle to r_resume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_6;
resume(player_6);


% --- Executes on button press in r_export.
function r_export_Callback(hObject, eventdata, handles)
% hObject    handle to r_export (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ynew;
global Fs;

global y2new;
global Fs2;
if(get(handles.r_rb_audio1,'Value') == 1 && get(handles.r_rb_audio2,'Value') == 0 ) 
    [file,path] = uiputfile('*.wav','Save WAV Audio File As');
    if isequal(file,0) || isequal(path,0)
        disp('Operation Cancelled');
    else 
        full5 = strcat (path, file);
        audiowrite(full5,ynew,Fs);
    end
end

if(get(handles.r_rb_audio1,'Value') == 0 && get(handles.r_rb_audio2,'Value') == 1 ) 
     [file,path] = uiputfile('*.wav','Save WAV Audio File As');
    if isequal(file,0) || isequal(path,0)
        disp('Operation Cancelled');
    else 
        full5 = strcat (path, file);
        audiowrite(full5,y2new,Fs2);
    end
end


% --- Executes on button press in a_apply.
function a_apply_Callback(hObject, eventdata, handles)
% hObject    handle to a_apply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y;
global Fs;
global a_y_new;

global player_7; 

global y2;
global Fs2;
global a2_y_new;

if(get(handles.a_rb_audio1,'Value') == 1 && get(handles.a_rb_audio2,'Value') == 0 ) 
    a_y_new=y;
    switch get(get(handles.uibuttongroup10,'SelectedObject'),'Tag')
      case 'radiobutton21',  a_y_new = y/4;
      case 'radiobutton22',  a_y_new = y/8;
      case 'radiobutton23',  a_y_new = y/16;
      case 'radiobutton24',  a_y_new = y*4;
      case 'radiobutton25',  a_y_new = y*8;
      case 'radiobutton26',  a_y_new = y*16;
      case 'radiobutton27',  a_y_new = y;  
    end
player_7 = audioplayer(a_y_new, Fs);    
end

if(get(handles.a_rb_audio1,'Value') == 0 && get(handles.a_rb_audio2,'Value') == 1 ) 
    a2_y_new=y2;
    switch get(get(handles.uibuttongroup10,'SelectedObject'),'Tag')
      case 'radiobutton21',  a2_y_new = y2/4;
      case 'radiobutton22',  a2_y_new = y2/8;
      case 'radiobutton23',  a2_y_new = y2/16;
      case 'radiobutton24',  a2_y_new = y2*4;
      case 'radiobutton25',  a2_y_new = y2*8;
      case 'radiobutton26',  a2_y_new = y2*16;
      case 'radiobutton27',  a2_y_new = y2;  
    end
    player_7 = audioplayer(a2_y_new, Fs2);  
end


% --- Executes on button press in a_play.
function a_play_Callback(hObject, eventdata, handles)
% hObject    handle to a_play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_7;
play(player_7);


% --- Executes on button press in a_stop.
function a_stop_Callback(hObject, eventdata, handles)
% hObject    handle to a_stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_7;
stop(player_7);


% --- Executes on button press in a_pause.
function a_pause_Callback(hObject, eventdata, handles)
% hObject    handle to a_pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_7;
pause(player_7);


% --- Executes on button press in a_resume.
function a_resume_Callback(hObject, eventdata, handles)
% hObject    handle to a_resume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_7;
resume(player_7);


% --- Executes on button press in a_export.
function a_export_Callback(hObject, eventdata, handles)
% hObject    handle to a_export (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a_y_new;
global Fs;

global a2_y_new;
global Fs2;
if(get(handles.a_rb_audio1,'Value') == 1 && get(handles.a_rb_audio2,'Value') == 0 ) 
    [file,path] = uiputfile('*.wav','Save WAV Audio File As');
    if isequal(file,0) || isequal(path,0)
        disp('Operation Cancelled');
    else 
        full5 = strcat (path, file);
        audiowrite(full5,a_y_new,Fs);
    end
end

if(get(handles.a_rb_audio1,'Value') == 0 && get(handles.a_rb_audio2,'Value') == 1 ) 
     [file,path] = uiputfile('*.wav','Save WAV Audio File As');
    if isequal(file,0) || isequal(path,0)
        disp('Operation Cancelled');
    else 
        full5 = strcat (path, file);
        audiowrite(full5,a2_y_new,Fs2);
    end
end


% --- Executes on button press in e_apply.
function e_apply_Callback(hObject, eventdata, handles)
% hObject    handle to e_apply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y;
global Fs;
global ynew;
global ynew2;

global player_9; 

global y2;
global Fs2;
global y2new;
global y2new2;

if(get(handles.e_rb_audio1,'Value') == 1 && get(handles.e_rb_audio2,'Value') == 0 )
    ynew2 = y;
%REFERENCE 3 BEGIN 
% https://www.projectrhea.org/rhea/index.php/Adding_sound_effects_to_your_music#2.Echo_effect
    length = size(y);
    a = 0.6;
    delay = 0.1;
    D = delay*Fs;
    ynew = zeros(length);
    for i = D +1 : 1 : length
        ynew(i) = y(i) + a*ynew(i-D);
    end;
%REFERENCE 3 END     
    switch get(get(handles.uibuttongroup13,'SelectedObject'),'Tag')
      case 'e_rb_default',  ynew2 = y;
      case 'e_rb_echo',  ynew2 = ynew;
    end
    player_9 = audioplayer(ynew2, Fs);  
end

if(get(handles.e_rb_audio1,'Value') == 0 && get(handles.e_rb_audio2,'Value') == 1 )
    y2new2 = y2;
    
    length = size(y2);
    a = 0.6;
    delay = 0.1;
    D = delay*Fs2;
    y2new = zeros(length);
    for i = D +1 : 1 : length
        y2new(i) = y2(i) + a*y2new(i-D);
    end;
    
    switch get(get(handles.uibuttongroup13,'SelectedObject'),'Tag')
      case 'e_rb_default',  y2new2 = y2;
      case 'e_rb_echo',  y2new2 = y2new;
    end
    player_9 = audioplayer(y2new2, Fs2);  
end


% --- Executes on button press in e_play.
function e_play_Callback(hObject, eventdata, handles)
% hObject    handle to e_play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_9;
play(player_9);

% --- Executes on button press in e_stop.
function e_stop_Callback(hObject, eventdata, handles)
% hObject    handle to e_stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_9;
stop(player_9);


% --- Executes on button press in e_pause.
function e_pause_Callback(hObject, eventdata, handles)
% hObject    handle to e_pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_9;
pause(player_9);


% --- Executes on button press in e_resume.
function e_resume_Callback(hObject, eventdata, handles)
% hObject    handle to e_resume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_9;
resume(player_9);


% --- Executes on button press in e_export.
function e_export_Callback(hObject, eventdata, handles)
% hObject    handle to e_export (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ynew2;
global Fs;

global y2new2;
global Fs2;
if(get(handles.r_rb_audio1,'Value') == 1 && get(handles.r_rb_audio2,'Value') == 0 ) 
    [file,path] = uiputfile('*.wav','Save WAV Audio File As');
    if isequal(file,0) || isequal(path,0)
        disp('Operation Cancelled');
    else 
        full5 = strcat (path, file);
        audiowrite(full5,ynew2,Fs);
    end
end

if(get(handles.r_rb_audio1,'Value') == 0 && get(handles.r_rb_audio2,'Value') == 1 ) 
     [file,path] = uiputfile('*.wav','Save WAV Audio File As');
    if isequal(file,0) || isequal(path,0)
        disp('Operation Cancelled');
    else 
        full5 = strcat (path, file);
        audiowrite(full5,y2new2,Fs2);
    end
end



function edit_seconds_Callback(hObject, eventdata, handles)
% hObject    handle to edit_seconds (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_seconds as text
%        str2double(get(hObject,'String')) returns contents of edit_seconds as a double


% --- Executes during object creation, after setting all properties.
function edit_seconds_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_seconds (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in m_play.
function m_play_Callback(hObject, eventdata, handles)
% hObject    handle to m_play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_4;
play(player_4);


% --- Executes on button press in m_stop.
function m_stop_Callback(hObject, eventdata, handles)
% hObject    handle to m_stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_4;
stop(player_4);


% --- Executes on button press in m_pause.
function m_pause_Callback(hObject, eventdata, handles)
% hObject    handle to m_pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_4;
pause(player_4);


% --- Executes on button press in m_resume.
function m_resume_Callback(hObject, eventdata, handles)
% hObject    handle to m_resume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player_4;
resume(player_4);
