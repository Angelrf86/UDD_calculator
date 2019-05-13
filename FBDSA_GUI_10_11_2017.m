function FBDSA_GUI_10_11_2017
%FBD Simulataion Analysis Tool

%Loading images tools
cdata = load ('CDataMat.mat');

%% Starting Variables
h.Strip = [0 0 0 0];
h.Zoom_In_Act = 0;
h.Angle_rotation_val = 0;
h.micro_Check = 0;
h.Gaussian_Check =1;
h.ScanNumber = 0;
h.SaveParameter_1 = 0;
h.Stop_value = 0;
h.Energy_Check = 0;
h.Area_Rectangle_value = 1;
h.Strip_Extract = [1 2 3 4];
h.Noise_sub_on = 0;
h.Pause = 0; 
h.Scan_2n1_val = 0;
h.Scan_2D_val = 0;
h.Scan_compare_Check = [1 2 3 4];
h.Color_Map = 0;
h.Smooth = 0;
h.Fit_One_Manual_Chk = 0;  
h.Scan_Smooth_Print_val = 0;
h.multi_scan_Check = 0; 
h.Save_Manuel = 1;
h.Plot_1_Scan_Spec = 0;
h.diff_spec =0;  
h.help_Write_Chk =0;
h.Plot_2D_Scan_Spec = 0;


%Constants
h.h_Plank = 4.135667662e-15;
h.c_light = 299792458;

%% Principal Figure
d = floor(rand*1000);
h.f = figure(d);
name_Version = 'FBDSA_GUI_09_02_2017';
set(h.f,'Name',name_Version,...
    'NumberTitle', 'Off',...
    'Units','normalized',...
    'Position', [0.0 0.4 0.5 0.58],...
    'Color',[0.8 0.8 0.8],...
    'Menubar','none','KeyReleaseFcn',@Press);


h.f_panel_2= figure(d+1);
set(h.f_panel_2,'Name','Save_plot',...
    'NumberTitle', 'Off',...
    'Visible','off',...
    'Units','normalized',...
    'Position', [0.0 0.05 1 0.915],...
    'Color',[0.8 0.8 0.8],...
    'Menubar','none','KeyReleaseFcn',@Press);



  


%% Definition of the Symmetries, Element and cell parameters 
h.f_panel_1 = uipanel('Parent',h.f,...
    'Units','Normalized',...
    'BackgroundColor',[0.6 0.6 0.6],...
    'Position',[0. 0.7 1 0.3],...
    'BorderType','beveledout',...
    'Visible','On');

h.lp_panel_1 = uipanel('Parent',h.f_panel_1,...
    'Units','Normalized',...
    'BackgroundColor',[0.6 0.6 0.6],...
    'Position',[0. 0.8 1 0.2],...
    'BorderType','beveledout',...
    'Visible','On');

h.name_Gui_control = uicontrol('Parent',h.lp_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0., 0., 0.2, 1],...
    'String','FBD Simulatort Analysis',...
    'BackgroundColor',[0.45 0.45 0.45],...
    'FontSize',10);


h.Beam_3D_simulator = uicontrol('Parent',h.lp_panel_1,...
    'Style','push',...
    'Units','normalized',...
    'Position',[0.2 0 0.1 1],...
    'String','Beam 3D S',...
    'FontName','Arial',...
    'FontWeight','bold',...
    'BackgroundColor',[0.3 0.3 0.3],...
    'FontSize',8,...
    'Callback',@Beam_3D_simulator);

h.Stop = uicontrol('Parent',h.lp_panel_1,...
    'Style','push',...
    'Units','normalized',...
    'Position',[0.3 0 0.1 1],...
    'String','Stop',...
    'BackgroundColor',[1 0 0],...
    'FontSize',10,...
    'Callback',@Stop_Gui);

h.name_Error_control = uicontrol('Parent',h.lp_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.4, 0.6, 0.2, 0.4],...
    'String',' Status ',...
    'BackgroundColor',[0.9 0.9 0.9],...
    'FontSize',10);
h.Error_control = uicontrol('Parent',h.lp_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.4, 0., 0.2, 0.6],...
    'String',' ... ',...
    'BackgroundColor',[0 0.9 0.9],...
    'FontSize',14);

h.Plot_Panel_call=  uicontrol('Parent',h.lp_panel_1,...
    'Style' , 'togglebutton',...
    'Enable', 'on',...
    'Value', 0,...
    'FontName','Arial',...
    'String','Plot Panel',...
    'FontSize',10,...
    'FontWeight','normal',...
    'BackgroundColor',[0.8 0.8 0],...
    'Units','Normalized',...
    'Position',[0.6, 0, 0.1, 1],...
    'Callback',@Plot_Panel_call);


h.Fit_Panel_call =  uicontrol('Parent',h.lp_panel_1,...
    'Style' , 'togglebutton',...
    'Enable', 'on',...
    'Value', 0,...
    'FontName','Arial',...
    'String','Fitting Panel',...
    'FontSize',10,...
    'FontWeight','normal',...
    'BackgroundColor',[1 1 0],...
    'Units','Normalized',...
    'Position',[0.7, 0, 0.1, 1],...
    'Callback',@Fit_Panel_call);


h.help_GUI_SLS_Diamond= uicontrol('Parent',h.lp_panel_1,...
    'Style','push',...
    'Units','normalized',...
    'Position',[0.8 0 0.1 1],...
    'String','Guide',...
    'BackgroundColor',[0.95 0 0.95],...
    'FontSize',6,...
    'Callback',@Help);

h.help_Write = uicontrol('Parent',h.lp_panel_1,...
    'Style' , 'Check',......
    'Visible', 'on',...
    'Enable','on',...
    'Value', 0,...
    'FontName','Helvetica',...
    'String','Help .dox',...
    'FontWeight','bold',...
    'HorizontalAlignment','center',...
    'Units','Normalized',...
    'Callback',@Help,...
    'Position',[0.9 0.5 0.1 0.5],...
    'BackgroundColor',[1 0 0],...
    'FontSize',7);

h.name_help_Write_num = uicontrol('Parent',h.lp_panel_1,...
    'Style','Text',...
    'Units','normalized',...
    'Position',[0.9 0. 0.05 0.5],...
    'BackgroundColor',[0.4 0.4 0.4],...
    'String','Code:',...
    'FontSize',8);
h.help_Write_num = uicontrol('Parent',h.lp_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.95 0. 0.05 0.5],...
    'BackgroundColor',[0.8 0.8 0.8],...
    'String','0000',...
    'FontSize',8);


%% Folder and File
h.name_Folder = uicontrol('Parent',h.f_panel_1,...
    'Style','push',...
    'Units','normalized',...
    'Position',[0.001 0.7 0.08 0.1],...
    'String',' Folder:',...
    'BackgroundColor',[0.7 0.7 0.7],...
    'FontSize',8,...
    'Callback',@Path);    
h.Folder = uicontrol('Parent',h.f_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.081 0.7 0.27 0.1],...
    'String','/das/work/p15/p15366/RN84/SwissFEL Simulations/',...
    'FontSize',6);

h.name_File = uicontrol('Parent',h.f_panel_1,...
    'Style','push',...
    'Units','normalized',...
    'Position',[0.001 0.6 0.08 0.1],...
    'String',' File:',...
    'BackgroundColor',[0.7 0.7 0.7],...
    'FontSize',8,...
    'Callback',@Path);    
h.File = uicontrol('Parent',h.f_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.081 0.6 0.27 0.1],...
    'String','Bragg_400_rocking_pinhole_C100-DK-500_10d000KeV_',...
    'FontSize',6);




%Energy and Pixel size
h.Energy_Chk = uicontrol('Parent',h.f_panel_1,...
    'Style' , 'Check',...
    'Enable','on',...
    'Value', 0,...
    'FontName','Helvetica',...
    'String','Energy',...
    'FontWeight','bold',...
    'HorizontalAlignment','center',...
    'Units','Normalized',...
    'Callback',@micro_Chk,...
    'Position',[0.36 0.71 0.05 0.1],...
    'BackgroundColor',[0.5 0.5 0.5],...
    'FontSize',6);

h.Energy_val = uicontrol('Parent',h.f_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.41 0.71 0.03 0.1],...
    'String','10000',...
    'BackgroundColor',[0.6 0.6 0.6],...
    'FontSize',6);

h.name_Energy_val =  uicontrol('Parent',h.f_panel_1,...
    'Style' , 'text',...
    'Enable', 'on',...
    'Value', 0,...
    'FontName','Helvetica',...
    'FontSize',6,...
    'String','eV',...
    'FontWeight','normal',...
    'BackgroundColor',[0 0 0.8],...
    'Units','Normalized',...
    'Position',[0.44 0.71 0.03 0.1],...
    'BackgroundColor',[0.6 0.6 0.6]);

h.micro = uicontrol('Parent',h.f_panel_1,...
    'Style' , 'Check',...
    'Enable','on',...
    'Value', 0,...
    'FontName','Helvetica',...
    'String','um',...
    'FontWeight','bold',...
    'HorizontalAlignment','center',...
    'Units','Normalized',...
    'Callback',@micro_Chk,...
    'Position',[0.36 0.61 0.05 0.1],...
    'BackgroundColor',[0.5 0.5 0.5],...
    'FontSize',8);

h.micro_val = uicontrol('Parent',h.f_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.41 0.61 0.03 0.1],...
    'String',' 0.74 ',...
    'BackgroundColor',[0.6 0.6 0.6],...
    'FontSize',8);

h.name_micro_val =  uicontrol('Parent',h.f_panel_1,...
    'Style' , 'text',...
    'Enable', 'on',...
    'Value', 0,...
    'FontName','Helvetica',...
    'FontSize',6,...
    'String','um/Px',...
    'FontWeight','normal',...
    'Units','Normalized',...
    'Position',[0.44 0.61 0.03 0.1],...
    'BackgroundColor',[0.6 0.6 0.6]);

h.center_max = uicontrol('Parent',h.f_panel_1,...
    'Style' , 'Check',...
    'Enable','on',...
    'Value', 0,...
    'FontName','Helvetica',...
    'String','Center',...
    'FontWeight','bold',...
    'HorizontalAlignment','center',...
    'Units','Normalized',...
    'Callback',@micro_Chk,...
    'Position',[0.36 0.51 0.05 0.1],...
    'BackgroundColor',[0.5 0.5 0.5],...
    'FontSize',6);

h.center_max_val = uicontrol('Parent',h.f_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.41 0.51 0.03 0.1],...
    'String',' 0 ',...
    'BackgroundColor',[0.6 0.6 0.6],...
    'FontSize',8);

h.name_center_max_val =  uicontrol('Parent',h.f_panel_1,...
    'Style' , 'text',...
    'Enable', 'on',...
    'Value', 0,...
    'FontName','Helvetica',...
    'FontSize',6,...
    'String','um',...
    'FontWeight','normal',...
    'Units','Normalized',...
    'Position',[0.44 0.51 0.03 0.1],...
    'BackgroundColor',[0.6 0.6 0.6]);


h.name_Image_Theta_val =  uicontrol('Parent',h.f_panel_1,...
    'Style' , 'text',...
    'FontName','Helvetica',...
    'FontSize',6,...
    'FontWeight','normal',...
    'String',' Image ',...
    'Units','Normalized',...
    'Position',[0.47 0.71 0.03 0.1],...
    'BackgroundColor',[0.5 0.5 0.5]);

h.Image_Theta_val = uicontrol('Parent',h.f_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.47 0.61 0.03 0.1],...
    'String',' 10 ',...
    'BackgroundColor',[0.6 0.6 0.6],...
    'FontSize',6);

h.name_Scan = uicontrol('Parent',h.f_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.005 0.50 0.04 0.08],...
    'String',' Scan',...
    'BackgroundColor',[0.7 0.7 0.7],...
    'FontSize',8);
h.Scan = uicontrol('Parent',h.f_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.045 0.50 0.05 0.08],...
    'String','1',...
    'FontSize',8);


h.name_Size_Scan = uicontrol('Parent',h.f_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.005 0.4 0.04 0.08],...
    'String','I Image',...
    'BackgroundColor',[0.75 0.75 0.75],...
    'FontSize',7);
h.Size_ScanI = uicontrol('Parent',h.f_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.045 0.4 0.05 0.08],...
    'String','1',...
    'FontSize',8);
h.name_Size_Scan = uicontrol('Parent',h.f_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.005 0.32 0.04 0.08],...
    'String','F Image',...
    'BackgroundColor',[0.75 0.75 0.75],...
    'FontSize',7);
h.Size_ScanF = uicontrol('Parent',h.f_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.045 0.32 0.05 0.08],...
    'String','-',...
    'FontSize',8);


h.Name_Size_ScanI_Load = uicontrol('Parent',h.f_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.1 0.50 0.04 0.08],...
    'BackgroundColor',[0.5 0.5 0.5],...
    'String','Image',...
    'FontSize',8);
h.Size_ScanI_Load = uicontrol('Parent',h.f_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.14 0.50 0.04 0.08],...
    'String','0',...
    'FontSize',8);
h.Load_Scan= uicontrol('Parent',h.f_panel_1,...
    'Style','push',...
    'Units','normalized',...
    'Position',[0.1 0.32 0.08 0.16],...
    'String','Load Image',...
    'BackgroundColor',[0 1 0],...
    'FontSize',8,...
    'Callback',@Load_Scan);

h.name_Area_Load_Scan = uicontrol('Parent',h.f_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.2 0.5 0.05 0.08],...
    'String','Total I',...
    'BackgroundColor',[0.5 0.5 0.5],...
    'FontSize',8);
h.Area_Load_Scan =  uicontrol('Parent',h.f_panel_1,...
    'Style','Edit',...
    'Enable', 'off',...
    'Units','normalized',...
    'Position',[0.25 0.5 0.1 0.08],...
    'String','[]',...
    'BackgroundColor',[0.7 0.7 0.7],...
    'FontSize',8);

h.name_Area_Roi_Load_Scan = uicontrol('Parent',h.f_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.2 0.4 0.05 0.08],...
    'String','Roi I',...
    'BackgroundColor',[0.5 0.5 0.5],...
    'FontSize',8);
h.Area_Roi_Load_Scan =  uicontrol('Parent',h.f_panel_1,...
    'Style','Edit',...
    'Enable', 'off',...
    'Units','normalized',...
    'Position',[0.25 0.4 0.1 0.08],...
    'String','[]',...
    'BackgroundColor',[0.7 0.7 0.7],...
    'FontSize',8);

h.Roi_Ranges = uicontrol('Parent',h.f_panel_1,...
    'Style','push',...
    'Units','normalized',...
    'Position',[0.2 0.32 0.1 0.08],...
    'String','Roi Area',...
    'BackgroundColor',[0.7 0.7 0.7],...
    'FontSize',8,...
    'Callback',@Select_Strip);
h.Roi_Range_Check = uicontrol('Parent',h.f_panel_1,...
    'Style' , 'Check',......
    'Visible', 'on',...
    'Enable','on',...
    'Value', 0,...
    'FontName','Helvetica',...
    'String','off',...
    'FontWeight','bold',...
    'HorizontalAlignment','center',...
    'Units','Normalized',...
    'Callback',@Select_Strip,...
    'Position',[0.3 0.32 0.05 0.08],...
    'BackgroundColor',[0.8 0.8 0.8],...
    'FontSize',6);

        
%% Column
h.Strip_panel_1 = uipanel('Parent',h.f_panel_1,...
    'Units','Normalized',...
    'BackgroundColor',[0.6 0.6 0.6],...
    'Position',[0.5 0. 0.5 0.8],...
    'BorderType','beveledout',...
    'Visible','On');

h.name_Strip_panel_1 = uicontrol('Parent',h.Strip_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.00 0.9 0.2 0.1],...
    'String','Strip panel',...
    'BackgroundColor',[0.5 0.5 0.5],...
    'FontSize',10);

h.name_Ranges_1 = uicontrol('Parent',h.Strip_panel_1,...
    'Style','push',...
    'Units','normalized',...
    'Position',[0.1 0.8 0.15 0.1],...
    'String','Strip 1',...
    'BackgroundColor',[0.7 0.7 0.7],...
    'FontSize',10,...
    'Callback',@Select_Strip);
h.name_Ranges_2 = uicontrol('Parent',h.Strip_panel_1,...
    'Style','push',...
    'Units','normalized',...
    'Position',[0.25 0.8 0.15 0.1],...
    'String','Strip 2',...
    'BackgroundColor',[0.7 0.7 0.7],...
    'FontSize',10,...
    'Callback',@Select_Strip);
h.name_Ranges_3 = uicontrol('Parent',h.Strip_panel_1,...
    'Style','push',...
    'Units','normalized',...
    'Position',[0.4 0.8 0.15 0.1],...
    'String','Strip 3',...
    'BackgroundColor',[0.7 0.7 0.7],...
    'FontSize',10,...
    'Callback',@Select_Strip);
h.name_Ranges_4 = uicontrol('Parent',h.Strip_panel_1,...
    'Style','push',...
    'Units','normalized',...
    'Position',[0.55 0.8 0.15 0.1],...
    'String','Strip 4',...
    'BackgroundColor',[0.7 0.7 0.7],...
    'FontSize',10,...
    'Callback',@Select_Strip);
h.name_Ranges_Sub = uicontrol('Parent',h.Strip_panel_1,...
    'Style','push',...
    'Units','normalized',...
    'Position',[0.7 0.8 0.15 0.1],...
    'String','Norma',...
    'BackgroundColor',[0.7 0.7 0.7],...
    'FontSize',8,...
    'Callback',@Select_Strip);

h.Strip_Color_1 = uicontrol('Parent',h.Strip_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.1 0.78 0.15 0.02],...
    'BackgroundColor',[1 0 0],...
    'String',' ',...
    'FontSize',8);
h.Strip_Color_2 = uicontrol('Parent',h.Strip_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.25 0.78 0.15 0.02],...
    'BackgroundColor',[1 1 0],...
    'String',' ',...
    'FontSize',8);
h.Strip_Color_3 = uicontrol('Parent',h.Strip_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.4 0.78 0.15 0.02],...
    'BackgroundColor',[1 0 1],...
    'String',' ',...
    'FontSize',8);
h.Strip_Color_4 = uicontrol('Parent',h.Strip_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.55 0.78 0.15 0.02],...
    'BackgroundColor',[1 1 1],...
    'String',' ',...
    'FontSize',8);
h.Strip_Color_MB = uicontrol('Parent',h.Strip_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.7 0.78 0.15 0.02],...
    'BackgroundColor',[0 0 1],...
    'String',' ',...
    'FontSize',8);

h.name_ColumnRangeMax = uicontrol('Parent',h.Strip_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0. 0.68 0.1 0.1],...
    'String','C Min',...
    'BackgroundColor',[0.7 0.7 0.7],...
    'FontSize',8);
h.name_ColumnRangeMin = uicontrol('Parent',h.Strip_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0. 0.58 0.1 0.1],...
    'String','C Max',...
    'BackgroundColor',[0.7 0.7 0.7],...
    'FontSize',8);

h.ColumnRangeMax1 = uicontrol('Parent',h.Strip_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.1 0.68 0.15 0.1],...
    'String',' 10 ',...
    'FontSize',8);
h.ColumnRangeMin1 = uicontrol('Parent',h.Strip_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.1 0.58 0.15 0.1],...
    'String',' 20 ',...
    'FontSize',8);

h.ColumnRangeMax2 = uicontrol('Parent',h.Strip_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.25 0.68 0.15 0.1],...
    'String',' 30 ',...
    'FontSize',8);
h.ColumnRangeMin2 = uicontrol('Parent',h.Strip_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.25 0.58 0.15 0.1],...
    'String',' 40 ',...
    'FontSize',8);

h.ColumnRangeMax3 = uicontrol('Parent',h.Strip_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.4 0.68 0.15 0.1],...
    'String',' 40 ',...
    'FontSize',8);
h.ColumnRangeMin3 = uicontrol('Parent',h.Strip_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.4 0.58 0.15 0.1],...
    'String',' 50 ',...
    'FontSize',8);

h.ColumnRangeMax4 = uicontrol('Parent',h.Strip_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.55 0.68 0.15 0.1],...
    'String',' 65 ',...
    'FontSize',8);
h.ColumnRangeMin4 = uicontrol('Parent',h.Strip_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.55 0.58 0.15 0.1],...
    'String',' 75 ',...
    'FontSize',8);

h.ColumnRangeMax_MB = uicontrol('Parent',h.Strip_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.7 0.68 0.15 0.1],...
    'String',' 0 ',...
    'FontSize',8);
h.ColumnRangeMin_MB = uicontrol('Parent',h.Strip_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.7 0.58 0.15 0.1],...
    'String',' 100 ',...
    'FontSize',8);

h.Same_Column = uicontrol('Parent',h.Strip_panel_1,...
    'Style' , 'Check',......
    'Visible', 'on',...
    'Enable','on',...
    'Value', 0,...
    'FontName','Helvetica',...
    'String','Same Col',...
    'FontWeight','bold',...
    'HorizontalAlignment','center',...
    'Units','Normalized',...
    'Callback',@Same_Chk,...
    'Position',[0.85 0.58 0.1 0.1],...
    'BackgroundColor',[0.8 0.8 0.8],...
    'FontSize',6);


h.Strip_Color_1 = uicontrol('Parent',h.Strip_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.1 0.56 0.15 0.02],...
    'BackgroundColor',[1 0 0],...
    'String',' ',...
    'FontSize',8);
h.Strip_Color_2 = uicontrol('Parent',h.Strip_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.25 0.56 0.15 0.02],...
    'BackgroundColor',[1 1 0],...
    'String',' ',...
    'FontSize',8);
h.Strip_Color_3 = uicontrol('Parent',h.Strip_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.4 0.56 0.15 0.02],...
    'BackgroundColor',[1 0 1],...
    'String',' ',...
    'FontSize',8);
h.Strip_Color_4 = uicontrol('Parent',h.Strip_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.55 0.56 0.15 0.02],...
    'BackgroundColor',[1 1 1],...
    'String',' ',...
    'FontSize',8);
h.Strip_Color_MB = uicontrol('Parent',h.Strip_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.7 0.56 0.15 0.02],...
    'BackgroundColor',[0 0 1],...
    'String',' ',...
    'FontSize',8);

%% row
h.name_ColumnRangeMax = uicontrol('Parent',h.Strip_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0. 0.46 0.1 0.1],...
    'String','Row Min',...
    'BackgroundColor',[0.7 0.7 0.7],...
    'FontSize',8);
h.name_ColumnRangeMin = uicontrol('Parent',h.Strip_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0. 0.36 0.1 0.1],...
    'String','Row Max',...
    'BackgroundColor',[0.7 0.7 0.7],...
    'FontSize',8);

h.StripRanges1Max = uicontrol('Parent',h.Strip_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.1 0.46 0.15 0.1],...
    'String','10',...
    'FontSize',8);
h.StripRanges1Min = uicontrol('Parent',h.Strip_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.1 0.36 0.15 0.1],...
    'String','90',...
    'FontSize',8);

h.StripRanges2Max = uicontrol('Parent',h.Strip_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.25 0.46 0.156 0.1],...
    'String','10',...
    'FontSize',8);
h.StripRanges2Min = uicontrol('Parent',h.Strip_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.25 0.36 0.15 0.1],...
    'String','90',...
    'FontSize',8);

h.StripRanges3Max = uicontrol('Parent',h.Strip_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.4 0.46 0.15 0.1],...
    'String','10',...
    'FontSize',8);
h.StripRanges3Min = uicontrol('Parent',h.Strip_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.4 0.36 0.15 0.1],...
    'String','90',...
    'FontSize',8);

h.StripRanges4Max = uicontrol('Parent',h.Strip_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.55 0.46 0.15 0.1],...
    'String','10',...
    'FontSize',8);
h.StripRanges4Min = uicontrol('Parent',h.Strip_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.55 0.36 0.15 0.1],...
    'String','90',...
    'FontSize',8);

h.StripRangesMax_MB = uicontrol('Parent',h.Strip_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.7 0.46 0.15 0.1],...
    'String','10',...
    'FontSize',8);
h.StripRangesMin_MB = uicontrol('Parent',h.Strip_panel_1,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.7 0.36 0.15 0.1],...
    'String','90',...
    'FontSize',8);

h.Same_Strip = uicontrol('Parent',h.Strip_panel_1,...
    'Style' , 'Check',......
    'Visible', 'on',...
    'Enable','on',...
    'Value', 0,...
    'FontName','Helvetica',...
    'String','Same Row',...
    'FontWeight','bold',...
    'HorizontalAlignment','center',...
    'Units','Normalized',...
    'Callback',@Same_Chk,...
    'Position',[0.85 0.36 0.1 0.1],...
    'BackgroundColor',[0.8 0.8 0.8],...
    'FontSize',6);

%Check wich Strip are analyzed
h.name_Strip_Scan_Extract = uicontrol('Parent',h.Strip_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0. 0.26 0.1 0.1],...
    'String','Select Strip',...
    'BackgroundColor',[0.4 0.4 0.4],...
    'FontSize',6);
h.Strip_scan_Extract_1 = uicontrol('Parent',h.Strip_panel_1,...
    'Style' , 'Check',......
    'Enable','on',...
    'Value', 1,...
    'FontName','Helvetica',...
    'String','Strip 1',...
    'FontWeight','bold',...
    'HorizontalAlignment','center',...
    'Units','Normalized',...
    'Callback',@Strip_Extract_Chk,...
    'Position',[0.1 0.26 0.15 0.1],...
    'BackgroundColor',[1 0 0],...
    'FontSize',6);
h.Strip_scan_Extract_2 = uicontrol('Parent',h.Strip_panel_1,...
    'Style' , 'Check',...
    'Enable','on',...
    'Value', 1,...
    'FontName','Helvetica',...
    'String','Strip 2',...
    'FontWeight','bold',...
    'HorizontalAlignment','center',...
    'Units','Normalized',...
    'Callback',@Strip_Extract_Chk,...
    'Position',[0.25 0.26 0.15 0.1],...
    'BackgroundColor',[1 1 0],...
    'FontSize',6);
h.Strip_scan_Extract_3 = uicontrol('Parent',h.Strip_panel_1,...
    'Style' , 'Check',...
    'Enable','on',...
    'Value', 1,...
    'FontName','Helvetica',...
    'String','Strip 3',...
    'FontWeight','bold',...
    'HorizontalAlignment','center',...
    'Units','Normalized',...
    'Callback',@Strip_Extract_Chk,...
    'Position',[0.4 0.26 0.15 0.1],...
    'BackgroundColor',[1 0 1],...
    'FontSize',6);    
h.Strip_scan_Extract_4 = uicontrol('Parent',h.Strip_panel_1,...
    'Style' , 'Check',...
    'Enable','on',...
    'Value', 1,...
    'FontName','Helvetica',...
    'String','Strip 4',...
    'FontWeight','bold',...
    'HorizontalAlignment','center',...
    'Units','Normalized',...
    'Callback',@Strip_Extract_Chk,...
    'Position',[0.55 0.26 0.15 0.1],...
    'BackgroundColor',[1 1 1],...
    'FontSize',6);
h.Strip_Color_MB = uicontrol('Parent',h.Strip_panel_1,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.7 0.26 0.15 0.1],...
    'BackgroundColor',[0 0 1],...
    'String',' ',...
    'FontSize',8);


h.Save_Parameter= uicontrol('Parent',h.Strip_panel_1,...
    'Style','push',...
    'Units','normalized',...
    'Position',[0.4 0.0 0.2 0.2],...
    'String','Fix Ranges',...
    'BackgroundColor',[0 0 0.95],...
    'FontSize',8,...
    'Callback',@Fix_Ranges);
%Help
h.help_Fix_Ranges = uicontrol('Parent',h.Strip_panel_1,...
    'Style','push',...
    'Units','normalized',...
    'Position',[0.6 0.0 0.2 0.2],...
    'String','Help Ranges',...
    'BackgroundColor',[0.95 0 0.95],...
    'FontSize',8,...
    'Callback',@Help);

h.Extract= uicontrol('Parent',h.Strip_panel_1,...
    'Style','push',...
    'Units','normalized',...
    'Position',[0.8 0.0 0.2 0.2],...
    'String','Extract',...
    'BackgroundColor',[1 1 0],...
    'FontSize',10,...
    'Callback',@ExtractS);

%%
h.Save_video = uicontrol('Parent',h.Strip_panel_1,...
    'Style' , 'Check',...
    'Enable','on',...
    'Value', 1,...
    'FontName','Helvetica',...
    'String','Record Video',...
    'FontWeight','bold',...
    'HorizontalAlignment','center',...
    'Units','Normalized',...
    'Callback',@Save_video,...
    'Position',[0. 0.1 0.2 0.1],...
    'BackgroundColor',[0.5 0.5 0.5],...
    'FontSize',6);

h.name_help_Write_num = uicontrol('Parent',h.Strip_panel_1,...
    'Style','Text',...
    'Units','normalized',...
    'Position',[0. 0. 0.1 0.1],...
    'BackgroundColor',[0.4 0.4 0.4],...
    'String','Color:',...
    'FontSize',8);

h.Save_Grey = uicontrol('Parent',h.Strip_panel_1,...
    'Style' , 'Check',...
    'Enable','on',...
    'Value', 1,...
    'FontName','Helvetica',...
    'String','Grey',...
    'FontWeight','bold',...
    'HorizontalAlignment','center',...
    'Units','Normalized',...
    'Callback',@Save_Color,...
    'Position',[0.1 0. 0.1 0.1],...
    'BackgroundColor',[0.5 0.5 0.5],...
    'FontSize',6);

h.Save_Color = uicontrol('Parent',h.Strip_panel_1,...
    'Style' , 'Check',...
    'Enable','on',...
    'Value', 0,...
    'FontName','Helvetica',...
    'String','Color',...
    'FontWeight','bold',...
    'HorizontalAlignment','center',...
    'Units','Normalized',...
    'Callback',@Save_Color,...
    'Position',[0.2 0. 0.1 0.1],...
    'BackgroundColor',[0.5 0.5 0],...
    'FontSize',6);


h.Save_hsv = uicontrol('Parent',h.Strip_panel_1,...
    'Style' , 'Check',...
    'Enable','on',...
    'Value', 0,...
    'FontName','Helvetica',...
    'String','Jet',...
    'FontWeight','bold',...
    'HorizontalAlignment','center',...
    'Units','Normalized',...
    'Callback',@Save_Color,...
    'Position',[0.3 0. 0.1 0.1],...
    'BackgroundColor',[0 0 0.8],...
    'FontSize',6);

%% ---------------
h.lp2 = uipanel('Parent',h.f,...
    'Units','Normalized',...
    'BackgroundColor',[0.6 0.6 0.6],...
    'Position',[0. 0 1 0.7],...
    'BorderType','beveledout',...
    'Visible','On');

h.ExtractS_Fig = axes('Parent',h.lp2,...
    'Units','normalized',...
    'Position',[0.27 0.05 0.7 0.8],...
    'LineWidth',0.5,...
    'fontsize',8,...
    'box','on',...
    'Color',[1 1 1],...
    'FontName','Helvetica',...
    'FontWeight','bold',...
    'Xlim',[-1 1]);    
    axes(h.ExtractS_Fig)
    andor_image = imread('bill4_3522','tif');
    imagesc(andor_image,'Parent',h.ExtractS_Fig);
    caxis([0 250])
    colormap gray
    colorbar
    axis ij equal tight    
    title(h.ExtractS_Fig,'F7: Scan Plot')

h.lp3 = uipanel('Parent',h.lp2,...
    'Units','Normalized',...
    'BackgroundColor',[0.5 0.5 0.5],...
    'Position',[0 0.91 1 0.09],...
    'BorderType','beveledout',...
    'Visible','On');

h.name_Image_panel = uicontrol('Parent',h.lp3,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.0 0. 0.07 1],...
    'String','Image Panel',...
    'BackgroundColor',[0.4 0.4 0.4],...
    'FontSize',8);    

h.Stop_Horizontal= uicontrol('Parent',h.lp3,...
    'Style','togglebutton',...
    'Units','normalized',...
    'Position',[0.07, 0, 0.07, 1],...
    'String',' Stop',...
    'BackgroundColor',[1 0 0],...
    'FontSize',8,...
    'Callback',@Stop_Gui);

h.name_Reset_Scan = uicontrol('Parent',h.lp3,...
    'Style','togglebutton',...
    'Units','normalized',...
    'Position',[0.14, 0 , 0.07, 1],...
    'String',' Reset',...
    'BackgroundColor',[0.4 0.4 0],...
    'FontSize',8,...
    'Callback',@Reset_Horizontal);


h.name_Max_Min_I = uicontrol('Parent',h.lp3,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.21, 0.6, 0.065, 0.4],...
    'String','Intenisty',...
    'BackgroundColor',[0.5 0.5 0.5],...
    'FontSize',8);
h.name_min_I = uicontrol('Parent',h.lp3,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.21, 0.3, 0.03, 0.3],...
    'String','Min',...
    'BackgroundColor',[0.5 0.5 0.5],...
    'FontSize',8);
h.name_Max_I = uicontrol('Parent',h.lp3,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.21, 0, 0.03, 0.3],...
    'String','Max',...
    'BackgroundColor',[0.5 0.5 0.5],...
    'FontSize',8);

h.min_I= uicontrol('Parent',h.lp3,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.24, 0.3, 0.035, 0.3],...
    'String',' 0 ',...
    'FontSize',8);
h.max_I= uicontrol('Parent',h.lp3,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.24, 0, 0.035, 0.3],...
    'String',' 1 ',...
    'FontSize',8);

h.name_Contrast_I = uicontrol('Parent',h.lp3,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.275, 0.6, 0.065, 0.4],...
    'String','Contrast',...
    'BackgroundColor',[0.5 0.5 0.5],...
    'FontSize',8);
h.name_min_I = uicontrol('Parent',h.lp3,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.275, 0.3, 0.03, 0.3],...
    'String','Min',...
    'BackgroundColor',[0.5 0.5 0.5],...
    'FontSize',8);
h.name_Max_I = uicontrol('Parent',h.lp3,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.275, 0, 0.03, 0.3],...
    'String','Max',...
    'BackgroundColor',[0.5 0.5 0.5],...
    'FontSize',8);
h.min_Contrast_I= uicontrol('Parent',h.lp3,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.305, 0.3, 0.035, 0.3],...
    'String',' 0 ',...
    'FontSize',8);
h.max_Contrast_I= uicontrol('Parent',h.lp3,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.305, 0, 0.035, 0.3],...
    'String',' 1 ',...
    'FontSize',8);


h.name_ColMax_Scan = uicontrol('Parent',h.lp3,...
    'Style','togglebutton',...
    'Units','normalized',...
    'Position',[0.34, 0.5, 0.09, 0.5],...
    'String',' ColMax',...
   'BackgroundColor',[0.4 0.4 0.4],...
    'FontSize',8,...
    'Callback',@ZoomIn);
h.name_ColMin_Scan = uicontrol('Parent',h.lp3,...
    'Style','togglebutton',...
    'Units','normalized',...
    'Position',[0.43, 0.5, 0.09, 0.5],...
    'String',' ColMin',...
    'BackgroundColor',[0.4 0.4 0.4],...
    'FontSize',8,...
    'Callback',@ZoomIn);
h.name_StripMax_Scan = uicontrol('Parent',h.lp3,...
    'Style','togglebutton',...
    'Units','normalized',...
    'Position',[0.52, 0.5, 0.09, 0.5],...
    'String',' StripMax',...
    'BackgroundColor',[0.4 0.4 0.4],...
    'FontSize',8,...
    'Callback',@ZoomIn);
h.name_StripMin_Scan = uicontrol('Parent',h.lp3,...
    'Style','togglebutton',...
    'Units','normalized',...
    'Position',[0.61, 0.5, 0.09, 0.5],...
    'String',' StripMin',...
    'BackgroundColor',[0.4 0.4 0.4],...
    'FontSize',8,...
    'Callback',@ZoomIn);

h.Size_ColMax = uicontrol('Parent',h.lp3,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.34, 0, 0.09,0.5],...
    'String',' [] ',...
    'FontSize',8);
h.Size_ColMin = uicontrol('Parent',h.lp3,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.43, 0, 0.09, 0.5],...
    'String',' [] ',...
    'FontSize',8);
h.Size_StripMax = uicontrol('Parent',h.lp3,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.52, 0, 0.09,0.5],...
    'String',' [] ',...
    'FontSize',8);
h.Size_StripMin= uicontrol('Parent',h.lp3,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.61, 0, 0.09, 0.5],...
    'String',' [] ',...
    'FontSize',8);

  
h.ZI_S =  uicontrol('Parent',h.lp3,...
    'Style' , 'togglebutton',...
    'Enable', 'on',...
    'Value', 0,...
    'FontName','Arial',...
    'CData',cdata.CDataPlus,...
    'FontSize',10,...
    'FontWeight','normal',...
    'BackgroundColor',[0 0 0.8],...
    'Units','Normalized',...
    'Position', [0.7, 0., 0.07, 1],...
    'Callback',@ZoomIn);

h.ZO_S =  uicontrol('Parent',h.lp3,...
    'Style' , 'togglebutton',...
    'Enable', 'on',...
    'Value', 0,...
    'FontName','Arial',...
    'CData',cdata.CDataMin,...
    'FontSize',10,...
    'FontWeight','normal',...
    'BackgroundColor',[0 0 0.4],...
    'Units','Normalized',...
    'Position', [0.77, 0, 0.07, 1],...
    'Callback',@ZoomOut);

h.pan_I_S=  uicontrol('Parent',h.lp3,...
    'Style' , 'togglebutton',...
    'Enable', 'on',...
    'Value', 0,...
    'FontName','Arial',...
    'String','Pan',...
    'FontSize',10,...
    'FontWeight','normal',...
    'BackgroundColor',[0 0.4 0],...
    'Units','Normalized',...
    'Position', [0.84, 0, 0.07, 1],...
    'Callback',@pan_graph);
h.Data_Cursor=  uicontrol('Parent',h.lp3,...
    'Style' , 'togglebutton',...
    'Enable', 'on',...
    'Value', 0,...
    'FontName','Arial',...
    'String','Data Cursor',...
    'FontSize',10,...
    'FontWeight','normal',...
    'BackgroundColor',[0 0.8 0],...
    'Units','Normalized',...
    'Position', [0.91, 0, 0.09, 1],...
    'Callback',@Data_Cursor_funct);

%% Lineal calculator horizontal lineing
h.Horizontal_Chk= uicontrol('Parent',h.lp2,...
    'Style' , 'Check',......
    'Visible', 'on',...
    'Enable','on',...
    'Value', 0,...
    'FontName','Helvetica',...
    'String','Horizontal Correction',...
    'FontWeight','bold',...
    'HorizontalAlignment','center',...
    'Units','Normalized',...
    'Callback',@Same_Chk,...
    'Position',[0.02 0.86 0.2 0.05],...
    'BackgroundColor',[0.6 0.6 0.6],...
    'FontSize',6);

h.help_Horizontal_Image= uicontrol('Parent',h.lp2,...
    'Style','push',...
    'Units','normalized',...
    'Position',[0.13 0.305 0.08 0.1],...
    'String','Help Horizontal',...
    'BackgroundColor',[0.95 0 0.95],...
    'FontSize',6,...
    'Callback',@Help);


%Image
h.name_Scan_Horizontal = uicontrol('Parent',h.lp2,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.01, 0.81, 0.1, 0.05],...
    'String',' N_Scan',...
    'BackgroundColor',[0.4 0.4 0.4],...
    'FontSize',8);
h.Scan_Horizontal_Image= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.11, 0.81, 0.1, 0.05],...
    'String',' 1 ',...
    'FontSize',8);

h.Select_Horizontal_Max = uicontrol('Parent',h.lp2,...
    'Style','togglebutton',...
    'Units','normalized',...
    'Position',[0.01, 0.76, 0.1, 0.05],...
    'String','Select Sections',...
    'BackgroundColor',[0.9 0.9 0],...
    'FontSize',8,...
    'Callback',@Select_Horizontal_positions);

h.Fix_Ranges_to_Horizontal = uicontrol('Parent',h.lp2,...
    'Style','togglebutton',...
    'Units','normalized',...
    'Position',[0.11, 0.76, 0.1, 0.05],...
    'String','Fixe Sections',...
    'BackgroundColor',[0 0.9 0.9],...
    'FontSize',8,...
    'Callback',@Fix_Ranges_Horizontal);


%Strips
h.name_Strips_Horizontal_1 = uicontrol('Parent',h.lp2,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.01, 0.7, 0.025, 0.04],...
    'String','p1',...
    'BackgroundColor',[0.8 0.8 0.8],...
    'FontSize',6);
h.name_Strips_Horizontal_2 = uicontrol('Parent',h.lp2,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.115, 0.7, 0.025, 0.04],...
    'String','p2',...
    'BackgroundColor',[0.8 0.8 0.8],...
    'FontSize',6);
h.name_Strips_Horizontal_3 = uicontrol('Parent',h.lp2,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.01, 0.66, 0.025, 0.04],...
    'String','p3',...
    'BackgroundColor',[0.8 0.8 0.8],...
    'FontSize',6);
h.name_Strips_Horizontal_4 = uicontrol('Parent',h.lp2,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.115, 0.66, 0.025, 0.04],...
    'String','p4',...
    'BackgroundColor',[0.8 0.8 0.8],...
    'FontSize',6);
h.name_Strips_Horizontal_5 = uicontrol('Parent',h.lp2,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.01, 0.62, 0.025, 0.04],...
    'String','p5',...
    'BackgroundColor',[0.8 0.8 0.8],...
    'FontSize',6);
h.name_Strips_Horizontal_6 = uicontrol('Parent',h.lp2,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.115, 0.62, 0.025, 0.04],...
    'String','p6',...
    'BackgroundColor',[0.8 0.8 0.8],...
    'FontSize',6);
h.name_Strips_Horizontal_7 = uicontrol('Parent',h.lp2,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.01, 0.58, 0.025, 0.04],...
    'String','p7',...
    'BackgroundColor',[0.8 0.8 0.8],...
    'FontSize',6);
h.name_Strips_Horizontal_8 = uicontrol('Parent',h.lp2,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.115, 0.58, 0.025, 0.04],...
    'String','p8',...
    'BackgroundColor',[0.8 0.8 0.8],...
    'FontSize',6);
h.name_Strips_Horizontal_9 = uicontrol('Parent',h.lp2,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.01, 0.54, 0.025, 0.04],...
    'String','p9',...
    'BackgroundColor',[0.8 0.8 0.8],...
    'FontSize',6);
h.name_Strips_Horizontal_10 = uicontrol('Parent',h.lp2,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.115, 0.54, 0.025, 0.04],...
    'String','p10',...
    'BackgroundColor',[0.8 0.8 0.8],...
    'FontSize',6);
h.name_Strips_Horizontal_11 = uicontrol('Parent',h.lp2,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.01, 0.5, 0.025, 0.04],...
    'String','p11',...
    'BackgroundColor',[0.8 0.8 0.8],...
    'FontSize',6);
h.name_Strips_Horizontal_12 = uicontrol('Parent',h.lp2,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.115, 0.5, 0.025,  0.04],...
    'String','p12',...
    'BackgroundColor',[0.8 0.8 0.8],...
    'FontSize',6);

h.Strips_Horizontal_x_1= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.035, 0.7, 0.04, 0.04],...
    'String',' 500 ',...
    'FontSize',8);
h.Strips_Horizontal_x_2= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.14, 0.7, 0.04, 0.04],...
    'String',' 525 ',...
    'FontSize',8);
h.Strips_Horizontal_x_3= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.035, 0.66, 0.04, 0.04],...
    'String',' 550 ',...
    'FontSize',8);
h.Strips_Horizontal_x_4= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.14, 0.66, 0.04, 0.04],...
    'String',' 575 ',...
    'FontSize',8);
h.Strips_Horizontal_x_5= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.035, 0.62, 0.04, 0.04],...
    'String',' 600 ',...
    'FontSize',8);
h.Strips_Horizontal_x_6= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.14, 0.62, 0.04, 0.04],...
    'String',' 625 ',...
    'FontSize',8);
h.Strips_Horizontal_x_7= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.035, 0.58, 0.04, 0.04],...
    'String',' 650 ',...
    'FontSize',8);
h.Strips_Horizontal_x_8= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.14, 0.58, 0.04, 0.04],...
    'String',' 675 ',...
    'FontSize',8);
h.Strips_Horizontal_x_9= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.035, 0.54, 0.04, 0.04],...
    'String',' 700 ',...
    'FontSize',8);
h.Strips_Horizontal_x_10= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.14, 0.54, 0.04, 0.04],...
    'String',' 725 ',...
    'FontSize',8);
h.Strips_Horizontal_x_11= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.035, 0.5, 0.04, 0.04],...
    'String',' 750 ',...
    'FontSize',8);
h.Strips_Horizontal_x_12= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.14, 0.5, 0.04, 0.04],...
    'String',' 775 ',...
    'FontSize',8);

h.Strips_Horizontal_y_1= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.075, 0.7, 0.04, 0.04],...
    'String',' 500 ',...
    'FontSize',8);
h.Strips_Horizontal_y_2= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.18, 0.7, 0.04, 0.04],...
    'String',' 525 ',...
    'FontSize',8);
h.Strips_Horizontal_y_3= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.075, 0.66, 0.04, 0.04],...
    'String',' 550 ',...
    'FontSize',8);
h.Strips_Horizontal_y_4= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.18, 0.66, 0.04, 0.04],...
    'String',' 575 ',...
    'FontSize',8);
h.Strips_Horizontal_y_5= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.075, 0.62, 0.04, 0.04],...
    'String',' 600 ',...
    'FontSize',8);
h.Strips_Horizontal_y_6= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.18, 0.62, 0.04, 0.04],...
    'String',' 625 ',...
    'FontSize',8);
h.Strips_Horizontal_y_7= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.075, 0.58, 0.04, 0.04],...
    'String',' 650 ',...
    'FontSize',8);
h.Strips_Horizontal_y_8= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.18, 0.58, 0.04, 0.04],...
    'String',' 675 ',...
    'FontSize',8);
h.Strips_Horizontal_y_9= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.075, 0.54, 0.04, 0.04],...
    'String',' 700 ',...
    'FontSize',8);
h.Strips_Horizontal_y_10= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.18, 0.54, 0.04, 0.04],...
    'String',' 725 ',...
    'FontSize',8);
h.Strips_Horizontal_y_11= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.075, 0.5, 0.04, 0.04],...
    'String',' 750 ',...
    'FontSize',8);
h.Strips_Horizontal_y_12= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.18, 0.5, 0.04, 0.04],...
    'String',' 775 ',...
    'FontSize',8);

%
h.name_Col_Horizontal_Width = uicontrol('Parent',h.lp2,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.01, 0.455, 0.1, 0.03],...
    'String','Column Width',...
    'BackgroundColor',[0.7 0.7 0.7],...
    'FontSize',8);
h.Col_Horizontal_Width= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.11, 0.455, 0.1, 0.03],...
    'String','10',...
    'FontSize',8);

h.name_Row_Horizontal_Width = uicontrol('Parent',h.lp2,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.01, 0.42, 0.1, 0.03],...
    'String','Row Width',...
    'BackgroundColor',[0.7 0.7 0.7],...
    'FontSize',8);
h.Row_Horizontal_Width= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.11, 0.42, 0.1, 0.03],...
    'String',' 300 ',...
    'FontSize',8);


h.Rest_to_Horizontal = uicontrol('Parent',h.lp2,...
    'Style','togglebutton',...
    'Units','normalized',...
    'Position',[0.02, 0.305, 0.1, 0.1],...
    'String','Calculate',...
    'FontWeight','bold',...
    'BackgroundColor',[0.9 0.9 0],...
    'FontSize',8,...
    'Callback',@Horizontal);


h.name_Angle_Horizontal= uicontrol('Parent',h.lp2,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.01, 0.25, 0.1, 0.05],...
    'String','Angle',...
    'BackgroundColor',[0.4 0.4 0.4],...
    'FontSize',8);

h.AngleHorizontal= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.11, 0.25, 0.1, 0.05],...
    'String',' [] ',...
    'BackgroundColor',[0.6 0.6 0.6],...
    'FontSize',8);


h.name_Max_Min_I = uicontrol('Parent',h.lp2,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.01, 0.2, 0.05, 0.05],...
    'String',' I Plot',...
    'BackgroundColor',[0.8 0.8 0.8],...
    'FontSize',8);

h.min_I_H= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.06, 0.2, 0.05, 0.05],...
    'String',' 0 ',...
    'FontSize',8);

h.max_I_H= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.11, 0.2, 0.05, 0.05],...
    'String',' 300 ',...
    'FontSize',8);

h.Load_Scan_H= uicontrol('Parent',h.lp2,...
    'Style','push',...
    'Units','normalized',...
    'Position',[0.16 0.2 0.05 0.05],...
    'String','Load',...
    'BackgroundColor',[0 1 0],...
    'FontSize',10,...
    'Callback',@Load_Scan_Horizontal);

%%
% Estudies of the size of the beam

h.Beam_size = uicontrol('Parent',h.lp2,...
    'Style' , 'text',......
    'Visible', 'on',...
    'Enable','on',...
    'Value', 0,...
    'FontName','Helvetica',...
    'String','Beam Size',...
    'FontWeight','bold',...
    'HorizontalAlignment','center',...
    'Units','Normalized',...
    'Callback',@beam_size_Chk,...
    'Position',[0.01 0.145 0.1 0.04],...
    'BackgroundColor',[0.5 0.5 0.5],...
    'FontSize',7);
h.name_Beam_units_size = uicontrol('Parent',h.lp2,...
    'Style' , 'push',......
    'Visible', 'on',...
    'Enable','on',...
    'Value', 0,...
    'FontName','Helvetica',...
    'String','Image',...
    'FontWeight','bold',...
    'HorizontalAlignment','center',...
    'Units','Normalized',...
    'Callback',@beam_size_Image,...
    'Position',[0.11 0.145 0.05 0.04],...
    'BackgroundColor',[0 0 1],...
    'FontSize',7);
h.Beam_size_image = uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.16, 0.145, 0.05, 0.04],...
    'String',' [] ',...
    'BackgroundColor',[0.6 0.6 0.6],...
    'FontSize',8);


h.name_Col_Horizontal_Width = uicontrol('Parent',h.lp2,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.01, 0.111, 0.1, 0.03],...
    'String','Column Max',...
    'BackgroundColor',[0.7 0.7 0.7],...
    'FontSize',8);
h.name_Col_Horizontal = uicontrol('Parent',h.lp2,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.11, 0.111, 0.1, 0.03],...
    'String',' Column Min',...
    'BackgroundColor',[0.7 0.7 0.7],...
    'FontSize',8);
h.Col_beam_size_Max= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.01, 0.071, 0.1, 0.04],...
    'String',' 100 ',...
    'FontSize',8);
h.Col_beam_size_Min= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.11, 0.071, 0.1, 0.04],...
    'String',' 1600 ',...
    'FontSize',8);
h.name_Col_Horizontal_Width = uicontrol('Parent',h.lp2,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.01, 0.041, 0.1, 0.03],...
    'String','Strip Max',...
    'BackgroundColor',[0.7 0.7 0.7],...
    'FontSize',8);
h.name_Col_Horizontal = uicontrol('Parent',h.lp2,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.11, 0.041, 0.1, 0.03],...
    'String',' Strip Min',...
    'BackgroundColor',[0.7 0.7 0.7],...
    'FontSize',8);
h.Strip_beam_size_Max= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.01, 0.001, 0.1, 0.04],...
    'String',' 100 ',...
    'FontSize',8);
h.Strip_beam_size_Min= uicontrol('Parent',h.lp2,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.11, 0.001, 0.1, 0.04],...
    'String',' 1600 ',...
    'FontSize',8);

%% functions
%%
% Selects the Path of the file to be read

    function Path(source, eventdata)
        if source == h.name_Folder
            name_dir = uigetdir;
            for i_name = 1:size(name_dir,2)
                if name_dir(1,i_name) == '\'
                    name_dir_2(1,i_name) = '/';
                else
                    name_dir_2(1,i_name) = name_dir(1,i_name);
                end
            end
            set(h.Folder,'String', name_dir_2)
        elseif source == h.name_File
            name_dir = get(h.Folder,'String');
            name_file = uigetfile('*.*','mytitle',name_dir);
            
           
            name_file_screen = strcat(name_file(1,1),name_file(1,2));
            for i_name_file = 3:size(name_file,2)
                name_file_screen = strcat(name_file_screen, name_file(1,i_name_file));                
                if name_file(1, i_name_file-1) == 'f'
                    if name_file(1, i_name_file) == '1'
                        h.BX = 1 ;
                        set(h.File,'String', name_file_screen)
                    elseif name_file(1, i_name_file) == '2'
                        h.BX = 2 ;
                        set(h.File,'String', name_file_screen)
                    elseif name_file(1, i_name_file) == '3'
                        h.BX = 3 ;
                        set(h.File,'String', name_file_screen)
                    elseif name_file(1, i_name_file) == '4'
                        h.BX = 4 ;
                        set(h.File,'String', name_file_screen)
                    elseif name_file(1, i_name_file) == '5'
                        h.BX = 5 ;
                        set(h.File,'String', name_file_screen)
                    elseif name_file(1, i_name_file) == '6'
                        h.BX = 6 ;
                        set(h.File,'String', name_file_screen)
                    end                    
                end
                                            
                
            end
            
            if h.BX == 1 || h.BX == 2 || h.BX == 3
                name_file_screen = '';
                name_file_screen = strcat(name_file(1,1),name_file(1,2));
            for i_name_file = 3:size(name_file,2)
                name_file_screen = strcat(name_file_screen, name_file(1,i_name_file));
                if name_file(1, i_name_file-2) == 'I'
                    if name_file(1, i_name_file-1) == '0'
                        if name_file(1, i_name_file) == '0'                            
                            name_file_screen = strcat(name_file_screen,  name_file(1,i_name_file+1),  name_file(1,i_name_file+2));                            
                            set(h.File,'String', name_file_screen)                            
                        end
                    end
                end
            end
            end
        end
    end
% Load image with grid
    function Load_Scan(source,eventdata)
        
        child = get(h.ExtractS_Fig,'Children');
        for i=1:length(child)
            delete(child(i));
        end
    
        axes(h.ExtractS_Fig)
        if source == h.Load_Scan
            %Image Load
            Size_ScanI_Load = eval(get(h.Size_ScanI_Load, 'String'));
            
            
            if Size_ScanI_Load == 0
                set(h.Error_control,'String','Define Initial and Final Image','BackgroundColor',[1 1 0])
                pause(0.5)
                set(h.Error_control,'String','Define Initial and Final Image','BackgroundColor',[1 0 0])
                pause(0.5)
                set(h.Error_control,'String','Define Initial and Final Image','BackgroundColor',[1 1 0])
                pause(0.5)
                set(h.Error_control,'String','Define Initial and Final Image','BackgroundColor',[1 0 0])
                pause(0.5)
                set(h.Error_control,'String','Define Initial and Final Image','BackgroundColor',[1 1 0])
                pause(0.5)
                set(h.Error_control,'String','Define Initial and Final Image','BackgroundColor',[1 0 0])
                pause(5)
                
            else
                set(h.Error_control,'String','Working','BackgroundColor',[0 0 1])
            end
            
            min_I =eval(get(h.min_I, 'String'));
            max_I = eval(get(h.max_I, 'String'));
            h.min_I_value = min_I;
            h.max_I_value = max_I;
            
            
            
            set(h.max_I_H,'String',max_I);
            
            
            if h.Zoom_In_Act == 1
                size_StripMin = h.size_StripMin ;
                size_StripMax= h.size_StripMax;
                size_ColMin= h.size_ColMin;
                size_ColMax = h.size_ColMax;
            end
            
            Folder = get(h.Folder,'String');
            
            File = get(h.File,'String');
            
            File_true = 0;
            for i_file = 1:size(File,2)
                if File_true == 0
                    File2(1,i_file) = File(1,i_file);
                end
                if File(1,i_file) == 'I'
                    if File(1,i_file+1) == '0'
                        File_true = 1;
                    else
                        
                    end
                end
            end
            
            h.x_variable = 0;
            h.y_variable = 0;
            h.t_variable = 0;
            
            for i_file = 1:size(File,2)
                if File(1,i_file) == 'B'
                    if File(1,i_file+1) == 'D'
                        h.Laue = 0;
                        if File(1,i_file-1) == 'F'
                            h.FBD = 1;
                        else
                            h.FBD = 0;
                        end
                    end
                elseif File(1,i_file) == 'L'
                    if File(1,i_file+1) == 'D'
                        h.Laue = 1;
                        if File(1,i_file-1) == 'F'
                            h.FBD = 1;
                        else
                            h.FBD = 0;
                        end
                    end
                end
                if File(1,i_file) == 'f'
                    if File(1,i_file+1) == '1'
                        h.BX = 1;
                        if File(1,i_file+3) == 'x'
                            h.x_variable = 1;
                            if File(1,i_file+4) == 't'
                                h.t_variable = 1;
                            elseif File(1,i_file+4) == 'y'
                                h.y_variable = 1;
                            end
                        elseif File(1,i_file+3) == 'y'
                            h.y_variable = 1;
                            h.t_variable = 1;
                        end
                    elseif File(1,i_file+1) == '2'
                        h.BX = 2;
                        if File(1,i_file+3) == 'x'
                            h.x_variable = 1;
                            if File(1,i_file+4) == 't'
                                h.t_variable = 1;
                            elseif File(1,i_file+4) == 'y'
                                h.y_variable = 1;
                            end
                        elseif File(1,i_file+3) == 'y'
                            h.y_variable = 1;
                            h.t_variable = 1;
                        end
                    elseif File(1,i_file+1) == '3'
                        h.BX = 3;
                        if File(1,i_file+3) == 'x'
                            h.x_variable = 1;
                            if File(1,i_file+4) == 't'
                                h.t_variable = 1;
                            elseif File(1,i_file+4) == 'y'
                                h.y_variable = 1;
                            end
                        elseif File(1,i_file+3) == 'y'
                            h.y_variable = 1;
                            h.t_variable = 1;
                        end
                    elseif File(1,i_file+1) == '4'
                        h.BX = 4;
                    elseif File(1,i_file+1) == '5'
                        h.BX = 5;
                    elseif File(1,i_file+1) == '6'
                        h.BX = 6;
                    end
                end
            end
            
            if h.BX ==1 || h.BX ==2 || h.BX ==3
                name_File = strcat(File2,'0%0.3d.mat');
                directoryname_file = sprintf(name_File,Size_ScanI_Load);
            else
                name_File = strcat(File2,'.mat');
                directoryname_file = sprintf(name_File);
            end
            
            filename_Image = sprintf('%s/%s',Folder,directoryname_file);
    
            if (exist(filename_Image,'file') == 2) 
                
                
                if (exist(filename_Image,'file') == 2)
                    Image_data = load(filename_Image);
                    
                end
                if h.BX ==1
                    Gaussian_R_sum = Image_data.R_S_G;
                    if h.x_variable  == 1 && h.t_variable == 1
                        x_array = Image_data.kx_transvers_array;
                        t_array = Image_data.E_Scan_plot;
                        surf(t_array,x_array,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                        h.x_array = x_array;
                        h.t_array = t_array;
                        h.Gaussian_R_sum = Gaussian_R_sum;
                    end
                    if h.y_variable == 1 && h.t_variable == 1
                        y_array = Image_data.ky_transvers_array;
                        t_array = Image_data.E_Scan_plot;
                        surf(t_array,y_array,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                        h.y_array = y_array;
                        h.t_array = t_array;
                        h.Gaussian_R_sum = Gaussian_R_sum;
                    end
                    
                    if h.y_variable == 1 && h.x_variable == 1
                        x_array = Image_data.kx_transvers_array;
                        y_array = Image_data.ky_transvers_array;
                        surf(x_array,y_array,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                        h.x_array = x_array;
                        h.y_array = y_array;
                        h.Gaussian_R_sum = Gaussian_R_sum;
                    end
                    
                    view([-90 90])
                elseif h.BX ==2
                    Gaussian_R_sum = Image_data.Gaussian_R_sum;
                    if h.x_variable  == 1 && h.t_variable == 1
                        x_array = Image_data.x_array;
                        t_array = Image_data.t_array;
                        surf(t_array,x_array,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                        h.x_array = x_array;
                        h.t_array = t_array;
                        h.Gaussian_R_sum = Gaussian_R_sum;
                    end
                    if h.y_variable  == 1 && h.t_variable == 1
                        y_array = Image_data.y_array;
                        t_array = Image_data.t_array;
                        surf(t_array,y_array,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                        h.y_array = y_array;
                        h.t_array = t_array;
                        h.Gaussian_R_sum = Gaussian_R_sum;
                    end
                    if h.x_variable  == 1 && h.y_variable == 1
                        x_array = Image_data.x_array;
                        y_array = Image_data.y_array;
                        surf(x_array,y_array,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                        h.y_array = y_array;
                        h.x_array = x_array;
                        h.Gaussian_R_sum = Gaussian_R_sum;
                    end
                    view([-90 90])
                    
                elseif h.BX ==3
                    Gaussian_R_sum = Image_data.R_S_2D_sum;
                    if h.x_variable  == 1 && h.t_variable == 1
                        x_array = Image_data.kx_transvers_array;
                        t_array = Image_data.E_Scan_plot;
                        surf(t_array,x_array,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                                                h.x_array = x_array;
                        h.t_array = t_array;
                        h.Gaussian_R_sum = Gaussian_R_sum;
                    end
                    if h.y_variable == 1 && h.t_variable == 1
                        y_array = Image_data.ky_transvers_array;
                        t_array = Image_data.E_Scan_plot;
                        surf(t_array,y_array,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                        h.y_array = y_array;
                        h.t_array = t_array;
                        h.Gaussian_R_sum = Gaussian_R_sum;
                    end
                    
                    if h.y_variable == 1 && h.x_variable == 1
                        x_array = Image_data.kx_transvers_array;
                        y_array = Image_data.ky_transvers_array;
                        surf(x_array,y_array,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                        h.y_array = y_array;
                        h.x_array = x_array;
                        h.Gaussian_R_sum = Gaussian_R_sum;
                    end
                    
                    view([-90 90])
                elseif h.BX ==4
                    x_array = Image_data.x_array;
                    Energy_array = Image_data.Energy_array;
                    Gaussian_R_sum = Image_data.Intensityx_array;
                    surf(x_array,Energy_array,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                    
                elseif h.BX ==5
                    E_Scan_plot = Image_data.E_Scan_plot;
                    R_00_S = Image_data.R_00_S;
                    R_0H_S = Image_data.R_0H_S;
                    R_0H_S_Mono_all = Image_data.R_0H_S_Mono_all;
                    if h.Laue == 1
                        plot(E_Scan_plot,R_00_S,'Parent',h.ExtractS_Fig);
                    else
                        plot(E_Scan_plot,R_0H_S,'Parent',h.ExtractS_Fig);
                    end
                    hold on
                    for i_mono = 1:size(R_0H_S_Mono_all,1)
                        plot(E_Scan_plot,R_0H_S_Mono_all(i_mono,:),'Parent',h.ExtractS_Fig);
                    end
                    
                elseif h.BX ==6
                    Energy_array = Image_data.Energy_array;
                    Intensity_array_save = Image_data.Intensity_array_save;
                    plot(Energy_array,Intensity_array_save,'Parent',h.ExtractS_Fig);
                end
                if h.Color_Map == 1
                    colormap winter
                elseif h.Color_Map == 0
                    colormap gray
                elseif h.Color_Map == 2
                    colormap hsv
                end
                
                colorbar
            end
        end
        
    end

% Load image
    function Fix_Ranges(source,eventdata)
                
        child = get(h.ExtractS_Fig,'Children');
        for i=1:length(child)
            delete(child(i));
        end
            
        axes(h.ExtractS_Fig)
        
        if source == h.Save_Parameter
            
            if h.BX ==1 ||h.BX ==2 || h.BX ==3
                Gaussian_R_sum = h.Gaussian_R_sum;
                if  h.BX ==1                        
                    if h.x_variable  == 1 && h.t_variable == 1
                        x_array = h.x_array*1e6;
                        factorx = x_array(1,2)-x_array(1,1);
                        x_array_plot = x_array / factorx;
                        
                        t_array = h.t_array*1e15 ;                               
                        factort = t_array(1,2)-t_array(1,1);
                        t_array_plot = t_array / factort;
                        surf(t_array_plot,x_array_plot,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                        
                    end
                    if h.y_variable == 1 && h.t_variable == 1                        
                        y_array = h.y_array*1e6;
                        factory = y_array(1,2)-y_array(1,1);
                        y_array_plot = y_array / factory;
                        
                        t_array = h.t_array*1e15 ;                               
                        factort = t_array(1,2)-t_array(1,1);
                        t_array_plot = t_array / factort;                      
                        surf(t_array_plot,y_array_plot,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                        
                    end                    
                    if h.y_variable == 1 && h.x_variable == 1                       
                        x_array = h.x_array*1e6;
                        factorx = x_array(1,2)-x_array(1,1);
                        x_array_plot = x_array / factorx;
                        y_array = h.y_array*1e6;
                        factory = y_array(1,2)-y_array(1,1);
                        y_array_plot = y_array / factory;                       
                        surf(x_array_plot,y_array_plot,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                    end                    
                    view([-90 90])
                    
                elseif h.BX ==2                   
                    if h.x_variable  == 1 && h.t_variable == 1
                        x_array = h.x_array*1e6;
                        factorx = x_array(1,2)-x_array(1,1);
                        x_array_plot = x_array / factorx;
                        
                        t_array = h.t_array*1e15 ;                               
                        factort = t_array(1,2)-t_array(1,1);
                        t_array_plot = t_array / factort;
                        surf(t_array_plot,x_array_plot,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                        
                    end
                    if h.y_variable  == 1 && h.t_variable == 1
                        y_array = h.y_array*1e6;
                        factory = y_array(1,2)-y_array(1,1);
                        y_array_plot = y_array / factory;

                        t_array = h.t_array*1e15 ;                               
                        factort = t_array(1,2)-t_array(1,1);
                        t_array_plot = t_array / factort;
                        surf(t_array_plot,y_array_plot,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                        
                    end
                    if h.x_variable  == 1 && h.y_variable == 1
                        y_array = h.y_array*1e6;
                        factory = y_array(1,2)-y_array(1,1);
                        y_array_plot = y_array / factory;
                        
                        x_array = h.x_array*1e6;
                        factorx = x_array(1,2)-x_array(1,1);
                        x_array_plot = x_array / factorx;
                        surf(x_array_plot,y_array_plot,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                        
                    end
                    view([-90 90])
                    
                elseif h.BX ==3
                 
                    if h.x_variable  == 1 && h.t_variable == 1
                        x_array = h.x_array*1e6;
                        factorx = x_array(1,2)-x_array(1,1);
                        x_array_plot = x_array / factorx;
                        
                        t_array = h.t_array*1e15 ;                               
                        factort = t_array(1,2)-t_array(1,1);
                        t_array_plot = t_array / factort;
                        surf(t_array_plot,x_array_plot,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                        
                    end
                    if h.y_variable == 1 && h.t_variable == 1
                        y_array = h.y_array*1e6;
                        factory = y_array(1,2)-y_array(1,1);
                        y_array_plot = y_array / factory;
                        
                        t_array = h.t_array*1e15;
                        surf(t_array_plot,y_array_plot,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                    end
                    
                    if h.y_variable == 1 && h.x_variable == 1
                        y_array = h.y_array*1e6;
                        factory = y_array(1,2)-y_array(1,1);
                        y_array_plot = y_array / factory;
                        
                        x_array = h.x_array*1e6;
                        factorx = x_array(1,2)-x_array(1,1);
                        x_array_plot = x_array / factorx;
                        surf(x_array_plot,y_array_plot,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                        
                    end
                    
                    view([-90 90])
                end
                
                if h.Color_Map == 1
                    colormap winter
                elseif h.Color_Map == 0
                    colormap gray
                elseif h.Color_Map == 2
                    colormap hsv
                end
                
                colorbar
                
                min_I =eval(get(h.min_I, 'String'));
                max_I = eval(get(h.max_I, 'String'));
                h.min_I_value = min_I;
                h.max_I_value = max_I;
                
                set(h.max_I_H,'String',max_I);
                
                ColumnRangeMax1 = eval(get(h.ColumnRangeMax1, 'String'));
                ColumnRangeMin1 = eval(get(h.ColumnRangeMin1, 'String'));
                ColumnRangeMax2 = eval(get(h.ColumnRangeMax2, 'String'));
                ColumnRangeMin2 = eval(get(h.ColumnRangeMin2, 'String'));
                ColumnRangeMax3 = eval(get(h.ColumnRangeMax3, 'String'));
                ColumnRangeMin3 = eval(get(h.ColumnRangeMin3, 'String'));
                ColumnRangeMax4 = eval(get(h.ColumnRangeMax4, 'String'));
                ColumnRangeMin4 = eval(get(h.ColumnRangeMin4, 'String'));
                
                StripRanges1Max = eval(get(h.StripRanges1Max, 'String'));
                StripRanges1Min = eval(get(h.StripRanges1Min, 'String'));
                StripRanges2Max = eval(get(h.StripRanges2Max, 'String'));
                StripRanges2Min = eval(get(h.StripRanges2Min, 'String'));
                StripRanges3Max = eval(get(h.StripRanges3Max, 'String'));
                StripRanges3Min = eval(get(h.StripRanges3Min, 'String'));
                StripRanges4Max = eval(get(h.StripRanges4Max, 'String'));
                StripRanges4Min = eval(get(h.StripRanges4Min, 'String'));
                
                ColumnRange = [ColumnRangeMax1 ColumnRangeMin1;ColumnRangeMax2 ColumnRangeMin2;ColumnRangeMax3 ColumnRangeMin3;ColumnRangeMax4 ColumnRangeMin4];
                StripRanges = [StripRanges1Max StripRanges1Min; StripRanges2Max StripRanges2Min; StripRanges3Max StripRanges3Min; StripRanges4Max StripRanges4Min];
                
                h.ColumnRanges = ColumnRange;
                h.StripRanges = StripRanges;
                hold on
            
                
            if get(h.Strip_scan_Extract_1,'value') == 1
                x_Strip = linspace(StripRanges(1,1),StripRanges(1,2),100);
                y_Strip = linspace(ColumnRange(1,1),ColumnRange(1,2),100);
                z_Strip = ones(100,100)*min_I;
                z_Strip(100,:) = max_I;
                z_Strip(:,100) = max_I;                
                z_Strip(:,1) = max_I;
                z_Strip(1,:) = max_I;               
                surf(x_Strip, y_Strip, z_Strip,'Parent', h.ExtractS_Fig)
                
                %rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min  x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','r'); %,'LineWidth',5
            end
            if get(h.Strip_scan_Extract_2,'value') == 1
                x_Strip = linspace(StripRanges(2,1),StripRanges(2,2),100);
                y_Strip = linspace(ColumnRange(2,1),ColumnRange(2,2),100);
                z_Strip = ones(100,100)*min_I;
                z_Strip(100,:) = max_I;
                z_Strip(:,100) = max_I;                
                z_Strip(:,1) = max_I;
                z_Strip(1,:) = max_I;               
                surf(x_Strip, y_Strip, z_Strip,'Parent', h.ExtractS_Fig)
                %rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','y','LineWidth',5);
            end
            if get(h.Strip_scan_Extract_3,'value') == 1
                x_Strip = linspace(StripRanges(3,1),StripRanges(3,2),100);
                y_Strip = linspace(ColumnRange(3,1),ColumnRange(3,2),100);
                z_Strip = ones(100,100)*min_I;
                z_Strip(100,:) = max_I;
                z_Strip(:,100) = max_I;                
                z_Strip(:,1) = max_I;
                z_Strip(1,:) = max_I;               
                surf(x_Strip, y_Strip, z_Strip,'Parent', h.ExtractS_Fig)
                %rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','m','LineWidth',5);
            end
            
            if get(h.Strip_scan_Extract_4,'value') == 1
                x_Strip = linspace(StripRanges(4,1),StripRanges(4,2),100);
                y_Strip = linspace(ColumnRange(4,1),ColumnRange(4,2),100);
                z_Strip = ones(100,100)*min_I;
                z_Strip(100,:) = max_I;
                z_Strip(:,100) = max_I;                
                z_Strip(:,1) = max_I;
                z_Strip(1,:) = max_I;
                surf(x_Strip, y_Strip, z_Strip,'Parent', h.ExtractS_Fig)
                %rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','w','LineWidth',5);
            end
            drawnow
            
            end
        end
    end

% Extract sections
    function ExtractS(source,eventdata)
        set(h.Error_control,'String','Scan working','BackgroundColor',[0 0 1])
        
        
        child = get(h.ExtractS_Fig,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        
        Folder = get(h.Folder,'String');
        directoryname_Images = strcat(Folder);
        
        h.directoryname_Images =directoryname_Images;
        
        axis(h.ExtractS_Fig)
        if source == h.Extract
            
            if h.BX ==1 ||h.BX ==2 || h.BX ==3
                
                
                ColumnRanges = h.ColumnRanges;
                StripRanges = h.StripRanges;

                Size_ScanF  = eval(get(h.Size_ScanF, 'String'));
                Size_ScanI = eval(get(h.Size_ScanI, 'String'));
                ImageNumbers = [Size_ScanI : Size_ScanF];
                
                Strip_Extract = h.Strip_Extract;
            
                if h.Zoom_In_Act == 1
                    size_StripMin = h.size_StripMin ;
                    size_StripMax= h.size_StripMax;
                    size_ColMin= h.size_ColMin;
                    size_ColMax = h.size_ColMax;
                end
            
                %%
                
                N_images = length(ImageNumbers);
                N_StripRanges = size(StripRanges,1);
                N_ColumnPixels = ColumnRanges(1,2)-ColumnRanges(1,1)+1;
                StripIntensities = zeros(N_images,N_ColumnPixels,N_StripRanges);
            
            
                File = get(h.File,'String');
                
                File_true = 0;
                for i_file = 1:size(File,2)
                    if File_true == 0
                        File2(1,i_file) = File(1,i_file);
                    end
                    if File(1,i_file) == 'I'
                        if File(1,i_file+1) == '0'
                            File_true = 1;
                        else
                            
                        end
                    end
                end
                
                name_File = strcat(File2,'0%0.3d.mat');
                
                axes(h.ExtractS_Fig)
                n_im = 0;
                
                
                frame(size(ImageNumbers,2)) = struct('cdata',[],'colormap',[]);
                
                t_im =1;
                for t_im = 1:size(ImageNumbers,2)
                    
                    i_im = ImageNumbers(1,t_im);
                    
                    if h.Pause == 1
                        i_pause =0;
                        while h.Pause == 1
                            pause(1)
                            i_pause = i_pause +1;
                            if i_pause ==60
                                h.Pause=0;
                                set(h.Name_Pause_I_S, 'Value',0)
                                set(h.Name_Pause, 'Value',0)
                            end
                        end
                    end
                    
                    if h.Stop_value == 1
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 1 0])
                        pause(0.5)
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 0 0])
                        pause(0.5)
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 1 0])
                        pause(0.5)
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 0 0])
                        pause(0.5)
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 1 0])
                        pause(0.5)
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 0 0])
                        pause(1)
                        Stop_value =0;
                        h.Stop_value =Stop_value;
                        break
                    end
                    
                    
                    directoryname_file = sprintf(name_File,i_im);
                    filename_Image = sprintf('%s/%s',Folder,directoryname_file);
                    
                    if (exist(filename_Image,'file') == 2)
                        
                        if (exist(filename_Image,'file') == 2)
                            Image_data = load(filename_Image);                            
                        end
                        
                        if h.BX ==1
                            Gaussian_R_sum = Image_data.R_S_G;
                            if h.x_variable  == 1 && h.t_variable == 1
                                
                                x_array = Image_data.kx_transvers_array*1e6;                                
                                t_array = Image_data.E_Scan_plot*1e15;
                                surf(t_array,x_array,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                                factorrow = t_array(1,2)-t_array(1,1);
                                factorcol = x_array(1,2)-x_array(1,1);
                            end
                            if h.y_variable == 1 && h.t_variable == 1
                                y_array = Image_data.ky_transvers_array*1e6;
                                t_array = Image_data.E_Scan_plot*1e15;
                                surf(t_array,y_array,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                                factorcol = y_array(1,2)-y_array(1,1);
                                factorrow = t_array(1,2)-t_array(1,1);
                            end
                            
                            if h.y_variable == 1 && h.x_variable == 1
                                x_array = Image_data.kx_transvers_array*1e6;
                                y_array = Image_data.ky_transvers_array*1e6;
                                surf(x_array,y_array,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                                factorrow = x_array(1,2)-x_array(1,1);
                                factorcol = y_array(1,2)-y_array(1,1);
                            end
                            
                            view([-90 90])
                        elseif h.BX ==2
                            Gaussian_R_sum = Image_data.Gaussian_R_sum;
                            if h.x_variable  == 1 && h.t_variable == 1
                                x_array = Image_data.x_array*1e6;
                                t_array = Image_data.t_array*1e15;
                                surf(t_array,x_array,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                                factorrow = t_array(1,2)-t_array(1,1);
                                factorcol = x_array(1,2)-x_array(1,1);
                            end
                            if h.y_variable  == 1 && h.t_variable == 1
                                y_array = Image_data.y_array*1e6;
                                t_array = Image_data.t_array*1e15;
                                surf(t_array,y_array,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                                factorcol = y_array(1,2)-y_array(1,1);
                                factorrow = t_array(1,2)-t_array(1,1);
                            end
                            if h.x_variable  == 1 && h.y_variable == 1
                                x_array = Image_data.x_array*1e6;
                                y_array = Image_data.y_array*1e6;
                                surf(x_array,y_array,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                                factorrow = x_array(1,2)-x_array(1,1);
                                factorcol = y_array(1,2)-y_array(1,1);
                            end
                            view([-90 90])
                            
                        elseif h.BX ==3
                            Gaussian_R_sum = Image_data.R_S_2D_sum;
                            if h.x_variable  == 1 && h.t_variable == 1
                                x_array = Image_data.kx_transvers_array*1e6;
                                t_array = Image_data.E_Scan_plot*1e15;
                                surf(t_array,x_array,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                                factorrow = t_array(1,2)-t_array(1,1);
                                factorcol = x_array(1,2)-x_array(1,1);
                            end
                            if h.y_variable == 1 && h.t_variable == 1
                                y_array = Image_data.ky_transvers_array*1e6;
                                t_array = Image_data.E_Scan_plot*1e15;
                                surf(t_array,y_array,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                                factorcol = y_array(1,2)-y_array(1,1);
                                factorrow = t_array(1,2)-t_array(1,1);
                            end
                            
                            if h.y_variable == 1 && h.x_variable == 1
                                x_array = Image_data.kx_transvers_array*1e6;
                                y_array = Image_data.ky_transvers_array*1e6;
                                factorrow = x_array(1,2)-x_array(1,1);
                                factorcol = y_array(1,2)-y_array(1,1);
                                surf(x_array,y_array,Gaussian_R_sum,'Parent',h.ExtractS_Fig,'edgecolor','none');
                            end
                            
                            view([-90 90])                            

                        end
                        if h.Color_Map == 1
                            colormap winter
                        elseif h.Color_Map == 0
                            colormap gray
                        elseif h.Color_Map == 2
                            colormap hsv
                        end
                        
                        colorbar
                        
                        if get(h.Save_video,'Value') == 1
                            frame(t_im) = getframe(h.ExtractS_Fig);
                        end
                        
                        min_I =eval(get(h.min_I, 'String'));
                        max_I = eval(get(h.max_I, 'String'));
                        h.min_I_value = min_I;
                        h.max_I_value = max_I;
                        
                        set(h.max_I_H,'String',max_I);
                        
                        ColumnRangeMax1 = eval(get(h.ColumnRangeMax1, 'String'));
                        ColumnRangeMin1 = eval(get(h.ColumnRangeMin1, 'String'));
                        ColumnRangeMax2 = eval(get(h.ColumnRangeMax2, 'String'));
                        ColumnRangeMin2 = eval(get(h.ColumnRangeMin2, 'String'));
                        ColumnRangeMax3 = eval(get(h.ColumnRangeMax3, 'String'));
                        ColumnRangeMin3 = eval(get(h.ColumnRangeMin3, 'String'));
                        ColumnRangeMax4 = eval(get(h.ColumnRangeMax4, 'String'));
                        ColumnRangeMin4 = eval(get(h.ColumnRangeMin4, 'String'));
                        
                        StripRanges1Max = eval(get(h.StripRanges1Max, 'String'));
                        StripRanges1Min = eval(get(h.StripRanges1Min, 'String'));
                        StripRanges2Max = eval(get(h.StripRanges2Max, 'String'));
                        StripRanges2Min = eval(get(h.StripRanges2Min, 'String'));
                        StripRanges3Max = eval(get(h.StripRanges3Max, 'String'));
                        StripRanges3Min = eval(get(h.StripRanges3Min, 'String'));
                        StripRanges4Max = eval(get(h.StripRanges4Max, 'String'));
                        StripRanges4Min = eval(get(h.StripRanges4Min, 'String'));
                        
                        
                        ColumnRange = [ColumnRangeMax1 ColumnRangeMin1;ColumnRangeMax2 ColumnRangeMin2;ColumnRangeMax3 ColumnRangeMin3;ColumnRangeMax4 ColumnRangeMin4]*factorcol;
                        StripRanges = [StripRanges1Max StripRanges1Min; StripRanges2Max StripRanges2Min; StripRanges3Max StripRanges3Min; StripRanges4Max StripRanges4Min]*factorrow;
                        h.ColumnRange = ColumnRange;
                        h.StripRanges = StripRanges;
                        h.factorcol = factorcol;
                        h.factorrow = factorrow;
                        
                        hold on
                        pause(1)
                        
                         if get(h.Strip_scan_Extract_1,'value') == 1
                             x_Strip = linspace(StripRanges(1,1),StripRanges(1,2),100);
                            y_Strip = linspace(ColumnRange(1,1),ColumnRange(1,2),100);
                            z_Strip = ones(100,100)*min_I;
                            z_Strip(100,:) = max_I;
                            z_Strip(:,100) = max_I;
                            z_Strip(:,1) = max_I;
                            z_Strip(1,:) = max_I;
                            surf(x_Strip, y_Strip, z_Strip,'Parent', h.ExtractS_Fig)
                            
                            %rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min  x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','r'); %,'LineWidth',5
                        end
                        if get(h.Strip_scan_Extract_2,'value') == 1
                            x_Strip = linspace(StripRanges(2,1),StripRanges(2,2),100);
                            y_Strip = linspace(ColumnRange(2,1),ColumnRange(2,2),100);
                            z_Strip = ones(100,100)*min_I;
                            z_Strip(100,:) = max_I;
                            z_Strip(:,100) = max_I;
                            z_Strip(:,1) = max_I;
                            z_Strip(1,:) = max_I;
                            surf(x_Strip, y_Strip, z_Strip,'Parent', h.ExtractS_Fig)
                            %rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','y','LineWidth',5);
                        end
                        if get(h.Strip_scan_Extract_3,'value') == 1
                            x_Strip = linspace(StripRanges(3,1),StripRanges(3,2),100);
                            y_Strip = linspace(ColumnRange(3,1),ColumnRange(3,2),100);
                            z_Strip = ones(100,100)*min_I;
                            z_Strip(100,:) = max_I;
                            z_Strip(:,100) = max_I;
                            z_Strip(:,1) = max_I;
                            z_Strip(1,:) = max_I;
                            surf(x_Strip, y_Strip, z_Strip,'Parent', h.ExtractS_Fig)
                            %rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','m','LineWidth',5);
                        end
                        
                        if get(h.Strip_scan_Extract_4,'value') == 1
                            x_Strip = linspace(StripRanges(4,1),StripRanges(4,2),100);
                            y_Strip = linspace(ColumnRange(4,1),ColumnRange(4,2),100);
                            z_Strip = ones(100,100)*min_I;
                            z_Strip(100,:) = max_I;
                            z_Strip(:,100) = max_I;
                            z_Strip(:,1) = max_I;
                            z_Strip(1,:) = max_I;
                            surf(x_Strip, y_Strip, z_Strip,'Parent', h.ExtractS_Fig)
                            %rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','w','LineWidth',5);
                        end
                        drawnow
                        hold on
                        
                        title(sprintf('F7: Image%0.3d',i_im));
                        pause(0.1)

                        
                        n_im = n_im + 1;
                        N_StripRanges2 =0;
                        i_Strip_values = 0;
                        t_Extract = 1;
                        for i_Extract = 1:size(Strip_Extract,2)
                            if Strip_Extract(1,i_Extract)==0
                            else
                                N_StripRanges2 = N_StripRanges2 +1;
                                i_Strip_values(1,t_Extract) = Strip_Extract(1,i_Extract);
                                t_Extract = t_Extract+ 1;
                            end
                            
                        end

                        for i_Extract= 1:N_StripRanges2
                            
                            i_Strip = i_Strip_values(1,i_Extract);
                            
                            x_Strip_min = StripRanges(i_Strip,1)/factorrow;
                            x_Strip_max = StripRanges(i_Strip,2)/factorrow;
                            y_Strip_min = ColumnRange(i_Strip,1)/factorcol;
                            y_Strip_max = ColumnRange(i_Strip,2)/factorcol;
                            
                            
%                             if i_Strip == 1
%                                 rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','r','LineWidth',1.5);
%                             elseif i_Strip == 2
%                                 rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','y','LineWidth',1.5);
%                             elseif i_Strip == 3
%                                 rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','m','LineWidth',1.5);
%                             elseif i_Strip == 4
%                                 rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','w','LineWidth',1.5);
%                             end
%                             
%                             pause(0.001)
                            t_Sum_Strip = 1;
                            
                            
                            
                            for i_Sum_Strip=y_Strip_min:y_Strip_max     
                                y_Strip = linspace(y_Strip_min,y_Strip_max,y_Strip_max-y_Strip_min+1)+size(Gaussian_R_sum,1)/2;
                                x_Strip = linspace(x_Strip_min,x_Strip_max,x_Strip_max-x_Strip_min+1)+size(Gaussian_R_sum,2)/2;

                                sum_andor = Gaussian_R_sum(y_Strip,x_Strip);
                                
                                if i_Strip == 1
                                    StripIntensities1(n_im,:,i_Strip) = sum(sum_andor,1);
                                elseif i_Strip == 2
                                    StripIntensities2(n_im,:,i_Strip) = sum(sum_andor,1);
                                elseif i_Strip == 3
                                    StripIntensities3(n_im,:,i_Strip) = sum(sum_andor,1);
                                else
                                    StripIntensities4(n_im,:,i_Strip) = sum(sum_andor,1);
                                end
                                t_Sum_Strip = t_Sum_Strip +1;
                            end

                        end


                        
                    end
                   hold off
                end
                        
                if get(h.Strip_scan_Extract_1,'Value') == 1
                    h.StripIntensities1 = StripIntensities1;
                end
                if get(h.Strip_scan_Extract_2,'Value') == 1
                    h.StripIntensities2=StripIntensities2;
                end
                if get(h.Strip_scan_Extract_3,'Value') == 1
                    h.StripIntensities3=StripIntensities3;
                end
                if get(h.Strip_scan_Extract_4,'Value') == 1
                    h.StripIntensities4=StripIntensities4;
                end

                
                h.ImageNumbers = ImageNumbers;
                if get(h.Save_video,'Value') == 1
                    set(h.f_video,'Visible','on')
                    movie(h.f_video,frame,1,5)
                    pause(0.5)
                    
                    filename_Output = sprintf('%s/VideoScan.avi',directoryname_Images);
                    
                    set(h.f_video,'Visible','off')
                    v = VideoWriter(filename_Output);
                    v.FrameRate = 5;
                    open(v)
                    writeVideo(v,frame)
                    close(v)
                end
                
            end
        end
    end
    

    function Plot_Panel_call (source,eventdata)


        if source  == h.Plot_Panel_call
            
        set(h.Plot_Panel_call,'Value',1)
        %% Plot Panel
        %-------------------------------
        h.f3 = figure(d+20);
        name_Versionpp = sprintf('%s Plot Panel',name_Version);
        set(h.f3,'Name',name_Versionpp,...
            'NumberTitle', 'Off',...
            'Units','normalized',...
            'Position', [0.51 0.05 0.485 0.87],...
            'Color',[0.8 0.8 0.8],...
            'KeyReleaseFcn',@Press);
        
                h.f_video = figure(d+2);
        set(h.f_video,'Name','Save_plot',...
            'NumberTitle', 'Off',...
            'Visible','off',...
            'Units','normalized',...
            'Position', [0.0 0.05 1 0.915],...
            'Color',[0.8 0.8 0.8],...
            'Menubar','none','KeyReleaseFcn',@Press);
        
        Plot_Panel_Print_call
        %% Plot main panel
        h.PlotS_Fig = axes('Parent',h.f3,'Units','normalized',...
            'Position',[0.08 0.66 0.4 0.19],...
            'box','on',...
            'LineWidth',0.5,...
            'fontsize',8,...
            'Color',[1 1 1],...
            'FontName','Helvetica',...
            'FontWeight','bold',...
            'Xlim',[-1 1]);
        title(h.PlotS_Fig,'F1: Integration Section')
        xlabel(h.PlotS_Fig, 'Position (um)')
        ylabel(h.PlotS_Fig,'Intensity (arb. units)')
        

        
        h.PlotRS_Fig = axes('Parent',h.f3,'Units','normalized',...
            'Position',[0.58 0.66 0.4 0.19],...
            'box','on',...
            'LineWidth',0.5,...
            'fontsize',8,...
            'box','on',...
            'Color',[1 1 1],...
            'FontName','Helvetica',...
            'FontWeight','bold',...
            'Xlim',[-1 1]);
        title(h.PlotRS_Fig,'F2: Integration Section')
        xlabel(h.PlotRS_Fig, 'Position (um)')
        ylabel(h.PlotRS_Fig,'Intensity (arb. units)')
        
        h.PlotS_Result_Fig = axes('Parent',h.f3,'Units','normalized',...
            'Position',[0.08 0.36 0.4 0.19],...
            'box','on',...
            'LineWidth',0.5,...
            'fontsize',8,...
            'box','on',...
            'Color',[1 1 1],...
            'FontName','Helvetica',...
            'FontWeight','bold',...
            'Xlim',[-1 1]);
        title(h.PlotS_Result_Fig,'F3: Integration Section')
        xlabel(h.PlotS_Result_Fig, 'Position (um)')
        ylabel(h.PlotS_Result_Fig,'Intensity (arb. units)')
        
        h.PlotS_Result2_Fig = axes('Parent',h.f3,'Units','normalized',...
            'Position',[0.58 0.36 0.4 0.19],...
            'box','on',...
            'LineWidth',0.5,...
            'fontsize',8,...
            'box','on',...
            'Color',[1 1 1],...
            'FontName','Helvetica',...
            'FontWeight','bold',...
            'Xlim',[-1 1]);
        title(h.PlotS_Result2_Fig,'F4: Integration Section')
        xlabel(h.PlotS_Result2_Fig, 'Position (um)')
        ylabel(h.PlotS_Result2_Fig,'Intensity (arb. units)')
        
        h.PlotS_Result3_Fig = axes('Parent',h.f3,'Units','normalized',...
            'Position',[0.08 0.06 0.4 0.19],...
            'box','on',...
            'LineWidth',0.5,...
            'fontsize',8,...
            'box','on',...
            'Color',[1 1 1],...
            'FontName','Helvetica',...
            'FontWeight','bold',...
            'Xlim',[-1 1]);
        title(h.PlotS_Result3_Fig,'F5: Integration Section')
        xlabel(h.PlotS_Result3_Fig, 'Position (um)')
        ylabel(h.PlotS_Result3_Fig,'Intensity (arb. units)')
        
        
        h.PlotS_Result4_Fig = axes('Parent',h.f3,'Units','normalized',...
            'Position',[0.58 0.06 0.4 0.19],...
            'box','on',...
            'LineWidth',0.5,...
            'fontsize',8,...
            'box','on',...
            'Color',[1 1 1],...
            'FontName','Helvetica',...
            'FontWeight','bold',...
            'Xlim',[-1 1]);
        title(h.PlotS_Result4_Fig,'F6: Integration Section')
        xlabel(h.PlotS_Result4_Fig, 'Position (um)')
        ylabel(h.PlotS_Result4_Fig,'Intensity (arb. units)')
        
        %%
        
        
        grid(h.PlotS_Result_Fig,'on');
        grid(h.PlotRS_Fig,'on');
        grid(h.PlotS_Result_Fig,'on');
        grid(h.PlotS_Result2_Fig,'on');
        grid(h.PlotS_Result3_Fig,'on');
        grid(h.PlotS_Result4_Fig,'on');
        
        h.lp = uipanel('Parent',h.f3,...
            'Units','Normalized',...
            'BackgroundColor',[0.5 0.5 0.5],...
            'Position',[0. 0.95 1 0.05],...
            'BorderType','beveledout',...
            'Visible','On');
        
        % Plot panel
        h.name_Plot_lp =  uicontrol('Parent',h.lp,...
            'Style' , 'text',...
            'Enable', 'on',...
            'Value', 0,...
            'FontName','Helvetica',...
            'FontSize',10,...
            'String','Plot Panel',...
            'FontWeight','normal',...
            'BackgroundColor',[0 0 0.8],...
            'Units','Normalized',...
            'Position', [0. 0.5 0.1 0.5],...
            'BackgroundColor',[0.4 0.4 0.4]);
               
        h.name_Log_Pre_plot =  uicontrol('Parent',h.lp,...
            'Style' , 'text',...
            'FontName','Helvetica',...
            'FontSize',10,...
            'String','Pre-Plot_MG',...
            'FontWeight','normal',...
            'BackgroundColor',[0 0 0.8],...
            'Units','Normalized',...
            'Position', [0.1 0.5 0.1 0.5],...
            'BackgroundColor',[0.45 0.45 0.45]);
        
        h.Log_Pre_plot = uicontrol('Parent',h.lp,...
            'Style' , 'Check',......
            'Enable','on',...
            'Value', 1,...
            'FontName','Helvetica',...
            'String','Logaritmic Scale',...
            'FontWeight','bold',...
            'HorizontalAlignment','center',...
            'Units','Normalized',...
            'Callback',@Print_Chk,...
            'Position',[0.1 0. 0.1 0.5],...
            'BackgroundColor',[0.46 0.46 0.46],...
            'FontSize',6);
        
        h.name_Picture =  uicontrol('Parent',h.lp,...
            'Style' , 'togglebutton',...
            'Enable', 'on',...
            'Value', 0,...
            'FontName','Arial',...
            'FontSize',10,...
            'String','Image',...
            'FontWeight','normal',...
            'BackgroundColor',[0 0 0.8],...
            'Units','Normalized',...
            'Position', [0.3, 0.8, 0.075, 0.2],...
            'BackgroundColor',[0 0.6 0.6],...
            'Callback',@name_Picture);
        
        h.Picture = uicontrol('Parent',h.lp,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.3 0.5 0.05 0.3],...
            'String',' 1 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',8);
        
        h.Picture_Minus = uicontrol('Parent',h.lp,...
            'Style' , 'togglebutton',...
            'Enable', 'on',...
            'Value', 0,...
            'FontName','Arial',...
            'CData',cdata.CDataMin,...
            'FontSize',10,...
            'FontWeight','normal',...
            'BackgroundColor',[0.9 0.9 0.9],...
            'Units','Normalized',...
            'Position', [0.35 0.65 0.025 0.15],...
            'Callback',@name_Picture);
        
        h.Picture_Plus = uicontrol('Parent',h.lp,...
            'Style' , 'togglebutton',...
            'Enable', 'on',...
            'Value', 0,...
            'FontName','Arial',...
            'CData',cdata.CDataPlus,...
            'FontSize',10,...
            'FontWeight','normal',...
            'BackgroundColor',[0.4 0.4 0.4],...
            'Units','Normalized',...
            'Position', [0.35 0.5 0.025 0.15],...
            'Callback',@name_Picture);
        
        
        % Save Values of the las Fits
        h.Save_values_scan = uicontrol('Parent',h.lp,...
            'Style','push',...
            'Units','normalized',...
            'Position',[0.38, 0.5, 0.08, 0.5],...
            'String','Save S',...
            'BackgroundColor',[0 0 0.9],...
            'FontSize',8,...
            'Callback',@Save_Scans_Values);
        
        % Load Select scans
        h.Scan_number_load = uicontrol('Parent',h.lp,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.46, 0.5, 0.04, 0.5],...
            'String',' [] ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',8);
        
        h.Load_values_scan = uicontrol('Parent',h.lp,...
            'Style','push',...
            'Units','normalized',...
            'Position',[0.50, 0.5, 0.06, 0.5],...
            'String','Load S',...
            'BackgroundColor',[0 0.9 0],...
            'FontSize',8,...
            'Callback',@Load_Scans_Values);
        
        % Compare two scans
        h.Compare_scan = uicontrol('Parent',h.lp,...
            'Style','push',...
            'Units','normalized',...
            'Position',[0.56, 0.7, 0.07, 0.3],...
            'String','Compare',...
            'BackgroundColor',[0.9 0.9 0],...
            'FontSize',8,...
            'Callback',@Compare_Scans_Values);
        h.help_Compare= uicontrol('Parent',h.lp,...
            'Style','push',...
            'Units','normalized',...
            'Position',[0.56 0.5 0.07 0.2],...
            'String','Help',...
            'BackgroundColor',[0.95 0 0.95],...
            'FontSize',6,...
            'Callback',@Help);        
       
        
        Str ={};
        Str{end+1} = '--';
        Str{end+1} = 'F1';
        Str{end+1} = 'F2';
        Str{end+1} = 'F3';
        Str{end+1} = 'F4';
        Str{end+1} = 'F5';
        Str{end+1} = 'F6';
        Str{end+1} = 'F7';
        Str{end+1} = 'FS';
        
        h.Sel_Pre_Print_I =  uicontrol('Parent',h.lp,...
            'Style' , 'popup',...
            'FontName','Helvetica',...
            'String',Str,...
            'FontSize',6,...
            'BackgroundColor',[1 1 1],...
            'Units','Normalized',...
            'Position', [0.83, 0.5, 0.04, 0.25],...
            'Callback',@DisplayCells);
        
        h.help_Print= uicontrol('Parent',h.lp,...
            'Style','push',...
            'Units','normalized',...
            'Position',[0.87 0.5 0.03 0.25],...
            'String','Help',...
            'BackgroundColor',[0.95 0 0.95],...
            'FontSize',6,...
            'Callback',@Help);
        
        h.Pre_Print_I = uicontrol('Parent',h.lp,...
            'Style' , 'togglebutton',...
            'Enable', 'on',...
            'Value', 0,...
            'FontName','Arial',...
            'String','Print',...
            'FontSize',8,...
            'FontWeight','bold',...
            'BackgroundColor',[0 0.5 0],...
            'Units','Normalized',...
            'Position', [0.83, 0.75, 0.07, 0.25],...
            'Callback',@Pre_print);
        
        
        
        
        h.Scan_2D = uicontrol('Parent',h.lp,...
            'Style' , 'Check',......
            'Enable','on',...
            'Value', 0,...
            'FontName','Helvetica',...
            'String','S_2D',...
            'FontWeight','bold',...
            'HorizontalAlignment','center',...
            'Units','Normalized',...
            'Callback',@Print_Chk,...
            'Position',[0.9, 0.75, 0.05, 0.25],...
            'BackgroundColor',[0.5 0.5 0.5],...
            'FontSize',6);
        
        h.Scan_Smooth_Print = uicontrol('Parent',h.lp,...
            'Style' , 'Check',......
            'Enable','on',...
            'Value', 0,...
            'FontName','Helvetica',...
            'String','S_S',...
            'FontWeight','bold',...
            'HorizontalAlignment','center',...
            'Units','Normalized',...
            'Callback',@Print_Chk,...
            'Position',[0.95, 0.75, 0.05, 0.25],...
            'BackgroundColor',[0.5 0.5 0.5],...
            'FontSize',6);
        
        h.Scan_2n1 = uicontrol('Parent',h.lp,...
            'Style' , 'Check',...
            'Enable','on',...
            'Value', 0,...
            'FontName','Helvetica',...
            'String','S_2n1',...
            'FontWeight','bold',...
            'HorizontalAlignment','center',...
            'Units','Normalized',...
            'Callback',@Print_Chk,...
            'Position',[0.9, 0.5, 0.06, 0.25],...
            'BackgroundColor',[0.5 0.5 0.5],...
            'FontSize',6);
        
        h.Picture_number_2n1 = uicontrol('Parent',h.lp,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.96, 0.5, 0.04, 0.25],...
            'String','X',...
            'BackgroundColor',[0.5 0.5 0.5],...
            'FontSize',6);

        set(h.Plot_Panel_call,'Value',0)
        end
    end

    function Plot_Panel_Print_call (source,eventadata)
        
        if get(h.Plot_Panel_call,'Value') == 1
        else
            close(h.plot_f1)
            close(h.plot_f2)
            close(h.plot_f3)
            close(h.plot_f4)
            close(h.plot_f5)
            close(h.plot_f6)
            close(h.plot_f7)
        end
        %% plot print
        h.plot_f1 = figure(d+101);
        set(h.plot_f1,'Name','SLS_Diamond_GUI_V.05_12_2016 Plot Panel F1',...
            'NumberTitle', 'Off',...
            'Visible','off',...
            'Units','normalized',...
            'Position', [1.51 0.5 0.4 0.4],...
            'Color',[0.8 0.8 0.8],...
            'Menubar','figure',...
            'KeyReleaseFcn',@Press);
        h.PlotS_Fig_plot_f1 = axes('Parent',h.plot_f1,'Units','normalized',...
            'Position',[0.1 0.1 0.8 0.8],...
            'box','on',...
            'LineWidth',0.5,...
            'fontsize',8,...
            'Color',[1 1 1],...
            'FontName','Helvetica',...
            'FontWeight','bold',...
            'Xlim',[-1 1]);
        title(h.PlotS_Fig_plot_f1,'F1: Integration Section')
        xlabel(h.PlotS_Fig_plot_f1, 'Position (um)')
        ylabel(h.PlotS_Fig_plot_f1,'Intensity (arb. units)')
        
        h.plot_f2 = figure(d+102);
        set(h.plot_f2,'Name','SLS_Diamond_GUI_V.05_12_2016 Plot PanelF2',...
            'NumberTitle', 'Off',...
            'Visible','off',...
            'Units','normalized',...
            'Position', [1.51 0.5 0.4 0.4],...
            'Color',[0.8 0.8 0.8],...
            'Menubar','figure',...
            'KeyReleaseFcn',@Press);
        h.PlotS_Fig_plot_f2 = axes('Parent',h.plot_f2,'Units','normalized',...
            'Position',[0.1 0.1 0.8 0.8],...
            'box','on',...
            'LineWidth',0.5,...
            'fontsize',8,...
            'Color',[1 1 1],...
            'FontName','Helvetica',...
            'FontWeight','bold',...
            'Xlim',[-1 1]);
        title(h.PlotS_Fig_plot_f2,'F2: Integration Section')
        xlabel(h.PlotS_Fig_plot_f2, 'Position (um)')
        ylabel(h.PlotS_Fig_plot_f2,'Intensity (arb. units)')
        
        h.plot_f3 = figure(d+103);
        set(h.plot_f3,'Name','SLS_Diamond_GUI_V.05_12_2016 Plot Panel F3',...
            'NumberTitle', 'Off',...
            'Visible','off',...
            'Units','normalized',...
            'Position', [1.51 0.5 0.4 0.4],...
            'Color',[0.8 0.8 0.8],...
            'Menubar','figure',...
            'KeyReleaseFcn',@Press);
        h.PlotS_Fig_plot_f3 = axes('Parent',h.plot_f3,'Units','normalized',...
            'Position',[0.1 0.1 0.8 0.8],...
            'box','on',...
            'LineWidth',0.5,...
            'fontsize',8,...
            'Color',[1 1 1],...
            'FontName','Helvetica',...
            'FontWeight','bold',...
            'Xlim',[-1 1]);
        title(h.PlotS_Fig_plot_f3,'F3: Integration Section')
        xlabel(h.PlotS_Fig_plot_f3, 'Position (um)')
        ylabel(h.PlotS_Fig_plot_f3,'Intensity (arb. units)')
        
        h.plot_f4 = figure(d+104);
        set(h.plot_f4,'Name','SLS_Diamond_GUI_V.05_12_2016 Plot Panel F4',...
            'NumberTitle', 'Off',...
            'Visible','off',...
            'Units','normalized',...
            'Position', [1.51 0.5 0.4 0.4],...
            'Color',[0.8 0.8 0.8],...
            'Menubar','figure',...
            'KeyReleaseFcn',@Press);
        h.PlotS_Fig_plot_f4 = axes('Parent',h.plot_f4,'Units','normalized',...
            'Position',[0.1 0.1 0.8 0.8],...
            'box','on',...
            'LineWidth',0.5,...
            'fontsize',8,...
            'Color',[1 1 1],...
            'FontName','Helvetica',...
            'FontWeight','bold',...
            'Xlim',[-1 1]);
        title(h.PlotS_Fig_plot_f4,'F4: Integration Section')
        xlabel(h.PlotS_Fig_plot_f4, 'Position (um)')
        ylabel(h.PlotS_Fig_plot_f4,'Intensity (arb. units)')
        
        h.plot_f5 = figure(d+105);
        set(h.plot_f5,'Name','SLS_Diamond_GUI_V.05_12_2016 Plot Panel F5',...
            'NumberTitle', 'Off',...
            'Visible','off',...
            'Units','normalized',...
            'Position', [1.51 0.5 0.4 0.4],...
            'Color',[0.8 0.8 0.8],...
            'Menubar','figure',...
            'KeyReleaseFcn',@Press);
        h.PlotS_Fig_plot_f5 = axes('Parent',h.plot_f5,'Units','normalized',...
            'Position',[0.1 0.1 0.8 0.8],...
            'box','on',...
            'LineWidth',0.5,...
            'fontsize',8,...
            'Color',[1 1 1],...
            'FontName','Helvetica',...
            'FontWeight','bold',...
            'Xlim',[-1 1]);
        title(h.PlotS_Fig_plot_f5,'F5: Integration Section')
        xlabel(h.PlotS_Fig_plot_f5, 'Position (um)')
        ylabel(h.PlotS_Fig_plot_f5,'Intensity (arb. units)')
        
        h.plot_f6 = figure(d+106);
        set(h.plot_f6,'Name','SLS_Diamond_GUI_V.05_12_2016 Plot Panel F6',...
            'NumberTitle', 'Off',...
            'Visible','off',...
            'Units','normalized',...
            'Position', [1.51 0.5 0.4 0.4],...
            'Color',[0.8 0.8 0.8],...
            'Menubar','figure',...
            'KeyReleaseFcn',@Press);
        h.PlotS_Fig_plot_f6 = axes('Parent',h.plot_f6,'Units','normalized',...
            'Position',[0.1 0.1 0.8 0.8],...
            'box','on',...
            'LineWidth',0.5,...
            'fontsize',8,...
            'Color',[1 1 1],...
            'FontName','Helvetica',...
            'FontWeight','bold',...
            'Xlim',[-1 1]);
        title(h.PlotS_Fig_plot_f6,'F6: Integration Section')
        xlabel(h.PlotS_Fig_plot_f6, 'Position (um)')
        ylabel(h.PlotS_Fig_plot_f6,'Intensity (arb. units)')
        
        h.plot_f7 = figure(d+107);
        set(h.plot_f7,'Name','SLS_Diamond_GUI_V.05_12_2016 Plot Panel F7',...
            'NumberTitle', 'Off',...
            'Visible','off',...
            'Units','normalized',...
            'Position', [1.51 0.5 0.4 0.4],...
            'Color',[0.8 0.8 0.8],...
            'Menubar','figure',...
            'KeyReleaseFcn',@Press);
        h.PlotS_Fig_plot_f7 = axes('Parent',h.plot_f7,'Units','normalized',...
            'Position',[0.1 0.1 0.8 0.8],...
            'box','on',...
            'LineWidth',0.5,...
            'fontsize',8,...
            'Color',[1 1 1],...
            'FontName','Helvetica',...
            'FontWeight','bold',...
            'Xlim',[-1 1]);
        title(h.PlotS_Fig_plot_f7,'F7: Integration Section')
        xlabel(h.PlotS_Fig_plot_f7, 'Position (um)')
        ylabel(h.PlotS_Fig_plot_f7,'Intensity (arb. units)')
        
    end

    function Plot_Sections(source,evendata)
    Plot_Panel_Print_call 
    
    
        set(h.Error_control,'String','Scan working','BackgroundColor',[0 0 1])
        
        child = get(h.PlotS_Result3_Fig,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.PlotRS_Fig,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.PlotS_Result_Fig,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.PlotS_Fig,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        axes(h.PlotS_Result3_Fig)
        legend('hide')
        
        child = get(h.PlotS_Result2_Fig,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.PlotS_Result4_Fig,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        
        child = get(h.PlotS_Fig_plot_f1,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.PlotS_Fig_plot_f2,'Children');
        for i=1:length(child)
            delete(child(i));
        end        
        
        child = get(h.PlotS_Fig_plot_f3,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.PlotS_Fig_plot_f4,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.PlotS_Fig_plot_f5,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.PlotS_Fig_plot_f6,'Children');
        for i=1:length(child)
            delete(child(i));
        end        

        
        
        axes(h.PlotS_Result4_Fig)
        legend('hide')
        
        
        
        
        if source == h.PlotSections
            clear all
            Fit_One_manually = h.Fit_One_Manual_Chk ;
            ImageNumbers = h.ImageNumbers;
            StripRanges = h.StripRanges;
            ColumnRanges = h.ColumnRange;
            factorrow = h.factorrow;
            ScanNumber = h.ScanNumber;
            h.Scan_number_save = ScanNumber;
            set(h.Scan_number_load,'String',ScanNumber);
            
            
            if get(h.Strip_scan_Extract_1,'Value') == 1
                StripIntensities1 = h.StripIntensities1;
            end
            if get(h.Strip_scan_Extract_2,'Value') == 1
                StripIntensities2= h.StripIntensities2;
            end
            if get(h.Strip_scan_Extract_3,'Value') == 1
                StripIntensities3= h.StripIntensities3;
            end
            if get(h.Strip_scan_Extract_4,'Value') == 1
                StripIntensities4= h.StripIntensities4;
            end
            
            I_max=h.max_I_value;
            I_min=h.min_I_value;
            if h.micro_Check == 1
                micro_val = h.micro_value;
            end
            
            Stop = 1;
            
            Delta_x_min = eval(get(h.Delta_x_min,'String'));
            Delta_x_max = eval(get(h.Delta_x_max,'String'));
            
            
            if h.Zoom_In_Act == 1
                size_StripMin = h.size_StripMin ;
                size_StripMax= h.size_StripMax;
                size_ColMin= h.size_ColMin;
                size_ColMax = h.size_ColMax;
            end
            
            
            
            
            %%
            directoryname_Images = sprintf('s%0.5d',ScanNumber);
            
            %%
            N_images = length(ImageNumbers)
            N_StripRanges = size(StripRanges,1);
            Strip_Extract= h.Strip_Extract;
            
            
            
            %%
            
            N_StripRanges =0;
            i_Strip_values = 0;
            t_Extract = 1;
            for i_Extract = 1:size(Strip_Extract,2)
                if Strip_Extract(1,i_Extract)==0
                else
                    N_StripRanges = N_StripRanges +1;
                    i_Strip_values(1,t_Extract) = Strip_Extract(1,i_Extract);
                    t_Extract = t_Extract+ 1;
                end
                
            end
            
            for i_Extract= 1:N_StripRanges
                
                i_Strip = i_Strip_values(1,i_Extract);
                
                if h.Stop_value == 1
                    Stop_value =0;
                    Stop = 0;
                    h.Stop_value =Stop_value;
                    break
                end
                Max_Pos_Manu = 0;
                
                if i_Strip == 1
                    StripIntensities = StripIntensities1;
                    set(h.Strip_scan,'Value',1)
                    set(h.Strip_scan1,'Value',0)
                    set(h.Strip_scan2,'Value',0)
                    set(h.Strip_scan3,'Value',0)
                elseif i_Strip == 2
                    StripIntensities = StripIntensities2;
                    set(h.Strip_scan,'Value',0)
                    set(h.Strip_scan1,'Value',1)
                    set(h.Strip_scan2,'Value',0)
                    set(h.Strip_scan3,'Value',0)
                elseif i_Strip == 3
                    StripIntensities = StripIntensities3;
                    set(h.Strip_scan,'Value',0)
                    set(h.Strip_scan1,'Value',0)
                    set(h.Strip_scan2,'Value',1)
                    set(h.Strip_scan3,'Value',0)
                elseif i_Strip == 4
                    StripIntensities = StripIntensities4;
                    set(h.Strip_scan,'Value',0)
                    set(h.Strip_scan1,'Value',0)
                    set(h.Strip_scan2,'Value',0)
                    set(h.Strip_scan3,'Value',1)
                end
                
                N_ColumnPixels = ColumnRanges(i_Strip,2)-ColumnRanges(i_Strip,1)+1  ;
                
                if i_Strip == 1
                    StripRanges_plot = linspace(StripRanges(1,1),StripRanges(1,2),(StripRanges(1,2)-StripRanges(1,1))/factorrow+1);
                    StripIntensities_mean1 = mean(squeeze(StripIntensities(:,:,1)),1);
                    Background1 = 0;
                elseif i_Strip == 2
                    StripRanges_plot = linspace(StripRanges(2,1),StripRanges(2,2),(StripRanges(2,2)-StripRanges(2,1))/factorrow+1);
                    StripIntensities_mean2 = mean(squeeze(StripIntensities(:,:,2)),1);
                    Background2 =0;
                elseif i_Strip == 3
                    StripRanges_plot = linspace(StripRanges(3,1),StripRanges(3,2),(StripRanges(3,2)-StripRanges(3,1))/factorrow+1);
                    StripIntensities_mean3 = mean(squeeze(StripIntensities(:,:,3)),1);
                    Background3 = 0;
                elseif i_Strip == 4
                    StripRanges_plot = linspace(StripRanges(4,1),StripRanges(4,2),(StripRanges(4,2)-StripRanges(4,1))/factorrow+1);
                    StripIntensities_mean4 = mean(squeeze(StripIntensities(:,:,4)),1);
                    Background4 = 0;
                end

                max_I = 0;
                
                axes(h.PlotS_Fig)
                hold off
                
                max_I_Intital = 0;
                for i_im = 1:N_images
                    ColumnRange = ColumnRanges(i_Strip,1):ColumnRanges(i_Strip,2);
                    StripInten= StripIntensities(i_im,:,i_Strip);
                    size(StripRanges_plot)
                    size(StripInten)
                    plot(StripRanges_plot,StripInten,'Parent', h.PlotS_Fig,'Color','b') ;
                    axes(h.PlotS_Fig_plot_f4)
                    plot(StripRanges_plot,StripInten,'Parent', h.PlotS_Fig_plot_f4,'Color','b') ;
                    hold on
                    axes(h.PlotS_Fig)
                    hold on
                    [max_I_image, index_max_image] = max(StripIntensities(i_im,:,i_Strip));
                    max_I = max(max_I,max_I_image);
                    if max_I >max_I_Intital 
                        max_I_Intital = max_I;
                    end
                    if i_Strip == 1
                        Save_Colum_Int1(1,:)=ColumnRange;
                        Save_Strip_Int1(1,:,i_im)=StripIntensities(i_im,:,i_Strip);
                    elseif i_Strip == 2
                        Save_Colum_Int2(1,:)=ColumnRange;
                        Save_Strip_Int2(1,:,i_im)=StripIntensities(i_im,:,i_Strip);
                    elseif i_Strip == 3
                        Save_Colum_Int3(1,:)=ColumnRange;
                        Save_Strip_Int3(1,:,i_im)=StripIntensities(i_im,:,i_Strip);
                    elseif i_Strip == 4
                        Save_Colum_Int4(1,:)=ColumnRange;
                        Save_Strip_Int4(1,:,i_im)=StripIntensities(i_im,:,i_Strip);
                    end
                end
                
                set(h.Name_Y_Max_Plot_F2,'String',max_I_Intital)
                
                axes(h.PlotS_Fig)
                hold on
                if i_Strip == 1
                    plot(StripRanges_plot,mean(squeeze(StripIntensities(:,:,i_Strip)),1),...
                        'Parent', h.PlotS_Fig,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','g');
                    axes(h.PlotS_Fig_plot_f4)
                    plot(StripRanges_plot,mean(squeeze(StripIntensities(:,:,i_Strip)),1),...
                        'Parent', h.PlotS_Fig_plot_f4,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','g');
                    Save_Strip_Int1(1,:,i_im)=mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                elseif i_Strip == 2
                    plot(StripRanges_plot,mean(squeeze(StripIntensities(:,:,i_Strip)),1),...
                        'Parent', h.PlotS_Fig,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','g');
                    axes(h.PlotS_Fig_plot_f4)
                    plot(StripRanges_plot,mean(squeeze(StripIntensities(:,:,i_Strip)),1),...
                        'Parent', h.PlotS_Fig_plot_f4,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','g');
                    Save_Strip_Int2(1,:,i_im)=mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                elseif i_Strip == 3
                    plot(StripRanges_plot,mean(squeeze(StripIntensities(:,:,i_Strip)),1),...
                        'Parent', h.PlotS_Fig,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','g');
                    axes(h.PlotS_Fig_plot_f4)
                    plot(StripRanges_plot,mean(squeeze(StripIntensities(:,:,i_Strip)),1),...
                        'Parent', h.PlotS_Fig_plot_f4,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','g');
                    Save_Strip_Int3(1,:,i_im)=mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                elseif i_Strip == 4
                    plot(StripRanges_plot,mean(squeeze(StripIntensities(:,:,i_Strip)),1),...
                        'Parent', h.PlotS_Fig,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','g');
                    axes(h.PlotS_Fig_plot_f4)
                    plot(StripRanges_plot,mean(squeeze(StripIntensities(:,:,i_Strip)),1),...
                        'Parent', h.PlotS_Fig_plot_f4,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','g');                    
                    Save_Strip_Int4(1,:,i_im)=mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                end
                axes(h.PlotS_Fig)
                title(sprintf('F1: Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig);
                xlim auto
                ylim auto                
                

                xlabel('Position (um)')

                ylabel('Intensity (arb units)')
                
                axes(h.PlotS_Fig_plot_f4)
                title(sprintf('F1: Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f4);
                xlim auto
                ylim auto                
                
                xlabel('Position (um)')
                ylabel('Intensity (arb units)')
                
                if i_Strip == 1
                    mean_Strip1(1,:) = mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                elseif i_Strip == 2
                    mean_Strip2(1,:) = mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                elseif i_Strip == 3
                    mean_Strip3(1,:) = mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                elseif i_Strip == 4
                    mean_Strip4(1,:) = mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                end
                
                h.i_im = i_im;
                h.Save_i_im =i_im;
                
                
                if h.micro_Check == 1
                    ColumnRange = ColumnRanges * micro_val;
                else
                    ColumnRange = ColumnRanges;
                end
                
                Picture_initial = eval(get(h.Size_ScanI, 'String'));
                n_im = 0;
                ImageNumbers = h.ImageNumbers;
                frame(size(ImageNumbers,2)) = struct('cdata',[],'colormap',[]);
                t_im =1;
                
                
                
                for i_im = 1:N_images
                    
                    %Plot the image
                    
                    axes(h.ExtractS_Fig)
                    Folder = get(h.Folder,'String');
                    
                    name_Folder = strcat(Folder,'/s%0.4d');
                    
                    File = get(h.File,'String');
                    
                    name_File = strcat(File,'_0%0.3d.tif');
                    name_File1 = strcat(File,'_0%0.3d.tiff');
                    name_File2 = strcat(File,'_%0.3d.tiff');
                    
                    Size_ScanI_Load = i_im + Picture_initial-1;
                    directoryname_Images = sprintf(name_Folder,ScanNumber);
                    directoryname_file = sprintf(name_File,Size_ScanI_Load);
                    directoryname_file1 = sprintf(name_File1,Size_ScanI_Load);
                    directoryname_file2 = sprintf(name_File2,Size_ScanI_Load);
                    
                    filename_Image = sprintf('%s/%s',directoryname_Images,directoryname_file);
                    filename_Image1 = sprintf('%s/%s',directoryname_Images,directoryname_file1);
                    filename_Image2 = sprintf('%s/%s',directoryname_Images,directoryname_file2);
                    
                    if (exist(filename_Image,'file') == 2) || (exist(filename_Image1,'file') == 2)|| (exist(filename_Image2,'file') == 2)
                        if (exist(filename_Image,'file') == 2)
                            andor_image = imread(filename_Image,'tif');
                            %andor_image = imread(filename_Image,'gif');
                            fprintf('Loading %s\n',filename_Image);
                            andor_image_ave = andor_image;
                            filename_Image = filename_Image;
                            
                        elseif (exist(filename_Image1,'file') == 2)
                            andor_image = imread(filename_Image1,'tif');
                            %andor_image = imread(filename_Image,'gif');
                            fprintf('Loading %s\n',filename_Image1);
                            andor_image_ave = andor_image;
                            filename_Image = filename_Image1;
                        elseif (exist(filename_Image2,'file') == 2)
                            andor_image = imread(filename_Image2,'tif');
                            %andor_image = imread(filename_Image,'gif');
                            fprintf('Loading %s\n',filename_Image2);
                            andor_image_ave = andor_image;
                            filename_Image = filename_Image2;
                        end
                        
                        n_im = n_im + 1;
                        
                        if get(h.Load_Noise_Scan_Check,'Value') == 1
                            ScanNumber_Noise = eval(get(h.Noise_Load,'String'));
                            
                            Noise_Load = get(h.Noise_Load_path,'String');
                            name_File_Noise = strcat(Noise_Load,'_0%0.3d.tif')   ;
                            
                            directoryname_file_Noise = sprintf(name_File_Noise,ScanNumber_Noise);
                            
                            filename_Image_Noise =  sprintf('%s/%s',directoryname_Images,directoryname_file_Noise);
                            
                            andor_image_Noise = imread(filename_Image_Noise,'tif');
                            andor_image =  andor_image - andor_image_Noise;
                        end
                        
                        
                        if h.Angle_rotation_val == 1
                            Angle_Horizontal= h.Angle_Horizontal;
                            andor_image = imrotate(andor_image,Angle_Horizontal,'bilinear','crop');
                            
                            Initial_ColMin = eval(get(h.Size_ColMin,'String'));
                            Initial_ColMax = eval(get(h.Size_ColMax,'String'));
                            Initial_StripMin = eval(get(h.Size_StripMin,'String'));
                            Initial_StripMax = eval(get(h.Size_StripMax,'String'));
                            
                            andor_image = imcrop(andor_image,[Initial_StripMin Initial_ColMin Initial_StripMax Initial_ColMax]);
                            
                            min_I = h.min_I_H_val;
                            max_I = h.max_I_H_val;
                        end
                        
                        %
                        %                     if (n_im == 1)
                        %                         andor_image_ave = andor_image;
                        %                     else
                        %                         andor_image_ave = andor_image_ave + andor_image;
                        %                     end
                        
                        
                        imagesc(andor_image,'Parent',h.ExtractS_Fig);
                        
                        
                        if h.Color_Map == 1
                            colormap winter
                        elseif h.Color_Map == 0
                            colormap gray
                        elseif h.Color_Map == 2
                            colormap hsv
                        end
                        
                        colorbar
                        min_Contrast_I = eval(get(h.min_Contrast_I,'String'));
                        max_Contrast_I = eval(get(h.max_Contrast_I,'String'));
                        
                        andor_image_ave = imadjust(andor_image,stretchlim(andor_image),[min_Contrast_I max_Contrast_I]);
                        Stretchlim = stretchlim(andor_image_ave);
                        Stretchlim_Min = num2str(Stretchlim(1,1));
                        Stretchlim_Max = num2str(Stretchlim(2,1));
                        h.Stretchlim = Stretchlim;
                        set(h.min_Contrast_I,'String',Stretchlim_Min);
                        set(h.max_Contrast_I,'String',Stretchlim_Max);
                        
                        if h.Smooth ==1
                            andor_image_ave = double(andor_image_ave);
                            andor_image_ave = sgolayfilt(andor_image_ave,3,41);
                        end
                        
                        imagesc(andor_image_ave,'Parent',h.ExtractS_Fig);
                        %                                        caxis([0 180])
                        colorbar
                        
                        
                        [Initial_ColMax,Initial_StripMax,c]=size(andor_image);
                        
                        axis ij equal tight
                        if h.Zoom_In_Act == 1
                            axis([size_StripMin size_StripMax size_ColMin size_ColMax ])
                        end
                        
                        
                        
                        title(sprintf('F7: scan%0.3d Image%0.3d',ScanNumber,Picture_initial+i_im-1));
                        
                        %         figure(FigNo+1);
                        %         plot(0,0);
                        %         xlim(ColumnRange)
                        
                        N_StripRanges =0;
                        i_Strip_values = 0;
                        t_Extract = 1;
                        for i_Extract = 1:size(Strip_Extract,2)
                            if Strip_Extract(1,i_Extract)==0
                            else
                                N_StripRanges = N_StripRanges +1;
                                i_Strip_values(1,t_Extract) = Strip_Extract(1,i_Extract);
                                t_Extract = t_Extract+ 1;
                            end
                            
                        end
                        
                        x_Strip_min = StripRanges(i_Strip,1);
                        x_Strip_max = StripRanges(i_Strip,2);
                        y_Strip_min = ColumnRanges(i_Strip,1);
                        y_Strip_max = ColumnRanges(i_Strip,2);
                        
                        
                        if i_Strip == 1
                            rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','r','LineWidth',1.5);
                        elseif i_Strip == 2
                            rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','y','LineWidth',1.5);
                        elseif i_Strip == 3
                            rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','m','LineWidth',1.5);
                        else
                            rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','w','LineWidth',1.5);
                        end
                    end
                    
                    if get(h.Save_video,'Value') == 1
                        frame(t_im) = getframe(h.ExtractS_Fig);
                    end
                    
                    
                    
                    
                    if h.Stop_value == 1
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 1 0])
                        pause(0.5)
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 0 0])
                        pause(0.5)
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 1 0])
                        pause(0.5)
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 0 0])
                        pause(0.5)
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 1 0])
                        pause(0.5)
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 0 0])
                        pause(1)
                        Stop = 0;
                        break
                    end
                    
                    if i_Strip ==1
                        Background = Background1;
                        
                    elseif i_Strip ==2
                        Background = Background2;
                    elseif i_Strip ==3
                        Background = Background3;
                    elseif i_Strip ==4
                        Background = Background4;
                    end
                    YMin = 0.9*Background;
                    
                    
                    [tonto,N_Strip] = size(squeeze(StripIntensities(i_im,:,i_Strip)));
                    ColumnRangesArray = linspace(ColumnRange(i_Strip,1),ColumnRange(i_Strip,2),N_Strip);
                    [~,N_pixel]=size(ColumnRangesArray);
                    
                    
                    
                    if h.Smooth == 1
                        
                        Intensities_Strip = squeeze(StripIntensities(i_im,:,i_Strip));
                        
                        Intensities_Strip_Smooth = sgolayfilt(Intensities_Strip,3,41);
                        if i_Strip == 1
                            mean_Smooth_Strip1(1,:,i_im) = Intensities_Strip_Smooth;
                        elseif i_Strip == 2
                            mean_Smooth_Strip2(1,:,i_im) = Intensities_Strip_Smooth;
                        elseif i_Strip == 3
                            mean_Smooth_Strip3(1,:,i_im) = Intensities_Strip_Smooth;
                        elseif i_Strip == 4
                            mean_Smooth_Strip4(1,:,i_im) = Intensities_Strip_Smooth;
                        end
                        
                    end
                    
                    
                    
                    
                    [max_I_image, index_max_image] = max(StripIntensities(i_im,:,i_Strip));
                    x_values = StripRanges_plot;
                    x_max = x_values(index_max_image);
                    max_I = max(max_I,max_I_image);
                    YMax = 1.05*max_I;
                    
                    if i_Strip == 1
                        Save_x_values1 (1,:) = x_values;
                    elseif i_Strip == 2
                        Save_x_values2 (1,:) = x_values;
                    elseif i_Strip == 3
                        Save_x_values3 (1,:) = x_values;
                    elseif i_Strip == 4
                        Save_x_values4 (1,:) = x_values;
                    end
                    
                    Val_Max_Pos_Manu =0;
                    
                    Picture_num = num2str(ImageNumbers(i_im));
                    set(h.Picture,'String',Picture_num)
                    for i_Max = 1:N_pixel
                        if  StripIntensities(i_im,i_Max,i_Strip)> Val_Max_Pos_Manu
                            Val_Max_Pos_Manu = StripIntensities(i_im,i_Max,i_Strip);
                            Max_Pos_Manu = StripRanges_plot(1,i_Max);
                        end
                    end
                    Max_Pos_Manu_array(1,i_im)= Max_Pos_Manu;
                    
                    if h.Smooth == 1
                        Val_Max_Pos_Manu =0;
                        for i_Max = 1:N_pixel
                            if   Intensities_Strip_Smooth(1,i_Max)> Val_Max_Pos_Manu
                                Val_Max_Pos_Manu = Intensities_Strip_Smooth(1,i_Max);
                                Max_Pos_Manu = StripRanges_plot(1,i_Max);
                            end
                        end
                        Max_Pos_Manu_array_Smooth(1,i_im)= Max_Pos_Manu;
                    end
                    
                    axes(h.PlotRS_Fig)
                    plot(StripRanges_plot,squeeze(StripIntensities(i_im,:,i_Strip)),'Parent', h.PlotRS_Fig,'LineWidth',2,'MarkerSize',2,'Color','b');
                    title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotRS_Fig);
                    hold on
                    BackgroundArray = Background*ones(1,N_Strip);
                    plot(StripRanges_plot,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotRS_Fig);
                                        
                    axes(h.PlotS_Fig_plot_f2)
                    plot(StripRanges_plot,squeeze(StripIntensities(i_im,:,i_Strip)),'Parent', h.PlotS_Fig_plot_f2,'LineWidth',2,'MarkerSize',2,'Color','b');
                    title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f2);
                    hold on                    
                    plot(StripRanges_plot,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Fig_plot_f2);
                    
                    axes(h.PlotRS_Fig)
                    YMax_plot = eval(get(h.Name_Y_Max_Plot_F2,'String'));
                    YMin_plot = eval(get(h.Name_Y_Min_Plot_F2,'String'));
                    
                    xlabel('Position (um)')
                   
                    ylabel('Intensity (arb units)')
                    
                    set(h.PlotRS_Fig,'Ylim',[YMin_plot YMax_plot]);
                    title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotRS_Fig);
                    
                    
                    axes(h.PlotS_Result2_Fig)
                    
                    if h.Smooth ==1
                        for i_Diff = 1:size(StripRanges_plot,2)-1
                            ColumnRangesArray_Diff(1,i_Diff) = StripRanges_plot(1,i_Diff);
                        end
                        Intensities_Strip_Smooth_Diff = diff(Intensities_Strip_Smooth);
                        plot(ColumnRangesArray_Diff,Intensities_Strip_Smooth_Diff,'Parent', h.PlotS_Result2_Fig,'LineWidth',2,'MarkerSize',2,'Color','c');
                        hold off
                        title(sprintf('F4: Smooth Image Strip Diff %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Result2_Fig);
                        axes(h.PlotS_Fig_plot_f5)
                        plot(ColumnRangesArray_Diff,Intensities_Strip_Smooth_Diff,'Parent', h.PlotS_Fig_plot_f5,'LineWidth',2,'MarkerSize',2,'Color','c');                        
                        hold off
                        title(sprintf('F4: Smooth Image Strip Diff %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f5);                        
                    else
                        size(StripRanges_plot,2);
                        for i_Diff = 1:size(StripRanges_plot,2)-1
                            ColumnRangesArray_Diff(1,i_Diff) = StripRanges_plot(1,i_Diff);
                        end
                        size(ColumnRangesArray_Diff);;
                        Intensities_Strip_Diff = diff(squeeze(StripIntensities(i_im,:,i_Strip)));
                        plot(ColumnRangesArray_Diff,Intensities_Strip_Diff,'Parent', h.PlotS_Result2_Fig,'LineWidth',2,'MarkerSize',2,'Color','c');
                        hold off
                        title(sprintf('F4: Smooth Image Strip Diff %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Result2_Fig);
                        axes(h.PlotS_Fig_plot_f5)
                        plot(ColumnRangesArray_Diff,Intensities_Strip_Diff,'Parent', h.PlotS_Fig_plot_f5,'LineWidth',2,'MarkerSize',2,'Color','c');
                        hold off
                        title(sprintf('F4: Smooth Image Strip Diff %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f5);
                    end
                    axes(h.PlotRS_Fig)
                    hold off
                    
                    
                    if h.Smooth == 1
                        axes(h.PlotS_Result_Fig)
                        plot(StripRanges_plot,Intensities_Strip_Smooth,'Parent', h.PlotS_Result_Fig,'LineWidth',2,'MarkerSize',2,'Color','c');
                        hold on
                        plot(x_values,feval(FittedFunction_Smooth,x_values),'Parent', h.PlotS_Result_Fig,'Color','g','LineStyle',':');
                        axis([400,1800,YMin, YMax])
                        title(sprintf('F3:Smooth Image Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Result_Fig);
                        
                        axes(h.PlotS_Fig_plot_f3)                        
                        plot(StripRanges_plot,Intensities_Strip_Smooth,'Parent', h.PlotS_Fig_plot_f3,'LineWidth',2,'MarkerSize',2,'Color','c');
                        hold on
                        plot(x_values,feval(FittedFunction_Smooth,x_values),'Parent', h.PlotS_Fig_plot_f3,'Color','g','LineStyle',':');
                        axis([400,1800,YMin, YMax])
                        title(sprintf('F3:Smooth Image Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f3);
                        
                        axes(h.PlotS_Result_Fig)
                        hold off
                        set(h.PlotS_Result_Fig,'Ylim',[YMin YMax]);
                        xlabel('Position (um)')
                        
                        ylabel('Intensity (arb units)')
                        
                        
                    end
                    pause(0.1)
                    
                    
                    time_pause = eval(get(h.time_pause,'String'));
                    if h.Fit_One_Manual_Chk == 1
                        pause(time_pause)
                    end
                    
                    
                    
                    
                    n_im = n_im + 1;
                    
                    t_pasue = 0;
                    
                    if h.Pause == 1
                        i_pause =0;
                        if h.Fit_One_Manual_Chk == 1
                            if h.Save_Manuel == 1
                                t_pasue = 1;
                            end
                            while h.Pause == 1
                                pause(1)
                                i_pause = i_pause +1;
                                if i_pause == 300
                                    h.Pause=0;
                                    set(h.Name_Pause_I_S, 'Value',0)
                                    set(h.Name_Pause, 'Value',0)
                                end
                            end
                            x_max = eval(get(h.x_max_fit,'String'));
                            y_max = eval(get(h.y_max_fit,'String'));
                            x_left = eval(get(h.x_left_fit,'String'));
                            x_right = eval(get(h.x_right_fit,'String'));
                            InitialWidth_pix = x_right-x_left;
                            
                        else
                            while h.Pause == 1
                                pause(1)
                                i_pause = i_pause +1;
                                if i_pause == 120
                                    h.Pause=0;
                                    set(h.Name_Pause_I_S, 'Value',0)
                                    set(h.Name_Pause, 'Value',0)
                                end
                            end
                            
                        end
                    end
                    
                    if t_pasue == 1
                        
                        StartPoints = [y_max-Background, x_max, InitialWidth_pix, Background];
                        
                        [FittedFunction,FitQuality] = fit(x_values',squeeze(StripIntensities(i_im,:,i_Strip))',GaussFunction,'Start', StartPoints);
                        if h.Smooth == 1
                            [FittedFunction_Smooth,FitQuality_Smooth] = fit(x_values',Intensities_Strip_Smooth',GaussFunction,'Start', StartPoints);
                            
                            
                            FittedCoefficients_Smooth = coeffvalues(FittedFunction_Smooth);
                            
                            
                            if (FitQuality_Smooth.rsquare >= 0.1)
                                FitValid_Smooth(i_im) = 1;
                                MaxPos_Smooth(i_im) = FittedCoefficients_Smooth(2);
                                Widths_Smooth(i_im) = FittedCoefficients_Smooth(3);
                                Heights_Smooth(i_im) = FittedCoefficients_Smooth(1);
                                Background_part_Smooth(i_im)= FittedCoefficients_Smooth(4);
                                
                                RSquare_Smooth(1,i_im) = FitQuality_Smooth.rsquare;
                            else
                                
                                FitValid_Smooth(i_im) = 0;
                                MaxPos_Smooth(i_im) = 0;
                                Widths_Smooth(i_im) = 0;
                                Heights_Smooth(i_im) = 0;
                                %Background_part_Smooth(i_im)= FittedCoefficients(4);
                                Background_part_Smooth(i_im)= 0;
                                
                                RSquare_Smooth(1,i_im) = 0;
                            end
                            max_I_bef_Smooth = FittedCoefficients_Smooth(1)+Background;
                            x_max_bef_Smooth = FittedCoefficients_Smooth(2);
                            InitialWidth_pix_bef_Smooth =FittedCoefficients_Smooth(3);
                            Background_bef_Smooth = FittedCoefficients_Smooth(4);
                            
                        end
                        
                        
                        FittedCoefficients = coeffvalues(FittedFunction);
                        if (FitQuality.rsquare >= rsquare_min)
                            FitValid(i_im) = 1;
                            MaxPos(i_im) = FittedCoefficients(2);
                            Widths(i_im) = FittedCoefficients(3);
                            Heights(i_im) = FittedCoefficients(1);
                            Background_part(i_im)= FittedCoefficients(4);
                            MaxPosStr = num2str(MaxPos(i_im));
                            set(h.x_max_Picture_1,'String',MaxPosStr);
                            
                            RSquare(1,i_im) = FitQuality.rsquare;
                        end
                        max_I_bef = FittedCoefficients(1)+Background;
                        x_max_bef = FittedCoefficients(2);
                        InitialWidth_pix_bef =FittedCoefficients(3);
                        Background_bef = FittedCoefficients(4);
                        
                        
                        axes(h.PlotRS_Fig)
                        plot(ColumnRangesArray,squeeze(StripIntensities(i_im,:,i_Strip)),'Parent', h.PlotRS_Fig,'LineWidth',2,'MarkerSize',2,'Color','b');
                        title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotRS_Fig);
                        hold on
                        BackgroundArray = Background*ones(1,N_Strip);
                        plot(ColumnRangesArray,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotRS_Fig);
                        plot(x_values,feval(FittedFunction,x_values),'Parent', h.PlotRS_Fig,'Color','r','LineStyle',':');
                        
                        axes(h.PlotS_Fig_plot_f2)
                        plot(ColumnRangesArray,squeeze(StripIntensities(i_im,:,i_Strip)),'Parent', h.PlotS_Fig_plot_f2,'LineWidth',2,'MarkerSize',2,'Color','b');
                        title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f2);
                        hold on                        
                        plot(ColumnRangesArray,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Fig_plot_f2);
                        plot(x_values,feval(FittedFunction,x_values),'Parent', h.PlotS_Fig_plot_f2,'Color','r','LineStyle',':');
                        
                        axes(h.PlotRS_Fig)
                        set(h.PlotRS_Fig,'Ylim',[YMin YMax]);
                        xlabel('Position (um)')
                        
                        ylabel('Intensity (arb units)')
                        set(h.PlotRS_Fig,'Ylim',[YMin YMax]);
                        title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotRS_Fig);
                        
                        axes(h.PlotRS_Fig)
                        hold off
                        
                        
                        
                        if h.Smooth == 1
                            axes(h.PlotS_Result_Fig)
                            plot(ColumnRangesArray,Intensities_Strip_Smooth,'Parent', h.PlotS_Result_Fig,'LineWidth',2,'MarkerSize',2,'Color','c');
                            hold on
                            plot(x_values,feval(FittedFunction_Smooth,x_values),'Parent', h.PlotS_Result_Fig,'Color','g','LineStyle',':');
                            axis([400,1800,YMin, YMax])
                            title(sprintf('F3:Smooth Image Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Result_Fig);
                            
                            axes(h.PlotS_Fig_plot_f3)
                            plot(ColumnRangesArray,Intensities_Strip_Smooth,'Parent', h.PlotS_Fig_plot_f3,'LineWidth',2,'MarkerSize',2,'Color','c');
                            hold on
                            plot(x_values,feval(FittedFunction_Smooth,x_values),'Parent', h.PlotS_Fig_plot_f3,'Color','g','LineStyle',':');
                            axis([400,1800,YMin, YMax])
                            title(sprintf('F3:Smooth Image Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f3);
                            
                            axes(h.PlotS_Result_Fig)
                            hold off
                            set(h.PlotS_Result_Fig,'Ylim',[YMin YMax]);
                            xlabel('Position (um)')
                            
                            ylabel('Intensity (arb units)')
                            
                            
                        end
                        
                    end
                    
                    if get(h.Save_video,'Value') == 1
                        frame_Strip(t_im) = getframe(h.PlotRS_Fig);
                        if h.Smooth == 1
                            frame_Strip_Smooth(t_im) = getframe(h.PlotS_Result_Fig);
                        end
                    end
                    
                    
                    
                    
                    
                    
                    pause(0.1)
                    t_im = t_im+1;
                    if h.Smooth == 1
                        Area_Smooth(1,i_im) = sum(Intensities_Strip_Smooth -  Background*ones(1,size(Intensities_Strip_Smooth,2)));
                    end
                end
                
                
                
                if Stop == 1
                    
                    if h.Smooth == 0
                        axes(h.PlotS_Result_Fig)
                        if i_Strip ==1
                            plot(ColumnRangesArray,StripIntensities_mean1,'Parent',h.PlotS_Result_Fig,'Color','r','LineWidth',2);
                            BackgroundArray = Background1*ones(1,N_Strip);
                            hold on
                            plot(ColumnRangesArray,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Result_Fig);
                        elseif i_Strip ==2
                            plot(ColumnRangesArray,StripIntensities_mean2,'Parent',h.PlotS_Result_Fig,'Color','r','LineWidth',2);
                            BackgroundArray = Background2*ones(1,N_Strip);
                            hold on
                            plot(ColumnRangesArray,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Result_Fig);
                        elseif i_Strip ==3
                            plot(ColumnRangesArray,StripIntensities_mean3,'Parent',h.PlotS_Result_Fig,'Color','r','LineWidth',2);
                            BackgroundArray = Background3*ones(1,N_Strip);
                            hold on
                            plot(ColumnRangesArray,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Result_Fig);
                        elseif i_Strip ==4
                            plot(ColumnRangesArray,StripIntensities_mean4,'Parent',h.PlotS_Result_Fig,'Color','r','LineWidth',2);
                            BackgroundArray = Background4*ones(1,N_Strip);
                            hold on
                            plot(ColumnRangesArray,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Result_Fig);
                            
                        end
                        hold off
                        
                        title(sprintf('F3: Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Result_Fig);
                        
                        if h.micro_Check ==1
                            xlabel('Position (um)')
                        else
                            xlabel('Position (um)')
                        end
                        ylabel('Intensity (arb units)')
                        axes(h.PlotS_Fig_plot_f3)
                        
                        if i_Strip ==1
                            plot(ColumnRangesArray,StripIntensities_mean1,'Parent',h.PlotS_Fig_plot_f3,'Color','r','LineWidth',2);                            
                            hold on
                            plot(ColumnRangesArray,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Fig_plot_f3);
                        elseif i_Strip ==2
                            plot(ColumnRangesArray,StripIntensities_mean2,'Parent',h.PlotS_Fig_plot_f3,'Color','r','LineWidth',2);
                            hold on
                            plot(ColumnRangesArray,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Fig_plot_f3);
                        elseif i_Strip ==3
                            plot(ColumnRangesArray,StripIntensities_mean3,'Parent',h.PlotS_Fig_plot_f3,'Color','r','LineWidth',2);                            
                            hold on
                            plot(ColumnRangesArray,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Fig_plot_f3);
                        elseif i_Strip ==4
                            plot(ColumnRangesArray,StripIntensities_mean4,'Parent',h.PlotS_Fig_plot_f3,'Color','r','LineWidth',2);                            
                            hold on
                            plot(ColumnRangesArray,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Fig_plot_f3);
                            
                        end
                        hold off
                        
                        title(sprintf('F3: Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f3);
                        
                        if h.micro_Check ==1
                            xlabel('Position (um)')
                        else
                            xlabel('Position (um)')
                        end
                        ylabel('Intensity (arb units)')
                        axes(h.PlotS_Result_Fig)
                    end
                    Save_Background(i_Strip,1) = Background;
                    
                    StripIntensities_mean_pinhole1 = zeros(1,size(ColumnRangesArray,2));
                    StripIntensities_mean_pinhole2 = zeros(1,size(ColumnRangesArray,2));
                    StripIntensities_mean_pinhole3 = zeros(1,size(ColumnRangesArray,2));
                    StripIntensities_mean_pinhole4 = zeros(1,size(ColumnRangesArray,2));
                    
                    for i_Column = 1: size(ColumnRangesArray,2)                        
                        if i_Strip ==1
                            for i_pinhole = i_Column: size(ColumnRangesArray,2)                        
                                StripIntensities_mean_pinhole1(1,i_Column) =StripIntensities_mean_pinhole1(1,i_Column)+ StripIntensities_mean1(1,size(ColumnRangesArray,2)-i_pinhole+1)-Background;
                            end                            
                        elseif i_Strip ==2
                            for i_pinhole = i_Column: size(ColumnRangesArray,2)                        
                                StripIntensities_mean_pinhole2(1,i_Column) =StripIntensities_mean_pinhole2(1,i_Column)+ StripIntensities_mean2(1,size(ColumnRangesArray,2)-i_pinhole+1)-Background;
                            end
                    elseif i_Strip ==3
                        for i_pinhole = i_Column: size(ColumnRangesArray,2)                        
                                StripIntensities_mean_pinhole3(1,i_Column) =StripIntensities_mean_pinhole3(1,i_Column)+ StripIntensities_mean3(1,size(ColumnRangesArray,2)-i_pinhole+1)-Background;
                            end
                    elseif i_Strip ==4
                        for i_pinhole = i_Column: size(ColumnRangesArray,2) 
                                StripIntensities_mean_pinhole4(1,i_Column) =StripIntensities_mean_pinhole4(1,i_Column)+ StripIntensities_mean4(1,size(ColumnRangesArray,2)-i_pinhole+1)-Background;
                            end
                        end
                    end
                    
                    for i_normal = 1:  size(ColumnRangesArray,2)
                        ColumnRangesArray_n(1,size(ColumnRangesArray,2)-i_normal+1) = ColumnRangesArray (1,i_normal);
                    end
                    ColumnRangesArray_n = ColumnRangesArray_n-ColumnRangesArray_n(1,1);
                    %Plot
                    if i_Strip ==1
                        axes(h.PlotS_Result3_Fig)
                        plot(ColumnRangesArray_n,StripIntensities_mean_pinhole1,'Parent',h.PlotS_Result3_Fig,'Color','r','LineWidth',2);
                        BackgroundArray = Background1*ones(1,N_Strip);
                        hold on
                        plot(ColumnRangesArray_n,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Result3_Fig);
                        
                        axes(h.PlotS_Fig_plot_f1)                        
                        plot(ColumnRangesArray_n,StripIntensities_mean_pinhole1,'Parent',h.PlotS_Fig_plot_f1,'Color','r','LineWidth',2);                        
                        hold on
                        plot(ColumnRangesArray_n,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Fig_plot_f1);
                    elseif i_Strip ==2
                        axes(h.PlotS_Result3_Fig)
                        plot(ColumnRangesArray_n,StripIntensities_mean_pinhole2,'Parent',h.PlotS_Result3_Fig,'Color','r','LineWidth',2);
                        BackgroundArray = Background2*ones(1,N_Strip);
                        hold on
                        plot(ColumnRangesArray_n,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Result3_Fig);
                        
                        axes(h.PlotS_Fig_plot_f1)                                                
                        plot(ColumnRangesArray_n,StripIntensities_mean_pinhole2,'Parent',h.PlotS_Fig_plot_f1,'Color','r','LineWidth',2);                        
                        hold on
                        plot(ColumnRangesArray_n,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Fig_plot_f1);
                    elseif i_Strip ==3
                        axes(h.PlotS_Result3_Fig)
                        plot(ColumnRangesArray_n,StripIntensities_mean_pinhole3,'Parent',h.PlotS_Result3_Fig,'Color','r','LineWidth',2);
                        BackgroundArray = Background3*ones(1,N_Strip);
                        hold on
                        plot(ColumnRangesArray_n,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Result3_Fig);
                        
                        axes(h.PlotS_Fig_plot_f1)   
                        plot(ColumnRangesArray_n,StripIntensities_mean_pinhole3,'Parent',h.PlotS_Fig_plot_f1,'Color','r','LineWidth',2);                        
                        hold on
                        plot(ColumnRangesArray_n,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Fig_plot_f1);                        
                    elseif i_Strip ==4
                        axes(h.PlotS_Result3_Fig)
                        plot(ColumnRangesArray_n,StripIntensities_mean_pinhole4,'Parent',h.PlotS_Result3_Fig,'Color','r','LineWidth',2);
                        BackgroundArray = Background4*ones(1,N_Strip);
                        hold on
                        plot(ColumnRangesArray_n,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Result3_Fig);
                        
                        axes(h.PlotS_Fig_plot_f1)                           
                        plot(ColumnRangesArray_n,StripIntensities_mean_pinhole4,'Parent',h.PlotS_Fig_plot_f1,'Color','r','LineWidth',2);                        
                        hold on
                        plot(ColumnRangesArray_n,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Fig_plot_f1);
                    end
                    axes(h.PlotS_Result3_Fig)
                    title('F5: Simulation Pinhole Energy Scan','Parent',h.PlotS_Result3_Fig);                    
                    if h.micro_Check ==1
                        xlabel('Position (um)')
                    else
                        xlabel('Position (um)')
                    end
                    axes(h.PlotS_Fig_plot_f1)
                    title('F5: Simulation Pinhole Energy Scan','Parent',h.PlotS_Fig_plot_f1);                    
                    if h.micro_Check ==1
                        xlabel('Position (um)')
                    else
                        xlabel('Position (um)')
                    end
                    
                    
                end
                
            end
            
            
            

        end
    end

%% Analysis
    function Smooth_Chk(source,eventdata)
        
        if source == h.name_Smooth
            Smooth = get(h.name_Smooth, 'Value');
            if Smooth == 1
                h.Smooth = Smooth;
                set(h.name_Smooth, 'Value', 1)
            elseif Smooth == 0
                h.Smooth = Smooth;
                set(h.name_Smooth, 'Value', 0)
            end
        end
    end

    function Fit_One_Manually_Chk (source, eventdata)
        if source == h.Fit_One_Manually
            Fit_One_manually = get(h.Fit_One_Manually,'Value');
            if Fit_One_manually == 1
                h.Fit_One_Manual_Chk = Fit_One_manually;
                set(h.Fit_One_Manually,'Value',1)
            else
                h.Fit_One_Manual_Chk = Fit_One_manually;
                set(h.Fit_One_Manually,'Value',0)
            end
        end
        if source == h.Save_manual_Fit
            set(h.Save_manual_Fit,'Value',0)
            h.Pause = 0;
            h.Save_Manuel = 1;
            set(h.Name_Pause_I_S, 'Value',0)
            set(h.Name_Pause, 'Value',0)
        end
        
    end

% Fitting Panel

    function Fit_Panel_call(source,eventdata)
        

        %% -- Panel Fit
        if source == h.Fit_Panel_call
            
            set(h.Fit_Panel_call , 'Value',0)
            
        h.lp_fit = figure(d+10);
        name_Versionfp = sprintf('%s Fitting Panel',name_Version);
        set(h.lp_fit,'Name',name_Versionfp,...
            'NumberTitle', 'Off',...
            'Units','normalized',...
            'Position', [0. 0.05 0.5 0.32],...
            'Color',[0.8 0.8 0.8],...
            'Menubar','none','KeyReleaseFcn',@Press);
        

        
        h.lp_fit_MG =  uipanel('Parent',h.lp_fit,...
            'Units','Normalized',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'Position',[0. 0.01 1 1],...
            'BorderType','beveledout',...
            'Visible','On');
        
        h.name_lp_fit = uicontrol('Parent',h.lp_fit,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0. 0.95 0.1 0.05],...
            'String','Fitting Panel',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',10);
        
        h.help_Fit_Sections= uicontrol('Parent',h.lp_fit,...
            'Style','push',...
            'Units','normalized',...
            'Position',[0. 0.9 0.1 0.05],...
            'String','Help Fitting',...
            'BackgroundColor',[0.95 0 0.95],...
            'FontSize',6,...
            'Callback',@Help);
        %Defines the number of points use for define de Background in the fittings
        h.name_Delta = uicontrol('Parent',h.lp_fit,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.1 0.95 0.2 0.05],...
            'String','Background',...
            'FontWeight','bold',...
            'BackgroundColor',[0.4 0.4 0.4],...
            'FontSize',8);
        
        h.name_Delta_x_max = uicontrol('Parent',h.lp_fit,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.1 0.9 0.05 0.05],...
            'String','Left',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',8);
        h.Delta_x_min = uicontrol('Parent',h.lp_fit,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.15 0.9 0.05 0.05],...
            'BackgroundColor',[0.7 0.7 0.7],...
            'String','10',...
            'FontSize',8);
        h.name_Delta_x_max = uicontrol('Parent',h.lp_fit,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.2 0.9 0.05 0.05],...
            'String','Right',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',8);
        h.Delta_x_max = uicontrol('Parent',h.lp_fit,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.25 0.9 0.05 0.05],...
            'BackgroundColor',[0.7 0.7 0.7],...
            'String','10',...
            'FontSize',8);
        
         h.Name_Plot_YLimn = uicontrol('Parent',h.lp_fit,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.3 0.95 0.2 0.05],...
            'String','Plot Limits',...
            'BackgroundColor',[0.4 0.4 0.4],...
            'FontSize',8);
        h.Name_Y_Max_Plot_F2 = uicontrol('Parent',h.lp_fit,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.30 0.9 0.05 0.05],...
            'String','Y Max',...
            'BackgroundColor',[0.45 0.45 0.45],...
            'FontSize',8);
        h.Name_Y_Max_Plot_F2 =  uicontrol('Parent',h.lp_fit,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.35 0.9 0.05 0.05],...
            'String','0.5',...
            'FontSize',8);
        h.Name_Y_Min_Plot_F2 = uicontrol('Parent',h.lp_fit,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.4 0.9 0.05 0.05],...
            'String','Y Min',...
            'BackgroundColor',[0.45 0.45 0.45],...
            'FontSize',8);
        h.Name_Y_Min_Plot_F2 =  uicontrol('Parent',h.lp_fit,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.45 0.9 0.05 0.05],...
            'String','-0.01',...
            'FontSize',8);        
        
        
        h.PlotSections= uicontrol('Parent',h.lp_fit,...
            'Style','push',...
            'Units','normalized',...
            'Position',[0.51 0.9 0.14 0.1],...
            'String','Plot Sections',...
            'BackgroundColor',[0 1 1],...
            'FontSize',10,...
            'FontWeight','bold',...
            'Callback',@Plot_Sections);
        
        % Strip Fitting
        h.name_Strip_Scan = uicontrol('Parent',h.lp_fit,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.65 0.95 0.11 0.05],...
            'String','Strip to Fit',...
            'BackgroundColor',[0.4 0.4 0.4],...
            'FontSize',10);
        
        h.Strip_scan_all = uicontrol('Parent',h.lp_fit,...
            'Style' , 'Check',......
            'Enable','on',...
            'Value', 0,...
            'FontName','Helvetica',...
            'String','All',...
            'FontWeight','bold',...
            'HorizontalAlignment','center',...
            'Units','Normalized',...
            'Callback',@Strip_Chk,...
            'Position',[0.76 0.95 0.05 0.05],...
            'BackgroundColor',[0.4 0.4 0.4],...
            'FontSize',8);
        h.Strip_scan = uicontrol('Parent',h.lp_fit,...
            'Style' , 'Check',......
            'Enable','on',...
            'Value', 1,...
            'FontName','Helvetica',...
            'String',' 1',...
            'FontWeight','bold',...
            'HorizontalAlignment','center',...
            'Units','Normalized',...
            'Callback',@Strip_Chk,...
            'Position',[0.65 0.9 0.04 0.05],...
            'BackgroundColor',[0.5 0.5 0.5],...
            'FontSize',6);
        h.Strip_scan1 = uicontrol('Parent',h.lp_fit,...
            'Style' , 'Check',...
            'Enable','on',...
            'Value', 0,...
            'FontName','Helvetica',...
            'String',' 2',...
            'FontWeight','bold',...
            'HorizontalAlignment','center',...
            'Units','Normalized',...
            'Callback',@Strip_Chk,...
            'Position',[0.65+0.04 0.9 0.04 0.05],...
            'BackgroundColor',[0.5 0.5 0.5],...
            'FontSize',6);        
        h.Strip_scan2 = uicontrol('Parent',h.lp_fit,...
            'Style' , 'Check',...
            'Enable','on',...
            'Value', 0,...
            'FontName','Helvetica',...
            'String',' 3',...
            'FontWeight','bold',...
            'HorizontalAlignment','center',...
            'Units','Normalized',...
            'Callback',@Strip_Chk,...
            'Position',[0.65+0.08 0.9 0.04 0.05],...
            'BackgroundColor',[0.5 0.5 0.5],...
            'FontSize',6);        
        h.Strip_scan3 = uicontrol('Parent',h.lp_fit,...
            'Style' , 'Check',...
            'Enable','on',...
            'Value', 0,...
            'FontName','Helvetica',...
            'String',' 4',...
            'FontWeight','bold',...
            'HorizontalAlignment','center',...
            'Units','Normalized',...
            'Callback',@Strip_Chk,...
            'Position',[0.65+0.12 0.9 0.04 0.05],...
            'BackgroundColor',[0.5 0.5 0.5],...
            'FontSize',6);
        
        
        h.Gaussian_Dist_Check = uicontrol('Parent',h.lp_fit,...
            'Style' , 'Check',...
            'Enable','on',...
            'Value', 1,...
            'FontName','Helvetica',...
            'String','Gaussian distribution',...
            'FontWeight','bold',...
            'HorizontalAlignment','center',...
            'Units','Normalized',...
            'Callback',@Peak_Chk,...
            'Position',[0.65+0.18 0.95 0.15 0.05],...
            'BackgroundColor',[0.5 0.5 0.5],...
            'FontSize',6);
        h.Lorentzian_Dist_Check = uicontrol('Parent',h.lp_fit,...
            'Style' , 'Check',...
            'Enable','on',...
            'Value', 0,...
            'FontName','Helvetica',...
            'String','Cauchy distribution',...
            'FontWeight','bold',...
            'HorizontalAlignment','center',...
            'Units','Normalized',...
            'Callback',@Peak_Chk,...
            'Position',[0.65+0.18 0.9 0.15 0.05],...
            'BackgroundColor',[0.5 0.5 0.5],...
            'FontSize',6);
        
%% fit one Gaussian
        h.name_Gaussian = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0. 0.73 1 0.15],...
            'FontWeight','bold',...
            'BackgroundColor',[0.45 0.45 0.45],...
            'FontSize',8);
        
        h.name_Gaussian = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0. 0.83 0.2 0.05],...
            'String','One Peak fit:',...
            'FontWeight','bold',...
            'BackgroundColor',[0.4 0.4 0.4],...
            'FontSize',8);
        
        h.PlotSections_1G= uicontrol('Parent',h.lp_fit_MG,...
            'Style','push',...
            'Units','normalized',...
            'Position',[0.2 0.83 0.3 0.05],...
            'String','Fit One Peak',...
            'BackgroundColor',[1 1 0],...
            'FontSize',10,...
            'FontWeight','bold',...
            'Callback',@Plot_Sections_1G);
        
        h.name_I_Maxima_Show =  uicontrol('Parent',h.lp_fit_MG,...
            'Style' , 'text',...
            'Enable', 'on',...
            'Value', 0,...
            'FontName','Arial',...
            'String','Max intensity',...
            'FontSize',8,...
            'FontWeight','normal',...
            'BackgroundColor',[0.7 0.7 0.7],...
            'Units','Normalized',...
            'Position',[0.2 0.78 0.1 0.05]);
        
        h.I_Maxima_Show = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Enable','on',...
            'Position',[0.3 0.78 0.1 0.05],...
            'String',' -- ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',8);
        
        h.name_x_Maxima_Show =  uicontrol('Parent',h.lp_fit_MG,...
            'Style' , 'text',...
            'Enable', 'on',...
            'Value', 0,...
            'FontName','Arial',...
            'String','Center maxima',...
            'FontSize',8,...
            'FontWeight','normal',...
            'BackgroundColor',[0.7 0.7 0.7],...
            'Units','Normalized',...
            'Position',[0.0 0.78 0.1 0.05]);        
        h.x_Maxima_Show = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Enable','on',...
            'Position',[0.1 0.78 0.1 0.05],...
            'String',' -- ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',8);
        
        h.name_FWHM =  uicontrol('Parent',h.lp_fit_MG,...
            'Style' , 'text',...
            'Enable', 'on',...
            'Value', 0,...
            'FontName','Arial',...
            'String','FWHM',...
            'FontSize',8,...
            'FontWeight','normal',...
            'BackgroundColor',[0.7 0.7 0.7],...
            'Units','Normalized',...
            'Position',[0.4 0.78 0.05 0.05]);
        
        h.x_Data_Cursor = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Enable','on',...
            'Position',[0.45 0.78 0.05 0.05],...
            'String',' -- ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',8);
        
        h.name_Rsquare_onefit=  uicontrol('Parent',h.lp_fit_MG,...
            'Style' , 'text',...
            'Enable', 'on',...
            'Value', 0,...
            'FontName','Arial',...
            'String','R^2',...
            'FontSize',8,...
            'FontWeight','normal',...
            'BackgroundColor',[0.7 0.7 0.7],...
            'Units','Normalized',...
            'Position',[0.25 0.73 0.1 0.05]);
        h.y_Data_Cursor = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Enable','off',...
            'Units','normalized',...
            'Position',[0.35 0.73 0.15 0.05],...
            'String',' -- ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',8);
        
        %Smooth the noise ratio
        h.name_Smooth = uicontrol('Parent',h.lp_fit_MG,...
            'Style' , 'Check',......
            'Visible', 'on',...
            'Enable','on',...
            'Value', 0,...
            'FontName','Helvetica',...
            'String','Smooth',...
            'FontWeight','bold',...
            'HorizontalAlignment','center',...
            'Units','Normalized',...
            'Callback',@Smooth_Chk,...
            'Position',[0.0 0.73 0.1 0.05],...
            'BackgroundColor',[0.5 0.5 0.5],...
            'FontSize',8);
        
        
        % Fit Only Manually some of the scans while presing Pause
        h.f_panel_fit_One_Manually = uicontrol('Parent',h.lp_fit_MG,...
            'Style' , 'Check',...
            'Enable','on',...
            'Value', 0,...
            'FontName','Helvetica',...
            'String','Manual Fit:',...
            'FontWeight','bold',...
            'HorizontalAlignment','center',...
            'Units','Normalized',...
            'Callback',@Fit_One_Manually_Chk,...
            'Position',[0.55 0.83 0.1 0.05],...
            'BackgroundColor',[0.5 0.5 0.5],...
            'FontSize',8);
        
        h.name_time_pause= uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.65 0.83 0.1 0.05],...
            'String','Pause(s)',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        
        h.time_pause= uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.75 0.83 0.1 0.05],...
            'String',' 0.1 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        
        h.Name_Pause =  uicontrol('Parent',h.lp_fit_MG,...
            'Style' , 'togglebutton',...
            'Enable', 'on',...
            'Value', 0,...
            'FontName','Arial',...
            'String','Pause',...
            'FontSize',10,...
            'FontWeight','normal',...
            'BackgroundColor',[0 1 0],...
            'Units','Normalized',...
            'Position',[0.55, 0.73, 0.08,0.1],...
            'Callback',@Pause);
        
        h.name_Image_panel = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.63, 0.78, 0.07,0.05],...
            'String','x max',...
            'BackgroundColor',[0.4 0.4 0.4],...
            'FontSize',8);
        h.x_max_fit =  uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.63, 0.73, 0.07,0.05],...
            'String',' [] ',...
            'FontSize',8);
        
        h.name_Image_panel = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.63+0.07, 0.78, 0.07,0.05],...
            'String','y max',...
            'BackgroundColor',[0.4 0.4 0.4],...
            'FontSize',8);
        h.y_max_fit =  uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.63+0.07, 0.73, 0.07,0.05],...
            'String',' [] ',...
            'FontSize',8);
        
        h.name_Image_panel = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.63+0.14, 0.78, 0.07,0.05],...
            'String','x left',...
            'BackgroundColor',[0.4 0.4 0.4],...
            'FontSize',8);
        h.x_left_fit =  uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.63+0.14, 0.73, 0.07,0.05],...
            'String',' [] ',...
            'FontSize',8);
        h.name_Image_panel = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.63+0.21, 0.78, 0.07,0.05],...
            'String','x right',...
            'BackgroundColor',[0.4 0.4 0.4],...
            'FontSize',8);
        h.x_right_fit = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.63+0.21, 0.73, 0.07,0.05],...
            'String',' [] ',...
            'FontSize',8);
        
        h.Save_manual_Fit = uicontrol('Parent',h.lp_fit_MG,...
            'Style','togglebutton',...
            'Units','normalized',...
            'Position',[0.9, 0.73, 0.08,0.1],...
            'String','Save',...
            'BackgroundColor',[0 0 0.9],...
            'FontSize',8,...
            'Callback',@Fit_One_Manually_Chk);
        
        
 %% Multi Gaussian
        h.name_Multi_Gaussian = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0. 0.43 1 0.28],...
            'FontWeight','bold',...
            'BackgroundColor',[0.4 0.4 0.4],...
            'FontSize',8);
        
        h.name_Multi_Gaussian = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0. 0.67 0.2 0.04],...
            'String','Multi Peak fit:',...
            'FontWeight','bold',...
            'BackgroundColor',[0.4 0.4 0.4],...
            'FontSize',8);
        
        h.name_MultiGauss = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.2 0.67 0.1 0.04],...
            'String','Number Peaks',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        
        Str ={};
        Str{end+1} = '--';
        Str{end+1} = '1';
        Str{end+1} = '2';
        Str{end+1} = '3';
        Str{end+1} = '4';
        Str{end+1} = '5';
        Str{end+1} = '6';
        Str{end+1} = '7';
        Str{end+1} = '8';
        
        h.Number_MultiGauss = uicontrol('Parent',h.lp_fit_MG,...
            'Style','popup',...
            'Units','normalized',...
            'String',Str,...
            'Position',[0.3 0.67 0.05 0.04],...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6,...
            'Callback',@Number_MultiGauss);
        
        h.name_RSquare_MG= uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.36 0.67 0.05 0.04],...
            'String','R^2',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        h.RSquare_MG= uicontrol('Parent',h.lp_fit_MG,...
            'Style','edit',...
            'Units','normalized',...
            'Enable','off',...
            'Position',[0.41 0.67 0.1 0.04],...
            'String','0',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        
        %Values
        h.name_MultiGauss_Fit = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0. 0.64 0.05 0.03],...
            'String','Fit',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        h.name_MultiGauss_Pos1 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0. 0.6 0.05 0.04],...
            'String','1:',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        h.name_MultiGauss_Pos2 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0. 0.56 0.05 0.04],...
            'String','2:',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'Callback',@Chk_MultiGauss,...
            'FontSize',6);
        h.name_MultiGauss_Pos3 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0. 0.52 0.05 0.04],...
            'String','3:',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        h.name_MultiGauss_Pos4 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0. 0.48 0.05 0.04],...
            'String','4:',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        
        
        h.name_MultiGauss_Pos = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.05 0.64 0.06 0.03],...
            'String','Position',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        h.name_MultiGauss_Pos_Chk_1 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Check',...
            'Units','normalized',...
            'Position',[0.11 0.64 0.04 0.03],...
            'Value',1,...
            'String','on',...
            'FontSize',20,...
            'FontName','Arial',...
            'Callback',@Chk_MultiGauss,...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        h.x_max_Picture_1 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.05 0.6 0.1 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.x_max_Picture_2 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.05 0.56 0.1 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.x_max_Picture_3 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.05 0.52 0.1 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.x_max_Picture_4 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.05 0.48 0.1 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        
        
        h.name_MultiGauss_Pos_Limit = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.15 0.64 0.05 0.03],...
            'String','Lim +',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        h.x_max_Picture_lim_p_1 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.15 0.6 0.05 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.x_max_Picture_lim_p_2 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.15 0.56 0.05 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.x_max_Picture_lim_p_3 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.15 0.52 0.05 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.x_max_Picture_lim_p_4 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.15 0.48 0.05 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        
        
        h.name_MultiGauss_Pos_Limit = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.2 0.64 0.05 0.03],...
            'String','Lim -',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        h.x_max_Picture_lim_n_1 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.2 0.6 0.05 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.x_max_Picture_lim_n_2 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.2 0.56 0.05 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.x_max_Picture_lim_n_3 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.2 0.52 0.05 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.x_max_Picture_lim_n_4 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.2 0.48 0.05 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        
        
        
        h.name_MultiGauss_Pos = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.25 0.64 0.06 0.03],...
            'String','Intensity',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        h.name_MultiGauss_Int_Chk_1 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Check',...
            'Units','normalized',...
            'Position',[0.31 0.64 0.04 0.03],...
            'String','on',...
            'Value',1,...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'Callback',@Chk_MultiGauss,...
            'FontSize',6);
        h.max_I_MG_1 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.25 0.6 0.1 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.max_I_MG_2 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.25 0.56 0.1 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.max_I_MG_3 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.25 0.52 0.1 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.max_I_MG_4 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.25 0.48 0.1 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        
        h.name_MultiGauss_Pos_Limit = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.35 0.64 0.05 0.03],...
            'String','Lim +',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        h.max_I_MG_lim_p_1 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.35 0.6 0.05 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.max_I_MG_lim_p_2 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.35 0.56 0.05 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.max_I_MG_lim_p_3 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.35 0.52 0.05 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.max_I_MG_lim_p_4 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.35 0.48 0.05 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        
        
        h.name_MultiGauss_Pos_Limit = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.4 0.64 0.04 0.03],...
            'String','Lim -',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        h.max_I_MG_lim_n_1 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.4 0.6 0.04 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.max_I_MG_lim_n_2 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.4 0.56 0.04 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.max_I_MG_lim_n_3 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.4 0.52 0.04 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.max_I_MG_lim_n_4 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.4 0.48 0.04 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        
        h.name_MultiGauss_FWHM = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.44 0.64 0.03 0.03],...
            'String','FWHM',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',5);
        h.name_MultiGauss_FWHM_Chk_1 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Check',...
            'Units','normalized',...
            'Position',[0.47 0.64 0.035 0.03],...
            'String','on',...
            'Value',1,...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'Callback',@Chk_MultiGauss,...
            'FontSize',5);
        h.FWHM_MG_1 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.44 0.6 0.03 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.FWHM_MG_2 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.44 0.56 0.03 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.FWHM_MG_3 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.44 0.52 0.03 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.FWHM_MG_4 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.44 0.48 0.03 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        
        h.Strip_Color_MG_1 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Check',...
            'Units','normalized',...
            'Value',1,...
            'Position',[0.47 0.6 0.035 0.04],...
            'BackgroundColor',[1 1 0],...
            'String','on',...
            'Callback',@Chk_MultiGauss,...
            'FontSize',5);
        h.Strip_Color_MG_2 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Check',...
            'Units','normalized',...
            'Value',1,...
            'Position',[0.47 0.56 0.035 0.04],...
            'BackgroundColor',[0 1 1],...
            'String','on',...
            'Callback',@Chk_MultiGauss,...
            'FontSize',5);
        h.Strip_Color_MG_3 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Check',...
            'Units','normalized',...
            'Value',1,...
            'Position',[0.47 0.52 0.035 0.04],...
            'BackgroundColor',[1 0 0],...
            'String','on',...
            'Callback',@Chk_MultiGauss,...
            'FontSize',5);
        h.Strip_Color_MG_4 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Check',...
            'Units','normalized',...
            'Value',1,...
            'Position',[0.47 0.48 0.035 0.04],...
            'BackgroundColor',[0 1 0],...
            'Callback',@Chk_MultiGauss,...
            'String','on',...
            'FontSize',5);
        
        
        h.name_MultiGauss_Fit = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.51 0.64 0.04 0.03],...
            'String','Fit',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        h.name_MultiGauss_Pos5 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.51 0.6 0.04 0.04],...
            'String','5:',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        h.name_MultiGauss_Pos6 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.51 0.56 0.04 0.04],...
            'String','6:',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        h.name_MultiGauss_Pos7 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.51 0.52 0.04 0.04],...
            'String','7:',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        h.name_MultiGauss_Pos8 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.51 0.48 0.04 0.04],...
            'String','8:',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        
        h.name_MultiGauss_Pos = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.55 0.64 0.06 0.03],...
            'String','Position',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        h.name_MultiGauss_Pos_Chk_2 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Check',...
            'Units','normalized',...
            'Value',1,...
            'Position',[0.61 0.64 0.06 0.03],...
            'String','on',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'Callback',@Chk_MultiGauss,...
            'FontSize',6);
        h.x_max_Picture_5 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.55 0.6 0.1 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.x_max_Picture_6 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.55 0.56 0.1 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.x_max_Picture_7 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.55 0.52 0.1 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.x_max_Picture_8 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.55 0.48 0.1 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        
        
        h.name_MultiGauss_Pos_Limit = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.65 0.64 0.05 0.03],...
            'String','Lim +',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        h.x_max_Picture_lim_p_5 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.65 0.6 0.05 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.x_max_Picture_lim_p_6 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.65 0.56 0.05 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.x_max_Picture_lim_p_7 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.65 0.52 0.05 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.x_max_Picture_lim_p_8 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.65 0.48 0.05 0.04],...
            'String','0',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        
        
        h.name_MultiGauss_Pos_Limit = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.7 0.64 0.05 0.03],...
            'String','Lim -',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        h.x_max_Picture_lim_n_5 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.7 0.6 0.05 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.x_max_Picture_lim_n_6 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.7 0.56 0.05 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.x_max_Picture_lim_n_7 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.7 0.52 0.05 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.x_max_Picture_lim_n_8 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.7 0.48 0.05 0.04],...
            'String','0',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        
        h.name_MultiGauss_Pos = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.75 0.64 0.06 0.03],...
            'String','Intensity',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        h.name_MultiGauss_Int_Chk_2 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Check',...
            'Units','normalized',...
            'Value',1,...
            'Position',[0.81 0.64 0.04 0.03],...
            'String','on',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'Callback',@Chk_MultiGauss,...
            'FontSize',6);
        h.max_I_MG_5 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.75 0.6 0.1 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.max_I_MG_6 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.75 0.56 0.1 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.max_I_MG_7 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.75 0.52 0.1 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.max_I_MG_8 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.75 0.48 0.1 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        
        h.name_MultiGauss_Pos_Limit = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.85 0.64 0.05 0.03],...
            'String','Lim +',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        h.max_I_MG_lim_p_5 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.85 0.6 0.05 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.max_I_MG_lim_p_6 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.85 0.56 0.05 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.max_I_MG_lim_p_7 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.85 0.52 0.05 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.max_I_MG_lim_p_8 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.85 0.48 0.05 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        
        h.name_MultiGauss_Pos_Limit = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.9 0.64 0.04 0.03],...
            'String','Lim -',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',6);
        h.max_I_MG_lim_n_5 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.9 0.6 0.04 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.max_I_MG_lim_n_6 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.9 0.56 0.04 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.max_I_MG_lim_n_7 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.9 0.52 0.04 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.max_I_MG_lim_n_8 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.9 0.48 0.04 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        
        h.name_MultiGauss_FWHM = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.94 0.64 0.03 0.03],...
            'String','FWHM',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'FontSize',5);
        h.name_MultiGauss_FWHM_Chk_2 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Check',...
            'Units','normalized',...
            'Value',1,...
            'Position',[0.97 0.64 0.035 0.03],...
            'String','on',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0.3 0.3 0.3],...
            'Callback',@Chk_MultiGauss,...
            'FontSize',5);
        h.FWHM_MG_5 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.94 0.6 0.03 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.FWHM_MG_6 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.94 0.56 0.03 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.FWHM_MG_7 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.94 0.52 0.03 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        h.FWHM_MG_8 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.94 0.48 0.03 0.04],...
            'String',' 0 ',...
            'BackgroundColor',[0.6 0.6 0.6],...
            'FontSize',6);
        
        
        h.Strip_Color_MG_5 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Check',...
            'Units','normalized',...
            'Value',1,...
            'Position',[0.97 0.6 0.035 0.04],...
            'BackgroundColor',[0.3 0.3 0.3],...
            'String','on',...
            'Callback',@Chk_MultiGauss,...
            'FontSize',5);
        h.Strip_Color_MG_6 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Check',...
            'Units','normalized',...
            'Position',[0.97 0.56 0.035 0.04],...
            'BackgroundColor',[0 0 1],...
            'Value',1,...
            'String','on',...
            'Callback',@Chk_MultiGauss,...
            'FontSize',5);
        h.Strip_Color_MG_7 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Check',...
            'Units','normalized',...
            'Position',[0.97 0.52 0.035 0.04],...
            'BackgroundColor',[1 0 1],...
            'Value',1,...
            'String','on',...
            'Callback',@Chk_MultiGauss,...
            'FontSize',5);
        h.Strip_Color_MG_8 = uicontrol('Parent',h.lp_fit_MG,...
            'Style','Check',...
            'Units','normalized',...
            'Position',[0.97 0.48 0.035 0.04],...
            'BackgroundColor',[1 1 0],...
            'Value',1,...
            'String','on',...
            'Callback',@Chk_MultiGauss,...
            'FontSize',5);
        
        h.PlotSections_MG = uicontrol('Parent',h.lp_fit_MG,...
            'Style','push',...
            'Units','normalized',...
            'Position',[0.75 0.67 0.25 0.05],...
            'String','Fit Multi Peak',...
            'BackgroundColor',[1 1 0],...
            'FontSize',10,...
            'FontWeight','bold',...
            'Callback',@Plot_Sections_MG);
        
        
        h.PlotSections_MG_Preplot = uicontrol('Parent',h.lp_fit_MG,...
            'Style','push',...
            'Units','normalized',...
            'Position',[0.5 0.67 0.25 0.05],...
            'String','Pre-plot MG',...
            'BackgroundColor',[0 0.9 0.9],...
            'FontSize',10,...
            'FontWeight','bold',...
            'Callback',@Pre_Plot_Sections_MG);
        
        h.name_file_xlsx = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.5 0.43 0.05 0.05],...
            'String','File:',...
            'BackgroundColor',[0.45 0.45 0.45],...
            'FontSize',8);
        h.file_xlsx =uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.55 0.43 0.05 0.05],...
            'String','--',...            
            'FontSize',8);    
        
        h.name_sheet_view = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.6 0.43 0.05 0.05],...
            'String','Sheet',...
            'BackgroundColor',[0.45 0.45 0.45],...
            'FontSize',8);
        h.sheet_view =uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.65 0.43 0.05 0.05],...
            'String','1',...
            'FontSize',8);
        
        h.name_xlRange_view = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0.7 0.43 0.05 0.05],...
            'String','xlRange',...
            'BackgroundColor',[0.45 0.45 0.45],...
            'FontSize',8);
        h.xlRange_view =uicontrol('Parent',h.lp_fit_MG,...
            'Style','Edit',...
            'Units','normalized',...
            'Position',[0.75 0.43 0.05 0.05],...
            'String','A1',...            
            'FontSize',8);
        
        h.Read_xls = uicontrol('Parent',h.lp_fit_MG,...
            'Style','push',...
            'Units','normalized',...
            'Position',[0.9 0.43 0.1 0.05],...
            'String','Open xlsx',...
            'BackgroundColor',[0 0.9 0.9],...
            'FontSize',8,...
            'FontWeight','bold',...
            'Callback',@Save_MG);
        
        h.Save_MG_Values = uicontrol('Parent',h.lp_fit_MG,...
            'Style','push',...
            'Units','normalized',...
            'Position',[0.8 0.43 0.1 0.05],...
            'String','Save as xlsx',...
            'BackgroundColor',[0 0 0.9],...
            'FontSize',8,...
            'FontWeight','bold',...
            'Callback',@Save_MG);
        
            
        
        h.name_Help_MultiGauss = uicontrol('Parent',h.lp_fit_MG,...
            'Style','text',...
            'Units','normalized',...
            'Position',[0. 0.43 0.5 0.05],...
            'String',' Define Position and Intensity for each maxima you can give Limits both upper (Lim+) and lower(Lim -) positions. "Inf" can be use to define a high limit',...
            'FontSize',20,...
            'FontName','Arial',...
            'FontWeight','bold',...
            'BackgroundColor',[0 0 0.95],...
            'FontSize',5);
        
      

 
        end
    end

    function Peak_Chk(source,eventdata)
        
       if source == h.Lorentzian_Dist_Check
              set( h.Lorentzian_Dist_Check,'Value',1)
              set( h.Gaussian_Dist_Check,'Value',0)
           
       elseif source == h. Gaussian_Dist_Check
              set( h.Lorentzian_Dist_Check,'Value',0)
              set( h.Gaussian_Dist_Check,'Value',1)                     
       end
       
    end

% Fit to gaussian
    function Plot_Sections_1G(source,evendata)
        Plot_Panel_Print_call
        set(h.Error_control,'String','Scan working','BackgroundColor',[0 0 1])  
        
            child = get(h.PlotS_Result3_Fig,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
            child = get(h.PlotRS_Fig,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
            child = get(h.PlotS_Result_Fig,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
            child = get(h.PlotS_Fig,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            axes(h.PlotS_Result3_Fig)
            legend('hide')

            child = get(h.PlotS_Result2_Fig,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
            child = get(h.PlotS_Result4_Fig,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            axes(h.PlotS_Result4_Fig)
            legend('hide')
            
            child = get(h.PlotS_Fig_plot_f1,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            child = get(h.PlotS_Fig_plot_f2,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
            child = get(h.PlotS_Fig_plot_f3,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
            child = get(h.PlotS_Fig_plot_f4,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
            child = get(h.PlotS_Fig_plot_f5,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
            child = get(h.PlotS_Fig_plot_f6,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
            child = get(h.PlotS_Fig_plot_f7,'Children');
            for i=1:length(child)
                delete(child(i));
            end

            
            if source == h.PlotSections_1G
                clear all
                Fit_One_manually = h.Fit_One_Manual_Chk ;
                ImageNumbers = h.ImageNumbers;
                StripRanges = h.StripRanges;
                ColumnRanges = h.ColumnRange;
                factorcol = h.factorcol;
                factorrow = h.factorrow;
                
                center_max_val = 0;
                if get(h.center_max,'Value') == 1
                    center_max_val = eval(get(h.center_max_val,'string'));
                end
                        
                ScanNumber = h.ScanNumber;
                h.Scan_number_save = ScanNumber;
                set(h.Scan_number_load,'String',ScanNumber);
                Size_ScanI = eval(get(h.Size_ScanI, 'String'));
                Folder = get(h.Folder,'String');
                directoryname_Images = strcat(Folder);
                
                if get(h.Strip_scan_Extract_1,'Value') == 1
                    StripIntensities1 = h.StripIntensities1;
                end
                if get(h.Strip_scan_Extract_2,'Value') == 1
                    StripIntensities2= h.StripIntensities2;
                end
                if get(h.Strip_scan_Extract_3,'Value') == 1
                    StripIntensities3= h.StripIntensities3;
                end
                if get(h.Strip_scan_Extract_4,'Value') == 1
                    StripIntensities4= h.StripIntensities4;
                end
                
                I_max=h.max_I_value;
                I_min=h.min_I_value;
                if h.micro_Check == 1
                    micro_val = h.micro_value;
                end
                
                Stop = 1;
                
                Delta_x_min = eval(get(h.Delta_x_min,'String'));
                Delta_x_max = eval(get(h.Delta_x_max,'String'));
                
                
                if h.Zoom_In_Act == 1
                    size_StripMin = h.size_StripMin ;
                    size_StripMax= h.size_StripMax;
                    size_ColMin= h.size_ColMin;
                    size_ColMax = h.size_ColMax;
                end
                
                
                %% Distribution selection
                if  get(h.Lorentzian_Dist_Check,'Value') == 1
                    % Cauchy distribution
                    GaussFunction = fittype('a0/(pi*halfwidth)./(1+((x-xcenter)/halfwidth).^2)+baseline','independent',{'x'},'coefficients',{'a0','xcenter','halfwidth','baseline'});
                    
                else
                    % Gaussina distribution
                    GaussFunction = fittype('a0*exp(-((x-xcenter)/halfwidth).^2/2)+baseline','independent',{'x'},'coefficients',{'a0','xcenter','halfwidth','baseline'});
                
                end
                
                if h.micro_Check == 1
                    InitialWidth_pix = 1;
                else
                    InitialWidth_pix = 1;
                end
                
                rsquare_min = 0.1;
                
                
                %%
                
                
                %filename_Output = sprintf('%s/Sections.mat',directoryname_Images);
                %load(filename_Output,'StripIntensities','StripRanges','ColumnRange','ScanNumber','ImageNumbers');
                % load(filename_Output,'StripIntensities','StripRanges','ColumnRange','ScanNumber','ImageNumbers','andor_image_ave');
                
                %%
                N_images = size(ImageNumbers,2);
                N_StripRanges = size(StripRanges,1);
                Strip_Extract= h.Strip_Extract;
                
                
                
                %%
                
                N_StripRanges =0;
                i_Strip_values = 0;
                t_Extract = 1;
                for i_Extract = 1:size(Strip_Extract,2)
                    if Strip_Extract(1,i_Extract)==0
                    else
                        N_StripRanges = N_StripRanges +1;
                        i_Strip_values(1,t_Extract) = Strip_Extract(1,i_Extract);
                        t_Extract = t_Extract+ 1;
                    end
                    
                end
                
                for i_Extract= 1:N_StripRanges
                    
                    i_Strip = i_Strip_values(1,i_Extract);
                    
                    if h.Stop_value == 1
                        Stop_value =0;
                        Stop = 0;
                        h.Stop_value =Stop_value;
                        break
                    end
                    Max_Pos_Manu = 0;
                    
                    if i_Strip == 1
                        StripIntensities = StripIntensities1;                        
                        set(h.Strip_scan,'Value',1)
                        set(h.Strip_scan1,'Value',0)
                        set(h.Strip_scan2,'Value',0)
                        set(h.Strip_scan3,'Value',0)
                    elseif i_Strip == 2
                        StripIntensities = StripIntensities2;
                        set(h.Strip_scan,'Value',0)
                        set(h.Strip_scan1,'Value',1)
                        set(h.Strip_scan2,'Value',0)
                        set(h.Strip_scan3,'Value',0)
                    elseif i_Strip == 3
                        StripIntensities = StripIntensities3;
                        set(h.Strip_scan,'Value',0)
                        set(h.Strip_scan1,'Value',0)
                        set(h.Strip_scan2,'Value',1)
                        set(h.Strip_scan3,'Value',0)
                    elseif i_Strip == 4
                        StripIntensities = StripIntensities4;
                        set(h.Strip_scan,'Value',0)
                        set(h.Strip_scan1,'Value',0)
                        set(h.Strip_scan2,'Value',0)
                        set(h.Strip_scan3,'Value',1)
                    end
                    
                  

                    if i_Strip == 1
                        StripRanges_plot = linspace(StripRanges(1,1),StripRanges(1,2),(StripRanges(1,2)-StripRanges(1,1))/factorrow+1)-center_max_val;
                        StripIntensities_mean1 = mean(squeeze(StripIntensities(:,:,1)),1);                                          
                    elseif i_Strip == 2
                        StripRanges_plot = linspace(StripRanges(2,1),StripRanges(2,2),(StripRanges(2,2)-StripRanges(2,1))/factorrow+1)-center_max_val;
                        StripIntensities_mean2 = mean(squeeze(StripIntensities(:,:,2)),1);                        
                    elseif i_Strip == 3
                        StripRanges_plot = linspace(StripRanges(3,1),StripRanges(3,2),(StripRanges(3,2)-StripRanges(3,1))/factorrow+1)-center_max_val;
                        StripIntensities_mean3 = mean(squeeze(StripIntensities(:,:,3)),1);                        
                    elseif i_Strip == 4
                        StripRanges_plot = linspace(StripRanges(4,1),StripRanges(4,2),(StripRanges(4,2)-StripRanges(4,1))/factorrow+1)-center_max_val;
                        StripIntensities_mean4 = mean(squeeze(StripIntensities(:,:,4)),1);
                    end
                    
                                       
                    max_I = 0;
                    
                    axes(h.PlotS_Fig)
                    hold off
                    
                    
                    for i_im = 1:N_images-Size_ScanI                        
                        StripInten= StripIntensities(i_im,:,i_Strip);
                        
                        size(StripRanges_plot)
                        size(StripInten)
                        
                        plot(StripRanges_plot,StripInten,'Parent', h.PlotS_Fig,'Color','b') ;                        
                        hold on
                        [max_I_image, index_max_image] = max(StripIntensities(i_im,:,i_Strip));
                        max_I = max(max_I,max_I_image);
                        if i_Strip == 1     
                            Save_Strip_Range1 = StripRanges_plot;
                            Save_Strip_Int1(1,:,i_im)=StripIntensities(i_im,:,i_Strip);                            
                        elseif i_Strip == 2                      
                            Save_Strip_Range2 = StripRanges_plot;
                            Save_Strip_Int2(1,:,i_im)=StripIntensities(i_im,:,i_Strip);
                        elseif i_Strip == 3
                            Save_Strip_Range3 = StripRanges_plot;
                            Save_Strip_Int3(1,:,i_im)=StripIntensities(i_im,:,i_Strip);
                        elseif i_Strip == 4
                            Save_Strip_Range4 = StripRanges_plot;
                            Save_Strip_Int4(1,:,i_im)=StripIntensities(i_im,:,i_Strip);
                        end
                        axes(h.PlotS_Fig_plot_f4)
                        plot(StripRanges_plot,StripInten,'Parent', h.PlotS_Fig_plot_f4,'Color','b') ;
                        hold on
                        axes(h.PlotS_Fig)
                    end
                    
                    axes(h.PlotS_Fig)
                    hold on
                    if i_Strip == 1                        
                        plot(StripRanges_plot,mean(squeeze(StripIntensities(:,:,i_Strip)),1),...
                            'Parent', h.PlotS_Fig_plot_f4,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','g');
                        Save_Strip_Int1(1,:,i_im)=mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                        axes(h.PlotS_Fig_plot_f4)
                    elseif i_Strip == 2
                        plot(StripRanges_plot,mean(squeeze(StripIntensities(:,:,i_Strip)),1),...
                            'Parent', h.PlotS_Fig_plot_f4,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','g');
                        Save_Strip_Int2(1,:,i_im)=mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                        axes(h.PlotS_Fig_plot_f4)
                    elseif i_Strip == 3
                        plot(StripRanges_plot,mean(squeeze(StripIntensities(:,:,i_Strip)),1),...
                            'Parent', h.PlotS_Fig_plot_f4,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','g');
                        Save_Strip_Int3(1,:,i_im)=mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                        axes(h.PlotS_Fig_plot_f4)
                    elseif i_Strip == 4
                        plot(StripRanges_plot,mean(squeeze(StripIntensities(:,:,i_Strip)),1),...
                            'Parent', h.PlotS_Fig_plot_f4,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','g');
                        Save_Strip_Int4(1,:,i_im)=mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                        axes(h.PlotS_Fig_plot_f4)
                    end
                    axes(h.PlotS_Fig)
                    title(sprintf('F1: Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig);
                    xlim auto
                    ylim auto
                    if h.micro_Check ==1
                        xlabel('Position (um)')
                    else
                        xlabel('Position (um)')
                    end
                    ylabel('Intensity (arb units)')
                    axes(h.PlotS_Fig_plot_f4)
                    title(sprintf('F1: Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f4);
                    xlim auto
                    ylim auto     
                    if h.micro_Check ==1
                        xlabel('Position (um)')
                    else
                        xlabel('Position (um)')
                    end
                    ylabel('Intensity (arb units)')
                    
                    axes(h.PlotS_Fig)
                    if i_Strip == 1
                        mean_Strip1(1,:) = mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                    elseif i_Strip == 2
                        mean_Strip2(1,:) = mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                    elseif i_Strip == 3
                        mean_Strip3(1,:) = mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                    elseif i_Strip == 4
                        mean_Strip4(1,:) = mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                    end
                    
                    h.i_im = i_im;
                    h.Save_i_im =i_im;
                    
                    
                    if h.micro_Check == 1
                        ColumnRange = ColumnRanges * micro_val;
                    else
                        ColumnRange = ColumnRanges;
                    end
                    
                    Picture_initial = eval(get(h.Size_ScanI, 'String'));
                    n_im = 0;
                                        
                    t_im =1;
                     for i_im = 1:N_images-Size_ScanI+1
                    
                    if h.Stop_value == 1
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 1 0])
                        pause(0.5)
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 0 0])
                        pause(0.5)
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 1 0])
                        pause(0.5)
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 0 0])
                        pause(0.5)
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 1 0])
                        pause(0.5)
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 0 0])
                        pause(1)
                        Stop = 0;
                        break
                    end
                    
                    if i_Strip ==1
                        Background = 0;
                        
                    elseif i_Strip ==2
                        Background = 0;
                    elseif i_Strip ==3
                        Background = 0;
                    elseif i_Strip ==4
                        Background = 0;
                    end
                    YMin = 0.9*Background;
                    
                      [tonto,N_Strip] = size(squeeze(StripIntensities(i_im,:,i_Strip)));
                    ColumnRangesArray = linspace(ColumnRange(i_Strip,1),ColumnRange(i_Strip,2),N_Strip);
                    [~,N_pixel]=size(ColumnRangesArray);
                        
                        [max_I_image, index_max_image] = max(StripIntensities(i_im,:,i_Strip));
                        x_values = StripRanges_plot;
                        x_max = x_values(index_max_image);
                        max_I = max(max_I,max_I_image);
                        YMax = 1.05*max_I;
                        
                        if i_Strip == 1
                            Save_x_values1 (1,:) = x_values;
                        elseif i_Strip == 2
                            Save_x_values2 (1,:) = x_values;
                        elseif i_Strip == 3
                            Save_x_values3 (1,:) = x_values;
                        elseif i_Strip == 4
                            Save_x_values4 (1,:) = x_values;
                        end
                        
                        Val_Max_Pos_Manu =0;
                        
                        Picture_num = num2str(i_im);
                        set(h.Picture,'String',Picture_num)
                        for i_Max = 1:N_pixel
                            if  StripIntensities(i_im,i_Max,i_Strip)> Val_Max_Pos_Manu
                                Val_Max_Pos_Manu = StripIntensities(i_im,i_Max,i_Strip);
                                Max_Pos_Manu = ColumnRangesArray(1,i_Max);
                            end
                        end
                        
                        Max_Pos_Manu_array(1,i_im)= Max_Pos_Manu;
                        
                        if h.Smooth == 1
                            Val_Max_Pos_Manu =0;
                            for i_Max = 1:N_pixel
                                if   Intensities_Strip_Smooth(1,i_Max)> Val_Max_Pos_Manu
                                    Val_Max_Pos_Manu = Intensities_Strip_Smooth(1,i_Max);
                                    Max_Pos_Manu = ColumnRangesArray(1,i_Max);
                                end
                            end
                            Max_Pos_Manu_array_Smooth(1,i_im)= Max_Pos_Manu;
                        end
                        FitQuality.rsquare = 0;
                        
                        
                        h.Save_multi_yes = 0;
                        if (FitQuality.rsquare >= rsquare_min)
                            max_I = max_I_bef;
                            x_max = x_max_bef;
                            InitialWidth_pix =InitialWidth_pix_bef;
                            Background = Background_bef;
                            StartPoints = [max_I-Background, x_max, InitialWidth_pix, Background];
                            FitQuality.rsquare
                        else
                            if h.Fit_One_Manual_Chk == 1
                                max_I = eval(get(h.I_Maxima_Show,'string'));
                                x_max = eval(get(h.x_Maxima_Show,'string'));
                                InitialWidth_pix = eval(get(h.x_Data_Cursor,'String'))/2;
                            end
                                                 
                            StartPoints = [max_I-Background, x_max, InitialWidth_pix, Background];
                        end
                        
                        [FittedFunction,FitQuality] = fit(x_values',squeeze(StripIntensities(i_im,:,i_Strip))',GaussFunction,'Start', StartPoints);

                        
                        FittedCoefficients = coeffvalues(FittedFunction);
                        
                        if (FitQuality.rsquare >= rsquare_min)
                            if h.Gaussian_Check ==1
                                FitValid(i_im) = 1;
                                MaxPos(i_im) = FittedCoefficients(2);
                                Widths(i_im) = FittedCoefficients(3);
                                Heights(i_im) = FittedCoefficients(1);
                                Background_part(i_im)= FittedCoefficients(4);
                                MaxPosStr = num2str(MaxPos(i_im));
                                set(h.x_max_Picture_1,'String',MaxPosStr);
                                
                                max_I_bef = FittedCoefficients(1)+Background;
                                x_max_bef = FittedCoefficients(2);
                                InitialWidth_pix_bef =FittedCoefficients(3);
                                Background_bef = FittedCoefficients(4);
                                
                                RSquare(1,i_im) = FitQuality.rsquare;
                                
                                
                                RSquare(1,i_im) = FitQuality.rsquare;
                                
                            end
                            
                        else
                            if h.Gaussian_Check ==1
                                FitValid(i_im) = 0;
                                MaxPos(i_im) = 0;
                                Widths(i_im) = 0;
                                Heights(i_im) = 0;
                                Background_part(i_im)= FittedCoefficients(4);
                                
                                RSquare(1,i_im) = 0;
                                
                            end
                        end
                        
                        max_I_bef = FittedCoefficients(1)+Background;
                        x_max_bef = FittedCoefficients(2);
                        InitialWidth_pix_bef =FittedCoefficients(3);
                        Background_bef = FittedCoefficients(4);
                        
                        
                        set(h.I_Maxima_Show,'string',max_I_bef)
                        set(h.x_Maxima_Show,'string',x_max_bef)
                        if get(h.Gaussian_Dist_Check,'Value') == 1
                            FWHM (i_Strip,i_im)= 2.355*Widths(i_im);
                            set(h.x_Data_Cursor,'String',num2str(2.355*Widths(i_im)))
                        else
                             FWHM (i_Strip,i_im)= 2*Widths(i_im);
                             set(h.x_Data_Cursor,'String',num2str(2*Widths(i_im)))
                        end
                        
                        set(h.y_Data_Cursor,'String',num2str(RSquare(1,i_im)))
                        RSquare_all(i_Strip,i_im) = RSquare(1,i_im);
                        
                        
                        axes(h.PlotRS_Fig)
                        plot(StripRanges_plot,squeeze(StripIntensities(i_im,:,i_Strip)),'Parent', h.PlotRS_Fig,'LineWidth',2,'MarkerSize',2,'Color','b');
                        title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotRS_Fig);
                        hold on
                        BackgroundArray = Background*ones(1,N_Strip);
                        plot(StripRanges_plot,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotRS_Fig);
                        plot(x_values,feval(FittedFunction,x_values),'Parent', h.PlotRS_Fig,'Color','r','LineStyle',':','linewidth',5);
                        
                        Difference_plot_Fit = squeeze(StripIntensities(i_im,:,i_Strip))' - feval(FittedFunction,x_values);
                        plot(x_values,Difference_plot_Fit,'Parent', h.PlotRS_Fig,'Color','g','LineStyle',':','linewidth',5);
                        
                        axes(h.PlotS_Fig_plot_f2)
                        plot(StripRanges_plot,squeeze(StripIntensities(i_im,:,i_Strip)),'Parent', h.PlotS_Fig_plot_f2,'LineWidth',2,'MarkerSize',2,'Color','b');
                        title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f2);
                        hold on
                        BackgroundArray = Background*ones(1,N_Strip);
                        plot(ColumnRangesArray,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Fig_plot_f2);
                        plot(x_values,feval(FittedFunction,x_values),'Parent', h.PlotS_Fig_plot_f2,'Color','r','LineStyle',':','linewidth',5);
                        
                        Difference_plot_Fit = squeeze(StripIntensities(i_im,:,i_Strip))' - feval(FittedFunction,x_values);
                        plot(x_values,Difference_plot_Fit,'Parent', h.PlotS_Fig_plot_f2,'Color','g','LineStyle',':','linewidth',5);
                        title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f2);
                        
                        if h.micro_Check ==1
                            xlabel('Position (um)')
                        else
                            xlabel('Position (um)')
                        end
                        ylabel('Intensity (arb units)')
                        
                        axes(h.PlotRS_Fig)
                        YMax_plot = eval(get(h.Name_Y_Max_Plot_F2,'String'));
                        YMin_plot = eval(get(h.Name_Y_Min_Plot_F2,'String'));
                        
                        set(h.PlotRS_Fig,'Ylim',[YMin_plot YMax_plot]);
                        
                        if h.micro_Check ==1
                            xlabel('Position (um)')
                        else
                            xlabel('Position (um)')
                        end
                        ylabel('Intensity (arb units)')
                        
                        set(h.PlotRS_Fig,'Ylim',[YMin_plot YMax_plot]);
                        title(sprintf('F2: Image %d, Strip %d, %d - %d pix',(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotRS_Fig);
                        
                        
                        axes(h.PlotS_Result2_Fig)
                        
                        if h.Smooth ==1
                            for i_Diff = 1:size(StripRanges_plot,2)-1
                                StripRanges_plot_Diff(1,i_Diff) = StripRanges_plot(1,i_Diff);
                            end
                            Intensities_Strip_Smooth_Diff = diff(Intensities_Strip_Smooth);
                            plot(StripRanges_plot,Intensities_Strip_Smooth_Diff,'Parent', h.PlotS_Result2_Fig,'LineWidth',2,'MarkerSize',2,'Color','c');
                            hold off
                            title(sprintf('F4: Smooth Image Strip Diff %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Result2_Fig);
                        else
                            for i_Diff = 1:size(StripRanges_plot,2)-1
                                StripRanges_plot_Diff(1,i_Diff) = StripRanges_plot(1,i_Diff);
                            end
                            Intensities_Strip_Diff = diff(squeeze(StripIntensities(i_im,:,i_Strip)));
                            plot(StripRanges_plot_Diff,Intensities_Strip_Diff,'Parent', h.PlotS_Result2_Fig,'LineWidth',2,'MarkerSize',2,'Color','c');
                            hold off
                            title(sprintf('F4: Smooth Image Strip Diff %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Result2_Fig);
                        end
                        
                        axes(h.PlotS_Fig_plot_f5)
                        
                        if h.Smooth ==1
                            plot(StripRanges_plot_Diff,Intensities_Strip_Smooth_Diff,'Parent', h.PlotS_Fig_plot_f5,'LineWidth',2,'MarkerSize',2,'Color','c');
                            hold off
                            title(sprintf('F4: Smooth Image Strip Diff %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f5);
                        else

                            plot(StripRanges_plot_Diff,Intensities_Strip_Diff,'Parent', h.PlotS_Fig_plot_f5,'LineWidth',2,'MarkerSize',2,'Color','c');
                            hold off
                            title(sprintf('F4: Smooth Image Strip Diff %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f5);
                        end
                        
                        axes(h.PlotRS_Fig)
                        hold off
                        
                        
                        if h.Smooth == 1
                            axes(h.PlotS_Result_Fig)
                            plot(ColumnRangesArray,Intensities_Strip_Smooth,'Parent', h.PlotS_Result_Fig,'LineWidth',2,'MarkerSize',2,'Color','c');
                            hold on
                            plot(x_values,feval(FittedFunction_Smooth,x_values),'Parent', h.PlotS_Result_Fig,'Color','g','LineStyle',':');
                            axis([400,1800,YMin, YMax])
                            title(sprintf('F3:Smooth Image Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Result_Fig);
                            hold off
                            set(h.PlotS_Result_Fig,'Ylim',[YMin YMax]);
                            if h.micro_Check ==1
                                xlabel('Position (um)')
                            else
                                xlabel('Position (um)')
                            end
                            ylabel('Intensity (arb units)')
                            
                            axes(h.PlotS_Fig_plot_f3)
                            plot(ColumnRangesArray,Intensities_Strip_Smooth,'Parent', h.PlotS_Fig_plot_f3,'LineWidth',2,'MarkerSize',2,'Color','c');
                            hold on
                            plot(x_values,feval(FittedFunction_Smooth,x_values),'Parent', h.PlotS_Fig_plot_f3,'Color','g','LineStyle',':');                            
                            title(sprintf('F3:Smooth Image Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f3);
                            hold off
                            
                            if h.micro_Check ==1
                                xlabel('Position (um)')
                            else
                                xlabel('Position (um)')
                            end
                            ylabel('Intensity (arb units)')
                            
                        end
                        pause(0.1)
                        
                        
                        time_pause = eval(get(h.time_pause,'String'));
                        if h.Fit_One_Manual_Chk == 1
                            pause(time_pause)
                        end
                        
                        
                        n_im = n_im + 1;
                        
                        t_pasue = 0;
                        
                        if h.Pause == 1
                            i_pause =0;
                            if h.Fit_One_Manual_Chk == 1
                                if h.Save_Manuel == 1
                                    t_pasue = 1;
                                end
                                while h.Pause == 1
                                    pause(1)
                                    i_pause = i_pause +1;
                                    if i_pause == 300
                                        h.Pause=0;
                                        set(h.Name_Pause_I_S, 'Value',0)
                                        set(h.Name_Pause, 'Value',0)
                                    end
                                end
                                x_max = eval(get(h.x_max_fit,'String'));
                                y_max = eval(get(h.y_max_fit,'String'));
                                x_left = eval(get(h.x_left_fit,'String'));
                                x_right = eval(get(h.x_right_fit,'String'));
                                InitialWidth_pix = x_right-x_left;
                                
                            else
                                while h.Pause == 1
                                    pause(1)
                                    i_pause = i_pause +1;
                                    if i_pause == 120
                                        h.Pause=0;
                                        set(h.Name_Pause_I_S, 'Value',0)
                                        set(h.Name_Pause, 'Value',0)
                                    end
                                end
                                
                            end
                        end
                        
                        if t_pasue == 1
                            
                            StartPoints = [y_max-Background, x_max, InitialWidth_pix, Background];
                            
                            [FittedFunction,FitQuality] = fit(x_values',squeeze(StripIntensities(i_im,:,i_Strip))',GaussFunction,'Start', StartPoints);
                            if h.Smooth == 1
                                [FittedFunction_Smooth,FitQuality_Smooth] = fit(x_values',Intensities_Strip_Smooth',GaussFunction,'Start', StartPoints);
                                
                                
                                FittedCoefficients_Smooth = coeffvalues(FittedFunction_Smooth);
                                
                                
                                if (FitQuality_Smooth.rsquare >= 0.1)
                                    FitValid_Smooth(i_im) = 1;
                                    MaxPos_Smooth(i_im) = FittedCoefficients_Smooth(2);
                                    Widths_Smooth(i_im) = FittedCoefficients_Smooth(3);
                                    Heights_Smooth(i_im) = FittedCoefficients_Smooth(1);
                                    Background_part_Smooth(i_im)= FittedCoefficients_Smooth(4);
                                    
                                    RSquare_Smooth(1,i_im) = FitQuality_Smooth.rsquare;
                                else
                                    
                                    FitValid_Smooth(i_im) = 0;
                                    MaxPos_Smooth(i_im) = 0;
                                    Widths_Smooth(i_im) = 0;
                                    Heights_Smooth(i_im) = 0;
                                    %Background_part_Smooth(i_im)= FittedCoefficients(4);
                                    Background_part_Smooth(i_im)= 0;
                                    
                                    RSquare_Smooth(1,i_im) = 0;
                                end
                                max_I_bef_Smooth = FittedCoefficients_Smooth(1)+Background;
                                x_max_bef_Smooth = FittedCoefficients_Smooth(2);
                                InitialWidth_pix_bef_Smooth =FittedCoefficients_Smooth(3);
                                Background_bef_Smooth = FittedCoefficients_Smooth(4);
                                
                            end
                            
                            
                            FittedCoefficients = coeffvalues(FittedFunction);
                            if (FitQuality.rsquare >= rsquare_min)
                                FitValid(i_im) = 1;
                                MaxPos(i_im) = FittedCoefficients(2);
                                Widths(i_im) = FittedCoefficients(3);
                                Heights(i_im) = FittedCoefficients(1);
                                Background_part(i_im)= FittedCoefficients(4);
                                MaxPosStr = num2str(MaxPos(i_im));
                                set(h.x_max_Picture_1,'String',MaxPosStr);
                                
                                RSquare(1,i_im) = FitQuality.rsquare;
                            end
                            max_I_bef = FittedCoefficients(1)+Background;
                            x_max_bef = FittedCoefficients(2);
                            InitialWidth_pix_bef =FittedCoefficients(3);
                            Background_bef = FittedCoefficients(4);
                            
                            
                            axes(h.PlotRS_Fig)
                            plot(ColumnRangesArray,squeeze(StripIntensities(i_im,:,i_Strip)),'Parent', h.PlotRS_Fig,'LineWidth',2,'MarkerSize',2,'Color','b');
                            title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotRS_Fig);
                            hold on
                            BackgroundArray = Background*ones(1,N_Strip);
                            plot(ColumnRangesArray,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotRS_Fig);
                            plot(x_values,feval(FittedFunction,x_values),'Parent', h.PlotRS_Fig,'Color','r','LineStyle',':');
                            axis([400,1800,YMin, YMax])
                            
                            axes(h.PlotS_Fig_plot_f2)
                            plot(ColumnRangesArray,squeeze(StripIntensities(i_im,:,i_Strip)),'Parent', h.PlotS_Fig_plot_f2,'LineWidth',2,'MarkerSize',2,'Color','b');
                            title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f2);
                            hold on
                            BackgroundArray = Background*ones(1,N_Strip);
                            plot(ColumnRangesArray,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Fig_plot_f2);
                            plot(x_values,feval(FittedFunction,x_values),'Parent', h.PlotS_Fig_plot_f2,'Color','r','LineStyle',':');
                            if h.micro_Check ==1
                                xlabel('Position (um)')
                            else
                                xlabel('Position (um)')
                            end
                            ylabel('Intensity (arb units)')
                            title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f2);
                            
                            axes(h.PlotRS_Fig)
                            
                            set(h.PlotRS_Fig,'Ylim',[YMin YMax]);
                            if h.micro_Check ==1
                                xlabel('Position (um)')
                            else
                                xlabel('Position (um)')
                            end
                            ylabel('Intensity (arb units)')
                            set(h.PlotRS_Fig,'Ylim',[YMin YMax]);
                            title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotRS_Fig);
                            
                            axes(h.PlotRS_Fig)
                            hold off
                            
                            
                            
                            if h.Smooth == 1
                                axes(h.PlotS_Result_Fig)
                                plot(ColumnRangesArray,Intensities_Strip_Smooth,'Parent', h.PlotS_Result_Fig,'LineWidth',2,'MarkerSize',2,'Color','c');
                                hold on
                                plot(x_values,feval(FittedFunction_Smooth,x_values),'Parent', h.PlotS_Result_Fig,'Color','g','LineStyle',':');
                                axis([400,1800,YMin, YMax])
                                title(sprintf('F3:Smooth Image Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Result_Fig);
                                hold off
                                
                                axes(h.PlotS_Fig_plot_f3)
                                plot(ColumnRangesArray,Intensities_Strip_Smooth,'Parent', h.PlotS_Fig_plot_f3,'LineWidth',2,'MarkerSize',2,'Color','c');
                                hold on
                                plot(x_values,feval(FittedFunction_Smooth,x_values),'Parent', h.PlotS_Fig_plot_f3,'Color','g','LineStyle',':');                                
                                title(sprintf('F3:Smooth Image Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f3);
                                hold off
                                
                                axes(h.PlotS_Result_Fig)
                                set(h.PlotS_Result_Fig,'Ylim',[YMin YMax]);
                                if h.micro_Check ==1
                                    xlabel('Position (um)')
                                else
                                    xlabel('Position (um)')
                                end
                                ylabel('Intensity (arb units)')
                                
                                
                            end
                            
                        end
                        
                        if get(h.Save_video,'Value') == 1
                            frame_Strip(t_im) = getframe(h.PlotRS_Fig);
                            if h.Smooth == 1
                                frame_Strip_Smooth(t_im) = getframe(h.PlotS_Result_Fig);
                            end
                        end
                        
                        
                        
                        if i_Strip == 1
                            Save_Strip_fit1(1,:,i_im)=feval(FittedFunction,x_values);
                            if h.Smooth == 1
                                Save_Strip_Smooth_fit1(1,:,i_im)=feval(FittedFunction_Smooth,x_values);
                            end
                        elseif i_Strip == 2
                            Save_Strip_fit2(1,:,i_im)=feval(FittedFunction,x_values);
                            if h.Smooth == 1
                                Save_Strip_Smooth_fit2(1,:,i_im)=feval(FittedFunction_Smooth,x_values);
                            end
                        elseif i_Strip == 3
                            Save_Strip_fit3(1,:,i_im)=feval(FittedFunction,x_values);
                            if h.Smooth == 1
                                Save_Strip_Smooth_fit3(1,:,i_im)=feval(FittedFunction_Smooth,x_values);
                            end
                        elseif i_Strip == 4
                            Save_Strip_fit4(1,:,i_im)=feval(FittedFunction,x_values);
                            if h.Smooth == 1
                                Save_Strip_Smooth_fit4(1,:,i_im)=feval(FittedFunction_Smooth,x_values);
                            end
                        end
                        
                        
                        pause(0.1)
                        t_im = t_im+1;
                        if h.Smooth == 1
                            Area_Smooth(1,i_im) = sum(Intensities_Strip_Smooth -  Background*ones(1,size(Intensities_Strip_Smooth,2)));
                        end
                    end
                    
                    
                    
                    if Stop == 1
                        
                        if h.Smooth == 0
                            axes(h.PlotS_Result_Fig)
                                                       
                            if i_Strip ==1
                                plot(ColumnRangesArray,StripIntensities_mean1,'Parent',h.PlotS_Result_Fig,'Color','r','LineWidth',2);
                                BackgroundArray = 0*ones(1,N_Strip);
                                hold on
                                plot(ColumnRangesArray,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Result_Fig);
                            elseif i_Strip ==2
                                plot(ColumnRangesArray,StripIntensities_mean2,'Parent',h.PlotS_Result_Fig,'Color','r','LineWidth',2);
                                BackgroundArray = 0*ones(1,N_Strip);
                                hold on
                                plot(ColumnRangesArray,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Result_Fig);
                            elseif i_Strip ==3
                                plot(ColumnRangesArray,StripIntensities_mean3,'Parent',h.PlotS_Result_Fig,'Color','r','LineWidth',2);
                                BackgroundArray = 0*ones(1,N_Strip);
                                hold on
                                plot(ColumnRangesArray,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Result_Fig);
                            elseif i_Strip ==4
                                plot(ColumnRangesArray,StripIntensities_mean4,'Parent',h.PlotS_Result_Fig,'Color','r','LineWidth',2);
                                BackgroundArray = 0*ones(1,N_Strip);
                                hold on
                                plot(ColumnRangesArray,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Result_Fig);
                                
                            end
                            hold off
                            
                            title(sprintf('F3: Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Result_Fig);
                            
                            if h.micro_Check ==1
                                xlabel('Position (um)')
                            else
                                xlabel('Position (um)')
                            end
                            ylabel('Intensity (arb units)')
                            
                            axes(h.PlotS_Fig_plot_f3)                                                       
                            if i_Strip ==1
                                plot(ColumnRangesArray,StripIntensities_mean1,'Parent',h.PlotS_Fig_plot_f3,'Color','r','LineWidth',2);
                                hold on
                                plot(ColumnRangesArray,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Fig_plot_f3);
                            elseif i_Strip ==2
                                plot(ColumnRangesArray,StripIntensities_mean2,'Parent',h.PlotS_Fig_plot_f3,'Color','r','LineWidth',2);
                                hold on
                                plot(ColumnRangesArray,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Fig_plot_f3);
                            elseif i_Strip ==3
                                plot(ColumnRangesArray,StripIntensities_mean3,'Parent',h.PlotS_Fig_plot_f3,'Color','r','LineWidth',2);
                                hold on
                                plot(ColumnRangesArray,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Fig_plot_f3);
                            elseif i_Strip ==4
                                plot(ColumnRangesArray,StripIntensities_mean4,'Parent',h.PlotS_Fig_plot_f3,'Color','r','LineWidth',2);
                                hold on
                                plot(ColumnRangesArray,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Fig_plot_f3);
                                
                            end
                            hold off
                            
                            title(sprintf('F3: Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f3);
                            
                            if h.micro_Check ==1
                                xlabel('Position (um)')
                            else
                                xlabel('Position (um)')
                            end
                            ylabel('Intensity (arb units)')
                            
                            axes(h.PlotS_Result_Fig)
                        end
                        %xlim([ColumnRanges(i_Strip,1)+Delta_x_max ColumnRanges(i_Strip,2)-Delta_x_max])
                        Save_Background(i_Strip,1) = Background;
                        
                        
                        Area(1,:)  = sum(squeeze(StripIntensities(:,:,i_Strip)),2);
                        size(Area)
                        %Area = sum(squeeze(StripIntensities(:,:,i_Strip)) - Background*ones(N_images,N_ColumnPixels),2);
                        
                        
                        for i_widths = 1:size(Widths,2)
                            Widths_plot(1,i_widths) = Widths(1,i_widths)*Heights(1,i_widths)*sqrt(2*pi)+Background_part(1,i_widths);
                            if h.Smooth == 1
                                Widths_plot_Smooth(1,i_widths) = Widths_Smooth(1,i_widths)*Heights_Smooth(1,i_widths)*sqrt(2*pi)+Background_part_Smooth(1,i_widths);
                            end
                        end
                        
                        Error(1,:) = (1-RSquare(1,:)).* Widths_plot(1,:)/5;
                        Save_Widths(i_Strip,:)=Widths_plot(1,:);
                        Save_Error(i_Strip,:) = Error(1,:);
                        Save_Area(i_Strip,:) = Area;
                        
                        Smooth = h.Smooth;
                        
                        if h.Smooth == 1
                            Save_Area_Smooth(i_Strip,:) = Area_Smooth;
                            Save_Widths_Smooth(i_Strip,:)=Widths_plot_Smooth(1,:);
                        end
                        
                        
                        if h.Energy_Check == 1
                            [a_Image,b_Image] =size(ImageNumbers);
                            Energy_Step_value=h.Energy_Step_value;
                            Energy_value = h.Energy_value;
                            Image_Theta = h.Image_Theta;
                            for i_Image=1:b_Image
                                Energy_Image(1,i_Image) = Energy_Step_value*(ImageNumbers(1,i_Image)-Image_Theta);
                            end
                        end
                        
                        axes(h.PlotS_Result3_Fig)
                        
                        hold off
                        
                        if h.Energy_Check == 0
                            plot(ImageNumbers,Area,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Result3_Fig);
                            hold on
                            %                 plot(ImageNumbers(FitValid == 1), Widths_plot(FitValid == 1),'Parent',h.PlotS_Result3_Fig,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r');
                            %                 errorbar(ImageNumbers(FitValid == 1),Widths_plot(FitValid == 1),Error(FitValid == 1),'Parent',h.PlotS_Result3_Fig)
                            if h.Smooth == 1
                                plot(ImageNumbers, Area_Smooth,'Parent',h.PlotS_Result3_Fig,'LineStyle','none','Marker','o','MarkerFaceColor','c','MarkerEdgeColor','c');
                                plot(ImageNumbers(FitValid_Smooth == 1), Widths_plot_Smooth(FitValid_Smooth == 1),'Parent',h.PlotS_Result3_Fig,'LineStyle','none','Marker','o','MarkerFaceColor','g','MarkerEdgeColor','g');
                                legend('Area M','Area GF','Error GF','Area MS','Area GFS')
                            else
                                legend('Area M','Area GF','Error GF')
                            end
                            xlabel('Image')
                            title(sprintf('F5: Intensity  --- Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent',h.PlotS_Fig_plot_f1);
                            
                            axes(h.PlotS_Fig_plot_f1)
                            plot(ImageNumbers,Area,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Fig_plot_f1);
                            hold on
                            %                 plot(ImageNumbers(FitValid == 1), Widths_plot(FitValid == 1),'Parent',h.PlotS_Result3_Fig,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r');
                            %                 errorbar(ImageNumbers(FitValid == 1),Widths_plot(FitValid == 1),Error(FitValid == 1),'Parent',h.PlotS_Result3_Fig)
                            if h.Smooth == 1
                                plot(ImageNumbers, Area_Smooth,'Parent',h.PlotS_Fig_plot_f1,'LineStyle','none','Marker','o','MarkerFaceColor','c','MarkerEdgeColor','c');
                                plot(ImageNumbers(FitValid_Smooth == 1), Widths_plot_Smooth(FitValid_Smooth == 1),'Parent',h.PlotS_Fig_plot_f1,'LineStyle','none','Marker','o','MarkerFaceColor','g','MarkerEdgeColor','g');
                                legend('Area M','Area GF','Error GF','Area MS','Area GFS')
                            else
                                legend('Area M','Area GF','Error GF')
                            end
                            xlabel('Image')
                            title(sprintf('F5: Intensity  --- Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent',h.PlotS_Fig_plot_f1);
                            ylabel('Intensity(abr units)')
                        
                        elseif h.Energy_Check == 1
                            plot(Energy_Image,Area,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Result3_Fig);
                            hold on
                            plot(Energy_Image(FitValid ==1),Widths_plot(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r','Parent',h.PlotS_Result3_Fig)
                            errorbar(Energy_Image(FitValid == 1),Widths_plot(FitValid == 1),Error(FitValid == 1),'Parent',h.PlotS_Result3_Fig)
                            if h.Smooth == 1
                                plot(Energy_Image, Area_Smooth,'Parent',h.PlotS_Result3_Fig,'LineStyle','none','Marker','o','MarkerFaceColor','c','MarkerEdgeColor','c');
                                plot(Energy_Image(FitValid_Smooth == 1), Widths_plot_Smooth(FitValid_Smooth == 1),'Parent',h.PlotS_Result3_Fig,'LineStyle','none','Marker','o','MarkerFaceColor','g','MarkerEdgeColor','g');
                                legend('Area M','Area GF','Error GF','Area MS','Area GFS')
                            else
                                legend('Area M','Area GF','Error GF')
                            end
                            xlabel('Energy(eV)')
                            title(sprintf('F5: Intensity  --- Strip %d, 0 position =  %d eV',i_Strip,Energy_value),'Parent',h.PlotS_Result3_Fig);
                            
                            axes(h.PlotS_Fig_plot_f1)
                            plot(Energy_Image,Area,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Fig_plot_f1);
                            hold on
                            plot(Energy_Image(FitValid ==1),Widths_plot(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r','Parent',h.PlotS_Fig_plot_f1)
                            errorbar(Energy_Image(FitValid == 1),Widths_plot(FitValid == 1),Error(FitValid == 1),'Parent',h.PlotS_Fig_plot_f1)
                            if h.Smooth == 1
                                plot(Energy_Image, Area_Smooth,'Parent',h.PlotS_Fig_plot_f1,'LineStyle','none','Marker','o','MarkerFaceColor','c','MarkerEdgeColor','c');
                                plot(Energy_Image(FitValid_Smooth == 1), Widths_plot_Smooth(FitValid_Smooth == 1),'Parent',h.PlotS_Fig_plot_f1,'LineStyle','none','Marker','o','MarkerFaceColor','g','MarkerEdgeColor','g');
                                legend('Area M','Area GF','Error GF','Area MS','Area GFS')
                            else
                                legend('Area M','Area GF','Error GF')
                            end
                            xlabel('Energy(eV)')
                            title(sprintf('F5: Intensity  --- Strip %d, 0 position =  %d eV',i_Strip,Energy_value),'Parent',h.PlotS_Fig_plot_f1);
                            ylabel('Intensity(abr units)')
                        end
                        
                        axes(h.PlotS_Result3_Fig)
                        ylabel('Intensity(abr units)')
                        
                        xlim auto
                        ylim auto
                        
                        axes(h.PlotS_Result4_Fig)
                        hold off
                        
                        if h.Energy_Check == 0
                            %                  plot(ImageNumbers(FitValid == 1),MaxPos(FitValid == 1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.PlotS_Result4_Fig);
                            hold on
                            plot(ImageNumbers,Max_Pos_Manu_array,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Result4_Fig);
                            if h.Smooth == 1
                                plot(ImageNumbers,Max_Pos_Manu_array_Smooth,'LineStyle','none','Marker','o','MarkerFaceColor','c','MarkerEdgeColor','c','Parent',h.PlotS_Result4_Fig);
                                plot(ImageNumbers(FitValid_Smooth == 1), MaxPos_Smooth(FitValid_Smooth == 1),'Parent',h.PlotS_Result4_Fig,'LineStyle','none','Marker','o','MarkerFaceColor','g','MarkerEdgeColor','g');
                                legend('MaxPos GF','MaxPos M','MaxPos MS','MaxPos GFS')
                            else
                                legend('MaxPos GF','MaxPos M')
                            end
                            xlabel('Image')
                            title(sprintf('F6: Peak position  --- Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent',h.PlotS_Result4_Fig);
                            
                            axes(h.PlotS_Fig_plot_f6)
                            %                  plot(ImageNumbers(FitValid == 1),MaxPos(FitValid == 1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.PlotS_Fig_plot_f6);
                            hold on
                            plot(ImageNumbers,Max_Pos_Manu_array,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Fig_plot_f6);
                            if h.Smooth == 1
                                plot(ImageNumbers,Max_Pos_Manu_array_Smooth,'LineStyle','none','Marker','o','MarkerFaceColor','c','MarkerEdgeColor','c','Parent',h.PlotS_Fig_plot_f6);
                                plot(ImageNumbers(FitValid_Smooth == 1), MaxPos_Smooth(FitValid_Smooth == 1),'Parent',h.PlotS_Fig_plot_f6,'LineStyle','none','Marker','o','MarkerFaceColor','g','MarkerEdgeColor','g');
                                legend('MaxPos GF','MaxPos M','MaxPos MS','MaxPos GFS')
                            else
                                legend('MaxPos GF','MaxPos M')
                            end
                            xlabel('Image')
                            title(sprintf('F6: Peak position  --- Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent',h.PlotS_Fig_plot_f6);
                            xlim auto
                            ylim auto
                        elseif h.Energy_Check == 1
                            plot(Energy_Image(FitValid ==1),MaxPos(FitValid == 1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.PlotS_Result4_Fig)
                            hold on
                            plot(Energy_Image,Max_Pos_Manu_array,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Result4_Fig)
                            if h.Smooth == 1
                                plot(Energy_Image,Max_Pos_Manu_array_Smooth,'LineStyle','none','Marker','o','MarkerFaceColor','c','MarkerEdgeColor','c','Parent',h.PlotS_Result4_Fig);
                                plot(Energy_Image(FitValid_Smooth == 1), MaxPos_Smooth(FitValid_Smooth == 1),'Parent',h.PlotS_Result4_Fig,'LineStyle','none','Marker','o','MarkerFaceColor','g','MarkerEdgeColor','g');
                                legend('MaxPos GF','MaxPos M','MaxPos MS','MaxPos GFS')
                            else
                                legend('MaxPos GF','MaxPos M')
                            end
                            xlabel('Energy(eV)')
                            title(sprintf('F6: Peak position  --- Strip %d, 0 position =  %d eV',i_Strip,Energy_value),'Parent',h.PlotS_Result4_Fig)
                            
                            axes(h.PlotS_Fig_plot_f6)
                             plot(Energy_Image(FitValid ==1),MaxPos(FitValid == 1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.PlotS_Fig_plot_f6)
                            hold on
                            plot(Energy_Image,Max_Pos_Manu_array,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Fig_plot_f6)
                            if h.Smooth == 1
                                plot(Energy_Image,Max_Pos_Manu_array_Smooth,'LineStyle','none','Marker','o','MarkerFaceColor','c','MarkerEdgeColor','c','Parent',h.PlotS_Fig_plot_f6);
                                plot(Energy_Image(FitValid_Smooth == 1), MaxPos_Smooth(FitValid_Smooth == 1),'Parent',h.PlotS_Fig_plot_f6,'LineStyle','none','Marker','o','MarkerFaceColor','g','MarkerEdgeColor','g');
                                legend('MaxPos GF','MaxPos M','MaxPos MS','MaxPos GFS')
                            else
                                legend('MaxPos GF','MaxPos M')
                            end
                            xlabel('Energy(eV)')
                            title(sprintf('F6: Peak position  --- Strip %d, 0 position =  %d eV',i_Strip,Energy_value),'Parent',h.PlotS_Fig_plot_f6)
                            xlim auto
                            ylim auto
                        end
                        axes(h.PlotS_Result4_Fig)
                        xlim auto
                        ylim auto
                        
                        if h.micro_Check == 1
                            ylabel('Position (um)')
                        else
                            ylabel('Position (um)')
                        end
                        axes(h.PlotS_Fig_plot_f6)
                        
                        if h.micro_Check == 1
                            ylabel('Position (um)')
                        else
                            ylabel('Position (um)')
                        end
                        
                        axes(h.PlotS_Result4_Fig)
                        
                        if h.micro_Check ==1
                            Save_Peak(i_Strip,:) = MaxPos(1,:)/micro_val;
                            Save_Peak_Manu(i_Strip,:) = Max_Pos_Manu_array(1,:)/micro_val;
                            if h.Smooth == 1
                                Save_Peak_Smooth(i_Strip,:) = MaxPos_Smooth(1,:)/micro_val;
                                Save_Peak_Manu_Smooth(i_Strip,:) = Max_Pos_Manu_array_Smooth(1,:)/micro_val;
                            end
                        else
                            Save_Peak(i_Strip,:) = MaxPos(1,:);
                            Save_Peak_Manu(i_Strip,:) = Max_Pos_Manu_array(1,:);
                            if h.Smooth == 1
                                Save_Peak_Smooth(i_Strip,:) = MaxPos_Smooth(1,:);
                                Save_Peak_Manu_Smooth(i_Strip,:) = Max_Pos_Manu_array_Smooth(1,:);
                            end
                        end
                        
                        Save_number_Image = ImageNumbers;
                        Save_FitValid(i_Strip,:)  = FitValid(1,:);
                        if h.Smooth == 1
                            Save_FitValid_Smooth(i_Strip,:)  = FitValid_Smooth(1,:);
                        end
                        
                        
                        
                        if get(h.Save_video,'Value') == 1
                            Save_ColumnRange_Def = h.ColumnRange;
                            Save_StripRange_Def = h.StripRanges;
                            
                            
                            set(h.f_video,'Visible','on')
                            movie(h.f_video,frame_Strip,1,10)
                            set(h.f_video,'Visible','off')
                            
                            if i_Strip ==1
                                limits_strip = sprintf('Column%0.3d_%0.3d_Raw%0.3d_%0.3d',Save_ColumnRange_Def(1,1),Save_ColumnRange_Def(1,2),Save_StripRange_Def(1,1),Save_StripRange_Def(1,2));
                                filename_Output = sprintf('%s/VideoScanS_Strip1_%s.avi',directoryname_Images,limits_strip);
                                filename_Output_Smooth = sprintf('%s/VideoScanS_Strip1_Smooth%s.avi',directoryname_Images,limits_strip);
                            elseif i_Strip ==2
                                limits_strip = sprintf('Column%0.3d_%0.3d_Raw%0.3d_%0.3d',Save_ColumnRange_Def(2,1),Save_ColumnRange_Def(2,2),Save_StripRange_Def(2,1),Save_StripRange_Def(2,2));
                                filename_Output = sprintf('%s/VideoScanS_Strip2_%s.avi',directoryname_Images,limits_strip);
                                filename_Output_Smooth = sprintf('%s/VideoScanS_Strip2_Smooth%s.avi',directoryname_Images,limits_strip);
                            elseif i_Strip ==3
                                limits_strip = sprintf('Column%0.3d_%0.3d_Raw%0.3d_%0.3d',Save_ColumnRange_Def(3,1),Save_ColumnRange_Def(3,2),Save_StripRange_Def(3,1),Save_StripRange_Def(3,2));
                                filename_Output = sprintf('%s/VideoScanS_Strip3_%s.avi',directoryname_Images,limits_strip);
                                filename_Output_Smooth = sprintf('%s/VideoScanS_Strip3_Smooth%s.avi',directoryname_Images,limits_strip);
                            elseif i_Strip ==4
                                limits_strip = sprintf('Column%0.3d_%0.3d_Raw%0.3d_%0.3d',Save_ColumnRange_Def(4,1),Save_ColumnRange_Def(4,2),Save_StripRange_Def(4,1),Save_StripRange_Def(4,2));
                                filename_Output = sprintf('%s/VideoScanS_Strip4_%s.avi',directoryname_Images,limits_strip);
                                filename_Output_Smooth = sprintf('%s/VideoScanS_Strip4_Smooth%s.avi',directoryname_Images,limits_strip);
                            end
                            
                            v = VideoWriter(filename_Output);
                            v.FrameRate = 5;
                            open(v)
                            writeVideo(v,frame_Strip)
                            close(v)
                            
                            if h.Smooth == 1
                                set(h.f_video,'Visible','off')
                                v = VideoWriter(filename_Output_Smooth);
                                v.FrameRate = 5;
                                open(v)
                                writeVideo(v,frame_Strip_Smooth)
                                close(v)
                            end
                        end
                    end
                    
                end
                
                
                h.FWHM = FWHM;
                h.RSquare = RSquare_all;
                
                
                h.Save_Area = Save_Area;
                h.Save_Peak = Save_Peak;
                h.Save_Widths = Save_Widths;
                if h.Smooth == 1
                    h.Save_Area_Smooth = Save_Area_Smooth;
                    h.Save_Peak_Smooth = Save_Peak_Smooth;
                    h.Save_Widths_Smooth = Save_Widths_Smooth;
                end
                h.Save_number_Image = Save_number_Image;
                h.Save_Background = Save_Background;
                
                h.Save_FitValid = Save_FitValid;
                h.Save_Peak_Manu =Save_Peak_Manu;
                if h.Smooth == 1
                    h.Save_FitValid_Smooth = Save_FitValid_Smooth;
                    h.Save_Peak_Manu_Smooth =Save_Peak_Manu_Smooth;
                end
                h.Save_Error = Save_Error;
                
                if get(h.Strip_scan_Extract_1,'Value') == 1
                    h.Save_Colum_Int1 = Save_Strip_Range1;
                    h.Save_Strip_Int1 =Save_Strip_Int1;
                    h.mean_Strip1 = mean_Strip1;
                    h.Save_x_values1 = Save_x_values1;
                    h.Save_Strip_fit1 = Save_Strip_fit1;
                    if h.Smooth == 1
                        h.Save_Strip_Smooth_Int1 =mean_Smooth_Strip1;
                        h.Save_Strip_Smooth_fit1 = Save_Strip_Smooth_fit1;
                    end
                    h. Strip = [1 0 0 0];
                end
                
                if get(h.Strip_scan_Extract_2,'Value') == 1
                    h.Save_Colum_Int2 = Save_Strip_Range2;
                    h.Save_Strip_Int2 =Save_Strip_Int2;
                    h.mean_Strip2 = mean_Strip2;
                    h.Save_x_values2 = Save_x_values2;
                    h.Save_Strip_fit2 = Save_Strip_fit2;
                    if h.Smooth == 1
                        h.Save_Strip_Smooth_Int2 =mean_Smooth_Strip2;
                        h.Save_Strip_Smooth_fit2 = Save_Strip_Smooth_fit2;
                    end
                    h. Strip = [0 2 0 0];
                end
                
                if get(h.Strip_scan_Extract_3,'Value') == 1
                    h.Save_x_values3 = Save_x_values3;
                    h.mean_Strip3 = mean_Strip3;
                    h.Save_Colum_Int3 = Save_Strip_Range3;
                    h.Save_Strip_Int3 =Save_Strip_Int3;
                    h.Save_Strip_fit3 = Save_Strip_fit3;
                    if h.Smooth == 1
                        h.Save_Strip_Smooth_Int3 =mean_Smooth_Strip3;
                        h.Save_Strip_Smooth_fit3 = Save_Strip_Smooth_fit3;
                    end
                    h. Strip = [0 0 3 0];
                end
                
                if get(h.Strip_scan_Extract_4,'Value') == 1
                    h.Save_Colum_Int4 = Save_Strip_Range4;
                    h.Save_Strip_Int4 =Save_Strip_Int4;
                    h.mean_Strip4 = mean_Strip4;
                    h.Save_x_values4 = Save_x_values4;
                    h.Save_Strip_fit4 = Save_Strip_fit4;
                    if h.Smooth == 1
                        h.Save_Strip_Smooth_Int4 =mean_Smooth_Strip4;
                        h.Save_Strip_Smooth_fit4 = Save_Strip_Smooth_fit4;
                    end
                    h. Strip = [0 0 0 4];
                end
                
                
                
            end
    end

% Fit to gaussian
    function Plot_Sections_MG(source,evendata)
        Plot_Panel_Print_call
        set(h.Error_control,'String','Scan working','BackgroundColor',[0 0 1])
        
        child = get(h.PlotS_Result3_Fig,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.PlotRS_Fig,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.PlotS_Result_Fig,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.PlotS_Fig,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        axes(h.PlotS_Result3_Fig)
        legend('hide')
        
        child = get(h.PlotS_Result2_Fig,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.PlotS_Result4_Fig,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        axes(h.PlotS_Result4_Fig)
        legend('hide')
        
        
        child = get(h.PlotS_Fig_plot_f1,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.PlotS_Fig_plot_f2,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.PlotS_Fig_plot_f3,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.PlotS_Fig_plot_f4,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.PlotS_Fig_plot_f5,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.PlotS_Fig_plot_f6,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.PlotS_Fig_plot_f7,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        file = get(h.File,'String');
        F_image = get(h.Size_ScanF,'String');
        if size(F_image,2) == 1
            F_image = sprintf('0%s',F_image);
        end
        for i_file = 1:(size(file,2)-size(F_image,2))
            file_name(1,i_file) = file(1,i_file);
        end
        file_name = sprintf('%s%s',file_name,F_image);
        
        set(h.file_xlsx,'String',file_name)
        
        if source == h.PlotSections_MG
            clear all
            Fit_One_manually = h.Fit_One_Manual_Chk ;
            ImageNumbers = h.ImageNumbers;
            
            StripRanges = h.StripRanges;
            ColumnRanges = h.ColumnRange;
            ScanNumber = h.ScanNumber;
            h.Scan_number_save = ScanNumber;
            set(h.Scan_number_load,'String',ScanNumber);
            
            
            center_max_val = 0;
            if get(h.center_max,'Value') == 1
                center_max_val = eval(get(h.center_max_val,'string'));
            end
            
            if get(h.Strip_scan_Extract_1,'Value') == 1
                StripIntensities1 = h.StripIntensities1;
            end
            if get(h.Strip_scan_Extract_2,'Value') == 1
                StripIntensities2= h.StripIntensities2;
            end
            if get(h.Strip_scan_Extract_3,'Value') == 1
                StripIntensities3= h.StripIntensities3;
            end
            if get(h.Strip_scan_Extract_4,'Value') == 1
                StripIntensities4= h.StripIntensities4;
            end
            
            I_max=h.max_I_value;
            I_min=h.min_I_value;
            if h.micro_Check == 1
                micro_val = h.micro_value;
            end
            
            Stop = 1;
            
            Delta_x_min = eval(get(h.Delta_x_min,'String'));
            Delta_x_max = eval(get(h.Delta_x_max,'String'));
            
            
            if h.Zoom_In_Act == 1
                size_StripMin = h.size_StripMin ;
                size_StripMax= h.size_StripMax;
                size_ColMin= h.size_ColMin;
                size_ColMax = h.size_ColMax;
            end
            
            %%
            
            
            switch h.Number_MultiGauss_val
                case 1
                    %% Distribution selection
                    if  get(h.Lorentzian_Dist_Check,'Value') == 1
                        % Cauchy distribution
                        MultiGaussFunction = fittype('a01/(pi*halfwidth)./(1+((x-xcenter1)/halfwidth).^2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','halfwidth','baseline'});
                        
                    else
                        % Gaussina distribution
                        MultiGaussFunction = fittype('a01*exp(-((x-xcenter1)/halfwidth).^2/2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','halfwidth','baseline'});
                        
                    end
                    InitialWidth_pix = 8*ones(1,1);
                    
                case 2
                    if  get(h.Lorentzian_Dist_Check,'Value') == 1
                        % Cauchy distribution
                        MultiGaussFunction = fittype('a01/(pi*halfwidth1)./(1+((x-xcenter1)/halfwidth1).^2)+a02/(pi*halfwidth2)./(1+((x-xcenter2)/halfwidth2).^2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','a02','xcenter2','halfwidth1','halfwidth2','baseline'});
                        
                    else
                        % Gaussina distribution
                        MultiGaussFunction = fittype('a01*exp(-((x-xcenter1)/halfwidth1).^2/2)+a02*exp(-((x-xcenter2)/halfwidth2).^2/2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','a02','xcenter2','halfwidth1','halfwidth2','baseline'});
                        
                    end
                    InitialWidth_pix = 8*ones(1,2);
                    
                case 3
                    if  get(h.Lorentzian_Dist_Check,'Value') == 1
                        % Cauchy distribution
                        MultiGaussFunction = fittype('a01/(pi*halfwidth1)./(1+((x-xcenter1)/halfwidth1).^2)+a02/(pi*halfwidth2)./(1+((x-xcenter2)/halfwidth2).^2)+a03/(pi*halfwidth3)./(1+((x-xcenter3)/halfwidth3).^2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','a02','xcenter2','a03','xcenter3','halfwidth1','halfwidth2','halfwidth3','baseline'});
                        
                    else
                        % Gaussina distribution
                        MultiGaussFunction = fittype('a01*exp(-((x-xcenter1)/halfwidth1).^2/2)+a02*exp(-((x-xcenter2)/halfwidth2).^2/2)+a03*exp(-((x-xcenter3)/halfwidth3).^2/2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','a02','xcenter2','a03','xcenter3','halfwidth1','halfwidth2','halfwidth3','baseline'});
                        
                    end
                    InitialWidth_pix = 8*ones(1,3);
                    
                case 4
                    if  get(h.Lorentzian_Dist_Check,'Value') == 1
                        % Cauchy distribution
                        MultiGaussFunction = fittype('a01/(pi*halfwidth1)./(1+((x-xcenter1)/halfwidth1).^2)+a02/(pi*halfwidth2)./(1+((x-xcenter2)/halfwidth2).^2)+a03/(pi*halfwidth3)./(1+((x-xcenter3)/halfwidth3).^2)+a04/(pi*halfwidth4)./(1+((x-xcenter4)/halfwidth4).^2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','a02','xcenter2','a03','xcenter3','a04','xcenter4','halfwidth1','halfwidth2','halfwidth3','halfwidth4','baseline'});
                        
                    else
                        % Gaussina distribution
                        MultiGaussFunction = fittype('a01*exp(-((x-xcenter1)/halfwidth1).^2/2)+a02*exp(-((x-xcenter2)/halfwidth2).^2/2)+a03*exp(-((x-xcenter3)/halfwidth3).^2/2)+a04*exp(-((x-xcenter4)/halfwidth4).^2/2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','a02','xcenter2','a03','xcenter3','a04','xcenter4','halfwidth1','halfwidth2','halfwidth3','halfwidth4','baseline'});
                        
                    end
                    InitialWidth_pix = 8*ones(1,4);
                    
                case 5
                    if  get(h.Lorentzian_Dist_Check,'Value') == 1
                        % Cauchy distribution
                        MultiGaussFunction = fittype('a01/(pi*halfwidth1)./(1+((x-xcenter1)/halfwidth1).^2)+a02/(pi*halfwidth2)./(1+((x-xcenter2)/halfwidth2).^2)+a03/(pi*halfwidth3)./(1+((x-xcenter3)/halfwidth3).^2)+a04/(pi*halfwidth4)./(1+((x-xcenter4)/halfwidth4).^2)+a05/(pi*halfwidth5)./(1+((x-xcenter5)/halfwidth5).^2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','a02','xcenter2','a03','xcenter3','a04','xcenter4','a05','xcenter5','halfwidth1','halfwidth2','halfwidth3','halfwidth4','halfwidth5','baseline'});
                        
                    else
                        % Gaussina distribution
                        MultiGaussFunction = fittype('a01*exp(-((x-xcenter1)/halfwidth1).^2/2)+a02*exp(-((x-xcenter2)/halfwidth2).^2/2)+a03*exp(-((x-xcenter3)/halfwidth3).^2/2)+a04*exp(-((x-xcenter4)/halfwidth4).^2/2)+a05*exp(-((x-xcenter5)/halfwidth5).^2/2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','a02','xcenter2','a03','xcenter3','a04','xcenter4','a05','xcenter5','halfwidth1','halfwidth2','halfwidth3','halfwidth4','halfwidth5','baseline'});
                        
                    end
                    InitialWidth_pix = 8*ones(1,5);
                    
                case 6
                    if  get(h.Lorentzian_Dist_Check,'Value') == 1
                        % Cauchy distribution
                        MultiGaussFunction = fittype('a01/(pi*halfwidth1)./(1+((x-xcenter1)/halfwidth1).^2)+a02/(pi*halfwidth2)./(1+((x-xcenter2)/halfwidth2).^2)+a03/(pi*halfwidth3)./(1+((x-xcenter3)/halfwidth3).^2)+a04/(pi*halfwidth4)./(1+((x-xcenter4)/halfwidth4).^2)+a05/(pi*halfwidth5)./(1+((x-xcenter5)/halfwidth5).^2)+a06/(pi*halfwidth6)./(1+((x-xcenter6)/halfwidth6).^2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','a02','xcenter2','a03','xcenter3','a04','xcenter4','a05','xcenter5','a06','xcenter6','halfwidth1','halfwidth2','halfwidth3','halfwidth4','halfwidth5','halfwidth6','baseline'});
                        
                    else
                        % Gaussina distribution
                        MultiGaussFunction = fittype('a01*exp(-((x-xcenter1)/halfwidth1).^2/2)+a02*exp(-((x-xcenter2)/halfwidth2).^2/2)+a03*exp(-((x-xcenter3)/halfwidth3).^2/2)+a04*exp(-((x-xcenter4)/halfwidth4).^2/2)+a05*exp(-((x-xcenter5)/halfwidth5).^2/2)+a06*exp(-((x-xcenter6)/halfwidth6).^2/2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','a02','xcenter2','a03','xcenter3','a04','xcenter4','a05','xcenter5','a06','xcenter6','halfwidth1','halfwidth2','halfwidth3','halfwidth4','halfwidth5','halfwidth6','baseline'});
                        
                    end
                    InitialWidth_pix = 8*ones(1,6);
                    
                case 7
                    if  get(h.Lorentzian_Dist_Check,'Value') == 1
                        % Cauchy distribution
                        MultiGaussFunction = fittype('a01/(pi*halfwidth1)./(1+((x-xcenter1)/halfwidth1).^2)+a02/(pi*halfwidth2)./(1+((x-xcenter2)/halfwidth2).^2)+a03/(pi*halfwidth3)./(1+((x-xcenter3)/halfwidth3).^2)+a04/(pi*halfwidth4)./(1+((x-xcenter4)/halfwidth4).^2)+a05/(pi*halfwidth5)./(1+((x-xcenter5)/halfwidth5).^2)+a06/(pi*halfwidth6)./(1+((x-xcenter6)/halfwidth6).^2)+a07/(pi*halfwidth7)./(1+((x-xcenter7)/halfwidth7).^2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','a02','xcenter2','a03','xcenter3','a04','xcenter4','a05','xcenter5','a06','xcenter6','a07','xcenter7','halfwidth1','halfwidth2','halfwidth3','halfwidth4','halfwidth5','halfwidth6','halfwidth7','baseline'});
                        
                    else
                        % Gaussina distribution
                        MultiGaussFunction = fittype('a01*exp(-((x-xcenter1)/halfwidth1).^2/2)+a02*exp(-((x-xcenter2)/halfwidth2).^2/2)+a03*exp(-((x-xcenter3)/halfwidth3).^2/2)+a04*exp(-((x-xcenter4)/halfwidth4).^2/2)+a05*exp(-((x-xcenter5)/halfwidth5).^2/2)+a06*exp(-((x-xcenter6)/halfwidth6).^2/2)+a07*exp(-((x-xcenter7)/halfwidth7).^2/2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','a02','xcenter2','a03','xcenter3','a04','xcenter4','a05','xcenter5','a06','xcenter6','a07','xcenter7','halfwidth1','halfwidth2','halfwidth3','halfwidth4','halfwidth5','halfwidth6','halfwidth7','baseline'});
                        
                    end
                    InitialWidth_pix = 8*ones(1,7);
                    
                case 8
                    if  get(h.Lorentzian_Dist_Check,'Value') == 1
                        % Cauchy distribution
                        MultiGaussFunction = fittype('a01/(pi*halfwidth1)./(1+((x-xcenter1)/halfwidth1).^2)+a02/(pi*halfwidth2)./(1+((x-xcenter2)/halfwidth2).^2)+a03/(pi*halfwidth3)./(1+((x-xcenter3)/halfwidth3).^2)+a04/(pi*halfwidth4)./(1+((x-xcenter4)/halfwidth4).^2)+a05/(pi*halfwidth5)./(1+((x-xcenter5)/halfwidth5).^2)+a06/(pi*halfwidth6)./(1+((x-xcenter6)/halfwidth6).^2)+a07/(pi*halfwidth7)./(1+((x-xcenter7)/halfwidth7).^2)+a08/(pi*halfwidth8)./(1+((x-xcenter8)/halfwidth8).^2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','a02','xcenter2','a03','xcenter3','a04','xcenter4','a05','xcenter5','a06','xcenter6','a07','xcenter7','a08','xcenter8','halfwidth1','halfwidth2','halfwidth3','halfwidth4','halfwidth5','halfwidth6','halfwidth7','halfwidth8','baseline'});
                        
                    else
                        % Gaussina distribution
                        MultiGaussFunction = fittype('a01*exp(-((x-xcenter1)/halfwidth1).^2/2)+a02*exp(-((x-xcenter2)/halfwidth2).^2/2)+a03*exp(-((x-xcenter3)/halfwidth3).^2/2)+a04*exp(-((x-xcenter4)/halfwidth4).^2/2)+a05*exp(-((x-xcenter5)/halfwidth5).^2/2)+a06*exp(-((x-xcenter6)/halfwidth6).^2/2)+a07*exp(-((x-xcenter7)/halfwidth7).^2/2)+a08*exp(-((x-xcenter8)/halfwidth8).^2/2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','a02','xcenter2','a03','xcenter3','a04','xcenter4','a05','xcenter5','a06','xcenter6','a07','xcenter7','a08','xcenter8','halfwidth1','halfwidth2','halfwidth3','halfwidth4','halfwidth5','halfwidth6','halfwidth7','halfwidth8','baseline'});
                        
                    end
                    InitialWidth_pix = 8*ones(1,8);
            end
            
            rsquare_min = 0.3;
            
            
            %%
            directoryname_Images = sprintf('s%0.5d',ScanNumber);
            
            %filename_Output = sprintf('%s/Sections.mat',directoryname_Images);
            %load(filename_Output,'StripIntensities','StripRanges','ColumnRange','ScanNumber','ImageNumbers');
            % load(filename_Output,'StripIntensities','StripRanges','ColumnRange','ScanNumber','ImageNumbers','andor_image_ave');
            
            %%            
            N_images = size(ImageNumbers,2);
            N_StripRanges = size(StripRanges,1);
            Strip_Extract= h.Strip_Extract;
            
            
            
            %%
            
            N_StripRanges =0;
            i_Strip_values = 0;
            t_Extract = 1;
            for i_Extract = 1:size(Strip_Extract,2)
                if Strip_Extract(1,i_Extract)==0
                else
                    N_StripRanges = N_StripRanges +1;
                    i_Strip_values(1,t_Extract) = Strip_Extract(1,i_Extract);
                    t_Extract = t_Extract+ 1;
                end
                
            end
            
            for i_Extract= 1:N_StripRanges
                
                i_Strip = i_Strip_values(1,i_Extract);
                
                if h.Stop_value == 1
                    Stop_value =0;
                    Stop = 0;
                    h.Stop_value =Stop_value;
                    break
                end
                Max_Pos_Manu = 0;
                
                if i_Strip == 1
                    StripIntensities = StripIntensities1;
                    
                    set(h.Strip_scan,'Value',1)
                    set(h.Strip_scan1,'Value',0)
                    set(h.Strip_scan2,'Value',0)
                    set(h.Strip_scan3,'Value',0)
                elseif i_Strip == 2
                    StripIntensities = StripIntensities2;
                    
                    set(h.Strip_scan,'Value',0)
                    set(h.Strip_scan1,'Value',1)
                    set(h.Strip_scan2,'Value',0)
                    set(h.Strip_scan3,'Value',0)
                elseif i_Strip == 3
                    StripIntensities = StripIntensities3;
                    
                    set(h.Strip_scan,'Value',0)
                    set(h.Strip_scan1,'Value',0)
                    set(h.Strip_scan2,'Value',1)
                    set(h.Strip_scan3,'Value',0)
                elseif i_Strip == 4
                    StripIntensities = StripIntensities4;
                    
                    set(h.Strip_scan,'Value',0)
                    set(h.Strip_scan1,'Value',0)
                    set(h.Strip_scan2,'Value',0)
                    set(h.Strip_scan3,'Value',1)
                end
                
                N_ColumnPixels = ColumnRanges(i_Strip,2)-ColumnRanges(i_Strip,1)+1  ;
                
                if i_Strip == 1
                    StripRanges_plot = linspace(StripRanges(1,1),StripRanges(1,2),StripRanges(1,2)/h.factorrow-StripRanges(1,1)/h.factorrow+1)-center_max_val;
                    StripIntensities_mean1 = mean(squeeze(StripIntensities(:,:,1)),1);
                    Background1 = 0;
                elseif i_Strip == 2
                    StripRanges_plot = linspace(StripRanges(2,1),StripRanges(2,2),StripRanges(2,2)/h.factorrow-StripRanges(2,1)/h.factorrow+1)-center_max_val;
                    StripIntensities_mean2 = mean(squeeze(StripIntensities(:,:,2)),1);
                    Background2 = 0;
                elseif i_Strip == 3
                    StripRanges_plot = linspace(StripRanges(3,1),StripRanges(3,2),StripRanges(3,2)/h.factorrow-StripRanges(3,1)/h.factorrow+1)-center_max_val;
                    StripIntensities_mean3 = mean(squeeze(StripIntensities(:,:,3)),1);
                    Background3 = 0;
                elseif i_Strip == 4
                    StripRanges_plot = linspace(StripRanges(4,1),StripRanges(4,2),StripRanges(4,2)/h.factorrow-StripRanges(4,1)/h.factorrow+1)-center_max_val;
                    StripIntensities_mean4 = mean(squeeze(StripIntensities(:,:,4)),1);
                    Background4 = 0;
                end
                
                max_I = 0;
                
                axes(h.PlotS_Fig)
                hold off
                
                
                for i_im = 1:N_images
                    
                    StripInten= StripIntensities(i_im,:,i_Strip);
                    plot(StripRanges_plot,StripInten,'Parent', h.PlotS_Fig,'Color','b') ;
                    hold on
                    [max_I_image, index_max_image] = max(StripIntensities(i_im,:,i_Strip));
                    max_I = max(max_I,max_I_image);
                    if i_Strip == 1
                        Save_Colum_Int1(1,:)=StripRanges_plot;
                        Save_Strip_Int1(1,:,i_im)=StripIntensities(i_im,:,i_Strip);
                    elseif i_Strip == 2
                        Save_Colum_Int2(1,:)=StripRanges_plot;
                        Save_Strip_Int2(1,:,i_im)=StripIntensities(i_im,:,i_Strip);
                    elseif i_Strip == 3
                        Save_Colum_Int3(1,:)=StripRanges_plot;
                        Save_Strip_Int3(1,:,i_im)=StripIntensities(i_im,:,i_Strip);
                    elseif i_Strip == 4
                        Save_Colum_Int4(1,:)=StripRanges_plot;
                        Save_Strip_Int4(1,:,i_im)=StripIntensities(i_im,:,i_Strip);
                    end
                    axes(h.PlotS_Fig_plot_f4)
                    plot(StripRanges_plot,StripInten,'Parent', h.PlotS_Fig_plot_f4,'Color','b') ;
                end
                
                axes(h.PlotS_Fig)
                hold on
                if i_Strip == 1
                    plot(StripRanges_plot,mean(squeeze(StripIntensities(:,:,i_Strip)),1),...
                        'Parent', h.PlotS_Fig,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','g');
                    Save_Strip_Int1(1,:,i_im)=mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                    
                    axes(h.PlotS_Fig_plot_f4)
                    plot(StripRanges_plot,mean(squeeze(StripIntensities(:,:,i_Strip)),1),...
                        'Parent', h.PlotS_Fig_plot_f4,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','g');
                elseif i_Strip == 2
                    plot(StripRanges_plot,mean(squeeze(StripIntensities(:,:,i_Strip)),1),...
                        'Parent', h.PlotS_Fig,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','g');
                    Save_Strip_Int2(1,:,i_im)=mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                    
                    axes(h.PlotS_Fig_plot_f4)
                    plot(StripRanges_plot,mean(squeeze(StripIntensities(:,:,i_Strip)),1),...
                        'Parent', h.PlotS_Fig_plot_f4,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','g');
                elseif i_Strip == 3
                    plot(StripRanges_plot,mean(squeeze(StripIntensities(:,:,i_Strip)),1),...
                        'Parent', h.PlotS_Fig,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','g');
                    Save_Strip_Int3(1,:,i_im)=mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                    
                    axes(h.PlotS_Fig_plot_f4)
                    plot(StripRanges_plot,mean(squeeze(StripIntensities(:,:,i_Strip)),1),...
                        'Parent', h.PlotS_Fig_plot_f4,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','g');
                elseif i_Strip == 4
                    plot(StripRanges_plot,mean(squeeze(StripIntensities(:,:,i_Strip)),1),...
                        'Parent', h.PlotS_Fig,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','g');
                    Save_Strip_Int4(1,:,i_im)=mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                    axes(h.PlotS_Fig_plot_f4)
                    plot(StripRanges_plot,mean(squeeze(StripIntensities(:,:,i_Strip)),1),...
                        'Parent', h.PlotS_Fig_plot_f4,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','g');
                end
                axes(h.PlotS_Fig)
                title(sprintf('F1: Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig);
                xlim auto
                ylim auto
                
                if h.micro_Check ==1
                    xlabel('Position (um)')
                else
                    xlabel('Position (um)')
                end
                ylabel('Intensity (arb units)')
                
                axes(h.PlotS_Fig_plot_f4)
                title(sprintf('F1: Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f4);
                xlim auto
                ylim auto
                
                if h.micro_Check ==1
                    xlabel('Position (um)')
                else
                    xlabel('Position (um)')
                end
                ylabel('Intensity (arb units)')
                
                
                axes(h.PlotS_Fig)
                if i_Strip == 1
                    mean_Strip1(1,:) = mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                elseif i_Strip == 2
                    mean_Strip2(1,:) = mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                elseif i_Strip == 3
                    mean_Strip3(1,:) = mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                elseif i_Strip == 4
                    mean_Strip4(1,:) = mean(squeeze(StripIntensities(:,:,i_Strip)),1);
                end
                
                h.i_im = i_im;
                h.Save_i_im =i_im;
                
                
                if h.micro_Check == 1
                    ColumnRange = ColumnRanges * micro_val;
                else
                    ColumnRange = ColumnRanges;
                end
                
                Picture_initial = eval(get(h.Size_ScanI, 'String'));
                n_im = 0;
                frame(size(ImageNumbers,2)) = struct('cdata',[],'colormap',[]);
                t_im =1;
                
                
                
                for i_im = 1:N_images
                    
                    %Plot the image
                    
                    
                    if h.Stop_value == 1
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 1 0])
                        pause(0.5)
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 0 0])
                        pause(0.5)
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 1 0])
                        pause(0.5)
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 0 0])
                        pause(0.5)
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 1 0])
                        pause(0.5)
                        set(h.Error_control,'String','Scan Stopped by User','BackgroundColor',[1 0 0])
                        pause(1)
                        Stop = 0;
                        break
                    end
                    
                    if i_Strip ==1
                        Background = Background1;
                        
                    elseif i_Strip ==2
                        Background = Background2;
                    elseif i_Strip ==3
                        Background = Background3;
                    elseif i_Strip ==4
                        Background = Background4;
                    end
                    YMin = 0.9*Background;
                    
                    
                    [tonto,N_Strip] = size(squeeze(StripIntensities(i_im,:,i_Strip)));
                    
                    
                    if h.Smooth == 1
                        
                        Intensities_Strip = squeeze(StripIntensities(i_im,:,i_Strip));
                        
                        Intensities_Strip_Smooth = sgolayfilt(Intensities_Strip,3,41);
                        if i_Strip == 1
                            mean_Smooth_Strip1(1,:,i_im) = Intensities_Strip_Smooth;
                        elseif i_Strip == 2
                            mean_Smooth_Strip2(1,:,i_im) = Intensities_Strip_Smooth;
                        elseif i_Strip == 3
                            mean_Smooth_Strip3(1,:,i_im) = Intensities_Strip_Smooth;
                        elseif i_Strip == 4
                            mean_Smooth_Strip4(1,:,i_im) = Intensities_Strip_Smooth;
                        end
                        
                    end
                    
                    
                    
                    
                    [max_I_image, index_max_image] = max(StripIntensities(i_im,:,i_Strip));
                    x_values = StripRanges_plot;
                    x_max = x_values(index_max_image);
                    max_I = max(max_I,max_I_image);
                    YMax = 1.05*max_I;
                    
                    if i_Strip == 1
                        Save_x_values1 (1,:) = x_values;
                    elseif i_Strip == 2
                        Save_x_values2 (1,:) = x_values;
                    elseif i_Strip == 3
                        Save_x_values3 (1,:) = x_values;
                    elseif i_Strip == 4
                        Save_x_values4 (1,:) = x_values;
                    end
                    
                    Val_Max_Pos_Manu =0;
                    
                    Picture_num = num2str(ImageNumbers(i_im));
                    set(h.Picture,'String',Picture_num)
                    
                    ColumnRangesArray = linspace(ColumnRange(i_Strip,1),ColumnRange(i_Strip,2),N_Strip);
                    [~,N_pixel]=size(ColumnRangesArray);
                    
                    for i_Max = 1:N_pixel
                        if  StripIntensities(i_im,i_Max,i_Strip)> Val_Max_Pos_Manu
                            Val_Max_Pos_Manu = StripIntensities(i_im,i_Max,i_Strip);
                            Max_Pos_Manu = ColumnRangesArray(1,i_Max);
                        end
                    end
                    Max_Pos_Manu_array(1,i_im)= Max_Pos_Manu;
                    
                    if h.Smooth == 1
                        Val_Max_Pos_Manu =0;
                        for i_Max = 1:N_pixel
                            if   Intensities_Strip_Smooth(1,i_Max)> Val_Max_Pos_Manu
                                Val_Max_Pos_Manu = Intensities_Strip_Smooth(1,i_Max);
                                Max_Pos_Manu = ColumnRangesArray(1,i_Max);
                            end
                        end
                        Max_Pos_Manu_array_Smooth(1,i_im)= Max_Pos_Manu;
                    end
                    FitQuality.rsquare = 0;
                    
                    
                    
                    h.Save_multi_yes = 1;
                    switch h.Number_MultiGauss_val
                        case 1
                            %Initial Values
                            max_I1 = eval(get(h.max_I_MG_1,'String'));
                            x_max1 = eval(get(h.x_max_Picture_1,'String'));
                            InitialWidth_pix(1,1) = eval(get(h.FWHM_MG_1,'String'));
                            if get(h.Gaussian_Dist_Check,'Value') == 1
                                InitialWidth_pix =  InitialWidth_pix/2.355;
                            else
                                InitialWidth_pix =  InitialWidth_pix/2;
                            end
                            
                            %limits for initial values
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_1,'Value') == 1)
                                x_max_lim_p_1 = eval(get(h.x_max_Picture_lim_p_1,'String'));
                                x_max_lim_n_1 = eval(get(h.x_max_Picture_lim_n_1,'String'));
                            else
                                x_max_lim_p_1 = eval(get(h.x_max_Picture_1,'String'));
                                x_max_lim_n_1 = eval(get(h.x_max_Picture_1,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_1,'Value') == 1)
                                I_max_lim_p_1 = eval(get(h.max_I_MG_lim_p_1,'String'));
                                I_max_lim_n_1 = eval(get(h.max_I_MG_lim_n_1,'String'));
                            else
                                I_max_lim_p_1 = max_I1;
                                I_max_lim_n_1 = max_I1-0.000001;
                            end
                            if get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_1,'Value') == 1)
                                FWHM_p_1 = InitialWidth_pix(1,1) + 1;
                                FWHM_n_1 = InitialWidth_pix(1,1) - 1;
                            else
                                FWHM_p_1 = InitialWidth_pix(1,1);
                                FWHM_n_1 = InitialWidth_pix(1,1)-0.000001;
                            end
                            
                            
                            %Definition of Startpoint and limits
                            
                            StartPoints = [max_I1-Background,x_max1,InitialWidth_pix(1,1),Background];
                            Lower_I =  [I_max_lim_n_1,x_max_lim_n_1,FWHM_n_1,Background-0.000001];
                            Upper_I =  [I_max_lim_p_1,x_max_lim_p_1,FWHM_p_1,Background+0.000001];
                            
                        case 2
                            %Initial Values
                            max_I1 = eval(get(h.max_I_MG_1,'String'));
                            x_max1 = eval(get(h.x_max_Picture_1,'String'));
                            max_I2 = eval(get(h.max_I_MG_2,'String'));
                            x_max2 = eval(get(h.x_max_Picture_2,'String'));
                            InitialWidth_pix(1,1) = eval(get(h.FWHM_MG_1,'String'));
                            InitialWidth_pix(1,2) = eval(get(h.FWHM_MG_2,'String'));
                            if get(h.Gaussian_Dist_Check,'Value') == 1
                                InitialWidth_pix =  InitialWidth_pix/2.355;
                            else
                                InitialWidth_pix =  InitialWidth_pix/2;
                            end
                            
                            %limits for initial values
                            if (get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_1,'Value') == 1)
                                x_max_lim_p_1 = eval(get(h.x_max_Picture_lim_p_1,'String'));
                                x_max_lim_n_1 = eval(get(h.x_max_Picture_lim_n_1,'String'));
                            else
                                x_max_lim_p_1 = eval(get(h.x_max_Picture_1,'String'));
                                x_max_lim_n_1 = eval(get(h.x_max_Picture_1,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_Int_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_1,'Value') == 1)
                                I_max_lim_p_1 = eval(get(h.max_I_MG_lim_p_1,'String'));
                                I_max_lim_n_1 = eval(get(h.max_I_MG_lim_n_1,'String'));
                            else
                                I_max_lim_p_1 = eval(get(h.max_I_MG_1,'String'));
                                I_max_lim_n_1 = eval(get(h.max_I_MG_1,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_1,'Value') == 1)
                                FWHM_p_1 = InitialWidth_pix(1,1) + 1;
                                FWHM_n_1 = InitialWidth_pix(1,1) - 1;
                            else
                                FWHM_p_1 = InitialWidth_pix(1,1);
                                FWHM_n_1 = InitialWidth_pix(1,1)-0.000001;
                            end
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_2,'Value') == 1)
                                x_max_lim_p_2 = eval(get(h.x_max_Picture_lim_p_2,'String'));
                                x_max_lim_n_2 = eval(get(h.x_max_Picture_lim_n_2,'String'));
                            else
                                x_max_lim_p_2 = eval(get(h.x_max_Picture_2,'String'));
                                x_max_lim_n_2 = eval(get(h.x_max_Picture_2,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_2,'Value') == 1)
                                I_max_lim_p_2 = eval(get(h.max_I_MG_lim_p_2,'String'));
                                I_max_lim_n_2 = eval(get(h.max_I_MG_lim_n_2,'String'));
                            else
                                I_max_lim_p_2 = eval(get(h.max_I_MG_2,'String'));
                                I_max_lim_n_2 = eval(get(h.max_I_MG_2,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_2,'Value') == 1)
                                FWHM_p_2 = InitialWidth_pix(1,2) + 1;
                                FWHM_n_2 = InitialWidth_pix(1,2) - 1;
                            else
                                FWHM_p_2 = InitialWidth_pix(1,2);
                                FWHM_n_2 = InitialWidth_pix(1,2)-0.000001;
                            end
                            
                            %Definition of Startpoint and limits
                            StartPoints = [max_I1-Background,x_max1,max_I2-Background,x_max2,InitialWidth_pix(1,1),InitialWidth_pix(1,2),Background];
                            Lower_I =  [I_max_lim_n_1,x_max_lim_n_1,I_max_lim_n_2,x_max_lim_n_2,FWHM_n_1,FWHM_n_2,Background-0.000001];
                            Upper_I =  [I_max_lim_p_1,x_max_lim_p_1,I_max_lim_p_2,x_max_lim_p_2,FWHM_p_1,FWHM_p_2,Background+0.000001];
                            
                        case 3
                            max_I1 = max_I;
                            x_max1 = eval(get(h.x_max_Picture_1,'String'));
                            max_I2 = eval(get(h.max_I_MG_2,'String'));
                            x_max2 = eval(get(h.x_max_Picture_2,'String'));
                            max_I3 = eval(get(h.max_I_MG_3,'String'));
                            x_max3 = eval(get(h.x_max_Picture_3,'String'));
                            InitialWidth_pix(1,1) = eval(get(h.FWHM_MG_1,'String'));
                            InitialWidth_pix(1,2) = eval(get(h.FWHM_MG_2,'String'));
                            InitialWidth_pix(1,3) = eval(get(h.FWHM_MG_3,'String'));
                            if get(h.Gaussian_Dist_Check,'Value') == 1
                                InitialWidth_pix =  InitialWidth_pix/2.355;
                            else
                                InitialWidth_pix =  InitialWidth_pix/2;
                            end
                            
                            %limits for initial values
                            if (get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_1,'Value') == 1)
                                x_max_lim_p_1 = eval(get(h.x_max_Picture_lim_p_1,'String'));
                                x_max_lim_n_1 = eval(get(h.x_max_Picture_lim_n_1,'String'));
                            else
                                x_max_lim_p_1 = eval(get(h.x_max_Picture_1,'String'));
                                x_max_lim_n_1 = eval(get(h.x_max_Picture_1,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_Int_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_1,'Value') == 1)
                                I_max_lim_p_1 = eval(get(h.max_I_MG_lim_p_1,'String'));
                                I_max_lim_n_1 = eval(get(h.max_I_MG_lim_n_1,'String'));
                            else
                                I_max_lim_p_1 = eval(get(h.max_I_MG_1,'String'));
                                I_max_lim_n_1 = eval(get(h.max_I_MG_1,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_1,'Value') == 1)
                                FWHM_p_1 = InitialWidth_pix(1,1) + 1;
                                FWHM_n_1 = InitialWidth_pix(1,1) - 1;
                            else
                                FWHM_p_1 = InitialWidth_pix(1,1);
                                FWHM_n_1 = InitialWidth_pix(1,1)-0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_2,'Value') == 1)
                                x_max_lim_p_2 = eval(get(h.x_max_Picture_lim_p_2,'String'));
                                x_max_lim_n_2 = eval(get(h.x_max_Picture_lim_n_2,'String'));
                            else
                                x_max_lim_p_2 = eval(get(h.x_max_Picture_2,'String'));
                                x_max_lim_n_2 = eval(get(h.x_max_Picture_2,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_2,'Value') == 1)
                                I_max_lim_p_2 = eval(get(h.max_I_MG_lim_p_2,'String'));
                                I_max_lim_n_2 = eval(get(h.max_I_MG_lim_n_2,'String'));
                            else
                                I_max_lim_p_2 = eval(get(h.max_I_MG_2,'String'));
                                I_max_lim_n_2 = eval(get(h.max_I_MG_2,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_2,'Value') == 1)
                                FWHM_p_2 = InitialWidth_pix(1,2) + 1;
                                FWHM_n_2 = InitialWidth_pix(1,2) - 1;
                            else
                                FWHM_p_2 = InitialWidth_pix(1,2);
                                FWHM_n_2 = InitialWidth_pix(1,2)-0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_3,'Value') == 1)
                                x_max_lim_p_3 = eval(get(h.x_max_Picture_lim_p_3,'String'));
                                x_max_lim_n_3 = eval(get(h.x_max_Picture_lim_n_3,'String'));
                            else
                                x_max_lim_p_3 = eval(get(h.x_max_Picture_3,'String'));
                                x_max_lim_n_3 = eval(get(h.x_max_Picture_3,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_3,'Value') == 1)
                                I_max_lim_p_3 = eval(get(h.max_I_MG_lim_p_3,'String'));
                                I_max_lim_n_3 = eval(get(h.max_I_MG_lim_n_3,'String'));
                            else
                                I_max_lim_p_3 = eval(get(h.max_I_MG_3,'String'));
                                I_max_lim_n_3 = eval(get(h.max_I_MG_3,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_3,'Value') == 1)
                                FWHM_p_3 = InitialWidth_pix(1,3) + 1;
                                FWHM_n_3 = InitialWidth_pix(1,3) - 1;
                            else
                                FWHM_p_3 = InitialWidth_pix(1,3) ;
                                FWHM_n_3 = InitialWidth_pix(1,3) -0.000001;
                            end
                            
                            %Definition of Startpoint and limits
                            StartPoints = [max_I1-Background,x_max1,max_I2-Background,x_max2,max_I3-Background,x_max3,InitialWidth_pix(1,1),InitialWidth_pix(1,2),InitialWidth_pix(1,3),Background];
                            Lower_I =  [I_max_lim_n_1,x_max_lim_n_1,I_max_lim_n_2,x_max_lim_n_2,I_max_lim_n_3,x_max_lim_n_3,FWHM_n_1,FWHM_n_2,FWHM_n_3,Background-0.000001];
                            Upper_I =  [I_max_lim_p_1,x_max_lim_p_1,I_max_lim_p_2,x_max_lim_p_2,I_max_lim_p_3,x_max_lim_p_3,FWHM_p_1,FWHM_p_2,FWHM_p_3,Background+0.000001];
                            
                        case 4
                            max_I1 = max_I;
                            x_max1 = eval(get(h.x_max_Picture_1,'String'));
                            max_I2 = eval(get(h.max_I_MG_2,'String'));
                            x_max2 = eval(get(h.x_max_Picture_2,'String'));
                            max_I3 = eval(get(h.max_I_MG_3,'String'));
                            x_max3 = eval(get(h.x_max_Picture_3,'String'));
                            max_I4 = eval(get(h.max_I_MG_4,'String'));
                            x_max4 = eval(get(h.x_max_Picture_4,'String'));
                            InitialWidth_pix(1,1) = eval(get(h.FWHM_MG_1,'String'));
                            InitialWidth_pix(1,2) = eval(get(h.FWHM_MG_2,'String'));
                            InitialWidth_pix(1,3) = eval(get(h.FWHM_MG_3,'String'));
                            InitialWidth_pix(1,4) = eval(get(h.FWHM_MG_4,'String'));
                            if get(h.Gaussian_Dist_Check,'Value') == 1
                                InitialWidth_pix =  InitialWidth_pix/2.355;
                            else
                                InitialWidth_pix =  InitialWidth_pix/2;
                            end
                            
                            
                            
                            %limits for initial values
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_1,'Value') == 1)
                                x_max_lim_p_1 = eval(get(h.x_max_Picture_lim_p_1,'String'));
                                x_max_lim_n_1 = eval(get(h.x_max_Picture_lim_n_1,'String'));
                            else
                                x_max_lim_p_1 = eval(get(h.x_max_Picture_1,'String'));
                                x_max_lim_n_1 = eval(get(h.x_max_Picture_1,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_1,'Value') == 1)
                                I_max_lim_p_1 = eval(get(h.max_I_MG_lim_p_1,'String'));
                                I_max_lim_n_1 = eval(get(h.max_I_MG_lim_n_1,'String'));
                            else
                                I_max_lim_p_1 = eval(get(h.max_I_MG_1,'String'));
                                I_max_lim_n_1 = eval(get(h.max_I_MG_1,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_1,'Value') == 1)
                                FWHM_p_1 = InitialWidth_pix(1,1) + 1;
                                FWHM_n_1 = InitialWidth_pix(1,1) - 1;
                            else
                                FWHM_p_1 = InitialWidth_pix(1,1);
                                FWHM_n_1 = InitialWidth_pix(1,1)-0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_2,'Value') == 1)
                                x_max_lim_p_2 = eval(get(h.x_max_Picture_lim_p_2,'String'));
                                x_max_lim_n_2 = eval(get(h.x_max_Picture_lim_n_2,'String'));
                            else
                                x_max_lim_p_2 = eval(get(h.x_max_Picture_2,'String'));
                                x_max_lim_n_2 = eval(get(h.x_max_Picture_2,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_2,'Value') == 1)
                                I_max_lim_p_2 = eval(get(h.max_I_MG_lim_p_2,'String'));
                                I_max_lim_n_2 = eval(get(h.max_I_MG_lim_n_2,'String'));
                            else
                                I_max_lim_p_2 = eval(get(h.max_I_MG_2,'String'));
                                I_max_lim_n_2 = eval(get(h.max_I_MG_2,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_2,'Value') == 1)
                                FWHM_p_2 = InitialWidth_pix(1,2) + 1;
                                FWHM_n_2 = InitialWidth_pix(1,2) - 1;
                            else
                                FWHM_p_2 = InitialWidth_pix(1,2);
                                FWHM_n_2 = InitialWidth_pix(1,2)-0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_3,'Value') == 1)
                                x_max_lim_p_3 = eval(get(h.x_max_Picture_lim_p_3,'String'));
                                x_max_lim_n_3 = eval(get(h.x_max_Picture_lim_n_3,'String'));
                            else
                                x_max_lim_p_3 = eval(get(h.x_max_Picture_3,'String'));
                                x_max_lim_n_3 = eval(get(h.x_max_Picture_3,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_3,'Value') == 1)
                                I_max_lim_p_3 = eval(get(h.max_I_MG_lim_p_3,'String'));
                                I_max_lim_n_3 = eval(get(h.max_I_MG_lim_n_3,'String'));
                            else
                                I_max_lim_p_3 = eval(get(h.max_I_MG_3,'String'));
                                I_max_lim_n_3 = eval(get(h.max_I_MG_3,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_3,'Value') == 1)
                                FWHM_p_3 = InitialWidth_pix(1,3)  + 1;
                                FWHM_n_3 = InitialWidth_pix(1,3)  - 1;
                            else
                                FWHM_p_3 = InitialWidth_pix(1,3) ;
                                FWHM_n_3 = InitialWidth_pix(1,3) -0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_4,'Value') == 1)
                                x_max_lim_p_4 = eval(get(h.x_max_Picture_lim_p_4,'String'));
                                x_max_lim_n_4 = eval(get(h.x_max_Picture_lim_n_4,'String'));
                            else
                                x_max_lim_p_4 = eval(get(h.x_max_Picture_4,'String'));
                                x_max_lim_n_4 = eval(get(h.x_max_Picture_4,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_4,'Value') == 1)
                                I_max_lim_p_4 = eval(get(h.max_I_MG_lim_p_4,'String'));
                                I_max_lim_n_4 = eval(get(h.max_I_MG_lim_n_4,'String'));
                            else
                                I_max_lim_p_4 = eval(get(h.max_I_MG_4,'String'));
                                I_max_lim_n_4 = eval(get(h.max_I_MG_4,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_4,'Value') == 1)
                                FWHM_p_4 = InitialWidth_pix(1,4) + 1;
                                FWHM_n_4 = InitialWidth_pix(1,4) - 1;
                            else
                                FWHM_p_4 = InitialWidth_pix(1,4);
                                FWHM_n_4 = InitialWidth_pix(1,4)-0.000001;
                            end
                            
                            %Definition of Startpoint and limits
                            StartPoints = [max_I1-Background,x_max1,max_I2-Background,x_max2,max_I3-Background,x_max3,max_I4-Background,x_max4,InitialWidth_pix(1,1),InitialWidth_pix(1,2),InitialWidth_pix(1,3),InitialWidth_pix(1,4),Background];
                            Lower_I =  [I_max_lim_n_1,x_max_lim_n_1,I_max_lim_n_2,x_max_lim_n_2,I_max_lim_n_3,x_max_lim_n_3,I_max_lim_n_4,x_max_lim_n_4,FWHM_n_1,FWHM_n_2,FWHM_n_3,FWHM_n_4,Background-0.000001];
                            Upper_I =  [I_max_lim_p_1,x_max_lim_p_1,I_max_lim_p_2,x_max_lim_p_2,I_max_lim_p_3,x_max_lim_p_3,I_max_lim_p_4,x_max_lim_p_4,FWHM_p_1,FWHM_p_2,FWHM_p_3,FWHM_p_4,Background+0.000001];
                            
                        case 5
                            max_I1 = max_I;
                            x_max1 = eval(get(h.x_max_Picture_1,'String'));
                            max_I2 = eval(get(h.max_I_MG_2,'String'));
                            x_max2 = eval(get(h.x_max_Picture_2,'String'));
                            max_I3 = eval(get(h.max_I_MG_3,'String'));
                            x_max3 = eval(get(h.x_max_Picture_3,'String'));
                            max_I4 = eval(get(h.max_I_MG_4,'String'));
                            x_max4 = eval(get(h.x_max_Picture_4,'String'));
                            max_I5 = eval(get(h.max_I_MG_5,'String'));
                            x_max5 = eval(get(h.x_max_Picture_5,'String'));
                            InitialWidth_pix(1,1) = eval(get(h.FWHM_MG_1,'String'));
                            InitialWidth_pix(1,2) = eval(get(h.FWHM_MG_2,'String'));
                            InitialWidth_pix(1,3) = eval(get(h.FWHM_MG_3,'String'));
                            InitialWidth_pix(1,4) = eval(get(h.FWHM_MG_4,'String'));
                            InitialWidth_pix(1,5) = eval(get(h.FWHM_MG_5,'String'));
                            if get(h.Gaussian_Dist_Check,'Value') == 1
                                InitialWidth_pix =  InitialWidth_pix/2.355;
                            else
                                InitialWidth_pix =  InitialWidth_pix/2;
                            end
                            
                            %limits for initial values
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_1,'Value') == 1)
                                x_max_lim_p_1 = eval(get(h.x_max_Picture_lim_p_1,'String'));
                                x_max_lim_n_1 = eval(get(h.x_max_Picture_lim_n_1,'String'));
                            else
                                x_max_lim_p_1 = eval(get(h.x_max_Picture_1,'String'));
                                x_max_lim_n_1 = eval(get(h.x_max_Picture_1,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_1,'Value') == 1)
                                I_max_lim_p_1 = eval(get(h.max_I_MG_lim_p_1,'String'));
                                I_max_lim_n_1 = eval(get(h.max_I_MG_lim_n_1,'String'));
                            else
                                I_max_lim_p_1 = eval(get(h.max_I_MG_1,'String'));
                                I_max_lim_n_1 = eval(get(h.max_I_MG_1,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_1,'Value') == 1)
                                FWHM_p_1 = InitialWidth_pix(1,1) + 1;
                                FWHM_n_1 = InitialWidth_pix(1,1) - 1;
                            else
                                FWHM_p_1 = InitialWidth_pix(1,1);
                                FWHM_n_1 = InitialWidth_pix(1,1)-0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_2,'Value') == 1)
                                x_max_lim_p_2 = eval(get(h.x_max_Picture_lim_p_2,'String'));
                                x_max_lim_n_2 = eval(get(h.x_max_Picture_lim_n_2,'String'));
                            else
                                x_max_lim_p_2 = eval(get(h.x_max_Picture_2,'String'));
                                x_max_lim_n_2 = eval(get(h.x_max_Picture_2,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_2,'Value') == 1)
                                I_max_lim_p_2 = eval(get(h.max_I_MG_lim_p_2,'String'));
                                I_max_lim_n_2 = eval(get(h.max_I_MG_lim_n_2,'String'));
                            else
                                I_max_lim_p_2 = eval(get(h.max_I_MG_2,'String'));
                                I_max_lim_n_2 = eval(get(h.max_I_MG_2,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_2,'Value') == 1)
                                FWHM_p_2 = InitialWidth_pix(1,2) + 1;
                                FWHM_n_2 = InitialWidth_pix(1,2) - 1;
                            else
                                FWHM_p_2 = InitialWidth_pix(1,2);
                                FWHM_n_2 = InitialWidth_pix(1,2)-0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_3,'Value') == 1)
                                x_max_lim_p_3 = eval(get(h.x_max_Picture_lim_p_3,'String'));
                                x_max_lim_n_3 = eval(get(h.x_max_Picture_lim_n_3,'String'));
                            else
                                x_max_lim_p_3 = eval(get(h.x_max_Picture_3,'String'));
                                x_max_lim_n_3 = eval(get(h.x_max_Picture_3,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_3,'Value') == 1)
                                I_max_lim_p_3 = eval(get(h.max_I_MG_lim_p_3,'String'));
                                I_max_lim_n_3 = eval(get(h.max_I_MG_lim_n_3,'String'));
                            else
                                I_max_lim_p_3 = eval(get(h.max_I_MG_3,'String'));
                                I_max_lim_n_3 = eval(get(h.max_I_MG_3,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_3,'Value') == 1)
                                FWHM_p_3 = InitialWidth_pix(1,3)  + 1;
                                FWHM_n_3 = InitialWidth_pix(1,3)  - 1;
                            else
                                FWHM_p_3 = InitialWidth_pix(1,3) ;
                                FWHM_n_3 = InitialWidth_pix(1,3) -0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_4,'Value') == 1)
                                x_max_lim_p_4 = eval(get(h.x_max_Picture_lim_p_4,'String'));
                                x_max_lim_n_4 = eval(get(h.x_max_Picture_lim_n_4,'String'));
                            else
                                x_max_lim_p_4 = eval(get(h.x_max_Picture_4,'String'));
                                x_max_lim_n_4 = eval(get(h.x_max_Picture_4,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_4,'Value') == 1)
                                I_max_lim_p_4 = eval(get(h.max_I_MG_lim_p_4,'String'));
                                I_max_lim_n_4 = eval(get(h.max_I_MG_lim_n_4,'String'));
                            else
                                I_max_lim_p_4 = eval(get(h.max_I_MG_4,'String'));
                                I_max_lim_n_4 = eval(get(h.max_I_MG_4,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_4,'Value') == 1)
                                FWHM_p_4 = InitialWidth_pix(1,4) + 1;
                                FWHM_n_4 = InitialWidth_pix(1,4) - 1;
                            else
                                FWHM_p_4 = InitialWidth_pix(1,4);
                                FWHM_n_4 = InitialWidth_pix(1,4)-0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_5,'Value') == 1)
                                x_max_lim_p_5 = eval(get(h.x_max_Picture_lim_p_5,'String'));
                                x_max_lim_n_5 = eval(get(h.x_max_Picture_lim_n_5,'String'));
                            else
                                x_max_lim_p_5 = eval(get(h.x_max_Picture_5,'String'));
                                x_max_lim_n_5 = eval(get(h.x_max_Picture_5,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_5,'Value') == 1)
                                I_max_lim_p_5 = eval(get(h.max_I_MG_lim_p_5,'String'));
                                I_max_lim_n_5 = eval(get(h.max_I_MG_lim_n_5,'String'));
                            else
                                I_max_lim_p_5 = eval(get(h.max_I_MG_5,'String'));
                                I_max_lim_n_5 = eval(get(h.max_I_MG_5,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_5,'Value') == 1)
                                FWHM_p_5 = InitialWidth_pix(1,5) + 1;
                                FWHM_n_5 = InitialWidth_pix(1,5) - 1;
                            else
                                FWHM_p_5 = InitialWidth_pix(1,5);
                                FWHM_n_5 = InitialWidth_pix(1,5)-0.000001;
                            end
                            
                            
                            %Definition of Startpoint and limits
                            StartPoints = [max_I1-Background,x_max1,max_I2-Background,x_max2,max_I3-Background,x_max3,max_I4-Background,x_max4,max_I5-Background,x_max5,InitialWidth_pix(1,1),InitialWidth_pix(1,2),InitialWidth_pix(1,3),InitialWidth_pix(1,4),InitialWidth_pix(1,5),Background];
                            Lower_I =  [I_max_lim_n_1,x_max_lim_n_1,I_max_lim_n_2,x_max_lim_n_2,I_max_lim_n_3,x_max_lim_n_3,I_max_lim_n_4,x_max_lim_n_4,I_max_lim_n_5,x_max_lim_n_5,FWHM_n_1,FWHM_n_2,FWHM_n_3,FWHM_n_4,FWHM_n_5,Background-0.000001];
                            Upper_I =  [I_max_lim_p_1,x_max_lim_p_1,I_max_lim_p_2,x_max_lim_p_2,I_max_lim_p_3,x_max_lim_p_3,I_max_lim_p_4,x_max_lim_p_4,I_max_lim_p_5,x_max_lim_p_5,FWHM_p_1,FWHM_p_2,FWHM_p_3,FWHM_p_4,FWHM_p_5,Background+0.000001];
                            
                        case 6
                            max_I1 = max_I;
                            x_max1 = eval(get(h.x_max_Picture_1,'String'));
                            max_I2 = eval(get(h.max_I_MG_2,'String'));
                            x_max2 = eval(get(h.x_max_Picture_2,'String'));
                            max_I3 = eval(get(h.max_I_MG_3,'String'));
                            x_max3 = eval(get(h.x_max_Picture_3,'String'));
                            max_I4 = eval(get(h.max_I_MG_4,'String'));
                            x_max4 = eval(get(h.x_max_Picture_4,'String'));
                            max_I5 = eval(get(h.max_I_MG_5,'String'));
                            x_max5 = eval(get(h.x_max_Picture_5,'String'));
                            max_I6 = eval(get(h.max_I_MG_6,'String'));
                            x_max6 = eval(get(h.x_max_Picture_6,'String'));
                            InitialWidth_pix(1,1) = eval(get(h.FWHM_MG_1,'String'));
                            InitialWidth_pix(1,2) = eval(get(h.FWHM_MG_2,'String'));
                            InitialWidth_pix(1,3) = eval(get(h.FWHM_MG_3,'String'));
                            InitialWidth_pix(1,4) = eval(get(h.FWHM_MG_4,'String'));
                            InitialWidth_pix(1,5) = eval(get(h.FWHM_MG_5,'String'));
                            InitialWidth_pix(1,6) = eval(get(h.FWHM_MG_6,'String'));
                            if get(h.Gaussian_Dist_Check,'Value') == 1
                                InitialWidth_pix =  InitialWidth_pix/2.355;
                            else
                                InitialWidth_pix =  InitialWidth_pix/2;
                            end
                            
                            %limits for initial values
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_1,'Value') == 1)
                                x_max_lim_p_1 = eval(get(h.x_max_Picture_lim_p_1,'String'));
                                x_max_lim_n_1 = eval(get(h.x_max_Picture_lim_n_1,'String'));
                            else
                                x_max_lim_p_1 = eval(get(h.x_max_Picture_1,'String'));
                                x_max_lim_n_1 = eval(get(h.x_max_Picture_1,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_1,'Value') == 1)
                                I_max_lim_p_1 = eval(get(h.max_I_MG_lim_p_1,'String'));
                                I_max_lim_n_1 = eval(get(h.max_I_MG_lim_n_1,'String'));
                            else
                                I_max_lim_p_1 = eval(get(h.max_I_MG_1,'String'));
                                I_max_lim_n_1 = eval(get(h.max_I_MG_1,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_1,'Value') == 1)
                                FWHM_p_1 = InitialWidth_pix(1,1) + 1;
                                FWHM_n_1 = InitialWidth_pix(1,1) - 1;
                            else
                                FWHM_p_1 = InitialWidth_pix(1,1);
                                FWHM_n_1 = InitialWidth_pix(1,1)-0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_2,'Value') == 1)
                                x_max_lim_p_2 = eval(get(h.x_max_Picture_lim_p_2,'String'));
                                x_max_lim_n_2 = eval(get(h.x_max_Picture_lim_n_2,'String'));
                            else
                                x_max_lim_p_2 = eval(get(h.x_max_Picture_2,'String'));
                                x_max_lim_n_2 = eval(get(h.x_max_Picture_2,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_2,'Value') == 1)
                                I_max_lim_p_2 = eval(get(h.max_I_MG_lim_p_2,'String'));
                                I_max_lim_n_2 = eval(get(h.max_I_MG_lim_n_2,'String'));
                            else
                                I_max_lim_p_2 = eval(get(h.max_I_MG_2,'String'));
                                I_max_lim_n_2 = eval(get(h.max_I_MG_2,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_2,'Value') == 1)
                                FWHM_p_2 = InitialWidth_pix(1,2) + 1;
                                FWHM_n_2 = InitialWidth_pix(1,2) - 1;
                            else
                                FWHM_p_2 = InitialWidth_pix(1,2);
                                FWHM_n_2 = InitialWidth_pix(1,2)-0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_3,'Value') == 1)
                                x_max_lim_p_3 = eval(get(h.x_max_Picture_lim_p_3,'String'));
                                x_max_lim_n_3 = eval(get(h.x_max_Picture_lim_n_3,'String'));
                            else
                                x_max_lim_p_3 = eval(get(h.x_max_Picture_3,'String'));
                                x_max_lim_n_3 = eval(get(h.x_max_Picture_3,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_3,'Value') == 1)
                                I_max_lim_p_3 = eval(get(h.max_I_MG_lim_p_3,'String'));
                                I_max_lim_n_3 = eval(get(h.max_I_MG_lim_n_3,'String'));
                            else
                                I_max_lim_p_3 = eval(get(h.max_I_MG_3,'String'));
                                I_max_lim_n_3 = eval(get(h.max_I_MG_3,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_3,'Value') == 1)
                                FWHM_p_3 = InitialWidth_pix(1,3)  + 1;
                                FWHM_n_3 = InitialWidth_pix(1,3)  - 1;
                            else
                                FWHM_p_3 = InitialWidth_pix(1,3) ;
                                FWHM_n_3 = InitialWidth_pix(1,3) -0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_4,'Value') == 1)
                                x_max_lim_p_4 = eval(get(h.x_max_Picture_lim_p_4,'String'));
                                x_max_lim_n_4 = eval(get(h.x_max_Picture_lim_n_4,'String'));
                            else
                                x_max_lim_p_4 = eval(get(h.x_max_Picture_4,'String'));
                                x_max_lim_n_4 = eval(get(h.x_max_Picture_4,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_4,'Value') == 1)
                                I_max_lim_p_4 = eval(get(h.max_I_MG_lim_p_4,'String'));
                                I_max_lim_n_4 = eval(get(h.max_I_MG_lim_n_4,'String'));
                            else
                                I_max_lim_p_4 = eval(get(h.max_I_MG_4,'String'));
                                I_max_lim_n_4 = eval(get(h.max_I_MG_4,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_4,'Value') == 1)
                                FWHM_p_4 = InitialWidth_pix(1,4) + 1;
                                FWHM_n_4 = InitialWidth_pix(1,4) - 1;
                            else
                                FWHM_p_4 = InitialWidth_pix(1,4);
                                FWHM_n_4 = InitialWidth_pix(1,4)-0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_5,'Value') == 1)
                                x_max_lim_p_5 = eval(get(h.x_max_Picture_lim_p_5,'String'));
                                x_max_lim_n_5 = eval(get(h.x_max_Picture_lim_n_5,'String'));
                            else
                                x_max_lim_p_5 = eval(get(h.x_max_Picture_5,'String'));
                                x_max_lim_n_5 = eval(get(h.x_max_Picture_5,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_5,'Value') == 1)
                                I_max_lim_p_5 = eval(get(h.max_I_MG_lim_p_5,'String'));
                                I_max_lim_n_5 = eval(get(h.max_I_MG_lim_n_5,'String'));
                            else
                                I_max_lim_p_5 = eval(get(h.max_I_MG_5,'String'));
                                I_max_lim_n_5 = eval(get(h.max_I_MG_5,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_5,'Value') == 1)
                                FWHM_p_5 = InitialWidth_pix(1,5) + 1;
                                FWHM_n_5 = InitialWidth_pix(1,5) - 1;
                            else
                                FWHM_p_5 = InitialWidth_pix(1,5);
                                FWHM_n_5 = InitialWidth_pix(1,5)-0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_6,'Value') == 1)
                                x_max_lim_p_6 = eval(get(h.x_max_Picture_lim_p_6,'String'));
                                x_max_lim_n_6 = eval(get(h.x_max_Picture_lim_n_6,'String'));
                            else
                                x_max_lim_p_6 = eval(get(h.x_max_Picture_6,'String'));
                                x_max_lim_n_6 = eval(get(h.x_max_Picture_6,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_6,'Value') == 1)
                                I_max_lim_p_6 = eval(get(h.max_I_MG_lim_p_6,'String'));
                                I_max_lim_n_6 = eval(get(h.max_I_MG_lim_n_6,'String'));
                            else
                                I_max_lim_p_6 = eval(get(h.max_I_MG_6,'String'));
                                I_max_lim_n_6 = eval(get(h.max_I_MG_6,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_6,'Value') == 1)
                                FWHM_p_6 = InitialWidth_pix(1,6) + 1;
                                FWHM_n_6 = InitialWidth_pix(1,6) - 1;
                            else
                                FWHM_p_6 = InitialWidth_pix(1,6);
                                FWHM_n_6 = InitialWidth_pix(1,6)-0.000001;
                            end
                            
                            %Definition of Startpoint and limits
                            StartPoints = [max_I1-Background,x_max1,max_I2-Background,x_max2,max_I3-Background,x_max3,max_I4-Background,x_max4,max_I5-Background,x_max5,max_I6-Background,x_max6,InitialWidth_pix(1,1),InitialWidth_pix(1,2),InitialWidth_pix(1,3),InitialWidth_pix(1,4),InitialWidth_pix(1,5),InitialWidth_pix(1,6),Background];
                            Lower_I =  [I_max_lim_n_1,x_max_lim_n_1,I_max_lim_n_2,x_max_lim_n_2,I_max_lim_n_3,x_max_lim_n_3,I_max_lim_n_4,x_max_lim_n_4,I_max_lim_n_5,x_max_lim_n_5,I_max_lim_n_6,x_max_lim_n_6,FWHM_n_1,FWHM_n_2,FWHM_n_3,FWHM_n_4,FWHM_n_5,FWHM_n_6,Background-0.000001];
                            Upper_I =  [I_max_lim_p_1,x_max_lim_p_1,I_max_lim_p_2,x_max_lim_p_2,I_max_lim_p_3,x_max_lim_p_3,I_max_lim_p_4,x_max_lim_p_4,I_max_lim_p_5,x_max_lim_p_5,I_max_lim_p_6,x_max_lim_p_6,FWHM_p_1,FWHM_p_2,FWHM_p_3,FWHM_p_4,FWHM_p_5,FWHM_p_6,Background+0.000001];
                        case 7
                            max_I1 = max_I;
                            x_max1 = eval(get(h.x_max_Picture_1,'String'));
                            max_I2 = eval(get(h.max_I_MG_2,'String'));
                            x_max2 = eval(get(h.x_max_Picture_2,'String'));
                            max_I3 = eval(get(h.max_I_MG_3,'String'));
                            x_max3 = eval(get(h.x_max_Picture_3,'String'));
                            max_I4 = eval(get(h.max_I_MG_4,'String'));
                            x_max4 = eval(get(h.x_max_Picture_4,'String'));
                            max_I5 = eval(get(h.max_I_MG_5,'String'));
                            x_max5 = eval(get(h.x_max_Picture_5,'String'));
                            max_I6 = eval(get(h.max_I_MG_6,'String'));
                            x_max6 = eval(get(h.x_max_Picture_6,'String'));
                            max_I7 = eval(get(h.max_I_MG_7,'String'));
                            x_max7 = eval(get(h.x_max_Picture_7,'String'));
                            InitialWidth_pix(1,1) = eval(get(h.FWHM_MG_1,'String'));
                            InitialWidth_pix(1,2) = eval(get(h.FWHM_MG_2,'String'));
                            InitialWidth_pix(1,3) = eval(get(h.FWHM_MG_3,'String'));
                            InitialWidth_pix(1,4) = eval(get(h.FWHM_MG_4,'String'));
                            InitialWidth_pix(1,5) = eval(get(h.FWHM_MG_5,'String'));
                            InitialWidth_pix(1,6) = eval(get(h.FWHM_MG_6,'String'));
                            InitialWidth_pix(1,7) = eval(get(h.FWHM_MG_7,'String'));
                            if get(h.Gaussian_Dist_Check,'Value') == 1
                                InitialWidth_pix =  InitialWidth_pix/2.355;
                            else
                                InitialWidth_pix =  InitialWidth_pix/2;
                            end
                            
                            %limits for initial values
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_1,'Value') == 1)
                                x_max_lim_p_1 = eval(get(h.x_max_Picture_lim_p_1,'String'));
                                x_max_lim_n_1 = eval(get(h.x_max_Picture_lim_n_1,'String'));
                            else
                                x_max_lim_p_1 = eval(get(h.x_max_Picture_1,'String'));
                                x_max_lim_n_1 = eval(get(h.x_max_Picture_1,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_1,'Value') == 1)
                                I_max_lim_p_1 = eval(get(h.max_I_MG_lim_p_1,'String'));
                                I_max_lim_n_1 = eval(get(h.max_I_MG_lim_n_1,'String'));
                            else
                                I_max_lim_p_1 = eval(get(h.max_I_MG_1,'String'));
                                I_max_lim_n_1 = eval(get(h.max_I_MG_1,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_1,'Value') == 1)
                                FWHM_p_1 = InitialWidth_pix(1,1) + 1;
                                FWHM_n_1 = InitialWidth_pix(1,1) - 1;
                            else
                                FWHM_p_1 = InitialWidth_pix(1,1);
                                FWHM_n_1 = InitialWidth_pix(1,1)-0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_2,'Value') == 1)
                                x_max_lim_p_2 = eval(get(h.x_max_Picture_lim_p_2,'String'));
                                x_max_lim_n_2 = eval(get(h.x_max_Picture_lim_n_2,'String'));
                            else
                                x_max_lim_p_2 = eval(get(h.x_max_Picture_2,'String'));
                                x_max_lim_n_2 = eval(get(h.x_max_Picture_2,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_2,'Value') == 1)
                                I_max_lim_p_2 = eval(get(h.max_I_MG_lim_p_2,'String'));
                                I_max_lim_n_2 = eval(get(h.max_I_MG_lim_n_2,'String'));
                            else
                                I_max_lim_p_2 = eval(get(h.max_I_MG_2,'String'));
                                I_max_lim_n_2 = eval(get(h.max_I_MG_2,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_2,'Value') == 1)
                                FWHM_p_2 = InitialWidth_pix(1,2) + 1;
                                FWHM_n_2 = InitialWidth_pix(1,2) - 1;
                            else
                                FWHM_p_2 = InitialWidth_pix(1,2);
                                FWHM_n_2 = InitialWidth_pix(1,2)-0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_3,'Value') == 1)
                                x_max_lim_p_3 = eval(get(h.x_max_Picture_lim_p_3,'String'));
                                x_max_lim_n_3 = eval(get(h.x_max_Picture_lim_n_3,'String'));
                            else
                                x_max_lim_p_3 = eval(get(h.x_max_Picture_3,'String'));
                                x_max_lim_n_3 = eval(get(h.x_max_Picture_3,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_3,'Value') == 1)
                                I_max_lim_p_3 = eval(get(h.max_I_MG_lim_p_3,'String'));
                                I_max_lim_n_3 = eval(get(h.max_I_MG_lim_n_3,'String'));
                            else
                                I_max_lim_p_3 = eval(get(h.max_I_MG_3,'String'));
                                I_max_lim_n_3 = eval(get(h.max_I_MG_3,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_3,'Value') == 1)
                                FWHM_p_3 = InitialWidth_pix(1,3)  + 1;
                                FWHM_n_3 = InitialWidth_pix(1,3)  - 1;
                            else
                                FWHM_p_3 = InitialWidth_pix(1,3) ;
                                FWHM_n_3 = InitialWidth_pix(1,3) -0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_4,'Value') == 1)
                                x_max_lim_p_4 = eval(get(h.x_max_Picture_lim_p_4,'String'));
                                x_max_lim_n_4 = eval(get(h.x_max_Picture_lim_n_4,'String'));
                            else
                                x_max_lim_p_4 = eval(get(h.x_max_Picture_4,'String'));
                                x_max_lim_n_4 = eval(get(h.x_max_Picture_4,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_4,'Value') == 1)
                                I_max_lim_p_4 = eval(get(h.max_I_MG_lim_p_4,'String'));
                                I_max_lim_n_4 = eval(get(h.max_I_MG_lim_n_4,'String'));
                            else
                                I_max_lim_p_4 = eval(get(h.max_I_MG_4,'String'));
                                I_max_lim_n_4 = eval(get(h.max_I_MG_4,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_4,'Value') == 1)
                                FWHM_p_4 = InitialWidth_pix(1,4) + 1;
                                FWHM_n_4 = InitialWidth_pix(1,4) - 1;
                            else
                                FWHM_p_4 = InitialWidth_pix(1,4);
                                FWHM_n_4 = InitialWidth_pix(1,4)-0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_5,'Value') == 1)
                                x_max_lim_p_5 = eval(get(h.x_max_Picture_lim_p_5,'String'));
                                x_max_lim_n_5 = eval(get(h.x_max_Picture_lim_n_5,'String'));
                            else
                                x_max_lim_p_5 = eval(get(h.x_max_Picture_5,'String'));
                                x_max_lim_n_5 = eval(get(h.x_max_Picture_5,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_5,'Value') == 1)
                                I_max_lim_p_5 = eval(get(h.max_I_MG_lim_p_5,'String'));
                                I_max_lim_n_5 = eval(get(h.max_I_MG_lim_n_5,'String'));
                            else
                                I_max_lim_p_5 = eval(get(h.max_I_MG_5,'String'));
                                I_max_lim_n_5 = eval(get(h.max_I_MG_5,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_5,'Value') == 1)
                                FWHM_p_5 = InitialWidth_pix(1,5) + 1;
                                FWHM_n_5 = InitialWidth_pix(1,5) - 1;
                            else
                                FWHM_p_5 = InitialWidth_pix(1,5);
                                FWHM_n_5 = InitialWidth_pix(1,5)-0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_6,'Value') == 1)
                                x_max_lim_p_6 = eval(get(h.x_max_Picture_lim_p_6,'String'));
                                x_max_lim_n_6 = eval(get(h.x_max_Picture_lim_n_6,'String'));
                            else
                                x_max_lim_p_6 = eval(get(h.x_max_Picture_6,'String'));
                                x_max_lim_n_6 = eval(get(h.x_max_Picture_6,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_6,'Value') == 1)
                                I_max_lim_p_6 = eval(get(h.max_I_MG_lim_p_6,'String'));
                                I_max_lim_n_6 = eval(get(h.max_I_MG_lim_n_6,'String'));
                            else
                                I_max_lim_p_6 = eval(get(h.max_I_MG_6,'String'));
                                I_max_lim_n_6 = eval(get(h.max_I_MG_6,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_6,'Value') == 1)
                                FWHM_p_6 = InitialWidth_pix(1,6) + 1;
                                FWHM_n_6 = InitialWidth_pix(1,6) - 1;
                            else
                                FWHM_p_6 = InitialWidth_pix(1,6);
                                FWHM_n_6 = InitialWidth_pix(1,6)-0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_7,'Value') == 1)
                                x_max_lim_p_7 = eval(get(h.x_max_Picture_lim_p_7,'String'));
                                x_max_lim_n_7 = eval(get(h.x_max_Picture_lim_n_7,'String'));
                            else
                                x_max_lim_p_7 = eval(get(h.x_max_Picture_7,'String'));
                                x_max_lim_n_7 = eval(get(h.x_max_Picture_7,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_7,'Value') == 1)
                                I_max_lim_p_7 = eval(get(h.max_I_MG_lim_p_7,'String'));
                                I_max_lim_n_7 = eval(get(h.max_I_MG_lim_n_7,'String'));
                            else
                                I_max_lim_p_7 = eval(get(h.max_I_MG_7,'String'));
                                I_max_lim_n_7 = eval(get(h.max_I_MG_7,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_7,'Value') == 1)
                                FWHM_p_7 = InitialWidth_pix(1,7) + 1;
                                FWHM_n_7 = InitialWidth_pix(1,7) - 1;
                            else
                                FWHM_p_7 = InitialWidth_pix(1,7);
                                FWHM_n_7 = InitialWidth_pix(1,7)-0.000001;
                            end
                            
                            %Definition of Startpoint and limits
                            StartPoints = [max_I1-Background,x_max1,max_I2-Background,x_max2,max_I3-Background,x_max3,max_I4-Background,x_max4,max_I5-Background,x_max5,max_I6-Background,x_max6,max_I7-Background,x_max7,InitialWidth_pix(1,1),InitialWidth_pix(1,2),InitialWidth_pix(1,3),InitialWidth_pix(1,4),InitialWidth_pix(1,5),InitialWidth_pix(1,6),InitialWidth_pix(1,7),Background];
                            Lower_I = [I_max_lim_n_1,x_max_lim_n_1,I_max_lim_n_2,x_max_lim_n_2,I_max_lim_n_3,x_max_lim_n_3,I_max_lim_n_4,x_max_lim_n_4,I_max_lim_n_5,x_max_lim_n_5,I_max_lim_n_6,x_max_lim_n_6,I_max_lim_n_7,x_max_lim_n_7,FWHM_n_1,FWHM_n_2,FWHM_n_3,FWHM_n_4,FWHM_n_5,FWHM_n_6,FWHM_n_7,Background-0.000001];
                            Upper_I = [I_max_lim_p_1,x_max_lim_p_1,I_max_lim_p_2,x_max_lim_p_2,I_max_lim_p_3,x_max_lim_p_3,I_max_lim_p_4,x_max_lim_p_4,I_max_lim_p_5,x_max_lim_p_5,I_max_lim_p_6,x_max_lim_p_6,I_max_lim_p_7,x_max_lim_p_7,FWHM_p_1,FWHM_p_2,FWHM_p_3,FWHM_p_4,FWHM_p_5,FWHM_p_6,FWHM_p_7,Background+0.000001];
                        case 8
                            max_I1 = max_I;
                            x_max1 = eval(get(h.x_max_Picture_1,'String'));
                            max_I2 = eval(get(h.max_I_MG_2,'String'));
                            x_max2 = eval(get(h.x_max_Picture_2,'String'));
                            max_I3 = eval(get(h.max_I_MG_3,'String'));
                            x_max3 = eval(get(h.x_max_Picture_3,'String'));
                            max_I4 = eval(get(h.max_I_MG_4,'String'));
                            x_max4 = eval(get(h.x_max_Picture_4,'String'));
                            max_I5 = eval(get(h.max_I_MG_5,'String'));
                            x_max5 = eval(get(h.x_max_Picture_5,'String'));
                            max_I6 = eval(get(h.max_I_MG_6,'String'));
                            x_max6 = eval(get(h.x_max_Picture_6,'String'));
                            max_I7 = eval(get(h.max_I_MG_7,'String'));
                            x_max7 = eval(get(h.x_max_Picture_7,'String'));
                            max_I8 = eval(get(h.max_I_MG_8,'String'));
                            x_max8 = eval(get(h.x_max_Picture_8,'String'));
                            InitialWidth_pix(1,1) = eval(get(h.FWHM_MG_1,'String'));
                            InitialWidth_pix(1,2) = eval(get(h.FWHM_MG_2,'String'));
                            InitialWidth_pix(1,3) = eval(get(h.FWHM_MG_3,'String'));
                            InitialWidth_pix(1,4) = eval(get(h.FWHM_MG_4,'String'));
                            InitialWidth_pix(1,5) = eval(get(h.FWHM_MG_5,'String'));
                            InitialWidth_pix(1,6) = eval(get(h.FWHM_MG_6,'String'));
                            InitialWidth_pix(1,7) = eval(get(h.FWHM_MG_7,'String'));
                            InitialWidth_pix(1,8) = eval(get(h.FWHM_MG_8,'String'));
                            if get(h.Gaussian_Dist_Check,'Value') == 1
                                InitialWidth_pix =  InitialWidth_pix/2.355;
                            else
                                InitialWidth_pix =  InitialWidth_pix/2;
                            end
                            
                            %limits for initial values
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_1,'Value') == 1)
                                x_max_lim_p_1 = eval(get(h.x_max_Picture_lim_p_1,'String'));
                                x_max_lim_n_1 = eval(get(h.x_max_Picture_lim_n_1,'String'));
                            else
                                x_max_lim_p_1 = eval(get(h.x_max_Picture_1,'String'));
                                x_max_lim_n_1 = eval(get(h.x_max_Picture_1,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_1,'Value') == 1)
                                I_max_lim_p_1 = eval(get(h.max_I_MG_lim_p_1,'String'));
                                I_max_lim_n_1 = eval(get(h.max_I_MG_lim_n_1,'String'));
                            else
                                I_max_lim_p_1 = eval(get(h.max_I_MG_1,'String'));
                                I_max_lim_n_1 = eval(get(h.max_I_MG_1,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_1,'Value') == 1)
                                FWHM_p_1 = InitialWidth_pix(1,1) + 1;
                                FWHM_n_1 = InitialWidth_pix(1,1) - 1;
                            else
                                FWHM_p_1 = InitialWidth_pix(1,1);
                                FWHM_n_1 =  InitialWidth_pix(1,1)-0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_2,'Value') == 1)
                                x_max_lim_p_2 = eval(get(h.x_max_Picture_lim_p_2,'String'));
                                x_max_lim_n_2 = eval(get(h.x_max_Picture_lim_n_2,'String'));
                            else
                                x_max_lim_p_2 = eval(get(h.x_max_Picture_2,'String'));
                                x_max_lim_n_2 = eval(get(h.x_max_Picture_2,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_2,'Value') == 1)
                                I_max_lim_p_2 = eval(get(h.max_I_MG_lim_p_2,'String'));
                                I_max_lim_n_2 = eval(get(h.max_I_MG_lim_n_2,'String'));
                            else
                                I_max_lim_p_2 = eval(get(h.max_I_MG_2,'String'));
                                I_max_lim_n_2 = eval(get(h.max_I_MG_2,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_2,'Value') == 1)
                                FWHM_p_2 = InitialWidth_pix(1,2) + 1;
                                FWHM_n_2 = InitialWidth_pix(1,2) - 1;
                            else
                                FWHM_p_2 = InitialWidth_pix(1,2);
                                FWHM_n_2 = InitialWidth_pix(1,2)-0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_3,'Value') == 1)
                                x_max_lim_p_3 = eval(get(h.x_max_Picture_lim_p_3,'String'));
                                x_max_lim_n_3 = eval(get(h.x_max_Picture_lim_n_3,'String'));
                            else
                                x_max_lim_p_3 = eval(get(h.x_max_Picture_3,'String'));
                                x_max_lim_n_3 = eval(get(h.x_max_Picture_3,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_3,'Value') == 1)
                                I_max_lim_p_3 = eval(get(h.max_I_MG_lim_p_3,'String'));
                                I_max_lim_n_3 = eval(get(h.max_I_MG_lim_n_3,'String'));
                            else
                                I_max_lim_p_3 = eval(get(h.max_I_MG_3,'String'));
                                I_max_lim_n_3 = eval(get(h.max_I_MG_3,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_3,'Value') == 1)
                                FWHM_p_3 = InitialWidth_pix(1,3)  + 1;
                                FWHM_n_3 = InitialWidth_pix(1,3)  - 1;
                            else
                                FWHM_p_3 = InitialWidth_pix(1,3) ;
                                FWHM_n_3 = InitialWidth_pix(1,3) -0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_4,'Value') == 1)
                                x_max_lim_p_4 = eval(get(h.x_max_Picture_lim_p_4,'String'));
                                x_max_lim_n_4 = eval(get(h.x_max_Picture_lim_n_4,'String'));
                            else
                                x_max_lim_p_4 = eval(get(h.x_max_Picture_4,'String'));
                                x_max_lim_n_4 = eval(get(h.x_max_Picture_4,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_4,'Value') == 1)
                                I_max_lim_p_4 = eval(get(h.max_I_MG_lim_p_4,'String'));
                                I_max_lim_n_4 = eval(get(h.max_I_MG_lim_n_4,'String'));
                            else
                                I_max_lim_p_4 = eval(get(h.max_I_MG_4,'String'));
                                I_max_lim_n_4 = eval(get(h.max_I_MG_4,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_4,'Value') == 1)
                                FWHM_p_4 = InitialWidth_pix(1,4) + 1;
                                FWHM_n_4 = InitialWidth_pix(1,4) - 1;
                            else
                                FWHM_p_4 = InitialWidth_pix(1,4);
                                FWHM_n_4 = InitialWidth_pix(1,4)-0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_5,'Value') == 1)
                                x_max_lim_p_5 = eval(get(h.x_max_Picture_lim_p_5,'String'));
                                x_max_lim_n_5 = eval(get(h.x_max_Picture_lim_n_5,'String'));
                            else
                                x_max_lim_p_5 = eval(get(h.x_max_Picture_5,'String'));
                                x_max_lim_n_5 = eval(get(h.x_max_Picture_5,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_5,'Value') == 1)
                                I_max_lim_p_5 = eval(get(h.max_I_MG_lim_p_5,'String'));
                                I_max_lim_n_5 = eval(get(h.max_I_MG_lim_n_5,'String'));
                            else
                                I_max_lim_p_5 = eval(get(h.max_I_MG_5,'String'));
                                I_max_lim_n_5 = eval(get(h.max_I_MG_5,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_5,'Value') == 1)
                                FWHM_p_5 = InitialWidth_pix(1,5) + 1;
                                FWHM_n_5 = InitialWidth_pix(1,5) - 1;
                            else
                                FWHM_p_5 = InitialWidth_pix(1,5);
                                FWHM_n_5 = InitialWidth_pix(1,5)-0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_6,'Value') == 1)
                                x_max_lim_p_6 = eval(get(h.x_max_Picture_lim_p_6,'String'));
                                x_max_lim_n_6 = eval(get(h.x_max_Picture_lim_n_6,'String'));
                            else
                                x_max_lim_p_6 = eval(get(h.x_max_Picture_6,'String'));
                                x_max_lim_n_6 = eval(get(h.x_max_Picture_6,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_6,'Value') == 1)
                                I_max_lim_p_6 = eval(get(h.max_I_MG_lim_p_6,'String'));
                                I_max_lim_n_6 = eval(get(h.max_I_MG_lim_n_6,'String'));
                            else
                                I_max_lim_p_6 = eval(get(h.max_I_MG_6,'String'));
                                I_max_lim_n_6 = eval(get(h.max_I_MG_6,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_6,'Value') == 1)
                                FWHM_p_6 = InitialWidth_pix(1,6) + 1;
                                FWHM_n_6 = InitialWidth_pix(1,6) - 1;
                            else
                                FWHM_p_6 = InitialWidth_pix(1,6);
                                FWHM_n_6 = InitialWidth_pix(1,6)-0.000001;
                            end
                            
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_7,'Value') == 1)
                                x_max_lim_p_7 = eval(get(h.x_max_Picture_lim_p_7,'String'));
                                x_max_lim_n_7 = eval(get(h.x_max_Picture_lim_n_7,'String'));
                            else
                                x_max_lim_p_7 = eval(get(h.x_max_Picture_7,'String'));
                                x_max_lim_n_7 = eval(get(h.x_max_Picture_7,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_7,'Value') == 1)
                                I_max_lim_p_7 = eval(get(h.max_I_MG_lim_p_7,'String'));
                                I_max_lim_n_7 = eval(get(h.max_I_MG_lim_n_7,'String'));
                            else
                                I_max_lim_p_7 = eval(get(h.max_I_MG_7,'String'));
                                I_max_lim_n_7 = eval(get(h.max_I_MG_7,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_7,'Value') == 1)
                                FWHM_p_7 = InitialWidth_pix(1,7) + 1;
                                FWHM_n_7 = InitialWidth_pix(1,7) - 1;
                            else
                                FWHM_p_7 = InitialWidth_pix(1,7);
                                FWHM_n_7 = InitialWidth_pix(1,7)-0.000001;
                            end
                            if get(h.name_MultiGauss_Pos_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_8,'Value') == 1)
                                x_max_lim_p_8 = eval(get(h.x_max_Picture_lim_p_8,'String'));
                                x_max_lim_n_8 = eval(get(h.x_max_Picture_lim_n_8,'String'));
                            else
                                x_max_lim_p_8 = eval(get(h.x_max_Picture_8,'String'));
                                x_max_lim_n_8 = eval(get(h.x_max_Picture_8,'String'))-0.000001;
                            end
                            if get(h.name_MultiGauss_Int_Chk_1,'Value') ==1 && (get(h.Strip_Color_MG_8,'Value') == 1)
                                I_max_lim_p_8 = eval(get(h.max_I_MG_lim_p_8,'String'));
                                I_max_lim_n_8 = eval(get(h.max_I_MG_lim_n_8,'String'));
                            else
                                I_max_lim_p_8 = eval(get(h.max_I_MG_8,'String'));
                                I_max_lim_n_8 = eval(get(h.max_I_MG_8,'String'))-0.000001;
                            end
                            if (get(h.name_MultiGauss_FWHM_Chk_1,'Value') ==1) && (get(h.Strip_Color_MG_8,'Value') == 1)
                                FWHM_p_8 = InitialWidth_pix(1,8) + 1;
                                FWHM_n_8 = InitialWidth_pix(1,8) - 1;
                            else
                                FWHM_p_8 = InitialWidth_pix(1,8);
                                FWHM_n_8 = InitialWidth_pix(1,8)-0.000001;
                            end
                            
                            %Definition of Startpoint and limits
                            StartPoints = [max_I1-Background,x_max1,max_I2-Background,x_max2,max_I3-Background,x_max3,max_I4-Background,x_max4,max_I5-Background,x_max5,max_I6-Background,x_max6,max_I7-Background,x_max7,max_I8-Background,x_max8,InitialWidth_pix(1,1),InitialWidth_pix(1,2),InitialWidth_pix(1,3),InitialWidth_pix(1,4),InitialWidth_pix(1,5),InitialWidth_pix(1,6),InitialWidth_pix(1,7),InitialWidth_pix(1,8),Background];
                            Lower_I =  [I_max_lim_n_1,x_max_lim_n_1,I_max_lim_n_2,x_max_lim_n_2,I_max_lim_n_3,x_max_lim_n_3,I_max_lim_n_4,x_max_lim_n_4,I_max_lim_n_5,x_max_lim_n_5,I_max_lim_n_6,x_max_lim_n_6,I_max_lim_n_7,x_max_lim_n_7,I_max_lim_n_8,x_max_lim_n_8,FWHM_n_1,FWHM_n_2,FWHM_n_3,FWHM_n_4,FWHM_n_5,FWHM_n_6,FWHM_n_7,FWHM_n_8,Background-0.000001];
                            Upper_I =  [I_max_lim_p_1,x_max_lim_p_1,I_max_lim_p_2,x_max_lim_p_2,I_max_lim_p_3,x_max_lim_p_3,I_max_lim_p_4,x_max_lim_p_4,I_max_lim_p_5,x_max_lim_p_5,I_max_lim_p_6,x_max_lim_p_6,I_max_lim_p_7,x_max_lim_p_7,I_max_lim_p_8,x_max_lim_p_8,FWHM_p_1,FWHM_p_2,FWHM_p_3,FWHM_p_4,FWHM_p_5,FWHM_p_6,FWHM_p_7,FWHM_p_8,Background+0.000001];
                    end
                    
                    size(squeeze(StripIntensities(i_im,:,i_Strip)))
                    
                    [FittedFunction,FitQuality] = fit(x_values',squeeze(StripIntensities(i_im,:,i_Strip))',MultiGaussFunction,'Start', StartPoints,'Lower',Lower_I,'Upper',Upper_I);
                    
                    if h.Smooth == 1
                        [FittedFunction_Smooth,FitQuality_Smooth] = fit(x_values',Intensities_Strip_Smooth',MultiGaussFunction,'Start', StartPoints);
                    end
                    
                    
                    
                    
                    
                    FittedCoefficients = coeffvalues(FittedFunction);
                    
                    if (FitQuality.rsquare >= rsquare_min)
                        if h.Gaussian_Check ==1
                            FitValid(i_im) = 1;
                            MaxPos(i_im) = FittedCoefficients(2);
                            Widths(i_im) = FittedCoefficients(3);
                            Heights(i_im) = FittedCoefficients(1);
                            Background_part(i_im)= FittedCoefficients(4);
                            MaxPosStr = num2str(MaxPos(i_im));
                            set(h.x_max_Picture_1,'String',MaxPosStr);
                            
                            max_I_bef = FittedCoefficients(1)+Background;
                            x_max_bef = FittedCoefficients(2);
                            InitialWidth_pix_bef =FittedCoefficients(3);
                            Background_bef = FittedCoefficients(4);
                            
                            RSquare(1,i_im) = FitQuality.rsquare;
                            
                            
                            RSquare(1,i_im) = FitQuality.rsquare;
                            
                        end
                        
                    else
                        if h.Gaussian_Check ==1
                            FitValid(i_im) = 0;
                            MaxPos(i_im) = 0;
                            Widths(i_im) = 0;
                            Heights(i_im) = 0;
                            Background_part(i_im)= FittedCoefficients(4);
                            
                            RSquare(1,i_im) = 0;
                            
                        end
                    end
                    
                    max_I_bef = FittedCoefficients(1)+Background;
                    x_max_bef = FittedCoefficients(2);
                    InitialWidth_pix_bef =FittedCoefficients(3);
                    Background_bef = FittedCoefficients(4);
                    
                    axes(h.PlotRS_Fig)
                    plot(StripRanges_plot,squeeze(StripIntensities(i_im,:,i_Strip)),'Parent', h.PlotRS_Fig,'LineWidth',2,'MarkerSize',2,'Color','b');
                    
                    title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotRS_Fig);
                    hold on
                    BackgroundArray = Background*ones(1,N_Strip);
                    plot(StripRanges_plot,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotRS_Fig);
                    plot(x_values,feval(FittedFunction,x_values),'Parent', h.PlotRS_Fig,'Color','r','LineStyle',':');
                    
                    Difference_plot_Fit = squeeze(StripIntensities(i_im,:,i_Strip))' - feval(FittedFunction,x_values);
                    plot(x_values,Difference_plot_Fit,'Parent', h.PlotRS_Fig,'Color','g','LineStyle',':');
                    
                    axes(h.PlotS_Fig_plot_f2)
                    plot(StripRanges_plot,squeeze(StripIntensities(i_im,:,i_Strip)),'Parent', h.PlotS_Fig_plot_f2,'LineWidth',2,'MarkerSize',2,'Color','b');
                    
                    title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f2);
                    hold on
                    
                    plot(StripRanges_plot,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Fig_plot_f2);
                    plot(x_values,feval(FittedFunction,x_values),'Parent', h.PlotS_Fig_plot_f2,'Color','r','LineStyle',':');
                    
                    plot(x_values,Difference_plot_Fit,'Parent', h.PlotS_Fig_plot_f2,'Color','g','LineStyle',':');
                    MultiGaussFunction = feval(FittedFunction,x_values);
                    
                    axes(h.PlotRS_Fig)
                    i_MultiGaussFunction1 = 0;
                    i_MultiGaussFunction2 = 0;
                    i_MultiGaussFunction3 = 0;
                    i_MultiGaussFunction4 = 0;
                    i_MultiGaussFunction5 = 0;
                    i_MultiGaussFunction6 = 0;
                    i_MultiGaussFunction7 = 0;
                    i_MultiGaussFunction8 = 0;
                    i_MultiGaussFunction = 0;
                    
                    switch h.Number_MultiGauss_val
                        case 1
                            set(h.max_I_MG_1,'String',FittedCoefficients(1,1));
                            set(h.x_max_Picture_1,'String',FittedCoefficients(1,2));
                            
                            set(h.max_I_MG_2,'Enable','off');
                            set(h.x_max_Picture_2,'Enable','off');
                            set(h.max_I_MG_3,'Enable','off');
                            set(h.x_max_Picture_3,'Enable','off');
                            set(h.max_I_MG_4,'Enable','off');
                            set(h.x_max_Picture_4,'Enable','off');
                            set(h.max_I_MG_5,'Enable','off');
                            set(h.x_max_Picture_5,'Enable','off');
                            set(h.max_I_MG_6,'Enable','off');
                            set(h.x_max_Picture_6,'Enable','off');
                            set(h.max_I_MG_7,'Enable','off');
                            set(h.x_max_Picture_7,'Enable','off');
                            set(h.max_I_MG_8,'Enable','off');
                            set(h.x_max_Picture_8,'Enable','off');
                            
                            if get(h.Gaussian_Dist_Check,'Value') == 1
                                FWHM_MG_1 =  2.355*FittedCoefficients(1,3);
                            else
                                FWHM_MG_1 =  2*FittedCoefficients(1,3);
                            end
                            MultiGaussFunction1 = feval(FittedFunction,x_values);
                            set(h.FWHM_MG_1,'String',FWHM_MG_1);
                            i_MultiGaussFunction = sum( MultiGaussFunction)-FittedCoefficients(1,4)*size(MultiGaussFunction,1);
                            i_MultiGaussFunction1 = sum( MultiGaussFunction1)-FittedCoefficients(1,4)*size(MultiGaussFunction1,1);
                            
                            plot(x_values,feval(FittedFunction,x_values),'Parent', h.PlotRS_Fig,'Color','r');
                            axes(h.PlotS_Fig_plot_f2)
                            plot(x_values,feval(FittedFunction,x_values),'Parent', h.PlotS_Fig_plot_f2,'Color','r');
                        case 2
                            set(h.max_I_MG_1,'String',FittedCoefficients(1,1));
                            set(h.x_max_Picture_1,'String',FittedCoefficients(1,2));
                            set(h.max_I_MG_2,'String',FittedCoefficients(1,3));
                            set(h.x_max_Picture_2,'String',FittedCoefficients(1,4));
                            
                            set(h.max_I_MG_3,'Enable','off');
                            set(h.x_max_Picture_3,'Enable','off');
                            set(h.max_I_MG_4,'Enable','off');
                            set(h.x_max_Picture_4,'Enable','off');
                            set(h.max_I_MG_5,'Enable','off');
                            set(h.x_max_Picture_5,'Enable','off');
                            set(h.max_I_MG_6,'Enable','off');
                            set(h.x_max_Picture_6,'Enable','off');
                            set(h.max_I_MG_7,'Enable','off');
                            set(h.x_max_Picture_7,'Enable','off');
                            set(h.max_I_MG_8,'Enable','off');
                            set(h.x_max_Picture_8,'Enable','off');
                            
                            if get(h.Gaussian_Dist_Check,'Value') == 1
                                FWHM_MG_1 = 2.355*FittedCoefficients(1,5);
                                FWHM_MG_2 = 2.355*FittedCoefficients(1,6);
                            else
                                FWHM_MG_1 =  2*FittedCoefficients(1,5);
                                FWHM_MG_2 = 2*FittedCoefficients(1,6);
                            end
                            set(h.FWHM_MG_1,'String',FWHM_MG_1);
                            set(h.FWHM_MG_2,'String',FWHM_MG_2);
                            
                            if  get(h.Lorentzian_Dist_Check,'Value') == 1
                                % Cauchy distribution
                                MultiGaussFunction1 = FittedCoefficients(1,1)/(pi*FittedCoefficients(1,5))./(1+((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,5)).^2)+ FittedCoefficients(1,7);
                                MultiGaussFunction2 = FittedCoefficients(1,3)/(pi*FittedCoefficients(1,6))./(1+((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,6)).^2)+ FittedCoefficients(1,7);
                            else
                                % Gaussian distribution
                                MultiGaussFunction1 = FittedCoefficients(1,1)*exp(-((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,5)).^2/2)+ FittedCoefficients(1,7);
                                MultiGaussFunction2 = FittedCoefficients(1,3)*exp(-((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,6)).^2/2)+ FittedCoefficients(1,7);
                            end
                             i_MultiGaussFunction = sum( MultiGaussFunction)-FittedCoefficients(1,7)*size(MultiGaussFunction,1);
                             i_MultiGaussFunction1 = sum( MultiGaussFunction1)-FittedCoefficients(1,7)*size(MultiGaussFunction1,1);
                             i_MultiGaussFunction2 = sum( MultiGaussFunction2)-FittedCoefficients(1,7)*size(MultiGaussFunction2,1);
                                                         
                            plot(x_values,MultiGaussFunction1,'Parent', h.PlotRS_Fig,'Color','y');
                            plot(x_values,MultiGaussFunction2,'Parent', h.PlotRS_Fig,'Color','c');
                            
                            axes(h.PlotS_Fig_plot_f2)
                            plot(x_values,MultiGaussFunction1,'Parent', h.PlotS_Fig_plot_f2,'Color','y');
                            plot(x_values,MultiGaussFunction2,'Parent', h.PlotS_Fig_plot_f2,'Color','c');
                        case 3
                            set(h.max_I_MG_1,'String',FittedCoefficients(1,1));
                            set(h.x_max_Picture_1,'String',FittedCoefficients(1,2));
                            set(h.max_I_MG_2,'String',FittedCoefficients(1,3));
                            set(h.x_max_Picture_2,'String',FittedCoefficients(1,4));
                            set(h.max_I_MG_3,'String',FittedCoefficients(1,5));
                            set(h.x_max_Picture_3,'String',FittedCoefficients(1,6));
                            
                            
                            set(h.max_I_MG_4,'Enable','off');
                            set(h.x_max_Picture_4,'Enable','off');
                            set(h.max_I_MG_5,'Enable','off');
                            set(h.x_max_Picture_5,'Enable','off');
                            set(h.max_I_MG_6,'Enable','off');
                            set(h.x_max_Picture_6,'Enable','off');
                            set(h.max_I_MG_7,'Enable','off');
                            set(h.x_max_Picture_7,'Enable','off');
                            set(h.max_I_MG_8,'Enable','off');
                            set(h.x_max_Picture_8,'Enable','off');
                            
                            if get(h.Gaussian_Dist_Check,'Value') == 1
                                FWHM_MG_1 = 2.355*FittedCoefficients(1,7);
                                FWHM_MG_2 = 2.355*FittedCoefficients(1,8);
                                FWHM_MG_3 = 2.355*FittedCoefficients(1,9);
                            else
                                FWHM_MG_1 =  2*FittedCoefficients(1,7);
                                FWHM_MG_2 = 2*FittedCoefficients(1,8);
                                FWHM_MG_3 = 2*FittedCoefficients(1,9);
                            end
                            set(h.FWHM_MG_1,'String',FWHM_MG_1);
                            set(h.FWHM_MG_2,'String',FWHM_MG_2);
                            set(h.FWHM_MG_3,'String',FWHM_MG_3);
                            
                            if  get(h.Lorentzian_Dist_Check,'Value') == 1
                                % Cauchy distribution
                                MultiGaussFunction1 = FittedCoefficients(1,1)/(pi*FittedCoefficients(1,7))./(1+((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,7)).^2)+ FittedCoefficients(1,10);
                                MultiGaussFunction2 = FittedCoefficients(1,3)/(pi*FittedCoefficients(1,8))./(1+((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,8)).^2)+ FittedCoefficients(1,10);
                                MultiGaussFunction3 = FittedCoefficients(1,5)/(pi*FittedCoefficients(1,9))./(1+((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,9)).^2)+ FittedCoefficients(1,10);
                            else
                                % Gaussian distribution
                                MultiGaussFunction1 = FittedCoefficients(1,1)*exp(-((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,7)).^2/2)+ FittedCoefficients(1,10);
                                MultiGaussFunction2 = FittedCoefficients(1,3)*exp(-((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,8)).^2/2)+ FittedCoefficients(1,10);
                                MultiGaussFunction3 = FittedCoefficients(1,5)*exp(-((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,9)).^2/2)+ FittedCoefficients(1,10);
                            end
                            
                             i_MultiGaussFunction = sum( MultiGaussFunction)-FittedCoefficients(1,10)*size(MultiGaussFunction,1);
                             i_MultiGaussFunction1 = sum( MultiGaussFunction1)-FittedCoefficients(1,10)*size(MultiGaussFunction1,1);
                             i_MultiGaussFunction2 = sum( MultiGaussFunction2)-FittedCoefficients(1,10)*size(MultiGaussFunction2,1);
                             i_MultiGaussFunction3 = sum( MultiGaussFunction3)-FittedCoefficients(1,10)*size(MultiGaussFunction3,1);
                             
                            plot(x_values,MultiGaussFunction1,'Parent', h.PlotRS_Fig,'Color','y');
                            plot(x_values,MultiGaussFunction2,'Parent', h.PlotRS_Fig,'Color','c');
                            plot(x_values,MultiGaussFunction3,'Parent', h.PlotRS_Fig,'Color','r');
                            
                            axes(h.PlotS_Fig_plot_f2)
                            plot(x_values,MultiGaussFunction1,'Parent', h.PlotS_Fig_plot_f2,'Color','y');
                            plot(x_values,MultiGaussFunction2,'Parent', h.PlotS_Fig_plot_f2,'Color','c');
                            plot(x_values,MultiGaussFunction3,'Parent', h.PlotS_Fig_plot_f2,'Color','r');
                        case 4
                            set(h.max_I_MG_1,'String',FittedCoefficients(1,1));
                            set(h.x_max_Picture_1,'String',FittedCoefficients(1,2));
                            set(h.max_I_MG_2,'String',FittedCoefficients(1,3));
                            set(h.x_max_Picture_2,'String',FittedCoefficients(1,4));
                            set(h.max_I_MG_3,'String',FittedCoefficients(1,5));
                            set(h.x_max_Picture_3,'String',FittedCoefficients(1,6));
                            set(h.max_I_MG_4,'String',FittedCoefficients(1,7));
                            set(h.x_max_Picture_4,'String',FittedCoefficients(1,8));
                            
                            set(h.max_I_MG_5,'Enable','off');
                            set(h.x_max_Picture_5,'Enable','off');
                            set(h.max_I_MG_6,'Enable','off');
                            set(h.x_max_Picture_6,'Enable','off');
                            set(h.max_I_MG_7,'Enable','off');
                            set(h.x_max_Picture_7,'Enable','off');
                            set(h.max_I_MG_8,'Enable','off');
                            set(h.x_max_Picture_8,'Enable','off');
                            
                            if get(h.Gaussian_Dist_Check,'Value') == 1
                                FWHM_MG_1 = 2.355*FittedCoefficients(1,9);
                                FWHM_MG_2 = 2.355*FittedCoefficients(1,10);
                                FWHM_MG_3 = 2.355*FittedCoefficients(1,11);
                                FWHM_MG_4 = 2.355*FittedCoefficients(1,12);
                            else
                                FWHM_MG_1 =  2*FittedCoefficients(1,9);
                                FWHM_MG_2 = 2*FittedCoefficients(1,10);
                                FWHM_MG_3 = 2*FittedCoefficients(1,11);
                                FWHM_MG_4 = 2*FittedCoefficients(1,12);
                            end
                            
                            set(h.FWHM_MG_1,'String',FWHM_MG_1);
                            set(h.FWHM_MG_2,'String',FWHM_MG_2);
                            set(h.FWHM_MG_3,'String',FWHM_MG_3);
                            set(h.FWHM_MG_4,'String',FWHM_MG_4);
                            
                            if  get(h.Lorentzian_Dist_Check,'Value') == 1
                                % Cauchy distribution
                                MultiGaussFunction1 = FittedCoefficients(1,1)/(pi*FittedCoefficients(1,9))./(1+((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,9)).^2)+ FittedCoefficients(1,13);
                                MultiGaussFunction2 = FittedCoefficients(1,3)/(pi*FittedCoefficients(1,10))./(1+((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,10)).^2)+ FittedCoefficients(1,13);
                                MultiGaussFunction3 = FittedCoefficients(1,5)/(pi*FittedCoefficients(1,11))./(1+((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,11)).^2)+ FittedCoefficients(1,13);
                                MultiGaussFunction4 = FittedCoefficients(1,7)/(pi*FittedCoefficients(1,12))./(1+((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,12)).^2)+ FittedCoefficients(1,13);
                            else
                                % Gaussian distribution
                                MultiGaussFunction1 = FittedCoefficients(1,1)*exp(-((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,9)).^2/2)+ FittedCoefficients(1,13);
                                MultiGaussFunction2 = FittedCoefficients(1,3)*exp(-((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,10)).^2/2)+ FittedCoefficients(1,13);
                                MultiGaussFunction3 = FittedCoefficients(1,5)*exp(-((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,11)).^2/2)+ FittedCoefficients(1,13);
                                MultiGaussFunction4 = FittedCoefficients(1,7)*exp(-((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,12)).^2/2)+ FittedCoefficients(1,13);
                            end
                            
                             i_MultiGaussFunction = sum( MultiGaussFunction)-FittedCoefficients(1,13)*size(MultiGaussFunction,1);
                             i_MultiGaussFunction1 = sum( MultiGaussFunction1)-FittedCoefficients(1,13)*size(MultiGaussFunction1,1);
                             i_MultiGaussFunction2 = sum( MultiGaussFunction2)-FittedCoefficients(1,13)*size(MultiGaussFunction2,1);
                             i_MultiGaussFunction3 = sum( MultiGaussFunction3)-FittedCoefficients(1,13)*size(MultiGaussFunction3,1);
                             i_MultiGaussFunction4 = sum( MultiGaussFunction4)-FittedCoefficients(1,13)*size(MultiGaussFunction4,1);
                             
                             
                            plot(x_values,MultiGaussFunction1,'Parent', h.PlotRS_Fig,'Color','y');
                            plot(x_values,MultiGaussFunction2,'Parent', h.PlotRS_Fig,'Color','c');
                            plot(x_values,MultiGaussFunction3,'Parent', h.PlotRS_Fig,'Color','r');
                            plot(x_values,MultiGaussFunction4,'Parent', h.PlotRS_Fig,'Color','g');
                            
                            axes(h.PlotS_Fig_plot_f2)
                            plot(x_values,MultiGaussFunction1,'Parent', h.PlotS_Fig_plot_f2,'Color','y');
                            plot(x_values,MultiGaussFunction2,'Parent', h.PlotS_Fig_plot_f2,'Color','c');
                            plot(x_values,MultiGaussFunction3,'Parent', h.PlotS_Fig_plot_f2,'Color','r');
                            plot(x_values,MultiGaussFunction4,'Parent', h.PlotS_Fig_plot_f2,'Color','g');
                        case 5
                            set(h.max_I_MG_1,'String',FittedCoefficients(1,1));
                            set(h.x_max_Picture_1,'String',FittedCoefficients(1,2));
                            set(h.max_I_MG_2,'String',FittedCoefficients(1,3));
                            set(h.x_max_Picture_2,'String',FittedCoefficients(1,4));
                            set(h.max_I_MG_3,'String',FittedCoefficients(1,5));
                            set(h.x_max_Picture_3,'String',FittedCoefficients(1,6));
                            set(h.max_I_MG_4,'String',FittedCoefficients(1,7));
                            set(h.x_max_Picture_4,'String',FittedCoefficients(1,8));
                            set(h.max_I_MG_5,'String',FittedCoefficients(1,9));
                            set(h.x_max_Picture_5,'String',FittedCoefficients(1,10));
                            
                            set(h.max_I_MG_6,'Enable','off');
                            set(h.x_max_Picture_6,'Enable','off');
                            set(h.max_I_MG_7,'Enable','off');
                            set(h.x_max_Picture_7,'Enable','off');
                            set(h.max_I_MG_8,'Enable','off');
                            set(h.x_max_Picture_8,'Enable','off');
                            
                            if get(h.Gaussian_Dist_Check,'Value') == 1
                                FWHM_MG_1 = 2.355*FittedCoefficients(1,11);
                                FWHM_MG_2 = 2.355*FittedCoefficients(1,12);
                                FWHM_MG_3 = 2.355*FittedCoefficients(1,13);
                                FWHM_MG_4 = 2.355*FittedCoefficients(1,14);
                                FWHM_MG_5 = 2.355*FittedCoefficients(1,15);
                            else
                                FWHM_MG_1 = 2*FittedCoefficients(1,11);
                                FWHM_MG_2 = 2*FittedCoefficients(1,12);
                                FWHM_MG_3 = 2*FittedCoefficients(1,13);
                                FWHM_MG_4 = 2*FittedCoefficients(1,14);
                                FWHM_MG_5 = 2*FittedCoefficients(1,15);
                            end
                            set(h.FWHM_MG_1,'String',FWHM_MG_1);
                            set(h.FWHM_MG_2,'String',FWHM_MG_2);
                            set(h.FWHM_MG_3,'String',FWHM_MG_3);
                            set(h.FWHM_MG_4,'String',FWHM_MG_4);
                            set(h.FWHM_MG_5,'String',FWHM_MG_5);
                            
                            if  get(h.Lorentzian_Dist_Check,'Value') == 1
                                % Cauchy distribution
                                MultiGaussFunction1 = FittedCoefficients(1,1)/(pi*FittedCoefficients(1,11))./(1+((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,11)).^2)+ FittedCoefficients(1,16);
                                MultiGaussFunction2 = FittedCoefficients(1,3)/(pi*FittedCoefficients(1,12))./(1+((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,12)).^2)+ FittedCoefficients(1,16);
                                MultiGaussFunction3 = FittedCoefficients(1,5)/(pi*FittedCoefficients(1,13))./(1+((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,13)).^2)+ FittedCoefficients(1,16);
                                MultiGaussFunction4 = FittedCoefficients(1,7)/(pi*FittedCoefficients(1,14))./(1+((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,14)).^2)+ FittedCoefficients(1,16);
                                MultiGaussFunction5 = FittedCoefficients(1,9)/(pi*FittedCoefficients(1,15))./(1+((x_values-FittedCoefficients(1,10))/FittedCoefficients(1,15)).^2)+ FittedCoefficients(1,16);
                            else
                                % Gaussian distribution
                                MultiGaussFunction1 = FittedCoefficients(1,1)*exp(-((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,11)).^2/2)+ FittedCoefficients(1,16);
                                MultiGaussFunction2 = FittedCoefficients(1,3)*exp(-((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,12)).^2/2)+ FittedCoefficients(1,16);
                                MultiGaussFunction3 = FittedCoefficients(1,5)*exp(-((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,13)).^2/2)+ FittedCoefficients(1,16);
                                MultiGaussFunction4 = FittedCoefficients(1,7)*exp(-((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,14)).^2/2)+ FittedCoefficients(1,16);
                                MultiGaussFunction5 = FittedCoefficients(1,9)*exp(-((x_values-FittedCoefficients(1,10))/FittedCoefficients(1,15)).^2/2)+ FittedCoefficients(1,16);
                            end
                            
                             i_MultiGaussFunction = sum( MultiGaussFunction)-FittedCoefficients(1,16)*size(MultiGaussFunction,1);
                             i_MultiGaussFunction1 = sum( MultiGaussFunction1)-FittedCoefficients(1,16)*size(MultiGaussFunction1,1);
                             i_MultiGaussFunction2 = sum( MultiGaussFunction2)-FittedCoefficients(1,16)*size(MultiGaussFunction2,1);
                             i_MultiGaussFunction3 = sum( MultiGaussFunction3)-FittedCoefficients(1,16)*size(MultiGaussFunction3,1);
                             i_MultiGaussFunction4 = sum( MultiGaussFunction4)-FittedCoefficients(1,16)*size(MultiGaussFunction4,1);
                             i_MultiGaussFunction5 = sum( MultiGaussFunction5)-FittedCoefficients(1,16)*size(MultiGaussFunction5,1);
                             
                            plot(x_values,MultiGaussFunction1,'Parent', h.PlotRS_Fig,'Color','y');
                            plot(x_values,MultiGaussFunction2,'Parent', h.PlotRS_Fig,'Color','c');
                            plot(x_values,MultiGaussFunction3,'Parent', h.PlotRS_Fig,'Color','r');
                            plot(x_values,MultiGaussFunction4,'Parent', h.PlotRS_Fig,'Color','g');
                            plot(x_values,MultiGaussFunction5,'Parent', h.PlotRS_Fig,'Color','k');
                            
                            axes(h.PlotS_Fig_plot_f2)
                            plot(x_values,MultiGaussFunction1,'Parent', h.PlotS_Fig_plot_f2,'Color','y');
                            plot(x_values,MultiGaussFunction2,'Parent', h.PlotS_Fig_plot_f2,'Color','c');
                            plot(x_values,MultiGaussFunction3,'Parent', h.PlotS_Fig_plot_f2,'Color','r');
                            plot(x_values,MultiGaussFunction4,'Parent', h.PlotS_Fig_plot_f2,'Color','g');
                            plot(x_values,MultiGaussFunction5,'Parent', h.PlotS_Fig_plot_f2,'Color','k');
                        case 6
                            set(h.max_I_MG_1,'String',FittedCoefficients(1,1));
                            set(h.x_max_Picture_1,'String',FittedCoefficients(1,2));
                            set(h.max_I_MG_2,'String',FittedCoefficients(1,3));
                            set(h.x_max_Picture_2,'String',FittedCoefficients(1,4));
                            set(h.max_I_MG_3,'String',FittedCoefficients(1,5));
                            set(h.x_max_Picture_3,'String',FittedCoefficients(1,6));
                            set(h.max_I_MG_4,'String',FittedCoefficients(1,7));
                            set(h.x_max_Picture_4,'String',FittedCoefficients(1,8));
                            set(h.max_I_MG_5,'String',FittedCoefficients(1,9));
                            set(h.x_max_Picture_5,'String',FittedCoefficients(1,10));
                            set(h.max_I_MG_6,'String',FittedCoefficients(1,11));
                            set(h.x_max_Picture_6,'String',FittedCoefficients(1,12));
                            set(h.max_I_MG_7,'Enable','off');
                            set(h.x_max_Picture_7,'Enable','off');
                            set(h.max_I_MG_8,'Enable','off');
                            set(h.x_max_Picture_8,'Enable','off');
                            
                            if get(h.Gaussian_Dist_Check,'Value') == 1
                                FWHM_MG_1 = 2.355*FittedCoefficients(1,13);
                                FWHM_MG_2 = 2.355*FittedCoefficients(1,14);
                                FWHM_MG_3 = 2.355*FittedCoefficients(1,15);
                                FWHM_MG_4 = 2.355*FittedCoefficients(1,16);
                                FWHM_MG_5 = 2.355*FittedCoefficients(1,17);
                                FWHM_MG_6 = 2.355*FittedCoefficients(1,18);
                            else
                                FWHM_MG_1 = 2*FittedCoefficients(1,13);
                                FWHM_MG_2 = 2*FittedCoefficients(1,14);
                                FWHM_MG_3 = 2*FittedCoefficients(1,15);
                                FWHM_MG_4 = 2*FittedCoefficients(1,16);
                                FWHM_MG_5 = 2*FittedCoefficients(1,17);
                                FWHM_MG_6 = 2*FittedCoefficients(1,18);
                            end
                            set(h.FWHM_MG_1,'String',FWHM_MG_1);
                            set(h.FWHM_MG_2,'String',FWHM_MG_2);
                            set(h.FWHM_MG_3,'String',FWHM_MG_3);
                            set(h.FWHM_MG_4,'String',FWHM_MG_4);
                            set(h.FWHM_MG_5,'String',FWHM_MG_5);
                            set(h.FWHM_MG_6,'String',FWHM_MG_6);
                            
                            
                            if  get(h.Lorentzian_Dist_Check,'Value') == 1
                                % Cauchy distributio4
                                MultiGaussFunction1 = FittedCoefficients(1,1)/(pi*FittedCoefficients(1,13))./(1+((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,13)).^2)+ FittedCoefficients(1,19);
                                MultiGaussFunction2 = FittedCoefficients(1,3)/(pi*FittedCoefficients(1,14))./(1+((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,14)).^2)+ FittedCoefficients(1,19);
                                MultiGaussFunction3 = FittedCoefficients(1,5)/(pi*FittedCoefficients(1,15))./(1+((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,15)).^2)+ FittedCoefficients(1,19);
                                MultiGaussFunction4 = FittedCoefficients(1,7)/(pi*FittedCoefficients(1,16))./(1+((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,16)).^2)+ FittedCoefficients(1,19);
                                MultiGaussFunction5 = FittedCoefficients(1,9)/(pi*FittedCoefficients(1,17))./(1+((x_values-FittedCoefficients(1,10))/FittedCoefficients(1,17)).^2)+ FittedCoefficients(1,19);
                                MultiGaussFunction6 = FittedCoefficients(1,11)/(pi*FittedCoefficients(1,18))./(1+((x_values-FittedCoefficients(1,12))/FittedCoefficients(1,18)).^2)+ FittedCoefficients(1,19);
                            else
                                % Gaussian distribution
                                MultiGaussFunction1 = FittedCoefficients(1,1)*exp(-((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,13)).^2/2)+ FittedCoefficients(1,19);
                                MultiGaussFunction2 = FittedCoefficients(1,3)*exp(-((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,14)).^2/2)+ FittedCoefficients(1,19);
                                MultiGaussFunction3 = FittedCoefficients(1,5)*exp(-((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,15)).^2/2)+ FittedCoefficients(1,19);
                                MultiGaussFunction4 = FittedCoefficients(1,7)*exp(-((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,16)).^2/2)+ FittedCoefficients(1,19);
                                MultiGaussFunction5 = FittedCoefficients(1,9)*exp(-((x_values-FittedCoefficients(1,10))/FittedCoefficients(1,17)).^2/2)+ FittedCoefficients(1,19);
                                MultiGaussFunction6 = FittedCoefficients(1,11)*exp(-((x_values-FittedCoefficients(1,12))/FittedCoefficients(1,18)).^2/2)+ FittedCoefficients(1,19);
                            end
                            
                            
                             i_MultiGaussFunction = sum( MultiGaussFunction)-FittedCoefficients(1,19)*size(MultiGaussFunction,1);
                             i_MultiGaussFunction1 = sum( MultiGaussFunction1)-FittedCoefficients(1,19)*size(MultiGaussFunction1,1);
                             i_MultiGaussFunction2 = sum( MultiGaussFunction2)-FittedCoefficients(1,19)*size(MultiGaussFunction2,1);
                             i_MultiGaussFunction3 = sum( MultiGaussFunction3)-FittedCoefficients(1,19)*size(MultiGaussFunction3,1);
                             i_MultiGaussFunction4 = sum( MultiGaussFunction4)-FittedCoefficients(1,19)*size(MultiGaussFunction4,1);
                             i_MultiGaussFunction5 = sum( MultiGaussFunction5)-FittedCoefficients(1,19)*size(MultiGaussFunction5,1);
                             i_MultiGaussFunction6 = sum( MultiGaussFunction6)-FittedCoefficients(1,19)*size(MultiGaussFunction6,1);
                             
                            plot(x_values,MultiGaussFunction1,'Parent', h.PlotRS_Fig,'Color','y');
                            plot(x_values,MultiGaussFunction2,'Parent', h.PlotRS_Fig,'Color','c');
                            plot(x_values,MultiGaussFunction3,'Parent', h.PlotRS_Fig,'Color','r');
                            plot(x_values,MultiGaussFunction4,'Parent', h.PlotRS_Fig,'Color','g');
                            plot(x_values,MultiGaussFunction5,'Parent', h.PlotRS_Fig,'Color','k');
                            plot(x_values,MultiGaussFunction6,'Parent', h.PlotRS_Fig,'Color','b');
                            
                            axes(h.PlotS_Fig_plot_f2)
                            plot(x_values,MultiGaussFunction1,'Parent', h.PlotS_Fig_plot_f2,'Color','y');
                            plot(x_values,MultiGaussFunction2,'Parent', h.PlotS_Fig_plot_f2,'Color','c');
                            plot(x_values,MultiGaussFunction3,'Parent', h.PlotS_Fig_plot_f2,'Color','r');
                            plot(x_values,MultiGaussFunction4,'Parent', h.PlotS_Fig_plot_f2,'Color','g');
                            plot(x_values,MultiGaussFunction5,'Parent', h.PlotS_Fig_plot_f2,'Color','k');
                            plot(x_values,MultiGaussFunction6,'Parent', h.PlotS_Fig_plot_f2,'Color','b');
                        case 7
                            set(h.max_I_MG_1,'String',FittedCoefficients(1,1));
                            set(h.x_max_Picture_1,'String',FittedCoefficients(1,2));
                            set(h.max_I_MG_2,'String',FittedCoefficients(1,3));
                            set(h.x_max_Picture_2,'String',FittedCoefficients(1,4));
                            set(h.max_I_MG_3,'String',FittedCoefficients(1,5));
                            set(h.x_max_Picture_3,'String',FittedCoefficients(1,6));
                            set(h.max_I_MG_4,'String',FittedCoefficients(1,7));
                            set(h.x_max_Picture_4,'String',FittedCoefficients(1,8));
                            set(h.max_I_MG_5,'String',FittedCoefficients(1,9));
                            set(h.x_max_Picture_5,'String',FittedCoefficients(1,10));
                            set(h.max_I_MG_6,'String',FittedCoefficients(1,11));
                            set(h.x_max_Picture_6,'String',FittedCoefficients(1,12));
                            set(h.max_I_MG_7,'String',FittedCoefficients(1,13));
                            set(h.x_max_Picture_7,'String',FittedCoefficients(1,14));
                            
                            set(h.max_I_MG_8,'Enable','off');
                            set(h.x_max_Picture_8,'Enable','off');
                            
                            if get(h.Gaussian_Dist_Check,'Value') == 1
                                FWHM_MG_1 = 2.355*FittedCoefficients(1,15);
                                FWHM_MG_2 = 2.355*FittedCoefficients(1,16);
                                FWHM_MG_3 = 2.355*FittedCoefficients(1,17);
                                FWHM_MG_4 = 2.355*FittedCoefficients(1,18);
                                FWHM_MG_5 = 2.355*FittedCoefficients(1,19);
                                FWHM_MG_6 = 2.355*FittedCoefficients(1,20);
                                FWHM_MG_7 = 2.355*FittedCoefficients(1,21);
                            else
                                FWHM_MG_1 = 2*FittedCoefficients(1,15);
                                FWHM_MG_2 = 2*FittedCoefficients(1,16);
                                FWHM_MG_3 = 2*FittedCoefficients(1,17);
                                FWHM_MG_4 = 2*FittedCoefficients(1,18);
                                FWHM_MG_5 = 2*FittedCoefficients(1,19);
                                FWHM_MG_6 = 2*FittedCoefficients(1,20);
                                FWHM_MG_7 = 2*FittedCoefficients(1,21);
                            end
                            set(h.FWHM_MG_1,'String',FWHM_MG_1);
                            set(h.FWHM_MG_2,'String',FWHM_MG_2);
                            set(h.FWHM_MG_3,'String',FWHM_MG_3);
                            set(h.FWHM_MG_4,'String',FWHM_MG_4);
                            set(h.FWHM_MG_5,'String',FWHM_MG_5);
                            set(h.FWHM_MG_6,'String',FWHM_MG_6);
                            set(h.FWHM_MG_7,'String',FWHM_MG_7);
                            
                            if  get(h.Lorentzian_Dist_Check,'Value') == 1
                                % Cauchy distributio4
                                MultiGaussFunction1 = FittedCoefficients(1,1)/(pi*FittedCoefficients(1,15))./(1+((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,15)).^2)+ FittedCoefficients(1,22);
                                MultiGaussFunction2 = FittedCoefficients(1,3)/(pi*FittedCoefficients(1,16))./(1+((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,16)).^2)+ FittedCoefficients(1,22);
                                MultiGaussFunction3 = FittedCoefficients(1,5)/(pi*FittedCoefficients(1,17))./(1+((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,17)).^2)+ FittedCoefficients(1,22);
                                MultiGaussFunction4 = FittedCoefficients(1,7)/(pi*FittedCoefficients(1,18))./(1+((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,18)).^2)+ FittedCoefficients(1,22);
                                MultiGaussFunction5 = FittedCoefficients(1,9)/(pi*FittedCoefficients(1,19))./(1+((x_values-FittedCoefficients(1,10))/FittedCoefficients(1,19)).^2)+ FittedCoefficients(1,22);
                                MultiGaussFunction6 = FittedCoefficients(1,11)/(pi*FittedCoefficients(1,20))./(1+((x_values-FittedCoefficients(1,12))/FittedCoefficients(1,20)).^2)+ FittedCoefficients(1,22);
                                MultiGaussFunction7 = FittedCoefficients(1,13)/(pi*FittedCoefficients(1,21))./(1+((x_values-FittedCoefficients(1,14))/FittedCoefficients(1,21)).^2)+ FittedCoefficients(1,22);
                            else
                                % Gaussian distribution
                                MultiGaussFunction1 = FittedCoefficients(1,1)*exp(-((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,15)).^2/2)+ FittedCoefficients(1,22);
                                MultiGaussFunction2 = FittedCoefficients(1,3)*exp(-((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,16)).^2/2)+ FittedCoefficients(1,22);
                                MultiGaussFunction3 = FittedCoefficients(1,5)*exp(-((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,17)).^2/2)+ FittedCoefficients(1,22);
                                MultiGaussFunction4 = FittedCoefficients(1,7)*exp(-((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,18)).^2/2)+ FittedCoefficients(1,22);
                                MultiGaussFunction5 = FittedCoefficients(1,9)*exp(-((x_values-FittedCoefficients(1,10))/FittedCoefficients(1,19)).^2/2)+ FittedCoefficients(1,22);
                                MultiGaussFunction6 = FittedCoefficients(1,11)*exp(-((x_values-FittedCoefficients(1,12))/FittedCoefficients(1,20)).^2/2)+ FittedCoefficients(1,22);
                                MultiGaussFunction7 = FittedCoefficients(1,13)*exp(-((x_values-FittedCoefficients(1,14))/FittedCoefficients(1,21)).^2/2)+ FittedCoefficients(1,22);
                            end
                            
                            
                            
                             i_MultiGaussFunction = sum( MultiGaussFunction)-FittedCoefficients(1,22)*size(MultiGaussFunction,1);
                             i_MultiGaussFunction1 = sum( MultiGaussFunction1)-FittedCoefficients(1,22)*size(MultiGaussFunction1,1);
                             i_MultiGaussFunction2 = sum( MultiGaussFunction2)-FittedCoefficients(1,22)*size(MultiGaussFunction2,1);
                             i_MultiGaussFunction3 = sum( MultiGaussFunction3)-FittedCoefficients(1,22)*size(MultiGaussFunction3,1);
                             i_MultiGaussFunction4 = sum( MultiGaussFunction4)-FittedCoefficients(1,22)*size(MultiGaussFunction4,1);
                             i_MultiGaussFunction5 = sum( MultiGaussFunction5)-FittedCoefficients(1,22)*size(MultiGaussFunction5,1);
                             i_MultiGaussFunction6 = sum( MultiGaussFunction6)-FittedCoefficients(1,22)*size(MultiGaussFunction6,1);
                             i_MultiGaussFunction7 = sum( MultiGaussFunction7)-FittedCoefficients(1,22)*size(MultiGaussFunction7,1);
                             
                             
                            plot(x_values,MultiGaussFunction1,'Parent', h.PlotRS_Fig,'Color','y');
                            plot(x_values,MultiGaussFunction2,'Parent', h.PlotRS_Fig,'Color','c');
                            plot(x_values,MultiGaussFunction3,'Parent', h.PlotRS_Fig,'Color','r');
                            plot(x_values,MultiGaussFunction4,'Parent', h.PlotRS_Fig,'Color','g');
                            plot(x_values,MultiGaussFunction5,'Parent', h.PlotRS_Fig,'Color','k');
                            plot(x_values,MultiGaussFunction6,'Parent', h.PlotRS_Fig,'Color','b');
                            plot(x_values,MultiGaussFunction7,'Parent', h.PlotRS_Fig,'Color','m');
                            
                            axes(h.PlotS_Fig_plot_f2)
                            plot(x_values,MultiGaussFunction1,'Parent', h.PlotS_Fig_plot_f2,'Color','y');
                            plot(x_values,MultiGaussFunction2,'Parent', h.PlotS_Fig_plot_f2,'Color','c');
                            plot(x_values,MultiGaussFunction3,'Parent', h.PlotS_Fig_plot_f2,'Color','r');
                            plot(x_values,MultiGaussFunction4,'Parent', h.PlotS_Fig_plot_f2,'Color','g');
                            plot(x_values,MultiGaussFunction5,'Parent', h.PlotS_Fig_plot_f2,'Color','k');
                            plot(x_values,MultiGaussFunction6,'Parent', h.PlotS_Fig_plot_f2,'Color','b');
                            plot(x_values,MultiGaussFunction7,'Parent', h.PlotS_Fig_plot_f2,'Color','m');
                        case 8
                            set(h.max_I_MG_1,'String',FittedCoefficients(1,1));
                            set(h.x_max_Picture_1,'String',FittedCoefficients(1,2));
                            set(h.max_I_MG_2,'String',FittedCoefficients(1,3));
                            set(h.x_max_Picture_2,'String',FittedCoefficients(1,4));
                            set(h.max_I_MG_3,'String',FittedCoefficients(1,5));
                            set(h.x_max_Picture_3,'String',FittedCoefficients(1,6));
                            set(h.max_I_MG_4,'String',FittedCoefficients(1,7));
                            set(h.x_max_Picture_4,'String',FittedCoefficients(1,8));
                            set(h.max_I_MG_5,'String',FittedCoefficients(1,9));
                            set(h.x_max_Picture_5,'String',FittedCoefficients(1,10));
                            set(h.max_I_MG_6,'String',FittedCoefficients(1,11));
                            set(h.x_max_Picture_6,'String',FittedCoefficients(1,12));
                            set(h.max_I_MG_7,'String',FittedCoefficients(1,13));
                            set(h.x_max_Picture_7,'String',FittedCoefficients(1,14));
                            set(h.max_I_MG_8,'String',FittedCoefficients(1,15));
                            set(h.x_max_Picture_8,'String',FittedCoefficients(1,16));
                            
                            if get(h.Gaussian_Dist_Check,'Value') == 1
                                FWHM_MG_1 = 2.355*FittedCoefficients(1,17);
                                FWHM_MG_2 = 2.355*FittedCoefficients(1,18);
                                FWHM_MG_3 = 2.355*FittedCoefficients(1,19);
                                FWHM_MG_4 = 2.355*FittedCoefficients(1,20);
                                FWHM_MG_5 = 2.355*FittedCoefficients(1,21);
                                FWHM_MG_6 = 2.355*FittedCoefficients(1,22);
                                FWHM_MG_7 = 2.355*FittedCoefficients(1,23);
                                FWHM_MG_8 = 2.355*FittedCoefficients(1,24);
                            else
                                FWHM_MG_1 = 2*FittedCoefficients(1,17);
                                FWHM_MG_2 = 2*FittedCoefficients(1,18);
                                FWHM_MG_3 = 2*FittedCoefficients(1,19);
                                FWHM_MG_4 = 2*FittedCoefficients(1,20);
                                FWHM_MG_5 = 2*FittedCoefficients(1,21);
                                FWHM_MG_6 = 2*FittedCoefficients(1,22);
                                FWHM_MG_7 = 2*FittedCoefficients(1,23);
                                FWHM_MG_8 = 2*FittedCoefficients(1,24);
                            end
                            set(h.FWHM_MG_1,'String',FWHM_MG_1);
                            set(h.FWHM_MG_2,'String',FWHM_MG_2);
                            set(h.FWHM_MG_3,'String',FWHM_MG_3);
                            set(h.FWHM_MG_4,'String',FWHM_MG_4);
                            set(h.FWHM_MG_5,'String',FWHM_MG_5);
                            set(h.FWHM_MG_6,'String',FWHM_MG_6);
                            set(h.FWHM_MG_7,'String',FWHM_MG_7);
                            set(h.FWHM_MG_8,'String',FWHM_MG_8);
                            
                            if  get(h.Lorentzian_Dist_Check,'Value') == 1
                                % Cauchy distributio4
                                MultiGaussFunction1 = FittedCoefficients(1,1)/(pi*FittedCoefficients(1,17))./(1+((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,17)).^2)+ FittedCoefficients(1,25);
                                MultiGaussFunction2 = FittedCoefficients(1,3)/(pi*FittedCoefficients(1,18))./(1+((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,18)).^2)+ FittedCoefficients(1,25);
                                MultiGaussFunction3 = FittedCoefficients(1,5)/(pi*FittedCoefficients(1,19))./(1+((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,19)).^2)+ FittedCoefficients(1,25);
                                MultiGaussFunction4 = FittedCoefficients(1,7)/(pi*FittedCoefficients(1,20))./(1+((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,20)).^2)+ FittedCoefficients(1,25);
                                MultiGaussFunction5 = FittedCoefficients(1,9)/(pi*FittedCoefficients(1,21))./(1+((x_values-FittedCoefficients(1,10))/FittedCoefficients(1,21)).^2)+ FittedCoefficients(1,25);
                                MultiGaussFunction6 = FittedCoefficients(1,11)/(pi*FittedCoefficients(1,22))./(1+((x_values-FittedCoefficients(1,12))/FittedCoefficients(1,22)).^2)+ FittedCoefficients(1,25);
                                MultiGaussFunction7 = FittedCoefficients(1,13)/(pi*FittedCoefficients(1,23))./(1+((x_values-FittedCoefficients(1,14))/FittedCoefficients(1,23)).^2)+ FittedCoefficients(1,25);
                                MultiGaussFunction8 = FittedCoefficients(1,15)/(pi*FittedCoefficients(1,24))./(1+((x_values-FittedCoefficients(1,16))/FittedCoefficients(1,24)).^2)+ FittedCoefficients(1,25);
                            else
                                % Gaussian distribution
                                MultiGaussFunction1 = FittedCoefficients(1,1)*exp(-((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,17)).^2/2)+ FittedCoefficients(1,25);
                                MultiGaussFunction2 = FittedCoefficients(1,3)*exp(-((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,18)).^2/2)+ FittedCoefficients(1,25);
                                MultiGaussFunction3 = FittedCoefficients(1,5)*exp(-((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,19)).^2/2)+ FittedCoefficients(1,25);
                                MultiGaussFunction4 = FittedCoefficients(1,7)*exp(-((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,20)).^2/2)+ FittedCoefficients(1,25);
                                MultiGaussFunction5 = FittedCoefficients(1,9)*exp(-((x_values-FittedCoefficients(1,10))/FittedCoefficients(1,21)).^2/2)+ FittedCoefficients(1,25);
                                MultiGaussFunction6 = FittedCoefficients(1,11)*exp(-((x_values-FittedCoefficients(1,12))/FittedCoefficients(1,22)).^2/2)+ FittedCoefficients(1,25);
                                MultiGaussFunction7 = FittedCoefficients(1,13)*exp(-((x_values-FittedCoefficients(1,14))/FittedCoefficients(1,23)).^2/2)+ FittedCoefficients(1,25);
                                MultiGaussFunction8 = FittedCoefficients(1,15)*exp(-((x_values-FittedCoefficients(1,16))/FittedCoefficients(1,24)).^2/2)+ FittedCoefficients(1,25);
                            end
                            
                            
                             i_MultiGaussFunction = sum( MultiGaussFunction)-FittedCoefficients(1,25)*size(MultiGaussFunction,1);
                             i_MultiGaussFunction1 = sum( MultiGaussFunction1)-FittedCoefficients(1,25)*size(MultiGaussFunction1,1);
                             i_MultiGaussFunction2 = sum( MultiGaussFunction2)-FittedCoefficients(1,25)*size(MultiGaussFunction2,1);
                             i_MultiGaussFunction3 = sum( MultiGaussFunction3)-FittedCoefficients(1,25)*size(MultiGaussFunction3,1);
                             i_MultiGaussFunction4 = sum( MultiGaussFunction4)-FittedCoefficients(1,25)*size(MultiGaussFunction4,1);
                             i_MultiGaussFunction5 = sum( MultiGaussFunction5)-FittedCoefficients(1,25)*size(MultiGaussFunction5,1);
                             i_MultiGaussFunction6 = sum( MultiGaussFunction6)-FittedCoefficients(1,25)*size(MultiGaussFunction6,1);
                             i_MultiGaussFunction7 = sum( MultiGaussFunction7)-FittedCoefficients(1,25)*size(MultiGaussFunction7,1);
                             i_MultiGaussFunction8 = sum( MultiGaussFunction8)-FittedCoefficients(1,25)*size(MultiGaussFunction8,1);
                            
                            plot(x_values,MultiGaussFunction1,'Parent', h.PlotRS_Fig,'Color','y');
                            plot(x_values,MultiGaussFunction2,'Parent', h.PlotRS_Fig,'Color','c');
                            plot(x_values,MultiGaussFunction3,'Parent', h.PlotRS_Fig,'Color','r');
                            plot(x_values,MultiGaussFunction4,'Parent', h.PlotRS_Fig,'Color','g');
                            plot(x_values,MultiGaussFunction5,'Parent', h.PlotRS_Fig,'Color','k');
                            plot(x_values,MultiGaussFunction6,'Parent', h.PlotRS_Fig,'Color','b');
                            plot(x_values,MultiGaussFunction7,'Parent', h.PlotRS_Fig,'Color','m');
                            plot(x_values,MultiGaussFunction8,'Parent', h.PlotRS_Fig,'Color','y');
                            
                            axes(h.PlotS_Fig_plot_f2)
                            plot(x_values,MultiGaussFunction1,'Parent', h.PlotS_Fig_plot_f2,'Color','y');
                            plot(x_values,MultiGaussFunction2,'Parent', h.PlotS_Fig_plot_f2,'Color','c');
                            plot(x_values,MultiGaussFunction3,'Parent', h.PlotS_Fig_plot_f2,'Color','r');
                            plot(x_values,MultiGaussFunction4,'Parent', h.PlotS_Fig_plot_f2,'Color','g');
                            plot(x_values,MultiGaussFunction5,'Parent', h.PlotS_Fig_plot_f2,'Color','k');
                            plot(x_values,MultiGaussFunction6,'Parent', h.PlotS_Fig_plot_f2,'Color','b');
                            plot(x_values,MultiGaussFunction7,'Parent', h.PlotS_Fig_plot_f2,'Color','m');
                            plot(x_values,MultiGaussFunction8,'Parent', h.PlotS_Fig_plot_f2,'Color','y');
                    end
                    h.i_MultiGaussFunction1 = i_MultiGaussFunction1;
                    h.i_MultiGaussFunction2 = i_MultiGaussFunction2;
                    h.i_MultiGaussFunction3 = i_MultiGaussFunction3;
                    h.i_MultiGaussFunction4 = i_MultiGaussFunction4;
                    h.i_MultiGaussFunction5 = i_MultiGaussFunction5;
                    h.i_MultiGaussFunction6 = i_MultiGaussFunction6;
                    h.i_MultiGaussFunction7 = i_MultiGaussFunction7;
                    h.i_MultiGaussFunction8 = i_MultiGaussFunction8;
                    h.i_MultiGaussFunction = i_MultiGaussFunction;
                    
                    axes(h.PlotRS_Fig)
                    YMax_plot = eval(get(h.Name_Y_Max_Plot_F2,'String'));
                    YMin_plot = eval(get(h.Name_Y_Min_Plot_F2,'String'));
                    
                    set(h.PlotRS_Fig,'Ylim',[YMin_plot YMax_plot]);
                    
                    if h.micro_Check ==1
                        xlabel('Position (um)')
                    else
                        xlabel('Position (um)')
                    end
                    ylabel('Intensity (arb units)')
                    
                    set(h.PlotRS_Fig,'Ylim',[YMin_plot YMax_plot]);
                    title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotRS_Fig);
                    
                    axes(h.PlotS_Fig_plot_f2)
                    YMax_plot = eval(get(h.Name_Y_Max_Plot_F2,'String'));
                    YMin_plot = eval(get(h.Name_Y_Min_Plot_F2,'String'));
                    
                    set(h.PlotS_Fig_plot_f2,'Ylim',[YMin_plot YMax_plot]);
                    
                    if h.micro_Check ==1
                        xlabel('Position (um)')
                    else
                        xlabel('Position (um)')
                    end
                    ylabel('Intensity (arb units)')
                    
                    set(h.PlotRS_Fig,'Ylim',[YMin_plot YMax_plot]);
                    title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f2);
                    
                    
                    
                    axes(h.PlotS_Result2_Fig)
                    
                    if h.Smooth ==1
                        for i_Diff = 1:size(ColumnRangesArray,2)-1
                            ColumnRangesArray_Diff(1,i_Diff) = ColumnRangesArray(1,i_Diff);
                        end
                        Intensities_Strip_Smooth_Diff = diff(Intensities_Strip_Smooth);
                        plot(ColumnRangesArray_Diff,Intensities_Strip_Smooth_Diff,'Parent', h.PlotS_Result2_Fig,'LineWidth',2,'MarkerSize',2,'Color','c');
                        hold off
                        title(sprintf('F4: Smooth Image Strip Diff %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Result2_Fig);
                        
                        axes(h.PlotS_Fig_plot_f5)
                        plot(ColumnRangesArray_Diff,Intensities_Strip_Smooth_Diff,'Parent', h.PlotS_Fig_plot_f5,'LineWidth',2,'MarkerSize',2,'Color','c');
                        hold off
                        title(sprintf('F4: Smooth Image Strip Diff %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f5);
                    else
                        for i_Diff = 1:size(ColumnRangesArray,2)-1
                            ColumnRangesArray_Diff(1,i_Diff) = ColumnRangesArray(1,i_Diff);
                        end
                        Intensities_Strip_Diff = diff(squeeze(StripIntensities(i_im,:,i_Strip)));
                        plot(ColumnRangesArray_Diff,Intensities_Strip_Diff,'Parent', h.PlotS_Result2_Fig,'LineWidth',2,'MarkerSize',2,'Color','c');
                        hold off
                        title(sprintf('F4: Smooth Image Strip Diff %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Result2_Fig);
                        
                        axes(h.PlotS_Fig_plot_f5)
                        plot(ColumnRangesArray_Diff,Intensities_Strip_Diff,'Parent', h.PlotS_Fig_plot_f5,'LineWidth',2,'MarkerSize',2,'Color','c');
                        hold off
                        title(sprintf('F4: Smooth Image Strip Diff %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f5);
                    end
                    axes(h.PlotRS_Fig)
                    hold off
                    
                    
                    if h.Smooth == 1
                        axes(h.PlotS_Result_Fig)
                        plot(ColumnRangesArray,Intensities_Strip_Smooth,'Parent', h.PlotS_Result_Fig,'LineWidth',2,'MarkerSize',2,'Color','c');
                        hold on
                        plot(x_values,feval(FittedFunction_Smooth,x_values),'Parent', h.PlotS_Result_Fig,'Color','g','LineStyle',':');
                        axis([400,1800,YMin, YMax])
                        title(sprintf('F3:Smooth Image Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Result_Fig);
                        hold off
                        set(h.PlotS_Result_Fig,'Ylim',[YMin YMax]);
                        if h.micro_Check ==1
                            xlabel('Position (um)')
                        else
                            xlabel('Position (um)')
                        end
                        ylabel('Intensity (arb units)')
                        axes(h.PlotS_Fig_plot_f3)
                        plot(ColumnRangesArray,Intensities_Strip_Smooth,'Parent', h.PlotS_Fig_plot_f3,'LineWidth',2,'MarkerSize',2,'Color','c');
                        hold on
                        plot(x_values,feval(FittedFunction_Smooth,x_values),'Parent', h.PlotS_Fig_plot_f3,'Color','g','LineStyle',':');
                        title(sprintf('F3:Smooth Image Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f3);
                        hold off
                        if h.micro_Check ==1
                            xlabel('Position (um)')
                        else
                            xlabel('Position (um)')
                        end
                        ylabel('Intensity (arb units)')
                    end
                    pause(0.1)
                    
                    
                    time_pause = eval(get(h.time_pause,'String'));
                    if h.Fit_One_Manual_Chk == 1
                        pause(time_pause)
                    end
                    
                    
                    
                    
                    n_im = n_im + 1;
                    
                    t_pasue = 0;
                    
                    if h.Pause == 1
                        i_pause =0;
                        if h.Fit_One_Manual_Chk == 1
                            if h.Save_Manuel == 1
                                t_pasue = 1;
                            end
                            while h.Pause == 1
                                pause(1)
                                i_pause = i_pause +1;
                                if i_pause == 300
                                    h.Pause=0;
                                    set(h.Name_Pause_I_S, 'Value',0)
                                    set(h.Name_Pause, 'Value',0)
                                end
                            end
                            x_max = eval(get(h.x_max_fit,'String'));
                            y_max = eval(get(h.y_max_fit,'String'));
                            x_left = eval(get(h.x_left_fit,'String'));
                            x_right = eval(get(h.x_right_fit,'String'));
                            InitialWidth_pix = x_right-x_left;
                            
                        else
                            while h.Pause == 1
                                pause(1)
                                i_pause = i_pause +1;
                                if i_pause == 120
                                    h.Pause=0;
                                    set(h.Name_Pause_I_S, 'Value',0)
                                    set(h.Name_Pause, 'Value',0)
                                end
                            end
                            
                        end
                    end
                    
                    if t_pasue == 1
                        
                        StartPoints = [y_max-Background, x_max, InitialWidth_pix, Background];
                        
                        [FittedFunction,FitQuality] = fit(x_values',squeeze(StripIntensities(i_im,:,i_Strip))',GaussFunction,'Start', StartPoints);
                        if h.Smooth == 1
                            [FittedFunction_Smooth,FitQuality_Smooth] = fit(x_values',Intensities_Strip_Smooth',GaussFunction,'Start', StartPoints);
                            
                            
                            FittedCoefficients_Smooth = coeffvalues(FittedFunction_Smooth);
                            
                            
                            if (FitQuality_Smooth.rsquare >= 0.1)
                                FitValid_Smooth(i_im) = 1;
                                MaxPos_Smooth(i_im) = FittedCoefficients_Smooth(2);
                                Widths_Smooth(i_im) = FittedCoefficients_Smooth(3);
                                Heights_Smooth(i_im) = FittedCoefficients_Smooth(1);
                                Background_part_Smooth(i_im)= FittedCoefficients_Smooth(4);
                                
                                RSquare_Smooth(1,i_im) = FitQuality_Smooth.rsquare;
                            else
                                
                                FitValid_Smooth(i_im) = 0;
                                MaxPos_Smooth(i_im) = 0;
                                Widths_Smooth(i_im) = 0;
                                Heights_Smooth(i_im) = 0;
                                %Background_part_Smooth(i_im)= FittedCoefficients(4);
                                Background_part_Smooth(i_im)= 0;
                                
                                RSquare_Smooth(1,i_im) = 0;
                            end
                            max_I_bef_Smooth = FittedCoefficients_Smooth(1)+Background;
                            x_max_bef_Smooth = FittedCoefficients_Smooth(2);
                            InitialWidth_pix_bef_Smooth =FittedCoefficients_Smooth(3);
                            Background_bef_Smooth = FittedCoefficients_Smooth(4);
                            
                        end
                        
                        
                        FittedCoefficients = coeffvalues(FittedFunction);
                        if (FitQuality.rsquare >= rsquare_min)
                            FitValid(i_im) = 1;
                            MaxPos(i_im) = FittedCoefficients(2);
                            Widths(i_im) = FittedCoefficients(3);
                            Heights(i_im) = FittedCoefficients(1);
                            Background_part(i_im)= FittedCoefficients(4);
                            MaxPosStr = num2str(MaxPos(i_im));
                            set(h.x_max_Picture_1,'String',MaxPosStr);
                            
                            RSquare(1,i_im) = FitQuality.rsquare;
                        end
                        max_I_bef = FittedCoefficients(1)+Background;
                        x_max_bef = FittedCoefficients(2);
                        InitialWidth_pix_bef =FittedCoefficients(3);
                        Background_bef = FittedCoefficients(4);
                        
                        
                        axes(h.PlotRS_Fig)
                        plot(ColumnRangesArray,squeeze(StripIntensities(i_im,:,i_Strip)),'Parent', h.PlotRS_Fig,'LineWidth',2,'MarkerSize',2,'Color','b');
                        title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotRS_Fig);
                        hold on
                        BackgroundArray = Background*ones(1,N_Strip);
                        plot(ColumnRangesArray,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotRS_Fig);
                        plot(x_values,feval(FittedFunction,x_values),'Parent', h.PlotRS_Fig,'Color','r','LineStyle',':');
                        axis([400,1800,YMin, YMax])
                        
                        
                        
                        set(h.PlotRS_Fig,'Ylim',[YMin YMax]);
                        if h.micro_Check ==1
                            xlabel('Position (um)')
                        else
                            xlabel('Position (um)')
                        end
                        ylabel('Intensity (arb units)')
                        set(h.PlotRS_Fig,'Ylim',[YMin YMax]);
                        title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotRS_Fig);
                        
                        axes(h.PlotRS_Fig)
                        hold off
                        
                        axes(h.PlotS_Fig_plot_f2)
                        plot(ColumnRangesArray,squeeze(StripIntensities(i_im,:,i_Strip)),'Parent', h.PlotS_Fig_plot_f2,'LineWidth',2,'MarkerSize',2,'Color','b');
                        title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f2);
                        hold on
                        plot(ColumnRangesArray,BackgroundArray,'Color','k','LineStyle','--','Parent',h.PlotS_Fig_plot_f2);
                        plot(x_values,feval(FittedFunction,x_values),'Parent', h.PlotS_Fig_plot_f2,'Color','r','LineStyle',':');
                        
                        if h.micro_Check ==1
                            xlabel('Position (um)')
                        else
                            xlabel('Position (um)')
                        end
                        ylabel('Intensity (arb units)')
                        title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f2);
                        
                        axes(h.PlotS_Fig_plot_f2)
                        hold off
                        
                        
                    end
                    
                    if get(h.Save_video,'Value') == 1
                        frame_Strip(t_im) = getframe(h.PlotRS_Fig);
                        if h.Smooth == 1
                            frame_Strip_Smooth(t_im) = getframe(h.PlotS_Result_Fig);
                        end
                    end
                    
                    
                    
                    if i_Strip == 1
                        Save_Strip_fit1(1,:,i_im)=feval(FittedFunction,x_values);
                        if h.Smooth == 1
                            Save_Strip_Smooth_fit1(1,:,i_im)=feval(FittedFunction_Smooth,x_values);
                        end
                    elseif i_Strip == 2
                        Save_Strip_fit2(1,:,i_im)=feval(FittedFunction,x_values);
                        if h.Smooth == 1
                            Save_Strip_Smooth_fit2(1,:,i_im)=feval(FittedFunction_Smooth,x_values);
                        end
                    elseif i_Strip == 3
                        Save_Strip_fit3(1,:,i_im)=feval(FittedFunction,x_values);
                        if h.Smooth == 1
                            Save_Strip_Smooth_fit3(1,:,i_im)=feval(FittedFunction_Smooth,x_values);
                        end
                    elseif i_Strip == 4
                        Save_Strip_fit4(1,:,i_im)=feval(FittedFunction,x_values);
                        if h.Smooth == 1
                            Save_Strip_Smooth_fit4(1,:,i_im)=feval(FittedFunction_Smooth,x_values);
                        end
                    end
                    
                    
                    pause(0.1)
                    t_im = t_im+1;
                    if h.Smooth == 1
                        Area_Smooth(1,i_im) = sum(Intensities_Strip_Smooth -  Background*ones(1,size(Intensities_Strip_Smooth,2)));
                    end
                end
                
                
                
                if Stop == 1
                    
                    
                    Area(1,:) = sum(squeeze(StripIntensities(:,:,i_Strip)) ,2);
                    
                    if h.Gaussian_Check ==1
                        
                        for i_widths = 1:size(Widths,2)
                            Widths_plot(1,i_widths) = Widths(1,i_widths)*Heights(1,i_widths)*sqrt(2*pi)+Background_part(1,i_widths);
                            if h.Smooth == 1
                                Widths_plot_Smooth(1,i_widths) = Widths_Smooth(1,i_widths)*Heights_Smooth(1,i_widths)*sqrt(2*pi)+Background_part_Smooth(1,i_widths);
                            end
                        end
                        
                        Error(1,:) = (1-RSquare(1,:)).* Widths_plot(1,:)/5;
                        Save_Widths(i_Strip,:)=Widths_plot(1,:);
                        Save_Error(i_Strip,:) = Error(1,:);
                        Save_Area(i_Strip,:) = Area;
                        
                        Smooth = h.Smooth;
                        
                        if h.Smooth == 1
                            Save_Area_Smooth(i_Strip,:) = Area_Smooth;
                            Save_Widths_Smooth(i_Strip,:)=Widths_plot_Smooth(1,:);
                        end
                        
                        
                        if h.Energy_Check == 1
                            [a_Image,b_Image] =size(ImageNumbers);
                            Energy_Step_value=h.Energy_Step_value;
                            Energy_value = h.Energy_value;
                            Image_Theta = h.Image_Theta;
                            for i_Image=1:b_Image
                                Energy_Image(1,i_Image) = Energy_Step_value*(ImageNumbers(1,i_Image)-Image_Theta);
                            end
                        end
                        
                    end
                    
                    axes(h.PlotS_Result3_Fig)
                    
                    hold off
                    
                    if h.Energy_Check == 0
                        plot(ImageNumbers(1:N_images),Area,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Result3_Fig);
                        hold on
                        %                 plot(ImageNumbers(FitValid == 1), Widths_plot(FitValid == 1),'Parent',h.PlotS_Result3_Fig,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r');
                        %                 errorbar(ImageNumbers(FitValid == 1),Widths_plot(FitValid == 1),Error(FitValid == 1),'Parent',h.PlotS_Result3_Fig)
                        legend('Area M','Area GF','Error GF')
                        
                        xlabel('Image')
                        title(sprintf('F5: Intensity  --- Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent',h.PlotS_Result3_Fig);
                        
                    elseif h.Energy_Check == 1
                        plot(Energy_Image,Area,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Result3_Fig);
                        hold on
                        plot(Energy_Image(FitValid ==1),Widths_plot(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r','Parent',h.PlotS_Result3_Fig)
                        errorbar(Energy_Image(FitValid == 1),Widths_plot(FitValid == 1),Error(FitValid == 1),'Parent',h.PlotS_Result3_Fig)
                        legend('Area M','Area GF','Error GF')
                        
                        xlabel('Energy(eV)')
                        title(sprintf('F5: Intensity  --- Strip %d, 0 position =  %d eV',i_Strip,Energy_value),'Parent',h.PlotS_Result3_Fig);
                        
                    end
                    ylabel('Intensity(abr units)')
                    
                    xlim auto
                    ylim auto
                    
                    axes(h.PlotS_Fig_plot_f1)
                    if h.Energy_Check == 0
                        plot(ImageNumbers(1:N_images),Area,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Fig_plot_f1);
                        hold on
                        %                 plot(ImageNumbers(FitValid == 1), Widths_plot(FitValid == 1),'Parent',h.PlotS_Result3_Fig,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r');
                        %                 errorbar(ImageNumbers(FitValid == 1),Widths_plot(FitValid == 1),Error(FitValid == 1),'Parent',h.PlotS_Fig_plot_f1)
                        if h.Smooth == 1
                            plot(ImageNumbers, Area_Smooth,'Parent',h.PlotS_Fig_plot_f1,'LineStyle','none','Marker','o','MarkerFaceColor','c','MarkerEdgeColor','c');
                            plot(ImageNumbers(FitValid_Smooth == 1), Widths_plot_Smooth(FitValid_Smooth == 1),'Parent',h.PlotS_Fig_plot_f1,'LineStyle','none','Marker','o','MarkerFaceColor','g','MarkerEdgeColor','g');
                            legend('Area M','Area GF','Error GF','Area MS','Area GFS')
                        else
                            legend('Area M','Area GF','Error GF')
                        end
                        xlabel('Image')
                        title(sprintf('F5: Intensity  --- Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent',h.PlotS_Fig_plot_f1);
                        
                    elseif h.Energy_Check == 1
                        plot(Energy_Image,Area,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Fig_plot_f1);
                        hold on
                        plot(Energy_Image(FitValid ==1),Widths_plot(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r','Parent',h.PlotS_Result3_Fig)
                        errorbar(Energy_Image(FitValid == 1),Widths_plot(FitValid == 1),Error(FitValid == 1),'Parent',h.PlotS_Fig_plot_f1)
                        if h.Smooth == 1
                            plot(Energy_Image, Area_Smooth,'Parent',h.PlotS_Result3_Fig,'LineStyle','none','Marker','o','MarkerFaceColor','c','MarkerEdgeColor','c');
                            plot(Energy_Image(FitValid_Smooth == 1), Widths_plot_Smooth(FitValid_Smooth == 1),'Parent',h.PlotS_Fig_plot_f1,'LineStyle','none','Marker','o','MarkerFaceColor','g','MarkerEdgeColor','g');
                            legend('Area M','Area GF','Error GF','Area MS','Area GFS')
                        else
                            legend('Area M','Area GF','Error GF')
                        end
                        xlabel('Energy(eV)')
                        title(sprintf('F5: Intensity  --- Strip %d, 0 position =  %d eV',i_Strip,Energy_value),'Parent',h.PlotS_Fig_plot_f1);
                        
                    end
                    ylabel('Intensity(abr units)')
                    
                    xlim auto
                    ylim auto
                    
                    
                    
                    axes(h.PlotS_Result4_Fig)
                    hold off
                    
                    if h.Energy_Check == 0
                        %                  plot(ImageNumbers(FitValid == 1),MaxPos(FitValid == 1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.PlotS_Result4_Fig);
                        hold on
                        size(ImageNumbers)
                        size(Max_Pos_Manu_array)
                        plot(ImageNumbers,Max_Pos_Manu_array,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Result4_Fig);
                        legend('MaxPos GF','MaxPos M')
                        
                        xlabel('Image')
                        title(sprintf('F6: Peak position  --- Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent',h.PlotS_Result4_Fig);
                    elseif h.Energy_Check == 1
                        plot(Energy_Image(FitValid ==1),MaxPos(FitValid == 1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.PlotS_Result4_Fig)
                        hold on
                        plot(Energy_Image,Max_Pos_Manu_array,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Result4_Fig)
                        legend('MaxPos GF','MaxPos M')
                        xlabel('Energy(eV)')
                        title(sprintf('F6: Peak position  --- Strip %d, 0 position =  %d eV',i_Strip,Energy_value),'Parent',h.PlotS_Result4_Fig)
                    end
                    xlim auto
                    ylim auto
                    
                    if h.micro_Check == 1
                        ylabel('Position (um)')
                    else
                        ylabel('Position (um)')
                    end
                    
                    axes(h.PlotS_Fig_plot_f6)
                    hold off
                    
                    if h.Energy_Check == 0
                        %                  plot(ImageNumbers(FitValid == 1),MaxPos(FitValid == 1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.PlotS_Fig_plot_f6);
                        hold on
                        plot(ImageNumbers,Max_Pos_Manu_array,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Fig_plot_f6);
                        legend('MaxPos GF','MaxPos M')
                    end
                    xlabel('Image')
                    title(sprintf('F6: Peak position  --- Strip %d, %d - %d pix',i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent',h.PlotS_Fig_plot_f6);
                elseif h.Energy_Check == 1
                    plot(Energy_Image(FitValid ==1),MaxPos(FitValid == 1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.PlotS_Fig_plot_f6)
                    hold on
                    plot(Energy_Image,Max_Pos_Manu_array,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Fig_plot_f6)
                    legend('MaxPos GF','MaxPos M')
                    xlabel('Energy(eV)')
                    title(sprintf('F6: Peak position  --- Strip %d, 0 position =  %d eV',i_Strip,Energy_value),'Parent',h.PlotS_Fig_plot_f6)
                end
                xlim auto
                ylim auto
                
                if h.micro_Check == 1
                    ylabel('Position (um)')
                else
                    ylabel('Position (um)')
                end
                
                pause(5)
                
                
            end
            RSquare = FitQuality.rsquare;
            set(h.RSquare_MG,'String',RSquare)
        end
        
        
    end

    function Pre_Plot_Sections_MG (source,eventdata)
        Plot_Panel_Print_call
        if source == h.PlotSections_MG_Preplot
            
            child = get(h.PlotS_Result_Fig,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
            child = get(h.PlotS_Fig_plot_f3,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            ImageNumbers = h.ImageNumbers;
      
        StripRanges = h.StripRanges;
        ColumnRanges = h.ColumnRange;
        ScanNumber = h.ScanNumber;
        h.Scan_number_save = ScanNumber;
        set(h.Scan_number_load,'String',ScanNumber);
        
        
        if get(h.Strip_scan_Extract_1,'Value') == 1  
            StripIntensities1 = h.StripIntensities1*1000;

        end
        if get(h.Strip_scan_Extract_2,'Value') == 1
            StripIntensities2= h.StripIntensities2*1000;

        end
        if get(h.Strip_scan_Extract_3,'Value') == 1
            StripIntensities3= h.StripIntensities3*1000;

        end
        if get(h.Strip_scan_Extract_4,'Value') == 1 
            StripIntensities4= h.StripIntensities4*1000;
            
        end
        

        if h.micro_Check == 1
            micro_val = h.micro_value;
        end

        
        Delta_x_min = eval(get(h.Delta_x_min,'String'));
        Delta_x_max = eval(get(h.Delta_x_max,'String'));
        
        center_max_val = 0;
        if get(h.center_max,'Value') == 1
             center_max_val = eval(get(h.center_max_val,'String'));
        end
        
        
        %%
        
       
        switch h.Number_MultiGauss_val
             case 1
                 MultiGaussFunction = fittype('a01*exp(-((x-xcenter1)/halfwidth).^2/2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','halfwidth','baseline'});
                 InitialWidth_pix = 8*ones(1,1);                 
             case 2
                 MultiGaussFunction = fittype('a01*exp(-((x-xcenter1)/halfwidth1).^2/2)+a02*exp(-((x-xcenter2)/halfwidth2).^2/2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','a02','xcenter2','halfwidth1','halfwidth2','baseline'});
                 InitialWidth_pix = 8*ones(1,2);
             case 3
                 MultiGaussFunction = fittype('a01*exp(-((x-xcenter1)/halfwidth1).^2/2)+a02*exp(-((x-xcenter2)/halfwidth2).^2/2)+a03*exp(-((x-xcenter3)/halfwidth3).^2/2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','a02','xcenter2','a03','xcenter3','halfwidth1','halfwidth2','halfwidth3','baseline'});           
                 InitialWidth_pix = 8*ones(1,3);
             case 4
                 MultiGaussFunction = fittype('a01*exp(-((x-xcenter1)/halfwidth1).^2/2)+a02*exp(-((x-xcenter2)/halfwidth2).^2/2)+a03*exp(-((x-xcenter3)/halfwidth3).^2/2)+a04*exp(-((x-xcenter4)/halfwidth4).^2/2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','a02','xcenter2','a03','xcenter3','a04','xcenter4','halfwidth1','halfwidth2','halfwidth3','halfwidth4','baseline'});
                 InitialWidth_pix = 8*ones(1,4);
             case 5
                 MultiGaussFunction = fittype('a01*exp(-((x-xcenter1)/halfwidth1).^2/2)+a02*exp(-((x-xcenter2)/halfwidth2).^2/2)+a03*exp(-((x-xcenter3)/halfwidth3).^2/2)+a04*exp(-((x-xcenter4)/halfwidth4).^2/2)+a05*exp(-((x-xcenter5)/halfwidth5).^2/2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','a02','xcenter2','a03','xcenter3','a04','xcenter4','a05','xcenter5','halfwidth1','halfwidth2','halfwidth3','halfwidth4','halfwidth5','baseline'});
                 InitialWidth_pix = 8*ones(1,5);
             case 6
                 MultiGaussFunction = fittype('a01*exp(-((x-xcenter1)/halfwidth1).^2/2)+a02*exp(-((x-xcenter2)/halfwidth2).^2/2)+a03*exp(-((x-xcenter3)/halfwidth3).^2/2)+a04*exp(-((x-xcenter4)/halfwidth4).^2/2)+a05*exp(-((x-xcenter5)/halfwidth5).^2/2)+a06*exp(-((x-xcenter6)/halfwidth6).^2/2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','a02','xcenter2','a03','xcenter3','a04','xcenter4','a05','xcenter5','a06','xcenter6','halfwidth1','halfwidth2','halfwidth3','halfwidth4','halfwidth5','halfwidth6','baseline'});
                 InitialWidth_pix = 8*ones(1,6);
             case 7
                 MultiGaussFunction = fittype('a01*exp(-((x-xcenter1)/halfwidth1).^2/2)+a02*exp(-((x-xcenter2)/halfwidth2).^2/2)+a03*exp(-((x-xcenter3)/halfwidth3).^2/2)+a04*exp(-((x-xcenter4)/halfwidth4).^2/2)+a05*exp(-((x-xcenter5)/halfwidth5).^2/2)+a06*exp(-((x-xcenter6)/halfwidth6).^2/2)+a07*exp(-((x-xcenter7)/halfwidth7).^2/2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','a02','xcenter2','a03','xcenter3','a04','xcenter4','a05','xcenter5','a06','xcenter6','a07','xcenter7','halfwidth1','halfwidth2','halfwidth3','halfwidth4','halfwidth5','halfwidth6','halfwidth7','baseline'});
                 InitialWidth_pix = 8*ones(1,7);
             case 8
                 MultiGaussFunction = fittype('a01*exp(-((x-xcenter1)/halfwidth1).^2/2)+a02*exp(-((x-xcenter2)/halfwidth2).^2/2)+a03*exp(-((x-xcenter3)/halfwidth3).^2/2)+a04*exp(-((x-xcenter4)/halfwidth4).^2/2)+a05*exp(-((x-xcenter5)/halfwidth5).^2/2)+a06*exp(-((x-xcenter6)/halfwidth6).^2/2)+a07*exp(-((x-xcenter7)/halfwidth7).^2/2)+a08*exp(-((x-xcenter8)/halfwidth8).^2/2)+baseline','independent',{'x'},'coefficients',{'a01','xcenter1','a02','xcenter2','a03','xcenter3','a04','xcenter4','a05','xcenter5','a06','xcenter6','a07','xcenter7','a08','xcenter8','halfwidth1','halfwidth2','halfwidth3','halfwidth4','halfwidth5','halfwidth6','halfwidth7','halfwidth8','baseline'});
                 InitialWidth_pix = 8*ones(1,8);                 
         end
                
        rsquare_min = 0.3;
        
                
        %%
        N_images = length(ImageNumbers);
        N_StripRanges = size(StripRanges,1);   
        Strip_Extract= h.Strip_Extract;
             

                  
        %%
        
        N_StripRanges =0;
        i_Strip_values = 0;
        t_Extract = 1;
        for i_Extract = 1:size(Strip_Extract,2)
            if Strip_Extract(1,i_Extract)==0
            else
                N_StripRanges = N_StripRanges +1;
                i_Strip_values(1,t_Extract) = Strip_Extract(1,i_Extract);
                t_Extract = t_Extract+ 1;
            end
            
        end
        
        for i_Extract= 1:N_StripRanges
            
            i_Strip = i_Strip_values(1,i_Extract);        
            
            
            if i_Strip == 1
                 StripIntensities = StripIntensities1;
               
                set(h.Strip_scan,'Value',1)
                set(h.Strip_scan1,'Value',0)
                set(h.Strip_scan2,'Value',0)
                set(h.Strip_scan3,'Value',0)
            elseif i_Strip == 2
                StripIntensities = StripIntensities2;

                set(h.Strip_scan,'Value',0)
                set(h.Strip_scan1,'Value',1)
                set(h.Strip_scan2,'Value',0)
                set(h.Strip_scan3,'Value',0)
            elseif i_Strip == 3
                StripIntensities = StripIntensities3;

                set(h.Strip_scan,'Value',0)
                set(h.Strip_scan1,'Value',0)
                set(h.Strip_scan2,'Value',1)
                set(h.Strip_scan3,'Value',0)
            elseif i_Strip == 4
                StripIntensities = StripIntensities4;
                
                set(h.Strip_scan,'Value',0)
                set(h.Strip_scan1,'Value',0)
                set(h.Strip_scan2,'Value',0)
                set(h.Strip_scan3,'Value',1)                
            end
             
            N_ColumnPixels = ColumnRanges(i_Strip,2)-ColumnRanges(i_Strip,1)+1  ;    
            
            if i_Strip == 1
                StripRanges_plot = linspace(StripRanges(1,1),StripRanges(1,2),StripRanges(1,2)/h.factorrow-StripRanges(1,1)/h.factorrow+1)-center_max_val;
                StripIntensities_mean1 = mean(squeeze(StripIntensities(:,:,1)),1);
                Background1 = 0;
            elseif i_Strip == 2
                StripRanges_plot = linspace(StripRanges(2,1),StripRanges(2,2),StripRanges(2,2)/h.factorrow-StripRanges(2,1)/h.factorrow+1)-center_max_val;
                StripIntensities_mean2 = mean(squeeze(StripIntensities(:,:,2)),1);
                Background2 = 0;
            elseif i_Strip == 3                    
                StripRanges_plot = linspace(StripRanges(3,1),StripRanges(3,2),StripRanges(3,2)/h.factorrow-StripRanges(3,1)/h.factorrow+1)-center_max_val;
                StripIntensities_mean3 = mean(squeeze(StripIntensities(:,:,3)),1);
                Background3 = 0;
            elseif i_Strip == 4
                StripRanges_plot = linspace(StripRanges(4,1),StripRanges(4,2),StripRanges(4,2)/h.factorrow-StripRanges(4,1)/h.factorrow+1)-center_max_val;
                StripIntensities_mean4 = mean(squeeze(StripIntensities(:,:,4)),1);
                Background4 = 0;
            end        
           
            max_I = 0;
            
            axes(h.PlotS_Fig)
            hold off

             
             if h.micro_Check ==1
                 xlabel('Position (um)')
             else
                 xlabel('Position (um)')
             end
             ylabel('Intensity (arb units)')
                 
             

             if h.micro_Check == 1
                 ColumnRange = ColumnRanges * micro_val;
             else
                 ColumnRange = ColumnRanges;
             end
             
  
    
             for i_im = 1:N_images                 
                 
                 if i_Strip ==1
                     Background = Background1;                      
                 elseif i_Strip ==2
                      Background = Background2;   
                 elseif i_Strip ==3
                       Background = Background3;   
                 elseif i_Strip ==4
                       Background = Background4;   
                 end
                 YMin = 0.9*Background;
                 
                                  
                 [tonto,N_Strip] = size(squeeze(StripIntensities(i_im,:,i_Strip)));
                 
                

                 
                 if h.Smooth == 1
                     
                     Intensities_Strip = squeeze(StripIntensities(i_im,:,i_Strip));                        
                 end
                 

                 
                  ColumnRangesArray = linspace(ColumnRange(i_Strip,1),ColumnRange(i_Strip,2),N_Strip);
                 [max_I_image, index_max_image] = max(StripIntensities(i_im,:,i_Strip));
                 x_values = StripRanges_plot;

                 max_I = max(max_I,max_I_image);      


                     
                     h.Save_multi_yes = 1;
                     switch h.Number_MultiGauss_val
                         case 1
                             %Initial Values
                             max_I1 = eval(get(h.max_I_MG_1,'String'));                            
                             x_max1 = eval(get(h.x_max_Picture_1,'String'));                             
                             InitialWidth_pix(1,1) = eval(get(h.FWHM_MG_1,'String'));
                             if get(h.Gaussian_Dist_Check,'Value') == 1
                                 InitialWidth_pix =  InitialWidth_pix/2.355;
                             else
                                 InitialWidth_pix =  InitialWidth_pix/2;
                             end
                             
                             FittedCoefficients = [max_I1,x_max1,InitialWidth_pix(1,1),Background];
                         case 2
                             %Initial Values
                             max_I1 = eval(get(h.max_I_MG_1,'String'));
                             x_max1 = eval(get(h.x_max_Picture_1,'String'));
                             max_I2 = eval(get(h.max_I_MG_2,'String'));
                             x_max2 = eval(get(h.x_max_Picture_2,'String'));
                             InitialWidth_pix(1,1) = eval(get(h.FWHM_MG_1,'String'));
                             InitialWidth_pix(1,2) = eval(get(h.FWHM_MG_2,'String'));
                             if get(h.Gaussian_Dist_Check,'Value') == 1
                                 InitialWidth_pix =  InitialWidth_pix/2.355;
                             else
                                 InitialWidth_pix =  InitialWidth_pix/2;
                             end
                             FittedCoefficients = [max_I1,x_max1,max_I2,x_max2,InitialWidth_pix(1,1),InitialWidth_pix(1,2),Background];                             
                             
                         case 3                             
                            max_I1 = eval(get(h.max_I_MG_1,'String'));                        
                             x_max1 = eval(get(h.x_max_Picture_1,'String'));
                             max_I2 = eval(get(h.max_I_MG_2,'String'));
                             x_max2 = eval(get(h.x_max_Picture_2,'String'));                                                                                     
                             max_I3 = eval(get(h.max_I_MG_3,'String'));
                             x_max3 = eval(get(h.x_max_Picture_3,'String'));
                             InitialWidth_pix(1,1) = eval(get(h.FWHM_MG_1,'String'));
                             InitialWidth_pix(1,2) = eval(get(h.FWHM_MG_2,'String'));
                             InitialWidth_pix(1,3) = eval(get(h.FWHM_MG_3,'String'));
                             if get(h.Gaussian_Dist_Check,'Value') == 1
                                 InitialWidth_pix =  InitialWidth_pix/2.355;
                             else
                                 InitialWidth_pix =  InitialWidth_pix/2;
                             end
                             
                             FittedCoefficients = [max_I1,x_max1,max_I2,x_max2,max_I3,x_max3,InitialWidth_pix(1,1),InitialWidth_pix(1,2),InitialWidth_pix(1,3),Background];
                                                          
                         case 4                             
                             max_I1 = eval(get(h.max_I_MG_1,'String'));                           
                             x_max1 = eval(get(h.x_max_Picture_1,'String'));
                             max_I2 = eval(get(h.max_I_MG_2,'String'));
                             x_max2 = eval(get(h.x_max_Picture_2,'String'));                                                                                     
                             max_I3 = eval(get(h.max_I_MG_3,'String'));
                             x_max3 = eval(get(h.x_max_Picture_3,'String'));                                                                                                                  
                             max_I4 = eval(get(h.max_I_MG_4,'String'));
                             x_max4 = eval(get(h.x_max_Picture_4,'String'));
                             InitialWidth_pix(1,1) = eval(get(h.FWHM_MG_1,'String'));
                             InitialWidth_pix(1,2) = eval(get(h.FWHM_MG_2,'String'));
                             InitialWidth_pix(1,3) = eval(get(h.FWHM_MG_3,'String'));
                             InitialWidth_pix(1,4) = eval(get(h.FWHM_MG_4,'String'));
                             if get(h.Gaussian_Dist_Check,'Value') == 1
                                 InitialWidth_pix =  InitialWidth_pix/2.355;
                             else
                                 InitialWidth_pix =  InitialWidth_pix/2;
                             end
                             
                             FittedCoefficients = [max_I1,x_max1,max_I2,x_max2,max_I3,x_max3,max_I4,x_max4,InitialWidth_pix(1,1),InitialWidth_pix(1,2),InitialWidth_pix(1,3),InitialWidth_pix(1,4),Background];                             
                             
                         case 5                             
                             max_I1 = eval(get(h.max_I_MG_1,'String'));                           
                             x_max1 = eval(get(h.x_max_Picture_1,'String'));
                             max_I2 = eval(get(h.max_I_MG_2,'String'));
                             x_max2 = eval(get(h.x_max_Picture_2,'String'));
                             max_I3 = eval(get(h.max_I_MG_3,'String'));
                             x_max3 = eval(get(h.x_max_Picture_3,'String'));
                             max_I4 = eval(get(h.max_I_MG_4,'String'));
                             x_max4 = eval(get(h.x_max_Picture_4,'String'));
                             max_I5 = eval(get(h.max_I_MG_5,'String'));
                             x_max5 = eval(get(h.x_max_Picture_5,'String'));
                             InitialWidth_pix(1,1) = eval(get(h.FWHM_MG_1,'String'));
                             InitialWidth_pix(1,2) = eval(get(h.FWHM_MG_2,'String'));
                             InitialWidth_pix(1,3) = eval(get(h.FWHM_MG_3,'String'));
                             InitialWidth_pix(1,4) = eval(get(h.FWHM_MG_4,'String'));
                             InitialWidth_pix(1,5) = eval(get(h.FWHM_MG_5,'String'));
                                   
                             if get(h.Gaussian_Dist_Check,'Value') == 1
                                 InitialWidth_pix =  InitialWidth_pix/2.355;
                             else
                                 InitialWidth_pix =  InitialWidth_pix/2;
                             end
                             
                             FittedCoefficients = [max_I1,x_max1,max_I2,x_max2,max_I3,x_max3,max_I4,x_max4,max_I5,x_max5,InitialWidth_pix(1,1),InitialWidth_pix(1,2),InitialWidth_pix(1,3),InitialWidth_pix(1,4),InitialWidth_pix(1,5),Background];                             
                             
                         case 6                             
                             max_I1 = eval(get(h.max_I_MG_1,'String'));
                             x_max1 = eval(get(h.x_max_Picture_1,'String'));
                             max_I2 = eval(get(h.max_I_MG_2,'String'));
                             x_max2 = eval(get(h.x_max_Picture_2,'String'));
                             max_I3 = eval(get(h.max_I_MG_3,'String'));
                             x_max3 = eval(get(h.x_max_Picture_3,'String'));
                             max_I4 = eval(get(h.max_I_MG_4,'String'));
                             x_max4 = eval(get(h.x_max_Picture_4,'String'));
                             max_I5 = eval(get(h.max_I_MG_5,'String'));
                             x_max5 = eval(get(h.x_max_Picture_5,'String'));
                             max_I6 = eval(get(h.max_I_MG_6,'String'));
                             x_max6 = eval(get(h.x_max_Picture_6,'String'));
                             InitialWidth_pix(1,1) = eval(get(h.FWHM_MG_1,'String'));
                             InitialWidth_pix(1,2) = eval(get(h.FWHM_MG_2,'String'));
                             InitialWidth_pix(1,3) = eval(get(h.FWHM_MG_3,'String'));
                             InitialWidth_pix(1,4) = eval(get(h.FWHM_MG_4,'String'));
                             InitialWidth_pix(1,5) = eval(get(h.FWHM_MG_5,'String'));
                             InitialWidth_pix(1,6) = eval(get(h.FWHM_MG_6,'String'));
                             if get(h.Gaussian_Dist_Check,'Value') == 1
                                 InitialWidth_pix =  InitialWidth_pix/2.355;
                             else
                                 InitialWidth_pix =  InitialWidth_pix/2;
                             end
                             
                             FittedCoefficients = [max_I1,x_max1,max_I2,x_max2,max_I3,x_max3,max_I4,x_max4,max_I5,x_max5,max_I6,x_max6,InitialWidth_pix(1,1),InitialWidth_pix(1,2),InitialWidth_pix(1,3),InitialWidth_pix(1,4),InitialWidth_pix(1,5),InitialWidth_pix(1,6),Background];
                             
                         case 7                             
                             max_I1 = eval(get(h.max_I_MG_1,'String'));
                             x_max1 = eval(get(h.x_max_Picture_1,'String'));
                             max_I2 = eval(get(h.max_I_MG_2,'String'));
                             x_max2 = eval(get(h.x_max_Picture_2,'String'));
                             max_I3 = eval(get(h.max_I_MG_3,'String'));
                             x_max3 = eval(get(h.x_max_Picture_3,'String'));
                             max_I4 = eval(get(h.max_I_MG_4,'String'));
                             x_max4 = eval(get(h.x_max_Picture_4,'String'));
                             max_I5 = eval(get(h.max_I_MG_5,'String'));
                             x_max5 = eval(get(h.x_max_Picture_5,'String'));
                             max_I6 = eval(get(h.max_I_MG_6,'String'));
                             x_max6 = eval(get(h.x_max_Picture_6,'String'));
                             max_I7 = eval(get(h.max_I_MG_7,'String'));
                             x_max7 = eval(get(h.x_max_Picture_7,'String'));
                             InitialWidth_pix(1,1) = eval(get(h.FWHM_MG_1,'String'));
                             InitialWidth_pix(1,2) = eval(get(h.FWHM_MG_2,'String'));
                             InitialWidth_pix(1,3) = eval(get(h.FWHM_MG_3,'String'));
                             InitialWidth_pix(1,4) = eval(get(h.FWHM_MG_4,'String'));
                             InitialWidth_pix(1,5) = eval(get(h.FWHM_MG_5,'String'));
                             InitialWidth_pix(1,6) = eval(get(h.FWHM_MG_6,'String'));
                             InitialWidth_pix(1,7) = eval(get(h.FWHM_MG_7,'String'));
                             
                             if get(h.Gaussian_Dist_Check,'Value') == 1
                                 InitialWidth_pix =  InitialWidth_pix/2.355;
                             else
                                 InitialWidth_pix =  InitialWidth_pix/2;
                             end
                             
                             FittedCoefficients = [max_I1,x_max1,max_I2,x_max2,max_I3,x_max3,max_I4,x_max4,max_I5,x_max5,max_I6,x_max6,max_I7,x_max7,InitialWidth_pix(1,1),InitialWidth_pix(1,2),InitialWidth_pix(1,3),InitialWidth_pix(1,4),InitialWidth_pix(1,5),InitialWidth_pix(1,6),InitialWidth_pix(1,7),Background];
                             
                         case 8                             
                             max_I1 = eval(get(h.max_I_MG_1,'String'));
                             x_max1 = eval(get(h.x_max_Picture_1,'String'));
                             max_I2 = eval(get(h.max_I_MG_2,'String'));
                             x_max2 = eval(get(h.x_max_Picture_2,'String'));
                             max_I3 = eval(get(h.max_I_MG_3,'String'));
                             x_max3 = eval(get(h.x_max_Picture_3,'String'));
                             max_I4 = eval(get(h.max_I_MG_4,'String'));
                             x_max4 = eval(get(h.x_max_Picture_4,'String'));
                             max_I5 = eval(get(h.max_I_MG_5,'String'));
                             x_max5 = eval(get(h.x_max_Picture_5,'String'));
                             max_I6 = eval(get(h.max_I_MG_6,'String'));
                             x_max6 = eval(get(h.x_max_Picture_6,'String'));
                             max_I7 = eval(get(h.max_I_MG_7,'String'));
                             x_max7 = eval(get(h.x_max_Picture_7,'String'));                             
                             max_I8 = eval(get(h.max_I_MG_8,'String'));
                             x_max8 = eval(get(h.x_max_Picture_8,'String'));
                             InitialWidth_pix(1,1) = eval(get(h.FWHM_MG_1,'String'));
                             InitialWidth_pix(1,2) = eval(get(h.FWHM_MG_2,'String'));
                             InitialWidth_pix(1,3) = eval(get(h.FWHM_MG_3,'String'));
                             InitialWidth_pix(1,4) = eval(get(h.FWHM_MG_4,'String'));
                             InitialWidth_pix(1,5) = eval(get(h.FWHM_MG_5,'String'));
                             InitialWidth_pix(1,6) = eval(get(h.FWHM_MG_6,'String'));
                             InitialWidth_pix(1,7) = eval(get(h.FWHM_MG_7,'String'));
                             InitialWidth_pix(1,8) = eval(get(h.FWHM_MG_8,'String'));
                             if get(h.Gaussian_Dist_Check,'Value') == 1
                                 InitialWidth_pix =  InitialWidth_pix/2.355;
                             else
                                 InitialWidth_pix =  InitialWidth_pix/2;
                             end

                             FittedCoefficients = [max_I1,x_max1,max_I2,x_max2,max_I3,x_max3,max_I4,x_max4,max_I5,x_max5,max_I6,x_max6,max_I7,x_max7,max_I8,x_max8,InitialWidth_pix(1,1),InitialWidth_pix(1,2),InitialWidth_pix(1,3),InitialWidth_pix(1,4),InitialWidth_pix(1,5),InitialWidth_pix(1,6),InitialWidth_pix(1,7),InitialWidth_pix(1,8),Background];                                                          
                     end
                     

                 axes(h.PlotS_Result_Fig)
                 
                 plot(StripRanges_plot,squeeze(StripIntensities(i_im,:,i_Strip)),'Parent', h.PlotS_Result_Fig,'LineWidth',2,'MarkerSize',2,'Color','b');

                 title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Result_Fig);
                 hold on
                 BackgroundArray = Background*ones(1,N_Strip);
                 plot(StripRanges_plot,BackgroundArray*10,'Color','k','LineStyle','--','Parent',h.PlotS_Result_Fig);                 
                                  
                 axes(h.PlotS_Fig_plot_f3)
                 plot(StripRanges_plot,squeeze(StripIntensities(i_im,:,i_Strip)),'Parent', h.PlotS_Fig_plot_f3,'LineWidth',2,'MarkerSize',2,'Color','b');

                 title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(i_im),i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Fig_plot_f3);
                 hold on                 
                 plot(StripRanges_plot,BackgroundArray*10,'Color','k','LineStyle','--','Parent',h.PlotS_Fig_plot_f3);                 
                   
                 axes(h.PlotS_Result_Fig)
                 
                 i_MultiGaussFunction1 = 0;
                 i_MultiGaussFunction2 = 0;
                 i_MultiGaussFunction3 = 0;
                 i_MultiGaussFunction4 = 0;
                 i_MultiGaussFunction5 = 0;
                 i_MultiGaussFunction6 = 0;
                 i_MultiGaussFunction7 = 0;
                 i_MultiGaussFunction8 = 0;
                 i_MultiGaussFunction = 0;
                 switch h.Number_MultiGauss_val
                     case 1
                         if  get(h.Lorentzian_Dist_Check,'Value') == 1
                             % Cauchy distribution
                             MultiGaussFunction1 = FittedCoefficients(1,1)/(pi*FittedCoefficients(1,3))./(1+((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,3)).^2)+ FittedCoefficients(1,4);                            
                             MultiGaussFunction = FittedCoefficients(1,1)/(pi*FittedCoefficients(1,3))./(1+((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,3)).^2) + FittedCoefficients(1,4);
                         else
                             % Gaussian distribution
                             MultiGaussFunction1 = F