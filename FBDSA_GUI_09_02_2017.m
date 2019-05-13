function FBDSA_GUI_09_02_2017
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
    'String','/das/work/p15/p15366/RN84/SwissFEL Simulations',...
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
            name_dir1 = get(h.Folder,'String');
            name_dir = uigetdir(name_dir1);
            for i_name = 1:size(name_dir,2)
                if name_dir(1,i_name) == '\'
                    name_dir_2(1,i_name) = '/';
                else
                    name_dir_2(1,i_name) = name_dir(1,i_name);
                end
            end
            name_dir_2
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
                             MultiGaussFunction1 = FittedCoefficients(1,1)*exp(-((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,3)).^2/2)+ FittedCoefficients(1,4);                         
                             MultiGaussFunction = FittedCoefficients(1,1)*exp(-((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,3)).^2/2)+ FittedCoefficients(1,4);    
                         end
                         
                         i_MultiGaussFunction = sum(MultiGaussFunction)-FittedCoefficients(1,4)*size(MultiGaussFunction,2);
                         i_MultiGaussFunction1 = sum(MultiGaussFunction1)-FittedCoefficients(1,4)*size(MultiGaussFunction1,2);
                         
                         plot(x_values,MultiGaussFunction1*1000,'Parent', h.PlotS_Result_Fig,'Color','y');                     
                         
                         
                         plot(x_values,MultiGaussFunction*1000,'Parent', h.PlotS_Result_Fig,'Color','r','LineStyle',':');                                              
                         Difference_plot_Fit = squeeze(StripIntensities(i_im,:,i_Strip)) - MultiGaussFunction;                         
                         plot(x_values,Difference_plot_Fit,'Parent', h.PlotS_Result_Fig,'Color','g','LineStyle',':');    
                         
                         axes(h.PlotS_Fig_plot_f3)
                         plot(x_values,MultiGaussFunction1*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','y');                                              
                         plot(x_values,MultiGaussFunction*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','r','LineStyle',':');                                                                                    
                         plot(x_values,Difference_plot_Fit,'Parent', h.PlotS_Fig_plot_f3,'Color','g','LineStyle',':');    
                         
                     case 2   
                          if  get(h.Lorentzian_Dist_Check,'Value') == 1
                             % Cauchy distribution
                             MultiGaussFunction1 = FittedCoefficients(1,1)/(pi*FittedCoefficients(1,5))./(1+((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,5)).^2)+ FittedCoefficients(1,7);
                             MultiGaussFunction2 = FittedCoefficients(1,3)/(pi*FittedCoefficients(1,6))./(1+((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,6)).^2)+ FittedCoefficients(1,7);
                             MultiGaussFunction = FittedCoefficients(1,1)/(pi*FittedCoefficients(1,5))./(1+((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,5)).^2)+ FittedCoefficients(1,3)/(pi*FittedCoefficients(1,6))./(1+((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,6)).^2)+ FittedCoefficients(1,7);
                         else            
                             % Gaussian distribution
                             MultiGaussFunction1 = FittedCoefficients(1,1)*exp(-((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,5)).^2/2)+ FittedCoefficients(1,7);
                             MultiGaussFunction2 = FittedCoefficients(1,3)*exp(-((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,6)).^2/2)+ FittedCoefficients(1,7);
                             MultiGaussFunction = FittedCoefficients(1,1)*exp(-((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,5)).^2/2)+ FittedCoefficients(1,3)*exp(-((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,6)).^2/2)+ FittedCoefficients(1,7);
                          end
                          
                          i_MultiGaussFunction = sum(MultiGaussFunction)-FittedCoefficients(1,7)*size(MultiGaussFunction,2);
                         i_MultiGaussFunction1 = sum(MultiGaussFunction1)-FittedCoefficients(1,7)*size(MultiGaussFunction1,2);
                         i_MultiGaussFunction2 = sum(MultiGaussFunction2)-FittedCoefficients(1,7)*size(MultiGaussFunction2,2);
                         
                         plot(x_values,MultiGaussFunction1*1000,'Parent', h.PlotS_Result_Fig,'Color','y');                     
                         plot(x_values,MultiGaussFunction2*1000,'Parent', h.PlotS_Result_Fig,'Color','c');                 
                         
                         
                         plot(x_values,MultiGaussFunction*1000,'Parent', h.PlotS_Result_Fig,'Color','r','LineStyle',':');                                              
                         Difference_plot_Fit = squeeze(StripIntensities(i_im,:,i_Strip)) - MultiGaussFunction;                         
                         plot(x_values,Difference_plot_Fit,'Parent', h.PlotS_Result_Fig,'Color','g','LineStyle',':');     
                         
                         
                         axes(h.PlotS_Fig_plot_f3)
                         plot(x_values,MultiGaussFunction1*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','y');                     
                         plot(x_values,MultiGaussFunction2*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','c');                                               
                         plot(x_values,MultiGaussFunction*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','r','LineStyle',':');                                                                                    
                         plot(x_values,Difference_plot_Fit,'Parent', h.PlotS_Fig_plot_f3,'Color','g','LineStyle',':');    
                         
                     case 3
                           if  get(h.Lorentzian_Dist_Check,'Value') == 1
                             % Cauchy distribution
                             MultiGaussFunction1 = FittedCoefficients(1,1)/(pi*FittedCoefficients(1,7))./(1+((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,7)).^2)+ FittedCoefficients(1,10);
                             MultiGaussFunction2 = FittedCoefficients(1,3)/(pi*FittedCoefficients(1,8))./(1+((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,8)).^2)+ FittedCoefficients(1,10);
                             MultiGaussFunction3 = FittedCoefficients(1,5)/(pi*FittedCoefficients(1,9))./(1+((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,9)).^2)+ FittedCoefficients(1,10);
                             MultiGaussFunction = FittedCoefficients(1,1)/(pi*FittedCoefficients(1,7))./(1+((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,7)).^2)+ FittedCoefficients(1,3)/(pi*FittedCoefficients(1,8))./(1+((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,8)).^2)+FittedCoefficients(1,5)/(pi*FittedCoefficients(1,9))./(1+((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,9)).^2)+ FittedCoefficients(1,10);
                         else            
                             % Gaussian distribution                             
                             MultiGaussFunction1 = FittedCoefficients(1,1)*exp(-((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,7)).^2/2)+ FittedCoefficients(1,10);
                             MultiGaussFunction2 = FittedCoefficients(1,3)*exp(-((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,8)).^2/2)+ FittedCoefficients(1,10);
                             MultiGaussFunction3 = FittedCoefficients(1,5)*exp(-((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,9)).^2/2)+ FittedCoefficients(1,10);
                             MultiGaussFunction = FittedCoefficients(1,1)*exp(-((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,7)).^2/2)+ FittedCoefficients(1,3)*exp(-((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,8)).^2/2)+FittedCoefficients(1,5)*exp(-((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,9)).^2/2)+ FittedCoefficients(1,10);
                           end
                           i_MultiGaussFunction = sum(MultiGaussFunction)-FittedCoefficients(1,10)*size(MultiGaussFunction,2);
                         i_MultiGaussFunction1 = sum(MultiGaussFunction1)-FittedCoefficients(1,10)*size(MultiGaussFunction1,2);
                         i_MultiGaussFunction2 = sum(MultiGaussFunction2)-FittedCoefficients(1,10)*size(MultiGaussFunction2,2);
                         i_MultiGaussFunction3 = sum(MultiGaussFunction3)-FittedCoefficients(1,10)*size(MultiGaussFunction3,2);
                         
                         plot(x_values,MultiGaussFunction1*1000,'Parent', h.PlotS_Result_Fig,'Color','y');    
                         plot(x_values,MultiGaussFunction2*1000,'Parent', h.PlotS_Result_Fig,'Color','c');                     
                         plot(x_values,MultiGaussFunction3*1000,'Parent', h.PlotS_Result_Fig,'Color','r');    
                         
                        
                         plot(x_values,MultiGaussFunction*1000,'Parent', h.PlotS_Result_Fig,'Color','r','LineStyle',':');                                              
                         Difference_plot_Fit = squeeze(StripIntensities(i_im,:,i_Strip)) - MultiGaussFunction;                         
                         plot(x_values,Difference_plot_Fit,'Parent', h.PlotS_Result_Fig,'Color','g','LineStyle',':');                
                         
                         axes(h.PlotS_Fig_plot_f3)
                         plot(x_values,MultiGaussFunction1*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','y');                     
                         plot(x_values,MultiGaussFunction2*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','c');                                               
                         plot(x_values,MultiGaussFunction*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','r','LineStyle',':');                                                                                    
                         plot(x_values,Difference_plot_Fit,'Parent', h.PlotS_Fig_plot_f3,'Color','g','LineStyle',':');    
                         plot(x_values,MultiGaussFunction3*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','r');    
                         
                     case 4
                         if  get(h.Lorentzian_Dist_Check,'Value') == 1
                             % Cauchy distribution
                             MultiGaussFunction1 = FittedCoefficients(1,1)/(pi*FittedCoefficients(1,9))./(1+((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,9)).^2)+ FittedCoefficients(1,13);
                             MultiGaussFunction2 = FittedCoefficients(1,3)/(pi*FittedCoefficients(1,10))./(1+((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,10)).^2)+ FittedCoefficients(1,13);
                             MultiGaussFunction3 = FittedCoefficients(1,5)/(pi*FittedCoefficients(1,11))./(1+((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,11)).^2)+ FittedCoefficients(1,13);
                             MultiGaussFunction4 = FittedCoefficients(1,7)/(pi*FittedCoefficients(1,12))./(1+((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,12)).^2)+ FittedCoefficients(1,13);
                             MultiGaussFunction = FittedCoefficients(1,1)/(pi*FittedCoefficients(1,9))./(1+((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,9)).^2)+ FittedCoefficients(1,3)/(pi*FittedCoefficients(1,10))./(1+((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,10)).^2)+ FittedCoefficients(1,5)/(pi*FittedCoefficients(1,11))./(1+((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,11)).^2)+ FittedCoefficients(1,7)/(pi*FittedCoefficients(1,12))./(1+((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,12)).^2)+ FittedCoefficients(1,13);
                         else  
                             % Gaussian distribution                             
                             MultiGaussFunction1 = FittedCoefficients(1,1)*exp(-((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,9)).^2/2)+ FittedCoefficients(1,13);
                             MultiGaussFunction2 = FittedCoefficients(1,3)*exp(-((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,10)).^2/2)+ FittedCoefficients(1,13);
                             MultiGaussFunction3 = FittedCoefficients(1,5)*exp(-((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,11)).^2/2)+ FittedCoefficients(1,13);
                             MultiGaussFunction4 = FittedCoefficients(1,7)*exp(-((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,12)).^2/2)+ FittedCoefficients(1,13);
                             MultiGaussFunction = FittedCoefficients(1,1)*exp(-((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,9)).^2/2)+ FittedCoefficients(1,3)*exp(-((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,10)).^2/2)+FittedCoefficients(1,5)*exp(-((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,11)).^2/2)+ FittedCoefficients(1,7)*exp(-((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,12)).^2/2)+ FittedCoefficients(1,13);                             
                         end
                         i_MultiGaussFunction = sum(MultiGaussFunction)-FittedCoefficients(1,13)*size(MultiGaussFunction,2);
                         i_MultiGaussFunction1 = sum(MultiGaussFunction1)-FittedCoefficients(1,13)*size(MultiGaussFunction1,2);
                         i_MultiGaussFunction2 = sum(MultiGaussFunction2)-FittedCoefficients(1,13)*size(MultiGaussFunction2,2);
                         i_MultiGaussFunction3 = sum(MultiGaussFunction3)-FittedCoefficients(1,13)*size(MultiGaussFunction3,2);
                         i_MultiGaussFunction4 = sum(MultiGaussFunction4)-FittedCoefficients(1,13)*size(MultiGaussFunction4,2);
                         
                         plot(x_values,MultiGaussFunction1*1000,'Parent', h.PlotS_Result_Fig,'Color','y');    
                         plot(x_values,MultiGaussFunction2*1000,'Parent', h.PlotS_Result_Fig,'Color','c');                     
                         plot(x_values,MultiGaussFunction3*1000,'Parent', h.PlotS_Result_Fig,'Color','r');    
                         plot(x_values,MultiGaussFunction4*1000,'Parent', h.PlotS_Result_Fig,'Color','g');                             
                         
                         plot(x_values,MultiGaussFunction*1000,'Parent', h.PlotS_Result_Fig,'Color','r','LineStyle',':');                                              
                         Difference_plot_Fit = squeeze(StripIntensities(i_im,:,i_Strip)) - MultiGaussFunction;                         
                         plot(x_values,Difference_plot_Fit,'Parent', h.PlotS_Result_Fig,'Color','g','LineStyle',':');                
                         
                         axes(h.PlotS_Fig_plot_f3)
                         plot(x_values,MultiGaussFunction1*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','y');                     
                         plot(x_values,MultiGaussFunction2*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','c');                                               
                         plot(x_values,MultiGaussFunction*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','r','LineStyle',':');                                                                                    
                         plot(x_values,Difference_plot_Fit,'Parent', h.PlotS_Fig_plot_f3,'Color','g','LineStyle',':');    
                         plot(x_values,MultiGaussFunction3*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','r');   
                         plot(x_values,MultiGaussFunction4*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','g');    
                     case 5        
                         if  get(h.Lorentzian_Dist_Check,'Value') == 1
                             % Cauchy distribution
                             MultiGaussFunction1 = FittedCoefficients(1,1)/(pi*FittedCoefficients(1,11))./(1+((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,11)).^2)+ FittedCoefficients(1,16);
                             MultiGaussFunction2 = FittedCoefficients(1,3)/(pi*FittedCoefficients(1,12))./(1+((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,12)).^2)+ FittedCoefficients(1,16);
                             MultiGaussFunction3 = FittedCoefficients(1,5)/(pi*FittedCoefficients(1,13))./(1+((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,13)).^2)+ FittedCoefficients(1,16);
                             MultiGaussFunction4 = FittedCoefficients(1,7)/(pi*FittedCoefficients(1,14))./(1+((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,14)).^2)+ FittedCoefficients(1,16);
                             MultiGaussFunction5 = FittedCoefficients(1,9)/(pi*FittedCoefficients(1,15))./(1+((x_values-FittedCoefficients(1,10))/FittedCoefficients(1,15)).^2)+ FittedCoefficients(1,16);
                             MultiGaussFunction = FittedCoefficients(1,1)/(pi*FittedCoefficients(1,11))./(1+((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,11)).^2)+ FittedCoefficients(1,3)/(pi*FittedCoefficients(1,12))./(1+((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,12)).^2)+ FittedCoefficients(1,5)/(pi*FittedCoefficients(1,13))./(1+((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,13)).^2)+ FittedCoefficients(1,7)/(pi*FittedCoefficients(1,14))./(1+((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,14)).^2)+ FittedCoefficients(1,9)/(pi*FittedCoefficients(1,15))./(1+((x_values-FittedCoefficients(1,10))/FittedCoefficients(1,15)).^2)+ FittedCoefficients(1,16);
                         else  
                             % Gaussian distribution                             
                             MultiGaussFunction1 = FittedCoefficients(1,1)*exp(-((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,11)).^2/2)+ FittedCoefficients(1,16);
                             MultiGaussFunction2 = FittedCoefficients(1,3)*exp(-((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,12)).^2/2)+ FittedCoefficients(1,16);
                             MultiGaussFunction3 = FittedCoefficients(1,5)*exp(-((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,13)).^2/2)+ FittedCoefficients(1,16);
                             MultiGaussFunction4 = FittedCoefficients(1,7)*exp(-((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,14)).^2/2)+ FittedCoefficients(1,16);
                             MultiGaussFunction5 = FittedCoefficients(1,9)*exp(-((x_values-FittedCoefficients(1,10))/FittedCoefficients(1,15)).^2/2)+ FittedCoefficients(1,16);
                             MultiGaussFunction = FittedCoefficients(1,1)*exp(-((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,11)).^2/2)+ FittedCoefficients(1,3)*exp(-((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,12)).^2/2)+FittedCoefficients(1,5)*exp(-((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,13)).^2/2)+ FittedCoefficients(1,7)*exp(-((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,14)).^2/2)+ FittedCoefficients(1,9)*exp(-((x_values-FittedCoefficients(1,10))/FittedCoefficients(1,15)).^2/2)+ FittedCoefficients(1,16);                             
                         end
                         i_MultiGaussFunction = sum(MultiGaussFunction)-FittedCoefficients(1,16)*size(MultiGaussFunction,2);
                         i_MultiGaussFunction1 = sum(MultiGaussFunction1)-FittedCoefficients(1,16)*size(MultiGaussFunction1,2);
                         i_MultiGaussFunction2 = sum(MultiGaussFunction2)-FittedCoefficients(1,16)*size(MultiGaussFunction2,2);
                         i_MultiGaussFunction3 = sum(MultiGaussFunction3)-FittedCoefficients(1,16)*size(MultiGaussFunction3,2);
                         i_MultiGaussFunction4 = sum(MultiGaussFunction4)-FittedCoefficients(1,16)*size(MultiGaussFunction4,2);
                         i_MultiGaussFunction5 = sum(MultiGaussFunction5)-FittedCoefficients(1,16)*size(MultiGaussFunction5,2);
                         
                         
                         plot(x_values,MultiGaussFunction1*1000,'Parent', h.PlotS_Result_Fig,'Color','y');    
                         plot(x_values,MultiGaussFunction2*1000,'Parent', h.PlotS_Result_Fig,'Color','c');                     
                         plot(x_values,MultiGaussFunction3*1000,'Parent', h.PlotS_Result_Fig,'Color','r');    
                         plot(x_values,MultiGaussFunction4*1000,'Parent', h.PlotS_Result_Fig,'Color','g');    
                         plot(x_values,MultiGaussFunction5*1000,'Parent', h.PlotS_Result_Fig,'Color','k');    
                         
                         
                         plot(x_values,MultiGaussFunction*1000,'Parent', h.PlotS_Result_Fig,'Color','r','LineStyle',':');                                              
                         Difference_plot_Fit = squeeze(StripIntensities(i_im,:,i_Strip)) - MultiGaussFunction;                         
                         plot(x_values,Difference_plot_Fit,'Parent', h.PlotS_Result_Fig,'Color','g','LineStyle',':');                
                         
                         axes(h.PlotS_Fig_plot_f3)
                         plot(x_values,MultiGaussFunction1*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','y');                     
                         plot(x_values,MultiGaussFunction*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','c');                                               
                         plot(x_values,MultiGaussFunction*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','r','LineStyle',':');                                                                                    
                         plot(x_values,Difference_plot_Fit,'Parent', h.PlotS_Fig_plot_f3,'Color','g','LineStyle',':');    
                         plot(x_values,MultiGaussFunction3*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','r');   
                         plot(x_values,MultiGaussFunction4*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','g');    
                         plot(x_values,MultiGaussFunction5*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','k');    
                         
                     case 6             
                         if  get(h.Lorentzian_Dist_Check,'Value') == 1
                             % Cauchy distribution
                             MultiGaussFunction1 = FittedCoefficients(1,1)/(pi*FittedCoefficients(1,13))./(1+((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,13)).^2)+ FittedCoefficients(1,19);
                             MultiGaussFunction2 = FittedCoefficients(1,3)/(pi*FittedCoefficients(1,14))./(1+((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,14)).^2)+ FittedCoefficients(1,19);
                             MultiGaussFunction3 = FittedCoefficients(1,5)/(pi*FittedCoefficients(1,15))./(1+((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,15)).^2)+ FittedCoefficients(1,19);
                             MultiGaussFunction4 = FittedCoefficients(1,7)/(pi*FittedCoefficients(1,16))./(1+((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,16)).^2)+ FittedCoefficients(1,19);
                             MultiGaussFunction5 = FittedCoefficients(1,9)/(pi*FittedCoefficients(1,17))./(1+((x_values-FittedCoefficients(1,10))/FittedCoefficients(1,17)).^2)+ FittedCoefficients(1,19);
                             MultiGaussFunction6 = FittedCoefficients(1,11)/(pi*FittedCoefficients(1,18))./(1+((x_values-FittedCoefficients(1,12))/FittedCoefficients(1,18)).^2)+ FittedCoefficients(1,19);
                             MultiGaussFunction = FittedCoefficients(1,1)/(pi*FittedCoefficients(1,13))./(1+((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,13)).^2)+ FittedCoefficients(1,3)/(pi*FittedCoefficients(1,14))./(1+((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,14)).^2)+ FittedCoefficients(1,5)/(pi*FittedCoefficients(1,15))./(1+((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,15)).^2)+ FittedCoefficients(1,7)/(pi*FittedCoefficients(1,16))./(1+((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,16)).^2)+ FittedCoefficients(1,9)/(pi*FittedCoefficients(1,17))./(1+((x_values-FittedCoefficients(1,10))/FittedCoefficients(1,17)).^2)+ FittedCoefficients(1,11)/(pi*FittedCoefficients(1,18))./(1+((x_values-FittedCoefficients(1,12))/FittedCoefficients(1,18)).^2)+ FittedCoefficients(1,19);
                         else  
                             % Gaussian distribution  
                             MultiGaussFunction1 = FittedCoefficients(1,1)*exp(-((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,13)).^2/2)+ FittedCoefficients(1,19);
                             MultiGaussFunction2 = FittedCoefficients(1,3)*exp(-((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,14)).^2/2)+ FittedCoefficients(1,19);
                             MultiGaussFunction3 = FittedCoefficients(1,5)*exp(-((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,15)).^2/2)+ FittedCoefficients(1,19);
                             MultiGaussFunction4 = FittedCoefficients(1,7)*exp(-((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,16)).^2/2)+ FittedCoefficients(1,19);
                             MultiGaussFunction5 = FittedCoefficients(1,9)*exp(-((x_values-FittedCoefficients(1,10))/FittedCoefficients(1,17)).^2/2)+ FittedCoefficients(1,19);
                             MultiGaussFunction6 = FittedCoefficients(1,11)*exp(-((x_values-FittedCoefficients(1,12))/FittedCoefficients(1,18)).^2/2)+ FittedCoefficients(1,19);
                             MultiGaussFunction = FittedCoefficients(1,1)*exp(-((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,13)).^2/2)+ FittedCoefficients(1,3)*exp(-((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,14)).^2/2)+FittedCoefficients(1,5)*exp(-((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,15)).^2/2)+ FittedCoefficients(1,7)*exp(-((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,16)).^2/2)+ FittedCoefficients(1,9)*exp(-((x_values-FittedCoefficients(1,10))/FittedCoefficients(1,17)).^2/2)+FittedCoefficients(1,11)*exp(-((x_values-FittedCoefficients(1,12))/FittedCoefficients(1,18)).^2/2)+ FittedCoefficients(1,19);                             
                         end
                         i_MultiGaussFunction = sum(MultiGaussFunction)-FittedCoefficients(1,19)*size(MultiGaussFunction,2);
                         i_MultiGaussFunction1 = sum(MultiGaussFunction1)-FittedCoefficients(1,19)*size(MultiGaussFunction1,2);
                         i_MultiGaussFunction2 = sum(MultiGaussFunction2)-FittedCoefficients(1,19)*size(MultiGaussFunction2,2);
                         i_MultiGaussFunction3 = sum(MultiGaussFunction3)-FittedCoefficients(1,19)*size(MultiGaussFunction3,2);
                         i_MultiGaussFunction4 = sum(MultiGaussFunction4)-FittedCoefficients(1,19)*size(MultiGaussFunction4,2);
                         i_MultiGaussFunction5 = sum(MultiGaussFunction5)-FittedCoefficients(1,19)*size(MultiGaussFunction5,2);
                         i_MultiGaussFunction6 = sum(MultiGaussFunction6)-FittedCoefficients(1,19)*size(MultiGaussFunction6,2);
                         
                         plot(x_values,MultiGaussFunction1*1000,'Parent', h.PlotS_Result_Fig,'Color','y');    
                         plot(x_values,MultiGaussFunction2*1000,'Parent', h.PlotS_Result_Fig,'Color','c');                     
                         plot(x_values,MultiGaussFunction3*1000,'Parent', h.PlotS_Result_Fig,'Color','r');    
                         plot(x_values,MultiGaussFunction4*1000,'Parent', h.PlotS_Result_Fig,'Color','g');    
                         plot(x_values,MultiGaussFunction5*1000,'Parent', h.PlotS_Result_Fig,'Color','k');    
                         plot(x_values,MultiGaussFunction6*1000,'Parent', h.PlotS_Result_Fig,'Color','b');   
                         
                         
                         plot(x_values,MultiGaussFunction*1000,'Parent', h.PlotS_Result_Fig,'Color','r','LineStyle',':');                                              
                         Difference_plot_Fit = squeeze(StripIntensities(i_im,:,i_Strip)) - MultiGaussFunction;                         
                         plot(x_values,Difference_plot_Fit,'Parent', h.PlotS_Result_Fig,'Color','g','LineStyle',':'); 
                         
                         axes(h.PlotS_Fig_plot_f3)
                         plot(x_values,MultiGaussFunction1*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','y');                     
                         plot(x_values,MultiGaussFunction2*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','c');                                               
                         plot(x_values,MultiGaussFunction*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','r','LineStyle',':');                                                                                    
                         plot(x_values,Difference_plot_Fit,'Parent', h.PlotS_Fig_plot_f3,'Color','g','LineStyle',':');    
                         plot(x_values,MultiGaussFunction3*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','r');   
                         plot(x_values,MultiGaussFunction4*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','g');    
                         plot(x_values,MultiGaussFunction5*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','k');  
                         plot(x_values,MultiGaussFunction6*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','b');  
                         
                     case 7                            
                         if  get(h.Lorentzian_Dist_Check,'Value') == 1
                             % Cauchy distribution
                             MultiGaussFunction1 = FittedCoefficients(1,1)/(pi*FittedCoefficients(1,15))./(1+((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,15)).^2)+ FittedCoefficients(1,22);
                             MultiGaussFunction2 = FittedCoefficients(1,3)/(pi*FittedCoefficients(1,16))./(1+((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,16)).^2)+ FittedCoefficients(1,22);
                             MultiGaussFunction3 = FittedCoefficients(1,5)/(pi*FittedCoefficients(1,17))./(1+((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,17)).^2)+ FittedCoefficients(1,22);
                             MultiGaussFunction4 = FittedCoefficients(1,7)/(pi*FittedCoefficients(1,18))./(1+((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,18)).^2)+ FittedCoefficients(1,22);
                             MultiGaussFunction5 = FittedCoefficients(1,9)/(pi*FittedCoefficients(1,19))./(1+((x_values-FittedCoefficients(1,10))/FittedCoefficients(1,19)).^2)+ FittedCoefficients(1,22);
                             MultiGaussFunction6 = FittedCoefficients(1,11)/(pi*FittedCoefficients(1,20))./(1+((x_values-FittedCoefficients(1,12))/FittedCoefficients(1,20)).^2)+ FittedCoefficients(1,22);
                             MultiGaussFunction7 = FittedCoefficients(1,13)/(pi*FittedCoefficients(1,21))./(1+((x_values-FittedCoefficients(1,14))/FittedCoefficients(1,21)).^2)+ FittedCoefficients(1,22);
                             MultiGaussFunction = FittedCoefficients(1,1)/(pi*FittedCoefficients(1,15))./(1+((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,15)).^2)+ FittedCoefficients(1,3)/(pi*FittedCoefficients(1,16))./(1+((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,16)).^2)+ FittedCoefficients(1,5)/(pi*FittedCoefficients(1,17))./(1+((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,17)).^2)+ FittedCoefficients(1,7)/(pi*FittedCoefficients(1,18))./(1+((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,18)).^2)+ FittedCoefficients(1,9)/(pi*FittedCoefficients(1,19))./(1+((x_values-FittedCoefficients(1,10))/FittedCoefficients(1,19)).^2)+ FittedCoefficients(1,11)/(pi*FittedCoefficients(1,20))./(1+((x_values-FittedCoefficients(1,12))/FittedCoefficients(1,20)).^2)+ FittedCoefficients(1,13)/(pi*FittedCoefficients(1,21))./(1+((x_values-FittedCoefficients(1,14))/FittedCoefficients(1,21)).^2)+ FittedCoefficients(1,22);
                         else  
                             % Gaussian distribution  
                             MultiGaussFunction1 = FittedCoefficients(1,1)*exp(-((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,15)).^2/2)+ FittedCoefficients(1,22);
                             MultiGaussFunction2 = FittedCoefficients(1,3)*exp(-((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,16)).^2/2)+ FittedCoefficients(1,22);
                             MultiGaussFunction3 = FittedCoefficients(1,5)*exp(-((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,17)).^2/2)+ FittedCoefficients(1,22);
                             MultiGaussFunction4 = FittedCoefficients(1,7)*exp(-((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,18)).^2/2)+ FittedCoefficients(1,22);
                             MultiGaussFunction5 = FittedCoefficients(1,9)*exp(-((x_values-FittedCoefficients(1,10))/FittedCoefficients(1,19)).^2/2)+ FittedCoefficients(1,22);
                             MultiGaussFunction6 = FittedCoefficients(1,11)*exp(-((x_values-FittedCoefficients(1,12))/FittedCoefficients(1,20)).^2/2)+ FittedCoefficients(1,22);
                             MultiGaussFunction7 = FittedCoefficients(1,13)*exp(-((x_values-FittedCoefficients(1,14))/FittedCoefficients(1,21)).^2/2)+ FittedCoefficients(1,22);
                             MultiGaussFunction = FittedCoefficients(1,1)*exp(-((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,15)).^2/2)+ FittedCoefficients(1,3)*exp(-((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,16)).^2/2)+FittedCoefficients(1,5)*exp(-((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,17)).^2/2)+ FittedCoefficients(1,7)*exp(-((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,18)).^2/2)+ FittedCoefficients(1,9)*exp(-((x_values-FittedCoefficients(1,10))/FittedCoefficients(1,19)).^2/2)+FittedCoefficients(1,11)*exp(-((x_values-FittedCoefficients(1,12))/FittedCoefficients(1,20)).^2/2)+ FittedCoefficients(1,13)*exp(-((x_values-FittedCoefficients(1,14))/FittedCoefficients(1,21)).^2/2)+ FittedCoefficients(1,22);
                         end
                         
                         i_MultiGaussFunction = sum(MultiGaussFunction)-FittedCoefficients(1,22)*size(MultiGaussFunction,2);
                         i_MultiGaussFunction1 = sum(MultiGaussFunction1)-FittedCoefficients(1,22)*size(MultiGaussFunction1,2);
                         i_MultiGaussFunction2 = sum(MultiGaussFunction2)-FittedCoefficients(1,22)*size(MultiGaussFunction2,2);
                         i_MultiGaussFunction3 = sum(MultiGaussFunction3)-FittedCoefficients(1,22)*size(MultiGaussFunction3,2);
                         i_MultiGaussFunction4 = sum(MultiGaussFunction4)-FittedCoefficients(1,22)*size(MultiGaussFunction4,2);
                         i_MultiGaussFunction5 = sum(MultiGaussFunction5)-FittedCoefficients(1,22)*size(MultiGaussFunction5,2);
                         i_MultiGaussFunction6 = sum(MultiGaussFunction6)-FittedCoefficients(1,22)*size(MultiGaussFunction6,2);
                         i_MultiGaussFunction7 = sum(MultiGaussFunction7)-FittedCoefficients(1,22)*size(MultiGaussFunction7,2);
                         
                         
                         plot(x_values,MultiGaussFunction1*1000,'Parent', h.PlotS_Result_Fig,'Color','y');    
                         plot(x_values,MultiGaussFunction2*1000,'Parent', h.PlotS_Result_Fig,'Color','c');                     
                         plot(x_values,MultiGaussFunction3*1000,'Parent', h.PlotS_Result_Fig,'Color','r');    
                         plot(x_values,MultiGaussFunction4*1000,'Parent', h.PlotS_Result_Fig,'Color','g');    
                         plot(x_values,MultiGaussFunction5*1000,'Parent', h.PlotS_Result_Fig,'Color','k');    
                         plot(x_values,MultiGaussFunction6*1000,'Parent', h.PlotS_Result_Fig,'Color','b');    
                         plot(x_values,MultiGaussFunction7*1000,'Parent', h.PlotS_Result_Fig,'Color','m');    
                                                  
                         plot(x_values,MultiGaussFunction*1000,'Parent', h.PlotS_Result_Fig,'Color','r','LineStyle',':');                                              
                         Difference_plot_Fit = squeeze(StripIntensities(i_im,:,i_Strip)) - MultiGaussFunction;                         
                         plot(x_values,Difference_plot_Fit,'Parent', h.PlotS_Result_Fig,'Color','g','LineStyle',':');       
                         
                         axes(h.PlotS_Fig_plot_f3)
                         plot(x_values,MultiGaussFunction1*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','y');                     
                         plot(x_values,MultiGaussFunction2*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','c');                                               
                         plot(x_values,MultiGaussFunction*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','r','LineStyle',':');                                                                                    
                         plot(x_values,Difference_plot_Fit,'Parent', h.PlotS_Fig_plot_f3,'Color','g','LineStyle',':');    
                         plot(x_values,MultiGaussFunction3*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','r');   
                         plot(x_values,MultiGaussFunction4*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','g');    
                         plot(x_values,MultiGaussFunction5*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','k');  
                         plot(x_values,MultiGaussFunction6*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','b');    
                         plot(x_values,MultiGaussFunction7*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','m');    
                         
                     case 8                             
                         if  get(h.Lorentzian_Dist_Check,'Value') == 1
                             % Cauchy distribution
                             MultiGaussFunction1 = FittedCoefficients(1,1)/(pi*FittedCoefficients(1,17))./(1+((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,17)).^2)+ FittedCoefficients(1,25);
                             MultiGaussFunction2 = FittedCoefficients(1,3)/(pi*FittedCoefficients(1,18))./(1+((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,18)).^2)+ FittedCoefficients(1,25);
                             MultiGaussFunction3 = FittedCoefficients(1,5)/(pi*FittedCoefficients(1,19))./(1+((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,19)).^2)+ FittedCoefficients(1,25);
                             MultiGaussFunction4 = FittedCoefficients(1,7)/(pi*FittedCoefficients(1,20))./(1+((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,20)).^2)+ FittedCoefficients(1,25);
                             MultiGaussFunction5 = FittedCoefficients(1,9)/(pi*FittedCoefficients(1,21))./(1+((x_values-FittedCoefficients(1,10))/FittedCoefficients(1,21)).^2)+ FittedCoefficients(1,25);
                             MultiGaussFunction6 = FittedCoefficients(1,11)/(pi*FittedCoefficients(1,22))./(1+((x_values-FittedCoefficients(1,12))/FittedCoefficients(1,22)).^2)+ FittedCoefficients(1,25);
                             MultiGaussFunction7 = FittedCoefficients(1,13)/(pi*FittedCoefficients(1,23))./(1+((x_values-FittedCoefficients(1,14))/FittedCoefficients(1,23)).^2)+ FittedCoefficients(1,25);
                             MultiGaussFunction8 = FittedCoefficients(1,15)/(pi*FittedCoefficients(1,24))./(1+((x_values-FittedCoefficients(1,16))/FittedCoefficients(1,24)).^2)+ FittedCoefficients(1,25);
                             MultiGaussFunction = FittedCoefficients(1,1)/(pi*FittedCoefficients(1,17))./(1+((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,17)).^2)+ FittedCoefficients(1,3)/(pi*FittedCoefficients(1,18))./(1+((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,18)).^2)+ FittedCoefficients(1,5)/(pi*FittedCoefficients(1,19))./(1+((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,19)).^2)+ FittedCoefficients(1,7)/(pi*FittedCoefficients(1,20))./(1+((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,20)).^2)+ FittedCoefficients(1,9)/(pi*FittedCoefficients(1,21))./(1+((x_values-FittedCoefficients(1,10))/FittedCoefficients(1,21)).^2)+ FittedCoefficients(1,11)/(pi*FittedCoefficients(1,22))./(1+((x_values-FittedCoefficients(1,12))/FittedCoefficients(1,22)).^2)+ FittedCoefficients(1,13)/(pi*FittedCoefficients(1,23))./(1+((x_values-FittedCoefficients(1,14))/FittedCoefficients(1,23)).^2)+ FittedCoefficients(1,15)/(pi*FittedCoefficients(1,24))./(1+((x_values-FittedCoefficients(1,16))/FittedCoefficients(1,24)).^2)+ FittedCoefficients(1,25);
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
                             MultiGaussFunction = FittedCoefficients(1,1)*exp(-((x_values-FittedCoefficients(1,2))/FittedCoefficients(1,17)).^2/2)+ FittedCoefficients(1,3)*exp(-((x_values-FittedCoefficients(1,4))/FittedCoefficients(1,18)).^2/2)+FittedCoefficients(1,5)*exp(-((x_values-FittedCoefficients(1,6))/FittedCoefficients(1,19)).^2/2)+ FittedCoefficients(1,7)*exp(-((x_values-FittedCoefficients(1,8))/FittedCoefficients(1,20)).^2/2)+ FittedCoefficients(1,9)*exp(-((x_values-FittedCoefficients(1,10))/FittedCoefficients(1,21)).^2/2)+ FittedCoefficients(1,11)*exp(-((x_values-FittedCoefficients(1,12))/FittedCoefficients(1,22)).^2/2)+ FittedCoefficients(1,13)*exp(-((x_values-FittedCoefficients(1,14))/FittedCoefficients(1,23)).^2/2)+ FittedCoefficients(1,15)*exp(-((x_values-FittedCoefficients(1,16))/FittedCoefficients(1,24)).^2/2)+ FittedCoefficients(1,25);
                         end
                         
                         i_MultiGaussFunction = sum(MultiGaussFunction)-FittedCoefficients(1,25)*size(MultiGaussFunction,2);
                         i_MultiGaussFunction1 = sum(MultiGaussFunction1)-FittedCoefficients(1,25)*size(MultiGaussFunction1,2);
                         i_MultiGaussFunction2 = sum(MultiGaussFunction2)-FittedCoefficients(1,25)*size(MultiGaussFunction2,2);
                         i_MultiGaussFunction3 = sum(MultiGaussFunction3)-FittedCoefficients(1,25)*size(MultiGaussFunction3,2);
                         i_MultiGaussFunction4 = sum(MultiGaussFunction4)-FittedCoefficients(1,25)*size(MultiGaussFunction4,2);
                         i_MultiGaussFunction5 = sum(MultiGaussFunction5)-FittedCoefficients(1,25)*size(MultiGaussFunction5,2);
                         i_MultiGaussFunction6 = sum(MultiGaussFunction6)-FittedCoefficients(1,25)*size(MultiGaussFunction6,2);
                         i_MultiGaussFunction7 = sum(MultiGaussFunction7)-FittedCoefficients(1,25)*size(MultiGaussFunction7,2);
                         i_MultiGaussFunction8 = sum(MultiGaussFunction8)-FittedCoefficients(1,25)*size(MultiGaussFunction8,2);
                         
                         plot(x_values,MultiGaussFunction1*1000,'Parent', h.PlotS_Result_Fig,'Color','y');    
                         plot(x_values,MultiGaussFunction2*1000,'Parent', h.PlotS_Result_Fig,'Color','c');                     
                         plot(x_values,MultiGaussFunction3*1000,'Parent', h.PlotS_Result_Fig,'Color','r');    
                         plot(x_values,MultiGaussFunction4*1000,'Parent', h.PlotS_Result_Fig,'Color','g');    
                         plot(x_values,MultiGaussFunction5*1000,'Parent', h.PlotS_Result_Fig,'Color','k');    
                         plot(x_values,MultiGaussFunction6*1000,'Parent', h.PlotS_Result_Fig,'Color','b');    
                         plot(x_values,MultiGaussFunction7*1000,'Parent', h.PlotS_Result_Fig,'Color','m');    
                         plot(x_values,MultiGaussFunction8*1000,'Parent', h.PlotS_Result_Fig,'Color','y');                             
                         
                         plot(x_values,MultiGaussFunction*1000,'Parent', h.PlotS_Result_Fig,'Color','r','LineStyle',':');                                              
                         Difference_plot_Fit = squeeze(StripIntensities(i_im,:,i_Strip)) - MultiGaussFunction;                         
                         plot(x_values,Difference_plot_Fit,'Parent', h.PlotS_Result_Fig,'Color','g','LineStyle',':');    
                         
                         axes(h.PlotS_Fig_plot_f3)
                         plot(x_values,MultiGaussFunction1*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','y');                     
                         plot(x_values,MultiGaussFunction2*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','c');                                               
                         plot(x_values,MultiGaussFunction*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','r','LineStyle',':');                                                                                    
                         plot(x_values,Difference_plot_Fit,'Parent', h.PlotS_Fig_plot_f3,'Color','g','LineStyle',':');    
                         plot(x_values,MultiGaussFunction3*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','r');   
                         plot(x_values,MultiGaussFunction4*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','g');    
                         plot(x_values,MultiGaussFunction5*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','k');  
                         plot(x_values,MultiGaussFunction6*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','b');    
                         plot(x_values,MultiGaussFunction7*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','m'); 
                         plot(x_values,MultiGaussFunction8*1000,'Parent', h.PlotS_Fig_plot_f3,'Color','y');    
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
                 
                 axes(h.PlotS_Result_Fig)
                 
                 YMax_plot = eval(get(h.Name_Y_Max_Plot_F2,'String'));
                 YMin_plot = eval(get(h.Name_Y_Min_Plot_F2,'String'));

                 if get(h.Log_Pre_plot,'value') == 1
                     set(h.PlotS_Result_Fig, 'YScale', 'log')  
                     set(h.PlotS_Result_Fig,'Ylim',[0 YMax_plot]);
                 else
                     set(h.PlotS_Result_Fig, 'YScale', 'linear')
                     set(h.PlotS_Result_Fig,'Ylim',[YMin_plot YMax_plot]);
                 end
                 
                 if h.micro_Check ==1
                     xlabel('Position (um)')
                 else
                     xlabel('Position (um)')
                 end
                 ylabel('Intensity (arb units)')
                    
                 
                 
                 title('Pre-Plot MG','Parent', h.PlotS_Result_Fig);
                 
                 axes(h.PlotS_Fig_plot_f3)                                        
                 if h.micro_Check ==1
                     xlabel('Position (um)')
                 else
                     xlabel('Position (um)')
                 end
                 ylabel('Intensity (arb units)')
                 title('Pre-Plot MG','Parent', h.PlotS_Fig_plot_f3);
             end

        end
        
        axes(h.PlotS_Result_Fig)
        if get(h.Log_Pre_plot,'value') == 1
            set(h.PlotS_Result_Fig, 'YScale', 'log')  
            set(h.PlotS_Result_Fig,'Ylim',[YMin_plot YMax_plot*1000]);
        else
            set(h.PlotS_Result_Fig, 'YScale', 'linear')
            set(h.PlotS_Result_Fig,'Ylim',[YMin_plot YMax_plot*1000]);            
        end
            
        end
    end

    function Number_MultiGauss(source,eventdata)
        
        if source == h.Number_MultiGauss
            
            val_Structure = get(h.Number_MultiGauss,'Value')-1;        

            if val_Structure == 1
                h.Number_MultiGauss_val = 1;   
                set(h.max_I_MG_1,'Enable','on');
                set(h.x_max_Picture_1,'Enable','on');
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
                
            elseif val_Structure == 2
                h.Number_MultiGauss_val = 2;                
                set(h.max_I_MG_1,'Enable','on');
                set(h.x_max_Picture_1,'Enable','on');
                set(h.max_I_MG_2,'Enable','on');
                set(h.x_max_Picture_2,'Enable','on');
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
                
            elseif val_Structure == 3
                h.Number_MultiGauss_val = 3;                
                set(h.max_I_MG_1,'Enable','on');
                set(h.x_max_Picture_1,'Enable','on');
                set(h.max_I_MG_2,'Enable','on');
                set(h.x_max_Picture_2,'Enable','on');
                set(h.max_I_MG_3,'Enable','on');
                set(h.x_max_Picture_3,'Enable','on');
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
                
            elseif val_Structure == 4
                h.Number_MultiGauss_val = 4; 
                set(h.max_I_MG_1,'Enable','on');
                set(h.x_max_Picture_1,'Enable','on');
                set(h.max_I_MG_2,'Enable','on');
                set(h.x_max_Picture_2,'Enable','on');
                set(h.max_I_MG_3,'Enable','on');
                set(h.x_max_Picture_3,'Enable','on');
                set(h.max_I_MG_4,'Enable','on');
                set(h.x_max_Picture_4,'Enable','on');
                set(h.max_I_MG_5,'Enable','off');
                set(h.x_max_Picture_5,'Enable','off');
                set(h.max_I_MG_6,'Enable','off');
                set(h.x_max_Picture_6,'Enable','off');
                set(h.max_I_MG_7,'Enable','off');
                set(h.x_max_Picture_7,'Enable','off');
                set(h.max_I_MG_8,'Enable','off');
                set(h.x_max_Picture_8,'Enable','off');
                
            elseif val_Structure == 5
                h.Number_MultiGauss_val = 5;                  
                set(h.max_I_MG_1,'Enable','on');
                set(h.x_max_Picture_1,'Enable','on');
                set(h.max_I_MG_2,'Enable','on');
                set(h.x_max_Picture_2,'Enable','on');
                set(h.max_I_MG_3,'Enable','on');
                set(h.x_max_Picture_3,'Enable','on');
                set(h.max_I_MG_4,'Enable','on');
                set(h.x_max_Picture_4,'Enable','on');
                set(h.max_I_MG_5,'Enable','on');
                set(h.x_max_Picture_5,'Enable','on');
                set(h.max_I_MG_6,'Enable','off');
                set(h.x_max_Picture_6,'Enable','off');
                set(h.max_I_MG_7,'Enable','off');
                set(h.x_max_Picture_7,'Enable','off');
                set(h.max_I_MG_8,'Enable','off');
                set(h.x_max_Picture_8,'Enable','off');
                
            elseif val_Structure == 6
                h.Number_MultiGauss_val = 6;                  
                set(h.max_I_MG_1,'Enable','on');
                set(h.x_max_Picture_1,'Enable','on');
                set(h.max_I_MG_2,'Enable','on');
                set(h.x_max_Picture_2,'Enable','on');
                set(h.max_I_MG_3,'Enable','on');
                set(h.x_max_Picture_3,'Enable','on');
                set(h.max_I_MG_4,'Enable','on');
                set(h.x_max_Picture_4,'Enable','on');
                set(h.max_I_MG_5,'Enable','on');
                set(h.x_max_Picture_5,'Enable','on');
                set(h.max_I_MG_6,'Enable','on');
                set(h.x_max_Picture_6,'Enable','on');
                set(h.max_I_MG_7,'Enable','off');
                set(h.x_max_Picture_7,'Enable','off');
                set(h.max_I_MG_8,'Enable','off');
                set(h.x_max_Picture_8,'Enable','off');
                
            elseif val_Structure == 7
                h.Number_MultiGauss_val= 7;  
                set(h.max_I_MG_1,'Enable','on');
                set(h.x_max_Picture_1,'Enable','on');
                set(h.max_I_MG_2,'Enable','on');
                set(h.x_max_Picture_2,'Enable','on');
                set(h.max_I_MG_3,'Enable','on');
                set(h.x_max_Picture_3,'Enable','on');
                set(h.max_I_MG_4,'Enable','on');
                set(h.x_max_Picture_4,'Enable','on');
                set(h.max_I_MG_5,'Enable','on');
                set(h.x_max_Picture_5,'Enable','on');
                set(h.max_I_MG_6,'Enable','on');
                set(h.x_max_Picture_6,'Enable','on');
                set(h.max_I_MG_7,'Enable','on');
                set(h.x_max_Picture_7,'Enable','on');
                set(h.max_I_MG_8,'Enable','off');
                set(h.x_max_Picture_8,'Enable','off');
                
            elseif val_Structure == 8
                h.Number_MultiGauss_val = 8;
                set(h.max_I_MG_1,'Enable','on');
                set(h.x_max_Picture_1,'Enable','on');
                set(h.max_I_MG_2,'Enable','on');
                set(h.x_max_Picture_2,'Enable','on');
                set(h.max_I_MG_3,'Enable','on');
                set(h.x_max_Picture_3,'Enable','on');
                set(h.max_I_MG_4,'Enable','on');
                set(h.x_max_Picture_4,'Enable','on');
                set(h.max_I_MG_5,'Enable','on');
                set(h.x_max_Picture_5,'Enable','on');
                set(h.max_I_MG_6,'Enable','on');
                set(h.x_max_Picture_6,'Enable','on');
                set(h.max_I_MG_7,'Enable','on');
                set(h.x_max_Picture_7,'Enable','on');
                set(h.max_I_MG_8,'Enable','on');
                set(h.x_max_Picture_8,'Enable','on');
            end
            
            
            
        end

        
    end

    function Save_MG(source,eventdata)
        
       if source ==  h.Save_MG_Values 
           
           ImageNumbers = h.ImageNumbers;
            filename = get(h.file_xlsx,'String');            
            if size(ImageNumbers,2) == 1
                ImageNumbersstr = sprintf('0%s',num2str(ImageNumbers));
            end
            for i_file = 1:(size(filename,2)-size(ImageNumbersstr,2))
                file_name(1,i_file) = filename(1,i_file);
            end
            
            for i_file = 1:(size(filename,2)-3)
                file_name3(1,i_file) = filename(1,i_file);
            end
            
            file_name2 = sprintf('%s%s',file_name,ImageNumbersstr);
            
            Folder = get(h.Folder,'String');
            filename2 = sprintf('%s/%s',Folder,file_name2);
            filename3 = sprintf('%s/%s_all',Folder,file_name3);
            
            sheet = eval(get(h.sheet_view ,'String'));
            xlRange = get(h.xlRange_view ,'String');
            
            
            xlRange2 = strcat(xlRange(1,1),num2str(eval(xlRange(1,2))+1));
            
            B = {'Num','Dx (um)','max','FWHM','Intensity','R^2'};
            
            A(1,:) = linspace(1,8,8);
                        
            A(2,1) = eval(get(h.x_max_Picture_1,'String'));
            A(2,2) = eval(get(h.x_max_Picture_2,'String'));
            A(2,3) = eval(get(h.x_max_Picture_3,'String'));
            A(2,4) = eval(get(h.x_max_Picture_4,'String'));
            A(2,5) = eval(get(h.x_max_Picture_5,'String'));
            A(2,6) = eval(get(h.x_max_Picture_6,'String'));
            A(2,7) = eval(get(h.x_max_Picture_7,'String'));
            A(2,8) = eval(get(h.x_max_Picture_8,'String'));
            
            A(3,1) = eval(get(h.max_I_MG_1,'String'));
            A(3,2) = eval(get(h.max_I_MG_2,'String'));
            A(3,3) = eval(get(h.max_I_MG_3,'String'));
            A(3,4) = eval(get(h.max_I_MG_4,'String'));
            A(3,5) = eval(get(h.max_I_MG_5,'String'));
            A(3,6) = eval(get(h.max_I_MG_6,'String'));
            A(3,7) = eval(get(h.max_I_MG_7,'String'));
            A(3,8) = eval(get(h.max_I_MG_8,'String'));
            
            A(4,1) = eval(get(h.FWHM_MG_1,'String'));
            A(4,2) = eval(get(h.FWHM_MG_2,'String'));
            A(4,3) = eval(get(h.FWHM_MG_3,'String'));
            A(4,4) = eval(get(h.FWHM_MG_4,'String'));
            A(4,5) = eval(get(h.FWHM_MG_5,'String'));
            A(4,6) = eval(get(h.FWHM_MG_6,'String'));
            A(4,7) = eval(get(h.FWHM_MG_7,'String'));
            A(4,8) = eval(get(h.FWHM_MG_8,'String'));
            
            A(5,1) = h.i_MultiGaussFunction1;
            A(5,2) = h.i_MultiGaussFunction2;
            A(5,3) = h.i_MultiGaussFunction3;
            A(5,4) = h.i_MultiGaussFunction4;
            A(5,5) = h.i_MultiGaussFunction5;
            A(5,6) = h.i_MultiGaussFunction6;
            A(5,7) = h.i_MultiGaussFunction7;
            A(5,8) = h.i_MultiGaussFunction8;
            
            A(6,1) = eval(get(h.RSquare_MG,'String'));
            A(6,2) = 0;
            A(6,3) = 0;
            A(6,4) = 0;
            A(6,5) = 0;
            A(6,6) = 0;
            A(6,7) = 0;
            A(6,8) = 0;
            
            if exist(strcat(filename3,'.xls'), 'file') == 2
                C = xlsread(filename3);
            end
            
            D = {'Position','Energy(KeV)','Dx1 (um)','FWHM1 (um)','Int1 (arb units)','Dx2 (um)','FWHM2 (um)','Int2 (arb units)','Dx3 (um)','FWHM3 (um)','Int3 (arb units)','Dx4 (um)','FWHM4 (um)','Int4 (arb units)','Dx5 (um)','FWHM5 (um)','Int5 (arb units)','Dx6 (um)','FWHM6 (um)','Int6 (arb units)','Dx7 (um)','FWHM7 (um)','Int7 (arb units)','Dx8 (um)','FWHM8 (um)','Int8 (arb units)','R^2'};
            C(ImageNumbers,1) = ImageNumbers;
            C(ImageNumbers,2) = 0;
            C(ImageNumbers,3*8+3) = eval(get(h.RSquare_MG,'String'));
            
            for i = 1:8                
                C(ImageNumbers,3*i-2+2) = A(2,i);
                C(ImageNumbers,3*i-1+2) = A(4,i);
                C(ImageNumbers,3*i+2) = A(5,i);
            end
            
            
            xlswrite(filename2,B,sheet,xlRange)
            xlswrite(filename2,A',sheet,xlRange2)
            
            xlswrite(filename3,D,sheet,xlRange)
            xlswrite(filename3,C,sheet,xlRange2)
            
            set(h.Save_MG_Values,'value',0)
            
        elseif source == h.Read_xls
            filename = get(h.file_xlsx ,'String');
            ImageNumbers = h.ImageNumbers;
            
            Folder = get(h.Folder,'String');
                       
            if size(ImageNumbers,2) == 1
                ImageNumbersstr = sprintf('0%s',num2str(ImageNumbers));
            end
            for i_file = 1:(size(filename,2)-size(ImageNumbersstr,2))
                file_name(1,i_file) = filename(1,i_file);
            end
            filename = sprintf('%s%s',file_name,ImageNumbersstr);
            filename2 = sprintf('%s/%s',Folder,filename);
            
            filename_excel = strcat(filename2,'.xls');
            winopen(filename_excel)
       end
    end

    function Chk_MultiGauss(source,eventdata)
        if source == h.name_MultiGauss_Pos_Chk_1
            if get(h.name_MultiGauss_Pos_Chk_1,'Value') == 1
                set(h.name_MultiGauss_Pos_Chk_1,'Value',1,'String','on')
                set(h.name_MultiGauss_Pos_Chk_2,'Value',1,'String','on')
               
            else
                set(h.name_MultiGauss_Pos_Chk_1,'Value',0,'String','off')
                set(h.name_MultiGauss_Pos_Chk_2,'Value',0,'String','off')
            end
        elseif source == h.name_MultiGauss_Pos_Chk_2
            if get(h.name_MultiGauss_Pos_Chk_2,'Value') == 1
                set(h.name_MultiGauss_Pos_Chk_1,'Value',1,'String','on')
                set(h.name_MultiGauss_Pos_Chk_2,'Value',1,'String','on')
            else
                set(h.name_MultiGauss_Pos_Chk_1,'Value',0,'String','off')
                set(h.name_MultiGauss_Pos_Chk_2,'Value',0,'String','off')
            end
        elseif source == h.name_MultiGauss_Int_Chk_1
            if get(h.name_MultiGauss_Int_Chk_1,'Value') == 1
                set(h.name_MultiGauss_Int_Chk_1,'Value',1,'String','on')
                 set(h.name_MultiGauss_Int_Chk_2,'Value',1,'String','on')
            else
                set(h.name_MultiGauss_Int_Chk_1,'Value',0,'String','off')
                set(h.name_MultiGauss_Int_Chk_2,'Value',0,'String','off')
            end
        elseif source == h.name_MultiGauss_Int_Chk_2
            if get(h.name_MultiGauss_Int_Chk_2,'Value') == 1
                set(h.name_MultiGauss_Int_Chk_1,'Value',1,'String','on')
                 set(h.name_MultiGauss_Int_Chk_2,'Value',1,'String','on')
            else
                set(h.name_MultiGauss_Int_Chk_1,'Value',0,'String','off')
                set(h.name_MultiGauss_Int_Chk_2,'Value',0,'String','off')
            end
        elseif source == h.name_MultiGauss_FWHM_Chk_1
            if get(h.name_MultiGauss_FWHM_Chk_1,'Value') == 1
                set(h.name_MultiGauss_FWHM_Chk_1,'Value',1,'String','on')
                 set(h.name_MultiGauss_FWHM_Chk_2,'Value',1,'String','on')
            else
                set(h.name_MultiGauss_FWHM_Chk_1,'Value',0,'String','off')
                set(h.name_MultiGauss_FWHM_Chk_2,'Value',0,'String','off')
            end
        elseif source == h.name_MultiGauss_FWHM_Chk_2
            if get(h.name_MultiGauss_FWHM_Chk_2,'Value') == 1
                set(h.name_MultiGauss_FWHM_Chk_1,'Value',1,'String','on')
                 set(h.name_MultiGauss_FWHM_Chk_2,'Value',1,'String','on')
            else
                set(h.name_MultiGauss_FWHM_Chk_1,'Value',0,'String','off')
                set(h.name_MultiGauss_FWHM_Chk_2,'Value',0,'String','off')
            end
        elseif source == h.Strip_Color_MG_1
            if get(h.Strip_Color_MG_1,'Value') == 1
                set(h.Strip_Color_MG_1,'Value',1,'String','on')
            else
                set(h.Strip_Color_MG_1,'Value',0,'String','off')  
            end
        elseif source == h.Strip_Color_MG_2
            if get(h.Strip_Color_MG_2,'Value') == 1
                set(h.Strip_Color_MG_2,'Value',1,'String','on')
            else
                set(h.Strip_Color_MG_2,'Value',0,'String','off') 
            end
        elseif source == h.Strip_Color_MG_3
            if get(h.Strip_Color_MG_3,'Value') == 1
                set(h.Strip_Color_MG_3,'Value',1,'String','on')
            else
                set(h.Strip_Color_MG_3,'Value',0,'String','off')  
            end
        elseif source == h.Strip_Color_MG_4
            if get(h.Strip_Color_MG_4,'Value') == 1
                set(h.Strip_Color_MG_4,'Value',1,'String','on')
            else
                set(h.Strip_Color_MG_4,'Value',0,'String','off')  
            end
        elseif source == h.Strip_Color_MG_5
            if get(h.Strip_Color_MG_5,'Value') == 1
                set(h.Strip_Color_MG_5,'Value',1,'String','on')
            else
                set(h.Strip_Color_MG_5,'Value',0,'String','off')  
            end
        elseif source == h.Strip_Color_MG_6
            if get(h.Strip_Color_MG_6,'Value') == 1
                set(h.Strip_Color_MG_6,'Value',1,'String','on')
            else
                set(h.Strip_Color_MG_6,'Value',0,'String','off')
            end
        elseif source == h.Strip_Color_MG_7
            if get(h.Strip_Color_MG_7,'Value') == 1
                set(h.Strip_Color_MG_7,'Value',1,'String','on')
            else
                set(h.Strip_Color_MG_7,'Value',0,'String','off')                
            end
        elseif source == h.Strip_Color_MG_8
            if get(h.Strip_Color_MG_8,'Value') == 1
                set(h.Strip_Color_MG_8,'Value',1,'String','on')
            else
                set(h.Strip_Color_MG_8,'Value',0,'String','off')                
            end
        end
        
    end

%% Plot

%Zoom in
    function ZoomIn(source, eventdata)
                       
        if source ==h.ZI_S
            val = get(h.ZI_S, 'Value');
            if val ==1
                set(h.ZI_S, 'Value', 1);                
                set(h.ZO_S, 'Value', 0);
                zoom(h.ExtractS_Fig,'on');              
                
            else
                set(h.ZI_S, 'Value', 0);
                set(h.ZO_S, 'Value', 0);
                zoom(h.ExtractS_Fig,'off');
            end
            
        elseif source == h.name_StripMin_Scan
            set(h.name_StripMin_Scan, 'Value', 0);
            size_StripMin = eval(get(h.Size_StripMin,'String'));
            size_StripMax = eval(get(h.Size_StripMax,'String'));
            size_ColMin = eval(get(h.Size_ColMin,'String'));
            size_ColMax = eval(get(h.Size_ColMax,'String'));
            
            axes(h.ExtractS_Fig)
            axis([size_StripMin size_StripMax size_ColMin size_ColMax ])
            
            h.size_StripMin =size_StripMin ;
            h.size_StripMax=size_StripMax;
            h.size_ColMin=size_ColMin;
            h.size_ColMax = size_ColMax;
            h.Zoom_In_Act = 1;
            
        elseif source == h.name_StripMax_Scan
            set(h.name_StripMax_Scan, 'Value', 0);
            size_StripMin = eval(get(h.Size_StripMin,'String'));
            size_StripMax = eval(get(h.Size_StripMax,'String'));
            size_ColMin = eval(get(h.Size_ColMin,'String'));
            size_ColMax = eval(get(h.Size_ColMax,'String'));
            
            axes(h.ExtractS_Fig)            
            axis([size_StripMin size_StripMax size_ColMin size_ColMax ])
            
            h.size_StripMin =size_StripMin ;
            h.size_StripMax=size_StripMax;
            h.size_ColMin=size_ColMin;
            h.size_ColMax = size_ColMax;
            h.Zoom_In_Act = 1;
            
        elseif source == h.name_ColMin_Scan
            set(h.name_ColMin_Scan, 'Value', 0);
            size_StripMin = eval(get(h.Size_StripMin,'String'));
            size_StripMax = eval(get(h.Size_StripMax,'String'));
            size_ColMin = eval(get(h.Size_ColMin,'String'));
            size_ColMax = eval(get(h.Size_ColMax,'String'));
            
            axes(h.ExtractS_Fig)
            axis([size_StripMin size_StripMax size_ColMin size_ColMax ])     
            
            h.size_StripMin =size_StripMin ;
            h.size_StripMax=size_StripMax;
            h.size_ColMin=size_ColMin;
            h.size_ColMax = size_ColMax;
            h.Zoom_In_Act = 1;
            
        elseif source == h.name_ColMax_Scan
            set(h.name_ColMax_Scan, 'Value', 0);
            size_StripMin = eval(get(h.Size_StripMin,'String'));
            size_StripMax = eval(get(h.Size_StripMax,'String'));
            size_ColMin = eval(get(h.Size_ColMin,'String'));
            size_ColMax = eval(get(h.Size_ColMax,'String'));
            
            axes(h.ExtractS_Fig)
            axis([size_StripMin size_StripMax size_ColMin size_ColMax ])
            
            h.size_StripMin =size_StripMin ;
            h.size_StripMax=size_StripMax;
            h.size_ColMin=size_ColMin;
            h.size_ColMax = size_ColMax;
            h.Zoom_In_Act = 1;
            
        elseif source == h.name_Reset_Scan  
            set(h.name_Reset_Scan, 'Value', 0);
            Initial_ColMin = h.Initial_ColMin;
            Initial_ColMax = h.Initial_ColMax;
            Initial_StripMin = h.Initial_StripMin;
            Initial_StripMax = h.Initial_StripMax;
            
            axes(h.ExtractS_Fig)  
            axis([  Initial_StripMin Initial_StripMax Initial_ColMin Initial_ColMax ])
            
            h.size_StripMin =Initial_StripMin ;
            h.size_StripMax=Initial_StripMax;
            h.size_ColMin=Initial_ColMin;
            h.size_ColMax = Initial_ColMax;
            h.Zoom_In_Act = 1;

        end
    end
%Zoom out
    function ZoomOut(source, eventdata)
        
        if source == h.ZO
            val = get(h.ZO, 'Value');
            if val ==1
                set(h.ZI, 'Value', 0);
                set(h.ZO, 'Value', 0);
                zoom(h.PlotS_Result3_Fig,'off');
            end
        elseif source == h.ZO_S
            val = get(h.ZO_S, 'Value');
            if val ==1
                set(h.ZI_S, 'Value', 0);
                set(h.ZO_S, 'Value', 0);
                zoom(h.ExtractS_Fig,'off');
            end
        end        

    end
%Pan
    function pan_graph(source, eventdata)
        if source== h.pan_I                    
            val = get(h.pan_I, 'Value');
            if val ==1
                set(h.pan_I, 'Value', 1);
                set(h.pan_I_S, 'Value', 0);
                pan(h.PlotS_Result3_Fig,'on');
            else                
                set(h.pan_I, 'Value', 0);
                set(h.pan_I_S, 'Value', 0);
                pan(h.PlotS_Result3_Fig,'off');                
            end
        elseif  source== h.pan_I_S                    
            val = get(h.pan_I_S, 'Value');
            if val ==1
                set(h.pan_I_S, 'Value', 1);
                set(h.pan_I, 'Value', 0);
                pan(h.ExtractS_Fig,'on');
            else
                set(h.pan_I, 'Value', 0);
                set(h.pan_I_S, 'Value', 0);
                pan(h.ExtractS_Fig,'off');                
            end
            
        end
    end
%um units
    function micro_Chk(source,eventdata)
        if source == h.micro
            val_micro_Scan = get(h.micro,'Value') ;
            if val_micro_Scan == 1
                h.micro_Check = 1;
                set(h.micro,'Value',1)
                micro_value=eval(get(h.micro_val,'String'))/1;
                h.micro_value =micro_value;
            elseif val_micro_Scan == 0
                h.micro_Check = 0;
                set(h.micro,'Value',0)                
            end
        elseif source == h.Energy_Chk
            val_Energy_Scan = get(h.Energy_Chk,'Value') ;
            if val_Energy_Scan == 1
                h.Energy_Check = 1;
                set(h.Energy_Chk,'Value',1)
                Energy_value = eval(get(h.Energy_val,'String'));
                Image_Theta = eval(get(h.Image_Theta_val,'String'));  
                h.Image_Theta= Image_Theta;
                h.Energy_value = Energy_value;
                
                Dspacing_value = 0.918*1e-10;
                Angle_Step_rotation_value = 0.0002;
                
                h_const = 4.14E-15;
                c_const = 3.00E+08;

                %Bragg Si531
                ThetaSi531= 42.46824;
                Theta1 = ThetaSi531 + Angle_Step_rotation_value;
                
                EnergySi1 = h_const*c_const/(sin(ThetaSi531*pi/180)*Dspacing_value*2);
                EnergySi2 = h_const*c_const/(sin(Theta1*pi/180)*Dspacing_value*2);
                                
                Energy_Step_value = EnergySi1 - EnergySi2;
                
                h.Energy_Step_value = Energy_Step_value;
            elseif val_Energy_Scan == 0
                h.Energy_Check = 0;
                set(h.Energy_Chk,'Value',0)                
            end
        end   
    end

    function DisplayCells(source,eventdata)
        if source == h.Sel_Pre_Print_I
            val_Structure = get(h.Sel_Pre_Print_I,'Value')-1;
            %F1
            if val_Structure == 1
                h.Figure_pre_plot = 1;                
            elseif val_Structure == 2
                h.Figure_pre_plot = 2;                
            elseif val_Structure == 3
                h.Figure_pre_plot = 3;                
            elseif val_Structure == 4
                h.Figure_pre_plot = 4;                
            elseif val_Structure == 5
                h.Figure_pre_plot = 5;                
            elseif val_Structure == 6
                h.Figure_pre_plot = 6;                
            elseif val_Structure == 7
                h.Figure_pre_plot = 7;                
            elseif val_Structure == 8
                h.Figure_pre_plot = 8;                                                        
            end
        elseif source == h.Sel_Compare_I 
            
            val_Structure = get(h.Sel_Compare_I,'Value')-1
            %F1
            if val_Structure == 1
                h.Figure_compare_plot = 1;
            elseif val_Structure == 2
                h.Figure_compare_plot = 2;
            elseif val_Structure == 3                
                h.Figure_compare_plot = 3;
            elseif val_Structure == 4               
                h.Figure_compare_plot = 4;
            end
            
        end
    end

%Video
    function Save_video (source,eventdata)
       Save_video = get(h.Save_video,'Value');
       if Save_video == 1
           set(h.Save_video, 'Value',1);           
           set(h.Save_Color, 'Value',0,'Enable','on');
           set(h.Save_Grey, 'Value',1,'Enable','off');
           set(h.Save_hsv, 'Value',0,'Enable','on');
           h.Color_Map = 0;
       else
           set(h.Save_video, 'Value',0);
           set(h.Save_Color, 'Value',0,'Enable','off');
           set(h.Save_Grey, 'Value',1,'Enable','off');
           set(h.Save_hsv, 'Value',0,'Enable','off');
           h.Color_Map = 0;
       end
       
    end

    function Save_Color(source,eventdata)
        %h.Color_Map = 1; Colormap winter
        %h.Color_Map = 0; Colormap Grey
        %h.Color_Map = 2; Colormap Jet
        if source == h.Save_Color 
            Save_Color = get(h.Save_Color,'Value');
            if Save_Color == 1
                set(h.Save_Color, 'Value',1,'Enable','off');
                set(h.Save_Grey, 'Value',0,'Enable','on');
                set(h.Save_hsv, 'Value',0,'Enable','on');
                h.Color_Map = 1;
            end
        elseif source == h.Save_Grey 
            Save_Grey = get(h.Save_Grey,'Value');
            if Save_Grey == 1
                set(h.Save_Grey, 'Value',1,'Enable','off');
                set(h.Save_Color, 'Value',0,'Enable','on');
                set(h.Save_hsv, 'Value',0,'Enable','on');
                h.Color_Map = 0;
            end
        elseif source == h.Save_hsv
            Save_hsv = get(h.Save_hsv,'Value');
            if Save_hsv == 1
                set(h.Save_hsv, 'Value',1,'Enable','off');
                set(h.Save_Color, 'Value',0,'Enable','on');
                set(h.Save_Grey, 'Value',0,'Enable','on');
                h.Color_Map = 2;
            end
        end
        
        
    end  

%% Pre-view Printing
    function Pre_print(source,eventdata)
        if source == h.Pre_Print_I
            
            if get(h.Pre_Print_I,'Value') == 1
                val_Figure_pre_plot = h.Figure_pre_plot;
                position = [500 300];
                if val_Figure_pre_plot == 1
                    movegui(h.PlotS_Fig_plot_f4, position)
                    axes(h.PlotS_Fig_plot_f4)
                    
                elseif val_Figure_pre_plot == 2
                    movegui(h.PlotS_Fig_plot_f2, position)
                    axes(h.PlotS_Fig_plot_f2)
                    
                elseif val_Figure_pre_plot == 3
                    movegui(h.PlotS_Fig_plot_f3, position)
                    axes(h.PlotS_Fig_plot_f3)
                    
                elseif val_Figure_pre_plot == 4
                    movegui(h.PlotS_Fig_plot_f5, position)
                    axes(h.PlotS_Fig_plot_f5)
                    
                elseif val_Figure_pre_plot == 5
                    movegui(h.PlotS_Fig_plot_f1, position)
                    axes(h.PlotS_Fig_plot_f1)
                    
                elseif val_Figure_pre_plot == 6
                    movegui(h.PlotS_Fig_plot_f6, position)
                    axes(h.PlotS_Fig_plot_f6)
                    
                elseif val_Figure_pre_plot == 7
                    movegui(h.PlotS_Fig_plot_f7, position)
                    axes(h.PlotS_Fig_plot_f7)
                    
                elseif val_Figure_pre_plot == 8
                    
                end
            else
                val_Figure_pre_plot = h.Figure_pre_plot;
                position = [10000 100];
                if val_Figure_pre_plot == 1
                    movegui(h.PlotS_Fig_plot_f4, position)
                    axes(h.PlotS_Fig_plot_f4)
                    
                elseif val_Figure_pre_plot == 2
                    movegui(h.PlotS_Fig_plot_f2, position)
                    axes(h.PlotS_Fig_plot_f2)
                    
                elseif val_Figure_pre_plot == 3
                    movegui(h.PlotS_Fig_plot_f3, position)
                    axes(h.PlotS_Fig_plot_f3)
                    
                elseif val_Figure_pre_plot == 4
                    movegui(h.PlotS_Fig_plot_f5, position)
                    axes(h.PlotS_Fig_plot_f5)
                    
                elseif val_Figure_pre_plot == 5
                    movegui(h.PlotS_Fig_plot_f1, position)
                    axes(h.PlotS_Fig_plot_f1)
                    
                elseif val_Figure_pre_plot == 6
                    movegui(h.PlotS_Fig_plot_f6, position)
                    axes(h.PlotS_Fig_plot_f6)
                    
                elseif val_Figure_pre_plot == 7
                    movegui(h.PlotS_Fig_plot_f7, position)
                    axes(h.PlotS_Fig_plot_f7)
                    
                elseif val_Figure_pre_plot == 8
                    
                end
            end
        end
  end
   
    function Compare_Scans_Values(source, eventdata)
        
         if source== h.Compare_scan
            h.Save_Smooth_chk1 =0;
            h.Save_Smooth_chk2 =0;
            h.Save_Smooth_chk3 =0;
            h.Save_Smooth_chk4 =0;
            
            c = floor(rand*1000);
            h.I_Fig_Compare= figure(c);

            
            set(h.I_Fig_Compare,'Name','I_Fig_Compare',...
                'NumberTitle', 'Off',...
                'Toolbar','figure',...
                'visible','on',...
                'Units','normalized',...
                'Position', [0.0 0.05 0.6 0.6],...
                'Color',[0.8 0.8 0.8],...
                'Menubar','figure',...
                'KeyReleaseFcn',@Press);
            
            h.I_Fig_Compare_In = axes('Parent',h.I_Fig_Compare, 'Units','normalized',...
                'Position',[0.1 0.1 0.8 0.7],...
                'box','on',...
                'LineWidth',0.5,...
                'fontsize',10,...
                'box','on',...
                'Color',[1 1 1],...
                'FontName','Helvetica',...
                'FontWeight','bold',...
                'Xlim',[-1 1]);
            title('Total Intensity')
            xlabel('Energy (eV)')
            ylabel('Intensity (arb. units)')
            grid('on');
            
            h.Scan_compare_Check_Energy_Val = 0;
            h.Scan_compare_Check_micron_Val = 0;
            
            h.name_Sel_Compare_I =  uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'text',...
                'FontName','Helvetica',...
                'String','F1:Scan Section All, F2:Scan Section Image, F3:Scan Section Average, F4:Integration Intensity Scan, F5:Maxima Scan',...    
                'FontSize',8,...
                'BackgroundColor',[0.9 0.9 0.9],...
                'Units','Normalized',...
                'Position', [0., 0.87, 0.7, 0.03]);
            
            h.name_Sel_Compare_I =  uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'text',...
                'FontName','Helvetica',...
                'String','Figure to compare',...    
                'FontSize',8,...
                'BackgroundColor',[1 1 1],...
                'Units','Normalized',...
                'Position', [0, 0.95, 0.1, 0.05]);
            
            Str ={};
            Str{end+1} = '--';
            Str{end+1} = 'F2: Scan Section Image';
            Str{end+1} = 'F3: Scan Section Average';
            Str{end+1} = 'F4: Integration Intensity Scan';
            Str{end+1} = 'F5: Maxima Scan';
            h.Figure_compare_plot = 0;
            
            h.Sel_Compare_I =  uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'popup',...
                'FontName','Helvetica',...
                'String',Str,...
                'FontSize',10,...
                'BackgroundColor',[1 1 1],...
                'Units','Normalized',...
                'Position', [0.00, 0.85, 0.1, 0.1],...
                'Callback',@DisplayCells);
            
            
            h.name_Scan_number_load_compare = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Edit',...
                'Enable', 'off',...
                'Value', 0,...
                'FontName','Arial',...
                'String','Scan',...
                'FontSize',8,...
                'FontWeight','normal',...
                'BackgroundColor',[0.1 0.1 0.1],...
                'Units','Normalized',...
                'Position',[0.1, 0.95, 0.04, 0.05]);
            
            h.Load_Scan_compare= uicontrol('Parent',h.I_Fig_Compare,...
                'Style','push',...
                'Units','normalized',...
                'Position',[0.1 0.9 0.04 0.05],...
                'String','Load',...
                'BackgroundColor',[0 1 0],...
                'FontSize',8,...
                'Callback',@Load_Scans_Values);  
            
            
            h.Scan_folder_load_compare1 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.14, 0.95, 0.08, 0.05],...                        
                'String','File',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',8);            
            h.Scan_number_load_compare1 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.22, 0.95, 0.04, 0.05],...                        
                'String','Scan',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',8);
            h.Scan_Image_load_compare1 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.26, 0.95, 0.05, 0.05],...                        
                'String','Image',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',8);
            h.Scan_compare_Check1 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 1,...
                'FontName','Helvetica',...
                'String',' 1',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Scan_Chk,...
                'Position',[0.31 0.95 0.04 0.05],...
                'BackgroundColor',[0.9 0 0],...                
                'FontSize',8);
            
            h.Scan_folder_load_compare2 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.35, 0.95, 0.08, 0.05],...                        
                'String',' File',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',8);            
            h.Scan_number_load_compare2 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.43, 0.95, 0.04, 0.05],...                        
                'String',' Scan ',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',8);
            h.Scan_Image_load_compare2 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.47, 0.95, 0.05, 0.05],...                        
                'String','Image',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',8);
            h.Scan_compare_Check2 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 1,...
                'FontName','Helvetica',...
                'String',' 2',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Scan_Chk,...
                'Position',[0.52 0.95 0.04 0.05],...
                'BackgroundColor',[0.9 0.9 0],...
                'FontSize',8);
            
            h.Scan_folder_load_compare3 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.14, 0.9, 0.08, 0.05],...                        
                'String','File',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',8);            
            h.Scan_number_load_compare3 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.22, 0.9, 0.04, 0.05],...                        
                'String','Scan',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',8);
            h.Scan_Image_load_compare3 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.26, 0.9, 0.05, 0.05],...                        
                'String','Image',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',8);
            h.Scan_compare_Check3 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 1,...
                'FontName','Helvetica',...
                'String',' 3',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Scan_Chk,...
                'Position',[0.31 0.9 0.04 0.05],...
                'BackgroundColor',[0 0.9 0.9],...
                'FontSize',8);
            
            h.Scan_folder_load_compare4 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.35, 0.9, 0.08, 0.05],...                        
                'String',' File',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',8);            
            h.Scan_number_load_compare4 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.43, 0.9, 0.04, 0.05],...                        
                'String',' Scan ',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',8);
            h.Scan_Image_load_compare4 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.47, 0.9, 0.05, 0.05],...                        
                'String','Image',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',8);
            h.Scan_compare_Check4 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 1,...
                'FontName','Helvetica',...
                'String',' 4',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Scan_Chk,...
                'Position',[0.52 0.9 0.04 0.05],...
                'BackgroundColor',[0.2 0.2 0.2],...
                'FontSize',8);
                      
            h.name_Strip_Scan = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Edit',...
                'Enable', 'off',...
                'Value', 0,...
                'Units','normalized',...
                'Position',[0.56 0.9 0.035 0.1],...
                'String','Strip',...
                'BackgroundColor',[0.4 0.4 0.4],...
                'FontSize',8);
                       
            h.val_Strip_Scan1 = 1;
            h.val_Strip_Scan2 = 1;
            h.val_Strip_Scan3 = 1;
            h.val_Strip_Scan4 = 1;
            h.Scan_compare_Check = [1 2 3 4];
                        
            h.Strip_compare_scan1_1 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 1,...
                'FontName','Helvetica',...
                'String','1',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Strip_Chk_compare,...
                'Position',[0.595 0.975 0.025 0.025],...
                'BackgroundColor',[0.5 0.5 0.5],...
                'FontSize',6);
            h.Strip_compare_scan1_2 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 0,...
                'FontName','Helvetica',...
                'String','2',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Strip_Chk_compare,...
                'Position',[0.595+0.025*1 0.975 0.025 0.025],...
                'BackgroundColor',[0.5 0.5 0.5],...
                'FontSize',6);
            h.Strip_compare_scan1_3 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 0,...
                'FontName','Helvetica',...
                'String','3',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Strip_Chk_compare,...
                'Position',[0.595+0.025*2 0.975 0.025 0.025],...
                'BackgroundColor',[0.5 0.5 0.5],...
                'FontSize',6);
            h.Strip_compare_scan1_4 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 0,...
                'FontName','Helvetica',...
                'String','4',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Strip_Chk_compare,...
                'Position',[0.595+0.025*3 0.975 0.025 0.025],...
                'BackgroundColor',[0.5 0.5 0.5],...
                'FontSize',6);            
            h.Strip_compare_scan_Smooth1 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 0,...
                'FontName','Helvetica',...
                'String','Smooth',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Strip_Chk_compare,...
                'Position',[0.595+0.025*4 0.975 0.055 0.025],...
                'BackgroundColor',[0.5 0.5 0.5],...
                'FontSize',6);
                     
            h.Scan_Image_load_Energy_compare1 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.75 0.975 0.04 0.025],...                        
                'String','[]',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);            
            
            h.Scan_Image_load_Position_compare1 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.79 0.975 0.02 0.025],...                        
                'String','[]',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);
            h.Scan_Image_load_Energy_Step_compare1 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.81 0.975 0.04 0.025],...                        
                'String','[]',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);
            h.Scan_Image_load_dhkl_compare1 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.85 0.975 0.04 0.025],...                        
                'String','[]',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);
            
            h.Scan_Image_load_micron_compare1 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.89 0.975 0.04 0.025],...                        
                'String','[]',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);
            

                        
            h.Strip_compare_scan2_1 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 1,...
                'FontName','Helvetica',...
                'String','1',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Strip_Chk_compare,...
                'Position',[0.595 0.95 0.025 0.025],...
                'BackgroundColor',[0.5 0.5 0.5],...
                'FontSize',6);
            h.Strip_compare_scan2_2 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 0,...
                'FontName','Helvetica',...
                'String','2',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Strip_Chk_compare,...
                'Position',[0.595+0.025*1 0.95 0.025 0.025],...
                'BackgroundColor',[0.5 0.5 0.5],...
                'FontSize',6);
            h.Strip_compare_scan2_3 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 0,...
                'FontName','Helvetica',...
                'String','3',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Strip_Chk_compare,...
                'Position',[0.595+0.025*2 0.95 0.025 0.025],...
                'BackgroundColor',[0.5 0.5 0.5],...
                'FontSize',6);
            h.Strip_compare_scan2_4 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 0,...
                'FontName','Helvetica',...
                'String','4',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Strip_Chk_compare,...
                'Position',[0.595+0.025*3 0.95 0.025 0.025],...
                'BackgroundColor',[0.5 0.5 0.5],...
                'FontSize',6);
            h.Strip_compare_scan_Smooth2 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 0,...
                'FontName','Helvetica',...
                'String','Smooth',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Strip_Chk_compare,...
                'Position',[0.595+0.025*4 0.95 0.055 0.025],...
                'BackgroundColor',[0.5 0.5 0.5],...
                'FontSize',6);
            
            h.Scan_Image_load_Energy_compare2 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.75 0.95 0.04 0.025],...                        
                'String','[]',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);            
            
            h.Scan_Image_load_Position_compare2 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.79 0.95 0.02 0.025],...                        
                'String','[]',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);
            h.Scan_Image_load_Energy_Step_compare2 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.81 0.95 0.04 0.025],...                        
                'String','[]',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);
            h.Scan_Image_load_dhkl_compare2 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.85 0.95 0.04 0.025],...                        
                'String','[]',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);
            
            h.Scan_Image_load_micron_compare2 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.89 0.95 0.04 0.025],...                        
                'String','[]',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);
            
            
            
            h.Strip_compare_scan3_1 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 1,...
                'FontName','Helvetica',...
                'String','1',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Strip_Chk_compare,...
                'Position',[0.595+0.03*0 0.925 0.025 0.025],...
                'BackgroundColor',[0.5 0.5 0.5],...
                'FontSize',6);
            h.Strip_compare_scan3_2 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 0,...
                'FontName','Helvetica',...
                'String','2',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Strip_Chk_compare,...
                'Position',[0.595+0.025*1 0.925 0.025 0.025],...
                'BackgroundColor',[0.5 0.5 0.5],...
                'FontSize',6);
            h.Strip_compare_scan3_3 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 0,...
                'FontName','Helvetica',...
                'String','3',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Strip_Chk_compare,...
                'Position',[0.595+0.025*2 0.925 0.025 0.025],...
                'BackgroundColor',[0.5 0.5 0.5],...
                'FontSize',6);
            h.Strip_compare_scan3_4 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 0,...
                'FontName','Helvetica',...
                'String','4',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Strip_Chk_compare,...
                'Position',[0.595+0.025*3 0.925 0.025 0.025],...
                'BackgroundColor',[0.5 0.5 0.5],...
                'FontSize',6);
            h.Strip_compare_scan_Smooth3 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 0,...
                'FontName','Helvetica',...
                'String','Smooth',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Strip_Chk_compare,...
                'Position',[0.595+0.025*4 0.925 0.055 0.025],...
                'BackgroundColor',[0.5 0.5 0.5],...
                'FontSize',6);
            
            h.Scan_Image_load_Energy_compare3 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.75 0.925 0.04 0.025],...                        
                'String','[]',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);            
            
            h.Scan_Image_load_Position_compare3 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.79 0.925 0.02 0.025],...                        
                'String','[]',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);
            h.Scan_Image_load_Energy_Step_compare3 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.81 0.925 0.04 0.025],...                        
                'String','[]',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);
            h.Scan_Image_load_dhkl_compare3 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.85 0.925 0.04 0.025],...                        
                'String','[]',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);
            
            h.Scan_Image_load_micron_compare3 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.89 0.925 0.04 0.025],...                        
                'String','[]',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);
     
            
            
            
            h.Strip_compare_scan4_1 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 1,...
                'FontName','Helvetica',...
                'String','1',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Strip_Chk_compare,...
                'Position',[0.595+0.025*0 0.9 0.025 0.025],...
                'BackgroundColor',[0.5 0.5 0.5],...
                'FontSize',6);
            h.Strip_compare_scan4_2 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 0,...
                'FontName','Helvetica',...
                'String','2',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Strip_Chk_compare,...
                'Position',[0.595+0.025*1 0.9 0.025 0.025],...
                'BackgroundColor',[0.5 0.5 0.5],...
                'FontSize',6);
            h.Strip_compare_scan4_3 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 0,...
                'FontName','Helvetica',...
                'String','3',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Strip_Chk_compare,...
                'Position',[0.595+0.025*2 0.9 0.025 0.025],...
                'BackgroundColor',[0.5 0.5 0.5],...
                'FontSize',6);
            h.Strip_compare_scan4_4 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 0,...
                'FontName','Helvetica',...
                'String','4',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Strip_Chk_compare,...
                'Position',[0.595+0.025*3 0.9 0.025 0.025],...
                'BackgroundColor',[0.5 0.5 0.5],...
                'FontSize',6);
            h.Strip_compare_scan_Smooth4 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 0,...
                'FontName','Helvetica',...
                'String','Smooth',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Strip_Chk_compare,...
                'Position',[0.595+0.025*4 0.9 0.055 0.025],...
                'BackgroundColor',[0.5 0.5 0.5],...
                'FontSize',6);
            
            h.Scan_Image_load_Energy_compare4 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.75 0.9 0.04 0.025],...                        
                'String','[]',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);            
            
            h.Scan_Image_load_Position_compare4 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.79 0.9 0.02 0.025],...                        
                'String','[]',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);
            h.Scan_Image_load_Energy_Step_compare4 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.81 0.9 0.04 0.025],...                        
                'String','[]',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);
            h.Scan_Image_load_dhkl_compare4 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.85 0.9 0.04 0.025],...                        
                'String','[]',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);
            
            h.Scan_Image_load_micron_compare4 = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.89 0.9 0.04 0.025],...                        
                'String','[]',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);

                        
            
            h.name_Scan_Image_load_Energy_compare = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','text',...
                'Units','normalized',...
                'Position',[0.75 0.87 0.03 0.03],...                        
                'String','E(eV)',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);            
            
            h.name_Scan_Image_load_Position_compare = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','text',...
                'Units','normalized',...
                'Position',[0.78 0.87 0.03 0.03],...                        
                'String','Imag Max',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);
            h.name_Scan_Image_load_Energy_Step_compare = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','text',...
                'Units','normalized',...
                'Position',[0.81 0.87 0.04 0.03],...                        
                'String','Theta Step',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);
            h.name_Scan_Image_load_dhkl_compare = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','text',...
                'Units','normalized',...
                'Position',[0.85 0.87 0.04 0.03],...                        
                'String','dhkl (m)',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);
            
            h.name_Scan_Image_load_micron_compare = uicontrol('Parent',h.I_Fig_Compare,...
                'Style','text',...
                'Units','normalized',...
                'Position',[0.89 0.87 0.04 0.03],...                        
                'String','um/pixel',...                        
                'BackgroundColor',[0.6 0.6 0.6],...                        
                'FontSize',6);
            
            
            
            
            h.Plot_Compare =  uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'togglebutton',...
                'Enable', 'on',...
                'Value', 0,...
                'FontName','Arial',...
                'FontSize',10,...
                'String',' Plot ',...
                'FontWeight','normal',...
                'BackgroundColor',[0 0 0.8],...
                'Units','Normalized',...
                'Position', [0.925, 0.925, 0.075, 0.075],...
                'BackgroundColor',[0.9 0 0],...
                'Callback',@Plot_Compare);            
            
            h.Scan_compare_Check_Energy = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 0,...
                'FontName','Helvetica',...
                'String','eV',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Scan_Chk,...
                'Position',[0.925 0.9 0.0375 0.025],...
                'BackgroundColor',[0.3 0.3 0.3],...
                'FontSize',5);
            h.Scan_compare_Check_micron = uicontrol('Parent',h.I_Fig_Compare,...
                'Style' , 'Check',......
                'Enable','on',...
                'Value', 0,...
                'FontName','Helvetica',...
                'String','um',...
                'FontWeight','bold',...
                'HorizontalAlignment','center',...
                'Units','Normalized',...
                'Callback',@Scan_Chk,...
                'Position',[0.9625 0.9 0.035 0.025],...
                'BackgroundColor',[0.3 0.3 0.3],...
                'FontSize',5);

         end
    end

    function Plot_Compare(source,eventdata)
        
        if source == h.Plot_Compare
            
            child = get(h.I_Fig_Compare_In,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
           
            Figure_compare_plot = h.Figure_compare_plot;
            
            val_Strip_Scan1 = h.val_Strip_Scan1;
            val_Strip_Scan2 = h.val_Strip_Scan2;
            val_Strip_Scan3 = h.val_Strip_Scan3;
            val_Strip_Scan4 = h.val_Strip_Scan4;
            
            h.h_plank = 4.135667662e-15;
            h.c_light = 299792458;
            
            Save_Smooth = h.Save_Smooth;
            
            if h.Scan_compare_Check (1,1) == 1
                Save_Area1 = h.Save_Area1;
                Save_Peak1 = h.Save_Peak1;
                Save_Widths1 = h.Save_Widths1;
                
                if h.Scan_compare_Check_Energy_Val ==1
                    Energy_1 = eval(get(h.Scan_Image_load_Energy_compare1,'String'));
                    d_hkl_1 = eval(get(h.Scan_Image_load_dhkl_compare1,'String'));  
                    Theta_1 = asin(h.h_plank*h.c_light/(Energy_1*2*d_hkl_1));
                    h.Energy_Step_value1 = Energy_1*cot(Theta_1)*eval(get(h.Scan_Image_load_Energy_Step_compare1,'String'));  
                    Position_1 = eval(get(h.Scan_Image_load_Position_compare1,'String'));
                end
                                   
                if h.Scan_compare_Check_micron_Val ==1
                    micron_1 = eval(get(h.Scan_Image_load_micron_compare1,'String'))*1e-6  ;                  
                end
                
                
                Save_number_Image1 = h.Save_number_Image1;
                i_im1= h.i_im1;
                StripRanges1 = h.StripRanges1;
                Save_Background1 = h.Save_Background1;
%                background1 = Save_Background1*ones(1,size_colum);
                
                Save_FitValid1 = h.Save_FitValid1;
                Save_Peak_Manu1 = h.Save_Peak_Manu1;
                Save_Error1 = h.Save_Error1;
        
                ImageNumbers1 = h.ImageNumbers1;
                Save_Background1 = h.Save_Background1;
                
                if Save_Smooth ==1
                    Save_Area_Smooth1 = h.Save_Area_Smooth1;
                    Save_Peak_Smooth1 = h.Save_Peak_Smooth1;
                    Save_Widths_Smooth1 = h.Save_Widths_Smooth1;
                    
                    Save_FitValid_Smooth1 = h.Save_FitValid_Smooth1;
                    Save_Peak_Manu_Smooth1 = h.Save_Peak_Manu_Smooth1;
                end
                
                
                if h.Strip1 == 1
                    Save_Colum_Int11 = h.Save_Colum_Int11;
                    Save_x_values11 = h.Save_x_values11;
                    Save_Strip_Int11 = h.Save_Strip_Int11;
                    mean_Strip11 = h.mean_Strip11;
                    Save_Strip_fit11 = h.Save_Strip_fit11;
                    if Save_Smooth ==1
                        Save_Strip_Smooth_Int11 = h.Save_Strip_Smooth_Int11;
                        Save_Strip_Smooth_fit11= h.Save_Strip_Smooth_fit11;                
                    end
                end
                if h.Strip2 == 1
                    Save_Colum_Int12 = h.Save_Colum_Int12;
                    Save_x_values12 = h.Save_x_values12;
                    Save_Strip_Int12 = h.Save_Strip_Int12;
                    mean_Strip12 = h.mean_Strip12;        
                    Save_Strip_fit12 = h.Save_Strip_fit12;
                    if Save_Smooth ==1
                        Save_Strip_Smooth_Int12 = h.Save_Strip_Smooth_Int12;
                        Save_Strip_Smooth_fit12= h.Save_Strip_Smooth_fit12;
                    end
                end  
                if h.Strip3 == 1    
                    Save_Colum_Int13 = h.Save_Colum_Int13;
                    Save_x_values13 = h.Save_x_values13;
                    Save_Strip_Int13 = h.Save_Strip_Int13;
                    mean_Strip13 = h.mean_Strip13;                
                    Save_Strip_fit13 = h.Save_Strip_fit13;
                    if Save_Smooth ==1
                        Save_Strip_Smooth_Int13 = h.Save_Strip_Smooth_Int13;
                        Save_Strip_Smooth_fit13 = h.Save_Strip_Smooth_fit13;                
                    end
                end
                if h.Strip4 == 1
                    Save_Colum_Int14 = h.Save_Colum_Int14;
                    Save_x_values14 = h.Save_x_values14;
                    Save_Strip_Int14 = h.Save_Strip_Int14;                
                    mean_Strip14 = h.mean_Strip14;
                    Save_Strip_fit14 = h.Save_Strip_fit14;
                    if Save_Smooth ==1
                        Save_Strip_Smooth_Int14 = h.Save_Strip_Smooth_Int14;
                        Save_Strip_Smooth_fit14= h.Save_Strip_Smooth_fit14;                
                    end
                end
                

                
                
                
                if val_Strip_Scan1 == 1
                    if h.Strip1 == 1
                        Save_x_values1 = Save_x_values11(1,:);
                        Save_Colum_Int1 = Save_Colum_Int11(1,:);
                        Strip_Int1 = mean_Strip11(1,:);
                        if h.Save_Smooth_chk1 ==0
                            Save_Strip_Int1 = Save_Strip_Int11(1,:,:);                             
                            Save_Strip_fit1 = Save_Strip_fit11(1,:,:);
                        else                        
                            Save_Strip_Int1 = Save_Strip_Smooth_Int11(1,:,:);                             
                            Save_Strip_fit1 = Save_Strip_Smooth_fit11(1,:,:);
                        end                        
                        [tonto,size_Int]=size(Strip_Int1);
                        Background1 = ones(size_Int,1)*Save_Background1(val_Strip_Scan1,1);
                    end
                elseif val_Strip_Scan1 ==2
                    if h.Strip2 == 1
                        Save_x_values1 = Save_x_values12(1,:);
                        Save_Colum_Int1= Save_Colum_Int12(1,:);
                        Strip_Int1 = mean_Strip12(1,:);
                        if h.Save_Smooth_chk1 ==0
                            Save_Strip_Int1 = Save_Strip_Int12(1,:,:); 
                            Save_Strip_fit1 = Save_Strip_fit12(1,:,:);
                        else
                            Save_Strip_Int1 = Save_Strip_Smooth_Int12(1,:,:); 
                            Save_Strip_fit1 = Save_Strip_Smooth_fit12(1,:,:);
                        end
                        [tonto,size_Int]=size(Strip_Int1);
                        Background1 = ones(size_Int,1)*Save_Background1(val_Strip_Scan1,1);
                    end
                elseif val_Strip_Scan1 ==3
                    if h.Strip3 == 1
                        Save_x_values1 = Save_x_values13(1,:);
                        Save_Colum_Int1 = Save_Colum_Int13(1,:);
                        Strip_Int1 = mean_Strip13(1,:);
                        if h.Save_Smooth_chk1 ==0
                            Save_Strip_Int1= Save_Strip_Int13(1,:,:); 
                            Save_Strip_fit1 = Save_Strip_fit13(1,:,:);
                        else
                            Save_Strip_Int1= Save_Strip_Smooth_Int13(1,:,:); 
                            Save_Strip_fit1 = Save_Strip_Smooth_fit13(1,:,:);
                        end
                        [tonto,size_Int]=size(Strip_Int1);
                        Background1 = ones(size_Int,1)*Save_Background1(val_Strip_Scan1,1);
                    end
                elseif val_Strip_Scan1 ==4
                    if h.Strip4 == 1
                        Save_x_values1 = Save_x_values14(1,:);
                        Save_Colum_Int1 = Save_Colum_Int14(1,:);
                        size(Save_Colum_Int1)   
                        Strip_Int1 = mean_Strip14(1,:);
                        if h.Save_Smooth_chk1 ==0
                            Save_Strip_Int1 = Save_Strip_Int14(1,:,:);
                            size(Save_Strip_Int1)                            
                            Save_Strip_fit1 = Save_Strip_fit14(1,:,:);
                        else                            
                            Save_Strip_Int1 = Save_Strip_Smooth_Int14(1,:,:);
                            size(Save_Strip_Int1)
                            Save_Strip_fit1 = Save_Strip_Smooth_fit14(1,:,:);
                        end
                        [tonto,size_Int]=size(Strip_Int1);
                        Background1 = ones(size_Int,1)*Save_Background1(val_Strip_Scan1,1);
                    end
                end
                             
                
                
                Picture_Plot = eval(get(h.Scan_Image_load_compare1,'String')) ;            
                Picture1 = Picture_Plot-ImageNumbers1(1,1)+1;    
                
                if val_Strip_Scan1 ==1
                    if h.Strip1 == 1
                        if h.micro_Check == 1
                            micro_val = h.micro_value;
                            ColumnRange1 = Save_Colum_Int1 * micro_val;                            
                            x_values1 = Save_x_values1 * micro_val;
                            MaxPos1 = Save_Peak1 * micro_val;
                            Max_Pos_Manu_array1 = Save_Peak_Manu1* micro_val;
                            if Save_Smooth ==1
                                MaxPos_Smooth1 = Save_Peak_Smooth1 * micro_val;
                                Max_Pos_Manu_array_Smooth1 = Save_Peak_Manu_Smooth1* micro_val;
                            end
                        else
                            ColumnRange1 = Save_Colum_Int1;
                            x_values1 = Save_x_values1;
                            MaxPos1 = Save_Peak1;
                            Max_Pos_Manu_array1 = Save_Peak_Manu1;
                            if Save_Smooth ==1
                                MaxPos_Smooth1 = Save_Peak_Smooth1;
                                Max_Pos_Manu_array_Smooth1 = Save_Peak_Manu_Smooth1;
                            end
                        end
                        
                    end
                end
                
                if val_Strip_Scan1 ==2
                    if h.Strip2 == 1
                        if h.micro_Check == 1
                            micro_val = h.micro_value;
                            ColumnRange1 = Save_Colum_Int1 * micro_val;
                            x_values1 = Save_x_values1 * micro_val;
                            MaxPos1 = Save_Peak1 * micro_val;
                            Max_Pos_Manu_array1 = Save_Peak_Manu1* micro_val;
                            if Save_Smooth ==1
                                MaxPos_Smooth1 = Save_Peak_Smooth1 * micro_val;
                                Max_Pos_Manu_array_Smooth1 = Save_Peak_Manu_Smooth1* micro_val;
                            end
                        else
                            ColumnRange1 = Save_Colum_Int1;
                            x_values1 = Save_x_values1;
                            MaxPos1 = Save_Peak1;
                            Max_Pos_Manu_array1 = Save_Peak_Manu1;
                            if Save_Smooth ==1
                                MaxPos_Smooth1 = Save_Peak_Smooth1;
                                Max_Pos_Manu_array_Smooth1 = Save_Peak_Manu_Smooth1;
                            end
                        end
                        
                    end
                end
                if val_Strip_Scan1 ==3
                    if h.Strip3 == 1
                        if h.micro_Check == 1
                            micro_val = h.micro_value;
                            ColumnRange1 = Save_Colum_Int1 * micro_val;
                            x_values1 = Save_x_values1 * micro_val;
                            MaxPos1 = Save_Peak1 * micro_val;
                            Max_Pos_Manu_array1 = Save_Peak_Manu1* micro_val;
                            if Save_Smooth ==1
                                MaxPos_Smooth1 = Save_Peak_Smooth1 * micro_val;
                                Max_Pos_Manu_array_Smooth1 = Save_Peak_Manu_Smooth1* micro_val;
                            end
                        else
                            ColumnRange1 = Save_Colum_Int1;
                            x_values1 = Save_x_values1;
                            MaxPos1 = Save_Peak1;
                            Max_Pos_Manu_array1 = Save_Peak_Manu1;
                            if Save_Smooth ==1
                                MaxPos_Smooth1 = Save_Peak_Smooth1;
                                Max_Pos_Manu_array_Smooth1 = Save_Peak_Manu_Smooth1;
                            end
                        end
                        
                    end
                end
                
                if val_Strip_Scan1 ==4
                    if h.Strip4 == 1
                        if h.micro_Check == 1
                            micro_val = h.micro_value;
                            ColumnRange1 = Save_Colum_Int1 * micro_val;
                            x_values1 = Save_x_values1 * micro_val;
                            MaxPos1 = Save_Peak1 * micro_val;
                            Max_Pos_Manu_array1 = Save_Peak_Manu1* micro_val;
                            if Save_Smooth ==1
                                MaxPos_Smooth1 = Save_Peak_Smooth1 * micro_val;
                                Max_Pos_Manu_array_Smooth1 = Save_Peak_Manu_Smooth1* micro_val;
                            end
                        else
                            ColumnRange1 = Save_Colum_Int1;
                            x_values1 = Save_x_values1;
                            MaxPos1 = Save_Peak1;
                            Max_Pos_Manu_array1 = Save_Peak_Manu1;
                            if Save_Smooth ==1
                                MaxPos_Smooth1 = Save_Peak_Smooth1;
                                Max_Pos_Manu_array_Smooth1 = Save_Peak_Manu_Smooth1;
                            end
                        end                        
                    end
                end
%                FWHM1 = h.FWHM1;
 %               RSquare1 = h.RSquare1;
                
                if val_Strip_Scan1 == 1
                    if h.Strip1 == 1
                        number_Image1(1,:)=Save_number_Image1(1,:);
                        Error1(1,:) = Save_Error1(1,:);
                        if h.Save_Smooth_chk1 ==0
                            Widths1(1,:)=Save_Widths1(1,:);
                            Area1(1,:) = Save_Area1(1,:);
                            FitValid1(1,:) = Save_FitValid1(1,:);
                            Peak1(1,:) = MaxPos1(1,:);
                            Peak_Manu1(1,:) =Max_Pos_Manu_array1 (1,:);                            
                        else                            
                            Widths1(1,:)=Save_Widths_Smooth1(1,:);
                            Area1(1,:) = Save_Area_Smooth1(1,:);
                            FitValid1(1,:) = Save_FitValid_Smooth1(1,:);
                            Peak1(1,:) = MaxPos_Smooth1(1,:);
                            Peak_Manu1(1,:) =Max_Pos_Manu_array_Smooth1 (1,:);
                            
                        end
                    end
                elseif val_Strip_Scan1 == 2
                    if h.Strip2 == 1
                        if h.Save_Smooth_chk1 ==0
                            Widths1(1,:)=Save_Widths1(2,:);
                            Area1(1,:) = Save_Area1(2,:);
                            FitValid1(1,:) = Save_FitValid1(2,:);
                            Peak1(1,:) = MaxPos1(2,:);
                            Peak_Manu1(1,:) =Max_Pos_Manu_array1 (2,:);
                        else
                            Widths1(1,:)=Save_Widths_Smooth1(2,:);
                            Area1(1,:) = Save_Area_Smooth1(2,:);
                            FitValid1(1,:) = Save_FitValid_Smooth1(2,:);
                            Peak1(1,:) = MaxPos_Smooth1(2,:);
                            Peak_Manu1(1,:) =Max_Pos_Manu_array_Smooth1 (2,:);
                        end
                        number_Image1(1,:)=Save_number_Image1(1,:);
                        Error1(1,:) = Save_Error1(2,:);
                    end
                elseif val_Strip_Scan1 == 3
                    if h.Strip3 == 1
                        if h.Save_Smooth_chk1 ==0
                            Widths1(1,:)=Save_Widths1(3,:);
                            Area1(1,:) = Save_Area1(3,:);
                            FitValid1(1,:) = Save_FitValid1(3,:);
                            Peak1(1,:) = MaxPos1(3,:);
                            Peak_Manu1(1,:) =Max_Pos_Manu_array1 (3,:);                        
                        else
                            Widths1(1,:)=Save_Widths_Smooth1(3,:);
                            Area1(1,:) = Save_Area_Smooth1(3,:);
                            FitValid1(1,:) = Save_FitValid_Smooth1(3,:);
                            Peak1(1,:) = MaxPos_Smooth1(3,:);
                            Peak_Manu1(1,:) =Max_Pos_Manu_array_Smooth1 (3,:);                        
                        end
                        number_Image1(1,:)=Save_number_Image1(1,:);
                        Error1(1,:) = Save_Error1(3,:);
                    end
                elseif val_Strip_Scan1 == 4                    
                    if h.Strip4 == 1
                        if h.Save_Smooth_chk1 ==0
                            Widths1(1,:)=Save_Widths1(4,:);
                            Area1(1,:) = Save_Area1(4,:);
                            FitValid1(1,:) = Save_FitValid1(4,:);
                            Peak1(1,:) = MaxPos1(4,:);
                            Peak_Manu1(1,:) =Max_Pos_Manu_array1 (4,:);
                        else
                            Widths1(1,:)=Save_Widths_Smooth1(4,:);
                            Area1(1,:) = Save_Area_Smooth1(4,:);
                            FitValid1(1,:) = Save_FitValid_Smooth1(4,:);
                            Peak1(1,:) = MaxPos_Smooth1(4,:);
                            Peak_Manu1(1,:) =Max_Pos_Manu_array_Smooth1 (4,:);
                        end
                        number_Image1(1,:)=Save_number_Image1(1,:);
                        Error1(1,:) = Save_Error1(4,:);
                    end
                end
       
            end
            
            
            if h.Scan_compare_Check (1,2) == 2
                Save_Area2 = h.Save_Area2;
                Save_Peak2 = h.Save_Peak2;
                Save_Widths2 = h.Save_Widths2;
                Save_number_Image2 = h.Save_number_Image2;
                i_im2= h.i_im2;
                StripRanges2 = h.StripRanges2;
                Save_Background2 = h.Save_Background2;
%                background2 = Save_Background2*ones(1,size_colum);                
                Save_FitValid2 = h.Save_FitValid2;
                Save_Peak_Manu2 = h.Save_Peak_Manu2;
                Save_Error2 = h.Save_Error2;
                ImageNumbers2 = h.ImageNumbers2;
                
                if h.Scan_compare_Check_Energy_Val ==1
                    Energy_2 = eval(get(h.Scan_Image_load_Energy_compare2,'String'));
                    d_hkl_2 = eval(get(h.Scan_Image_load_dhkl_compare2,'String'));  
                    Theta_2 = asin(h.h_plank*h.c_light/(Energy_2*2*d_hkl_2));
                    h.Energy_Step_value2 = Energy_2*cot(Theta_2)*eval(get(h.Scan_Image_load_Energy_Step_compare2,'String'));  
                    Position_2 = eval(get(h.Scan_Image_load_Position_compare2,'String'));
                end
                                   
                if h.Scan_compare_Check_micron_Val ==1
                    micron_2 = eval(get(h.Scan_Image_load_micron_compare2,'String'))*1e-6;                    
                end
                
                if Save_Smooth ==1
                    Save_Area_Smooth2 = h.Save_Area_Smooth2;
                    Save_Peak_Smooth2 = h.Save_Peak_Smooth2;
                    Save_Widths_Smooth2 = h.Save_Widths_Smooth2;
                    
                    Save_FitValid_Smooth2 = h.Save_FitValid_Smooth2;
                    Save_Peak_Manu_Smooth2 = h.Save_Peak_Manu_Smooth2;
                end
                   
                
                if h.Strip1 == 1
                    Save_Colum_Int21 = h.Save_Colum_Int21;
                    Save_x_values21 = h.Save_x_values21;
                    Save_Strip_Int21 = h.Save_Strip_Int21;                    
                    mean_Strip21 = h.mean_Strip21;
                    Save_Strip_fit21 = h.Save_Strip_fit21;
                    if Save_Smooth ==1
                        Save_Strip_Smooth_Int21 = h.Save_Strip_Smooth_Int21;                        
                        Save_Strip_Smooth_fit21= h.Save_Strip_Smooth_fit21;                
                    end
                end
                
                if h.Strip2 == 1
                    Save_Colum_Int22 = h.Save_Colum_Int22;
                    Save_x_values22 = h.Save_x_values22;
                    Save_Strip_Int22 = h.Save_Strip_Int22;
                    mean_Strip22 = h.mean_Strip22;
                    Save_Strip_fit22 = h.Save_Strip_fit22;
                    if Save_Smooth ==1
                        Save_Strip_Smooth_Int22 = h.Save_Strip_Smooth_Int22;
                        Save_Strip_Smooth_fit22 = h.Save_Strip_Smooth_fit22;
                    end
                end
                
                if h.Strip3 == 1
                    Save_Colum_Int23 = h.Save_Colum_Int23;
                    Save_x_values23 = h.Save_x_values23;
                    Save_Strip_Int23 = h.Save_Strip_Int23;
                    mean_Strip23 = h.mean_Strip23;
                    Save_Strip_fit23 = h.Save_Strip_fit23;
                    if Save_Smooth ==1
                        Save_Strip_Smooth_Int23 = h.Save_Strip_Smooth_Int23;
                        Save_Strip_Smooth_fit23 = h.Save_Strip_Smooth_fit23;                
                    end
                end
                
                if h.Strip4 == 1
                    Save_Colum_Int24 = h.Save_Colum_Int24;
                    Save_x_values24 = h.Save_x_values24;
                    Save_Strip_Int24 = h.Save_Strip_Int24;
                    mean_Strip24 = h.mean_Strip24;
                    Save_Strip_fit24 = h.Save_Strip_fit24;   
                    if Save_Smooth ==1
                        Save_Strip_Smooth_Int24 = h.Save_Strip_Smooth_Int24;
                        Save_Strip_Smooth_fit24 = h.Save_Strip_Smooth_fit24;                
                    end
                end
                
                
                if val_Strip_Scan2 == 1
                    if h.Strip1 == 1
                        Save_x_values2 = Save_x_values21(1,:);
                        Save_Colum_Int2 = Save_Colum_Int21(1,:);
                        Strip_Int2 = mean_Strip21(1,:);
                        if h.Save_Smooth_chk2 ==0
                            Save_Strip_Int2 = Save_Strip_Int21(1,:,:); 
                            Save_Strip_fit2 = Save_Strip_fit21(1,:,:); 
                        else
                            Save_Strip_Int2 = Save_Strip_Smooth_Int21(1,:,:); 
                            Save_Strip_fit2 = Save_Strip_Smooth_fit21(1,:,:); 
                        end
                        [tonto,size_Int]=size(Strip_Int2);
                        Background2 = ones(size_Int,1)*Save_Background2(val_Strip_Scan2,1);
                    end
                elseif val_Strip_Scan2 ==2
                    if h.Strip2 == 1
                        Save_x_values2 = Save_x_values22(1,:);
                        Save_Colum_Int2= Save_Colum_Int22(1,:);
                        Strip_Int2 = mean_Strip22(1,:);
                        if h.Save_Smooth_chk2 ==0
                            Save_Strip_Int2 = Save_Strip_Int22(1,:,:); 
                            Save_Strip_fit2 = Save_Strip_fit22(1,:,:); 
                        else
                            Save_Strip_Int2 = Save_Strip_Smooth_Int22(1,:,:); 
                            Save_Strip_fit2 = Save_Strip_Smooth_fit22(1,:,:); 
                        end
                        [tonto,size_Int]=size(Strip_Int2);
                        Background2 = ones(size_Int,1)*Save_Background2(val_Strip_Scan2,1);
                    end
                elseif val_Strip_Scan2 ==3
                    if h.Strip3 == 1
                        Save_x_values2 = Save_x_values23(1,:);
                        Save_Colum_Int2 = Save_Colum_Int23(1,:);
                        Strip_Int2 = mean_Strip23(1,:);
                         if h.Save_Smooth_chk2 ==0
                             Save_Strip_Int2 = Save_Strip_Int23(1,:,:);
                             Save_Strip_fit2 = Save_Strip_fit23(1,:,:); 
                         else
                             Save_Strip_Int2 = Save_Strip_Smooth_Int23(1,:,:);
                             Save_Strip_fit2 = Save_Strip_Smooth_fit23(1,:,:); 
                         end
                        [tonto,size_Int]=size(Strip_Int2);
                        Background2 = ones(size_Int,1)*Save_Background2(val_Strip_Scan2,1);
                    end
                elseif val_Strip_Scan2 ==4
                    if h.Strip4 == 1
                        Save_x_values2 = Save_x_values24(1,:);
                        Save_Colum_Int2 = Save_Colum_Int24(1,:);
                        Strip_Int2 = mean_Strip24(1,:);
                         if h.Save_Smooth_chk2 ==0
                             Save_Strip_Int2 = Save_Strip_Int24(1,:,:); 
                             Save_Strip_fit2 = Save_Strip_fit24(1,:,:); 
                         else
                             Save_Strip_Int2 = Save_Strip_Smooth_Int24(1,:,:); 
                             Save_Strip_fit2 = Save_Strip_Smooth_fit24(1,:,:); 
                         end
                        [tonto,size_Int]=size(Strip_Int2);
                        Background2 = ones(size_Int,1)*Save_Background2(val_Strip_Scan2,1);
                    end
                end
                
                
                Picture_Plot = eval(get(h.Scan_Image_load_compare2,'String')) ;            
                Picture2 = Picture_Plot-ImageNumbers2(1,1)+1;  
                
                
                if val_Strip_Scan2 ==1
                    if h.Strip1 == 1
                        
                        if h.micro_Check == 1
                            micro_val = h.micro_value;
                            ColumnRange2 = Save_Colum_Int2 * micro_val;
                            x_values2 = Save_x_values2 * micro_val;
                            MaxPos2 = Save_Peak2 * micro_val;
                            Max_Pos_Manu_array2 = Save_Peak_Manu2* micro_val;
                            if Save_Smooth ==1
                                MaxPos_Smooth2 = Save_Peak_Smooth2 * micro_val;
                                Max_Pos_Manu_array_Smooth2 = Save_Peak_Manu_Smooth2* micro_val;
                            end
                        else
                            ColumnRange2 = Save_Colum_Int2;
                            x_values2 = Save_x_values2;
                            MaxPos2 = Save_Peak2;
                            Max_Pos_Manu_array2 = Save_Peak_Manu2;
                            if Save_Smooth ==1
                                MaxPos_Smooth2 = Save_Peak_Smooth2;
                                Max_Pos_Manu_array_Smooth2 = Save_Peak_Manu_Smooth2;
                            end
                        end
                        
                    end
                end
                if val_Strip_Scan2 ==2
                    if h.Strip2 == 1
                        
                        if h.micro_Check == 1
                            micro_val = h.micro_value;
                            ColumnRange2 = Save_Colum_Int2 * micro_val;
                            x_values2 = Save_x_values2 * micro_val;
                            MaxPos2 = Save_Peak2 * micro_val;
                            Max_Pos_Manu_array2 = Save_Peak_Manu2* micro_val;
                            if Save_Smooth ==1
                                MaxPos_Smooth2 = Save_Peak_Smooth2 * micro_val;
                                Max_Pos_Manu_array_Smooth2 = Save_Peak_Manu_Smooth2* micro_val;
                            end
                        else
                            ColumnRange2 = Save_Colum_Int2;
                            x_values2 = Save_x_values2;
                            MaxPos2 = Save_Peak2;
                            Max_Pos_Manu_array2 = Save_Peak_Manu2;
                            if Save_Smooth ==1
                                MaxPos_Smooth2 = Save_Peak_Smooth2;
                                Max_Pos_Manu_array_Smooth2 = Save_Peak_Manu_Smooth2;
                            end
                        end
                        
                    end
                end
                
                if val_Strip_Scan2 ==3
                    if h.Strip3 == 1
                        
                        if h.micro_Check == 1
                            micro_val = h.micro_value;
                            ColumnRange2 = Save_Colum_Int2 * micro_val;
                            x_values2 = Save_x_values2 * micro_val;
                            MaxPos2 = Save_Peak2 * micro_val;
                            Max_Pos_Manu_array2 = Save_Peak_Manu2* micro_val;
                            if Save_Smooth ==1                      
                                MaxPos_Smooth2 = Save_Peak_Smooth2 * micro_val;
                                Max_Pos_Manu_array_Smooth2 = Save_Peak_Manu_Smooth2* micro_val;
                            end
                        else
                            ColumnRange2 = Save_Colum_Int2;
                            x_values2 = Save_x_values2;
                            MaxPos2 = Save_Peak2;
                            Max_Pos_Manu_array2 = Save_Peak_Manu2;
                            if Save_Smooth ==1                                
                                MaxPos_Smooth2 = Save_Peak_Smooth2;
                                Max_Pos_Manu_array_Smooth2 = Save_Peak_Manu_Smooth2;
                            end
                        end
                        
                    end
                end
                
                
                if val_Strip_Scan2 ==4
                    if h.Strip4 == 1
                        
                        if h.micro_Check == 1
                            micro_val = h.micro_value;
                            ColumnRange2 = Save_Colum_Int2 * micro_val;
                            x_values2 = Save_x_values2 * micro_val;
                            MaxPos2 = Save_Peak2 * micro_val;
                            Max_Pos_Manu_array2 = Save_Peak_Manu2* micro_val;
                            if Save_Smooth ==1                      
                                MaxPos_Smooth2 = Save_Peak_Smooth2 * micro_val;
                                Max_Pos_Manu_array_Smooth2 = Save_Peak_Manu_Smooth2* micro_val;
                            end
                        else
                            ColumnRange2 = Save_Colum_Int2;
                            x_values2 = Save_x_values2;
                            MaxPos2 = Save_Peak2;
                            Max_Pos_Manu_array2 = Save_Peak_Manu2;
                            if Save_Smooth ==1                                
                                MaxPos_Smooth2 = Save_Peak_Smooth2;
                                Max_Pos_Manu_array_Smooth2 = Save_Peak_Manu_Smooth2;
                            end
                        end
                        
                    end
                end
                
%                FWHM2 = h.FWHM2;
%                RSquare2 = h.RSquare2;
                
                
              if val_Strip_Scan2 == 1   
                  if h.Strip1 == 1
                      if h.Save_Smooth_chk2 ==0
                          Widths2(1,:)=Save_Widths2(1,:);
                          Area2(1,:)=Save_Area2(1,:);
                          FitValid2(1,:) = Save_FitValid2(1,:);
                          Peak2(1,:) = MaxPos2(1,:);
                          Peak_Manu2(1,:) =Max_Pos_Manu_array2 (1,:);
                      else
                          Widths2(1,:)=Save_Widths_Smooth2(1,:);
                          Area2(1,:)=Save_Area_Smooth2(1,:);
                          FitValid2(1,:) = Save_FitValid_Smooth2(1,:);
                          Peak2(1,:) = MaxPos_Smooth2(1,:);
                          Peak_Manu2(1,:) =Max_Pos_Manu_array_Smooth2 (1,:);
                      end
                      number_Image2(1,:)=Save_number_Image2(1,:);
                      Error2(1,:) = Save_Error2(1,:);
                  end
              elseif val_Strip_Scan2 == 2   
                  if h.Strip2 == 1
                      if h.Save_Smooth_chk2 ==0
                          Widths2(1,:)=Save_Widths2(2,:);
                          Area2(1,:)=Save_Area2(2,:);
                          FitValid2(1,:) = Save_FitValid2(2,:);
                          Peak2(1,:) = MaxPos2(2,:);
                          Peak_Manu2(1,:) =Max_Pos_Manu_array2 (2,:);
                      else
                          Widths2(1,:)=Save_Widths_Smooth2(2,:);
                          Area2(1,:)=Save_Area_Smooth2(2,:);
                          FitValid2(1,:) = Save_FitValid_Smooth2(2,:);
                          Peak2(1,:) = MaxPos_Smooth2(2,:);
                          Peak_Manu2(1,:) =Max_Pos_Manu_array_Smooth2 (2,:);
                      end
                      number_Image2(1,:)=Save_number_Image2(1,:);
                      Error2(1,:) = Save_Error2(2,:);
                  end
              elseif val_Strip_Scan2 == 3 
                  if h.Strip3 == 1
                      if h.Save_Smooth_chk2 ==0
                          Widths2(1,:)=Save_Widths2(3,:);
                          Area2(1,:)=Save_Area2(3,:);
                          FitValid2(1,:) = Save_FitValid2(3,:);
                          Peak2(1,:) = MaxPos2(3,:);
                          Peak_Manu2(1,:) =Max_Pos_Manu_array2 (3,:);
                      else
                           Widths2(1,:)=Save_Widths_Smooth2(3,:);
                          Area2(1,:)=Save_Area_Smooth2(3,:);
                          FitValid2(1,:) = Save_FitValid_Smooth2(3,:);
                          Peak2(1,:) = MaxPos_Smooth2(3,:);
                          Peak_Manu2(1,:) =Max_Pos_Manu_array_Smooth2 (3,:);
                      end
                      number_Image2(1,:)=Save_number_Image2(1,:);
                      Error2(1,:) = Save_Error2(3,:);
                  end
              elseif val_Strip_Scan2 == 4   
                  if h.Strip4 == 1
                      if h.Save_Smooth_chk2 ==0
                          Widths2(1,:)=Save_Widths2(4,:);
                          Area2(1,:)=Save_Area2(4,:);
                          FitValid2(1,:) = Save_FitValid2(4,:);
                          Peak2(1,:) = MaxPos2(4,:);
                          Peak_Manu2(1,:) =Max_Pos_Manu_array2 (4,:);
                      else
                           Widths2(1,:)=Save_Widths_Smooth2(4,:);
                          Area2(1,:)=Save_Area_Smooth2(4,:);
                          FitValid2(1,:) = Save_FitValid_Smooth2(4,:);
                          Peak2(1,:) = MaxPos_Smooth2(4,:);
                          Peak_Manu2(1,:) =Max_Pos_Manu_array_Smooth2 (4,:);
                      end
                      number_Image2(1,:)=Save_number_Image2(1,:);
                      Error2(1,:) = Save_Error2(4,:);
                  end
              end
              
              
            end
            
            if h.Scan_compare_Check (1,3) == 3
                Save_Area3 = h.Save_Area3;
                Save_Peak3 = h.Save_Peak3;
                Save_Widths3 = h.Save_Widths3;
                if Save_Smooth ==1
                    Save_Area_Smooth3 = h.Save_Area_Smooth3;
                    Save_Peak_Smooth3 = h.Save_Peak_Smooth3;
                    Save_Widths_Smooth3 = h.Save_Widths_Smooth3;
                    
                    Save_FitValid_Smooth3 = h.Save_FitValid_Smooth3;
                    Save_Peak_Manu_Smooth3 = h.Save_Peak_Manu_Smooth3;
                end
                
                if h.Scan_compare_Check_Energy_Val ==1
                    Energy_3 = eval(get(h.Scan_Image_load_Energy_compare3,'String'));
                    d_hkl_3 = eval(get(h.Scan_Image_load_dhkl_compare3,'String'));  
                    Theta_3 = asin(h.h_plank*h.c_light/(Energy_3*2*d_hkl_3));
                    h.Energy_Step_value3 = Energy_3*cot(Theta_3)*eval(get(h.Scan_Image_load_Energy_Step_compare3,'String'));  
                    Position_3 = eval(get(h.Scan_Image_load_Position_compare3,'String'));
                end
                                   
                if h.Scan_compare_Check_micron_Val ==1
                    micron_3 = eval(get(h.Scan_Image_load_micron_compare3,'String'))*1e-6;
                end
                
                if h.Strip1 == 1
                    Save_Colum_Int31 = h.Save_Colum_Int31;
                    Save_x_values31 = h.Save_x_values31;
                    Save_Strip_Int31 = h.Save_Strip_Int31;
                    mean_Strip31 = h.mean_Strip31;
                    Save_Strip_fit31 = h.Save_Strip_fit31;
                    if Save_Smooth ==1
                        Save_Strip_Smooth_Int31 = h.Save_Strip_Smooth_Int31;
                        Save_Strip_Smooth_fit31 = h.Save_Strip_Smooth_fit31;                
                    end
                end
                
                if h.Strip2 == 1
                    Save_Colum_Int32 = h.Save_Colum_Int32;
                    Save_x_values32 = h.Save_x_values32;
                    Save_Strip_Int32 = h.Save_Strip_Int32;
                    mean_Strip32 = h.mean_Strip32;
                    Save_Strip_fit32 = h.Save_Strip_fit32;
                    if Save_Smooth ==1
                        Save_Strip_Smooth_Int32 = h.Save_Strip_Smooth_Int32;
                        Save_Strip_Smooth_fit32 = h.Save_Strip_Smooth_fit32;                
                    end
                end
                
                if h.Strip3 == 1
                    Save_Colum_Int33 = h.Save_Colum_Int33;
                    Save_x_values33 = h.Save_x_values33;
                    Save_Strip_Int33 = h.Save_Strip_Int33;
                    mean_Strip33 = h.mean_Strip33;
                    Save_Strip_fit33 = h.Save_Strip_fit33;
                    if Save_Smooth ==1
                        Save_Strip_Smooth_Int33 = h.Save_Strip_Smooth_Int33;
                        Save_Strip_Smooth_fit33 = h.Save_Strip_Smooth_fit33;                
                    end
                end
                
                if h.Strip4 == 1
                    Save_Colum_Int34 = h.Save_Colum_Int34;
                    Save_x_values34 = h.Save_x_values34;
                    Save_Strip_Int34 = h.Save_Strip_Int34;
                    mean_Strip34 = h.mean_Strip34;
                    Save_Strip_fit34 = h.Save_Strip_fit34;
                    if Save_Smooth ==1
                        Save_Strip_Smooth_Int34 = h.Save_Strip_Smooth_Int34;
                        Save_Strip_Smooth_fit34 = h.Save_Strip_Smooth_fit34;                
                    end
                end
                
                Save_number_Image3 = h.Save_number_Image3;
                i_im3= h.i_im3;
                StripRanges3 = h.StripRanges3;
                Save_Background3 = h.Save_Background3;
%                background3 = Save_Background3*ones(1,size_colum);
                Save_FitValid3 = h.Save_FitValid3;
                Save_Peak_Manu3 = h.Save_Peak_Manu3;
                Save_Error3 = h.Save_Error3;
        
                ImageNumbers3 = h.ImageNumbers3;
                
                if val_Strip_Scan3 == 1                    
                    if h.Strip1 == 1
                        Save_x_values3 = Save_x_values31(1,:);
                        Save_Colum_Int3 = Save_Colum_Int31(1,:);
                        Strip_Int3 = mean_Strip31(1,:);
                        if h.Save_Smooth_chk3 ==0
                            Save_Strip_Int3 = Save_Strip_Int31(1,:,:); 
                            Save_Strip_fit3 = Save_Strip_fit31(1,:,:); 
                        else
                            Save_Strip_Int3 = Save_Strip_Smooth_Int31(1,:,:); 
                            Save_Strip_fit3 = Save_Strip_Smooth_fit31(1,:,:); 
                        end
                        [tonto,size_Int]=size(Strip_Int3);                        
                        Background3 = ones(size_Int,1)*Save_Background3(val_Strip_Scan3,1);
                    end
                elseif val_Strip_Scan3 ==2
                    if h.Strip2 == 1
                        Save_x_values3 = Save_x_values32(1,:);
                        Save_Colum_Int3= Save_Colum_Int32(1,:);
                        Strip_Int3 = mean_Strip32(1,:);
                        if h.Save_Smooth_chk3 ==0
                            Save_Strip_Int3 = Save_Strip_Int32(1,:,:);                         
                            Save_Strip_fit3 = Save_Strip_fit32(1,:,:); 
                        else
                            Save_Strip_Int3 = Save_Strip_Smooth_Int32(1,:,:);                         
                            Save_Strip_fit3 = Save_Strip_Smooth_fit32(1,:,:); 
                        end
                        [tonto,size_Int]=size(Strip_Int3);                        
                        Background3 = ones(size_Int,1)*Save_Background3(val_Strip_Scan3,1);
                    end
                elseif val_Strip_Scan3 ==3
                    if h.Strip3 == 1
                        Save_x_values3 = Save_x_values33(1,:);
                        Save_Colum_Int3 = Save_Colum_Int33(1,:);
                        Strip_Int3 = mean_Strip33(1,:);
                        if h.Save_Smooth_chk3 ==0
                            Save_Strip_Int3 = Save_Strip_Int33(1,:,:);                         
                            Save_Strip_fit3 = Save_Strip_fit33(1,:,:); 
                        else
                            Save_Strip_Int3 = Save_Strip_Smooth_Int33(1,:,:);                         
                            Save_Strip_fit3 = Save_Strip_Smooth_fit33(1,:,:); 
                        end
                        [tonto,size_Int]=size(Strip_Int3);                        
                        Background3 = ones(size_Int,1)*Save_Background3(val_Strip_Scan3,1);
                    end
                elseif val_Strip_Scan3 ==4
                    if h.Strip4 == 1
                        Save_x_values3 = Save_x_values34(1,:);
                        Save_Colum_Int3 = Save_Colum_Int34(1,:);
                        Strip_Int3 = mean_Strip34(1,:);
                        if h.Save_Smooth_chk3 ==0
                            Save_Strip_Int3 = Save_Strip_Int34(1,:,:);                         
                            Save_Strip_fit3 = Save_Strip_fit34(1,:,:); 
                        else
                            Save_Strip_Int3 = Save_Strip_Smooth_Int34(1,:,:);                         
                            Save_Strip_fit3 = Save_Strip_Smooth_fit34(1,:,:); 
                        end
                        [tonto,size_Int]=size(Strip_Int3);                        
                        Background3 = ones(size_Int,1)*Save_Background3(val_Strip_Scan3,1);
                    end
                end
                

                Picture_Plot = eval(get(h.Scan_Image_load_compare3,'String')) ;            
                Picture3 = Picture_Plot-ImageNumbers3(1,1)+1;   
                
                if val_Strip_Scan3 ==1
                    if h.Strip1 == 1
                        if h.micro_Check == 1
                            micro_val = h.micro_value;
                            ColumnRange3 = Save_Colum_Int3 * micro_val;
                            x_values3 = Save_x_values3 * micro_val;
                            MaxPos3 = Save_Peak3 * micro_val;
                            Max_Pos_Manu_array3 = Save_Peak_Manu3* micro_val;
                            if Save_Smooth ==1  
                                MaxPos_Smooth3 = Save_Peak_Smooth3 * micro_val;
                                Max_Pos_Manu_array_Smooth3 = Save_Peak_Manu_Smooth3* micro_val;
                            end
                        else
                            ColumnRange3 = Save_Colum_Int3;
                            x_values3 = Save_x_values3;
                            MaxPos3 = Save_Peak3;
                            Max_Pos_Manu_array3 = Save_Peak_Manu3;
                            if Save_Smooth ==1  
                                MaxPos_Smooth3 = Save_Peak_Smooth3;
                                Max_Pos_Manu_array_Smooth3 = Save_Peak_Manu_Smooth3;
                            end
                        end
                    end
                end
                if val_Strip_Scan3 ==2
                    if h.Strip2 == 1
                        if h.micro_Check == 1
                            micro_val = h.micro_value;
                            ColumnRange3 = Save_Colum_Int3 * micro_val;
                            x_values3 = Save_x_values3 * micro_val;
                            MaxPos3 = Save_Peak3 * micro_val;
                            Max_Pos_Manu_array3 = Save_Peak_Manu3* micro_val;
                            if Save_Smooth ==1  
                                MaxPos_Smooth3 = Save_Peak_Smooth3 * micro_val;
                                Max_Pos_Manu_array_Smooth3 = Save_Peak_Manu_Smooth3* micro_val;
                            end
                        else
                            ColumnRange3 = Save_Colum_Int3;
                            x_values3 = Save_x_values3;
                            MaxPos3 = Save_Peak3;
                            Max_Pos_Manu_array3 = Save_Peak_Manu3;
                            if Save_Smooth ==1  
                                MaxPos_Smooth3 = Save_Peak_Smooth3;
                                Max_Pos_Manu_array_Smooth3 = Save_Peak_Manu_Smooth3;
                            end
                        end
                    end
                end
                if val_Strip_Scan3 ==3
                    if h.Strip3 == 1
                        if h.micro_Check == 1
                            micro_val = h.micro_value;
                            ColumnRange3 = Save_Colum_Int3 * micro_val;
                            x_values3 = Save_x_values3 * micro_val;
                            MaxPos3 = Save_Peak3 * micro_val;
                            Max_Pos_Manu_array3 = Save_Peak_Manu3* micro_val;
                            if Save_Smooth ==1  
                                MaxPos_Smooth3 = Save_Peak_Smooth3 * micro_val;
                                Max_Pos_Manu_array_Smooth3 = Save_Peak_Manu_Smooth3* micro_val;
                            end
                        else
                            ColumnRange3 = Save_Colum_Int3;
                            x_values3 = Save_x_values3;
                            MaxPos3 = Save_Peak3;
                            Max_Pos_Manu_array3 = Save_Peak_Manu3;
                            if Save_Smooth ==1  
                                MaxPos_Smooth3 = Save_Peak_Smooth3;
                                Max_Pos_Manu_array_Smooth3 = Save_Peak_Manu_Smooth3;
                            end
                        end
                    end
                end
                if val_Strip_Scan3 ==4
                    if h.Strip4 == 1
                        if h.micro_Check == 1
                            micro_val = h.micro_value;
                            ColumnRange3 = Save_Colum_Int3 * micro_val;
                            x_values3 = Save_x_values3 * micro_val;
                            MaxPos3 = Save_Peak3 * micro_val;
                            Max_Pos_Manu_array3 = Save_Peak_Manu3* micro_val;
                            if Save_Smooth ==1  
                                MaxPos_Smooth3 = Save_Peak_Smooth3 * micro_val;
                                Max_Pos_Manu_array_Smooth3 = Save_Peak_Manu_Smooth3* micro_val;
                            end
                        else
                            ColumnRange3 = Save_Colum_Int3;
                            x_values3 = Save_x_values3;
                            MaxPos3 = Save_Peak3;
                            Max_Pos_Manu_array3 = Save_Peak_Manu3;
                            if Save_Smooth ==1  
                                MaxPos_Smooth3 = Save_Peak_Smooth3;
                                Max_Pos_Manu_array_Smooth3 = Save_Peak_Manu_Smooth3;
                            end
                        end
                    end
                end
                
%                FWHM3 = h.FWHM3;
%                RSquare3 = h.RSquare3;
                
                
                if val_Strip_Scan3 == 1      
                    if h.Strip1 == 1
                        if h.Save_Smooth_chk3 ==0
                            Widths3(1,:)=Save_Widths3(1,:);
                            Area3(1,:)=Save_Area3(1,:);
                            FitValid3(1,:) = Save_FitValid3(1,:);
                            Peak3(1,:) = MaxPos3(1,:);
                            Peak_Manu3(1,:) =Max_Pos_Manu_array3 (1,:);
                        else
                            Widths3(1,:)=Save_Widths_Smooth3(1,:);
                            Area3(1,:)=Save_Area_Smooth3(1,:);
                            FitValid3(1,:) = Save_FitValid_Smooth3(1,:);
                            Peak3(1,:) = MaxPos_Smooth3(1,:);
                            Peak_Manu3(1,:) =Max_Pos_Manu_array_Smooth3 (1,:);
                        end
                        number_Image3(1,:)=Save_number_Image3(1,:);
                        Error3(1,:) = Save_Error3(1,:);
                    end
                elseif val_Strip_Scan3 == 2    
                    if h.Strip2 == 1
                        if h.Save_Smooth_chk3 ==0
                            Widths3(1,:)=Save_Widths3(2,:);
                            Area3(1,:)=Save_Area3(2,:);
                            FitValid3(1,:) = Save_FitValid3(2,:);
                            Peak3(1,:) = MaxPos3(2,:);
                            Peak_Manu3(1,:) =Max_Pos_Manu_array3 (2,:);
                        else
                            Widths3(1,:)=Save_Widths_Smooth3(2,:);
                            Area3(1,:)=Save_Area_Smooth3(2,:);
                            FitValid3(1,:) = Save_FitValid_Smooth3(2,:);
                            Peak3(1,:) = MaxPos_Smooth3(2,:);
                            Peak_Manu3(1,:) =Max_Pos_Manu_array_Smooth3 (2,:);
                            
                        end
                        number_Image3(1,:)=Save_number_Image3(1,:);
                        Error3(1,:) = Save_Error3(2,:);                    
                    end
                elseif val_Strip_Scan3 == 3      
                    if h.Strip3 == 1
                        if h.Save_Smooth_chk3 ==0
                            Widths3(1,:)=Save_Widths3(3,:);
                            Area3(1,:)=Save_Area3(3,:);
                            FitValid3(1,:) = Save_FitValid3(3,:);
                            Peak3(1,:) = MaxPos3(3,:);
                            Peak_Manu3(1,:) =Max_Pos_Manu_array3 (3,:);
                        else
                            Widths3(1,:)=Save_Widths_Smooth3(3,:);
                            Area3(1,:)=Save_Area_Smooth3(3,:);
                            FitValid3(1,:) = Save_FitValid_Smooth3(3,:);
                            Peak3(1,:) = MaxPos_Smooth3(3,:);
                            Peak_Manu3(1,:) =Max_Pos_Manu_array_Smooth3 (3,:);
                        end
                        number_Image3(1,:)=Save_number_Image3(1,:);
                        Error3(1,:) = Save_Error3(3,:);                    
                    end
                elseif val_Strip_Scan3 == 4    
                    if h.Strip4 == 1
                        if h.Save_Smooth_chk3 ==0
                            Widths3(1,:)=Save_Widths3(4,:);
                            Area3(1,:)=Save_Area3(4,:);
                            FitValid3(1,:) = Save_FitValid3(4,:);
                            Peak3(1,:) = MaxPos3(4,:);
                            Peak_Manu3(1,:) =Max_Pos_Manu_array3 (4,:);
                        else
                            Widths3(1,:)=Save_Widths_Smooth3(4,:);
                            Area3(1,:)=Save_Area_Smooth3(4,:);
                            FitValid3(1,:) = Save_FitValid_Smooth3(4,:);
                            Peak3(1,:) = MaxPos_Smooth3(4,:);
                            Peak_Manu3(1,:) =Max_Pos_Manu_array_Smooth3 (4,:); 
                        end
                        number_Image3(1,:)=Save_number_Image3(1,:);                        
                        Error3(1,:) = Save_Error3(4,:);
                    end
                end
        
            end    
            
            if h.Scan_compare_Check (1,4) == 4
                Save_Area4 = h.Save_Area4;
                Save_Peak4 = h.Save_Peak4;
                Save_Widths4 = h.Save_Widths4;
                
                if Save_Smooth ==1
                    Save_Area_Smooth4 = h.Save_Area_Smooth4;
                    Save_Peak_Smooth4 = h.Save_Peak_Smooth4;
                    Save_Widths_Smooth4 = h.Save_Widths_Smooth4;
                    
                    Save_FitValid_Smooth4 = h.Save_FitValid_Smooth4;
                    Save_Peak_Manu_Smooth4 = h.Save_Peak_Manu_Smooth4;
                end
                
                if h.Scan_compare_Check_Energy_Val ==1
                    Energy_4 = eval(get(h.Scan_Image_load_Energy_compare4,'String'));
                    d_hkl_4 = eval(get(h.Scan_Image_load_dhkl_compare4,'String'));  
                    Theta_4 = asin(h.h_plank*h.c_light/(Energy_4*2*d_hkl_4));
                    h.Energy_Step_value4 = Energy_4*cot(Theta_4)*eval(get(h.Scan_Image_load_Energy_Step_compare4,'String'));  
                    Position_4 = eval(get(h.Scan_Image_load_Position_compare4,'String'));
                end
                                   
                if h.Scan_compare_Check_micron_Val ==1
                    micron_4 = eval(get(h.Scan_Image_load_micron_compare4,'String'))*1e-6;                    
                end
                
                if h.Strip1 == 1
                    Save_Colum_Int41 = h.Save_Colum_Int41;
                    Save_x_values41 = h.Save_x_values41;
                    Save_Strip_Int41 = h.Save_Strip_Int41;
                    mean_Strip41 = h.mean_Strip41;
                    Save_Strip_fit41 = h.Save_Strip_fit41;
                    if Save_Smooth ==1
                        Save_Strip_Smooth_Int41 = h.Save_Strip_Smooth_Int41;
                        Save_Strip_Smooth_fit41= h.Save_Strip_Smooth_fit41;                
                    end
                end
                if h.Strip2 == 1
                    Save_Colum_Int42 = h.Save_Colum_Int42;
                    Save_x_values42 = h.Save_x_values42;
                    Save_Strip_Int42 = h.Save_Strip_Int42;
                    mean_Strip42 = h.mean_Strip42;
                    Save_Strip_fit42 = h.Save_Strip_fit42;
                    if Save_Smooth ==1
                        Save_Strip_Smooth_Int42 = h.Save_Strip_Smooth_Int42;
                        Save_Strip_Smooth_fit42= h.Save_Strip_Smooth_fit42;                
                    end
                end
                
                if h.Strip3 == 1
                    Save_Colum_Int43 = h.Save_Colum_Int43;
                    Save_x_values43 = h.Save_x_values43;
                    Save_Strip_Int43 = h.Save_Strip_Int43;
                    mean_Strip43 = h.mean_Strip43;
                    Save_Strip_fit43 = h.Save_Strip_fit43;
                    if Save_Smooth ==1
                        Save_Strip_Smooth_Int43 = h.Save_Strip_Smooth_Int43;
                        Save_Strip_Smooth_fit43= h.Save_Strip_Smooth_fit43;                
                    end
                end
                
                
                if h.Strip4 == 1
                    Save_Colum_Int44 = h.Save_Colum_Int44;
                    Save_x_values44 = h.Save_x_values44;
                    Save_Strip_Int44 = h.Save_Strip_Int44;
                    mean_Strip44 = h.mean_Strip44;       
                    Save_Strip_fit44 = h.Save_Strip_fit44;
                    if Save_Smooth ==1
                        Save_Strip_Smooth_Int44 = h.Save_Strip_Smooth_Int44;
                        Save_Strip_Smooth_fit44 = h.Save_Strip_Smooth_fit44;                
                    end
                end
                    
                Save_number_Image4 = h.Save_number_Image4;
                i_im4= h.i_im4;
                StripRanges4 = h.StripRanges4;
                Save_Background4 = h.Save_Background4;
%                background4 = Save_Background4*ones(1,size_colum);
                Save_FitValid4 = h.Save_FitValid4;
                Save_Peak_Manu4 = h.Save_Peak_Manu4;
                Save_Error4 = h.Save_Error4;
        
                ImageNumbers4 = h.ImageNumbers4;
                
                if val_Strip_Scan4 == 1
                    if h.Strip1 == 1
                        Save_x_values4 = Save_x_values41(1,:);
                        Save_Colum_Int4 = Save_Colum_Int41(1,:);
                        Strip_Int4 = mean_Strip41(1,:);
                        if h.Save_Smooth_chk4 ==0
                            Save_Strip_Int4 = Save_Strip_Int41(1,:,:); 
                            Save_Strip_fit4 = Save_Strip_fit41(1,:,:); 
                        else
                            Save_Strip_Int4 = Save_Strip_Smooth_Int41(1,:,:); 
                            Save_Strip_fit4 = Save_Strip_Smooth_fit41(1,:,:); 
                        end
                        [tonto,size_Int]=size(Strip_Int4);
                        Background4 = ones(size_Int,1)*Save_Background4(val_Strip_Scan4,1);                        
                    end
                elseif val_Strip_Scan4 ==2
                    if h.Strip2 == 1
                        Save_x_values4 = Save_x_values42(1,:);                        
                        Save_Colum_Int4= Save_Colum_Int42(1,:);
                        Strip_Int4 = mean_Strip42(1,:);
                        if h.Save_Smooth_chk4 ==0
                            Save_Strip_Int4 = Save_Strip_Int42(1,:,:); 
                            Save_Strip_fit4 = Save_Strip_fit42(1,:,:); 
                        else
                            Save_Strip_Int4 = Save_Strip_Smooth_Int42(1,:,:); 
                            Save_Strip_fit4 = Save_Strip_Smooth_fit42(1,:,:); 
                        end
                        [tonto,size_Int]=size(Strip_Int4);
                        Background4 = ones(size_Int,1)*Save_Background4(val_Strip_Scan4,1);   
                    end
                elseif val_Strip_Scan4 ==3
                    if h.Strip3 == 1
                        Save_x_values4 = Save_x_values43(1,:);
                        Save_Colum_Int4 = Save_Colum_Int43(1,:);
                        Strip_Int4 = mean_Strip43(1,:);        
                        if h.Save_Smooth_chk4 ==0
                            Save_Strip_Int4= Save_Strip_Int43(1,:,:); 
                            Save_Strip_fit4 = Save_Strip_fit43(1,:,:); 
                        else
                            Save_Strip_Int4= Save_Strip_Smooth_Int43(1,:,:); 
                            Save_Strip_fit4 = Save_Strip_Smooth_fit43(1,:,:); 
                        end
                        [tonto,size_Int]=size(Strip_Int4);
                        Background4 = ones(size_Int,1)*Save_Background4(val_Strip_Scan4,1);   
                    end
                elseif val_Strip_Scan4 ==4
                    if h.Strip4 == 1
                        Save_x_values4 = Save_x_values44(1,:);
                        Save_Colum_Int4 = Save_Colum_Int44(1,:);
                        Strip_Int4 = mean_Strip44(1,:);
                        if h.Save_Smooth_chk4 ==0
                            Save_Strip_Int4 = Save_Strip_Int44(1,:,:); 
                            Save_Strip_fit4 = Save_Strip_fit44(1,:,:); 
                        else
                             Save_Strip_Int4 = Save_Strip_Smooth_Int44(1,:,:); 
                            Save_Strip_fit4 = Save_Strip_Smooth_fit44(1,:,:); 
                        end
                        [tonto,size_Int]=size(Strip_Int4);
                        Background4 = ones(size_Int,1)*Save_Background4(val_Strip_Scan4,1);   
                    end
                end
                
                
                
                Picture_Plot = eval(get(h.Scan_Image_load_compare4,'String')) ;            
                Picture4 = Picture_Plot-ImageNumbers4(1,1)+1;    
                     
                if val_Strip_Scan4 ==1
                    if h.Strip1 == 1
                        if h.micro_Check == 1
                            micro_val = h.micro_value;
                            ColumnRange4 = Save_Colum_Int4 * micro_val;
                            x_values4 = Save_x_values4 * micro_val;                            
                            MaxPos4 = Save_Peak4 * micro_val;
                            Max_Pos_Manu_array4 = Save_Peak_Manu4* micro_val;
                            if Save_Smooth ==1  
                                MaxPos_Smooth4 = Save_Peak_Smooth4 * micro_val;
                                Max_Pos_Manu_array_Smooth4 = Save_Peak_Manu_Smooth4* micro_val;
                            end
                        else
                            ColumnRange4 = Save_Colum_Int4;
                            x_values4 = Save_x_values4;
                            MaxPos4 = Save_Peak4;
                            Max_Pos_Manu_array4 = Save_Peak_Manu4;
                            if Save_Smooth ==1  
                                MaxPos_Smooth4 = Save_Peak_Smooth4;
                                Max_Pos_Manu_array_Smooth4 = Save_Peak_Manu_Smooth4;
                            end
                        end
                    end
                end
                if val_Strip_Scan4 ==2
                    if h.Strip2 == 1
                        if h.micro_Check == 1
                            micro_val = h.micro_value;
                            ColumnRange4 = Save_Colum_Int4 * micro_val;
                            x_values4 = Save_x_values4 * micro_val;
                            MaxPos4 = Save_Peak4 * micro_val;
                            Max_Pos_Manu_array4 = Save_Peak_Manu4* micro_val;
                            if Save_Smooth ==1  
                                MaxPos_Smooth4 = Save_Peak_Smooth4 * micro_val;
                                Max_Pos_Manu_array_Smooth4 = Save_Peak_Manu_Smooth4* micro_val;
                            end
                        else
                            ColumnRange4 = Save_Colum_Int4;
                            x_values4 = Save_x_values4;
                            MaxPos4 = Save_Peak4;
                            Max_Pos_Manu_array4 = Save_Peak_Manu4;
                            if Save_Smooth ==1  
                                MaxPos_Smooth4 = Save_Peak_Smooth4;
                                Max_Pos_Manu_array_Smooth4 = Save_Peak_Manu_Smooth4;
                            end
                        end
                    end
                end
                if val_Strip_Scan4 ==3
                    if h.Strip3 == 1
                        if h.micro_Check == 1
                            micro_val = h.micro_value;
                            ColumnRange4 = Save_Colum_Int4 * micro_val;
                            x_values4 = Save_x_values4 * micro_val;
                            MaxPos4 = Save_Peak4 * micro_val;
                            Max_Pos_Manu_array4 = Save_Peak_Manu4* micro_val;
                            if Save_Smooth ==1  
                                MaxPos_Smooth4 = Save_Peak_Smooth4 * micro_val;
                                Max_Pos_Manu_array_Smooth4 = Save_Peak_Manu_Smooth4* micro_val;
                            end
                        else
                            ColumnRange4 = Save_Colum_Int4;
                            x_values4 = Save_x_values4;
                            MaxPos4 = Save_Peak4;
                            Max_Pos_Manu_array4 = Save_Peak_Manu4;
                            if Save_Smooth ==1  
                                MaxPos_Smooth4 = Save_Peak_Smooth4;
                                Max_Pos_Manu_array_Smooth4 = Save_Peak_Manu_Smooth4;
                            end
                        end
                    end
                end
                if val_Strip_Scan4 ==4
                    if h.Strip4 == 1
                        if h.micro_Check == 1
                            micro_val = h.micro_value;
                            ColumnRange4 = Save_Colum_Int4 * micro_val;
                            x_values4 = Save_x_values4 * micro_val;
                            MaxPos4 = Save_Peak4 * micro_val;
                            Max_Pos_Manu_array4 = Save_Peak_Manu4* micro_val;
                            if Save_Smooth ==1  
                                MaxPos_Smooth4 = Save_Peak_Smooth4 * micro_val;
                                Max_Pos_Manu_array_Smooth4 = Save_Peak_Manu_Smooth4* micro_val;
                            end
                        else
                            ColumnRange4 = Save_Colum_Int4;
                            x_values4 = Save_x_values4;
                            MaxPos4 = Save_Peak4;
                            Max_Pos_Manu_array4 = Save_Peak_Manu4;
                            if Save_Smooth ==1  
                                MaxPos_Smooth4 = Save_Peak_Smooth4;
                                Max_Pos_Manu_array_Smooth4 = Save_Peak_Manu_Smooth4;
                            end
                        end
                    end
                end
                
%                FWHM4 = h.FWHM4;
%                RSquare4 = h.RSquare4;
                              
              if val_Strip_Scan4 == 1 
                  if h.Strip1 == 1
                      if h.Save_Smooth_chk4 ==0
                          Widths4(1,:)=Save_Widths4(1,:);
                          Area4(1,:)=Save_Area4(1,:);
                          FitValid4(1,:) = Save_FitValid4(1,:);
                          Peak4(1,:) = MaxPos4(1,:);
                          Peak_Manu4(1,:) =Max_Pos_Manu_array4 (1,:);
                      else
                          Widths4(1,:)=Save_Widths_Smooth4(1,:);
                          Area4(1,:)=Save_Area_Smooth4(1,:);
                          FitValid4(1,:) = Save_FitValid_Smooth4(1,:);
                          Peak4(1,:) = MaxPos_Smooth4(1,:);
                          Peak_Manu4(1,:) =Max_Pos_Manu_array_Smooth4 (1,:);
                      end
                      number_Image4(1,:)=Save_number_Image4(1,:);
                      Error4(1,:) = Save_Error4(1,:);
                  end
              elseif val_Strip_Scan4 == 2                  
                  if h.Strip2 == 1
                      if h.Save_Smooth_chk4 ==0
                          Widths4(1,:)=Save_Widths4(2,:);
                          Area4(1,:)=Save_Area4(2,:);
                          FitValid4(1,:) = Save_FitValid4(2,:);
                          Peak4(1,:) = MaxPos4(2,:);
                          Peak_Manu4(1,:) =Max_Pos_Manu_array4 (2,:);
                      else
                          Widths4(1,:)=Save_Widths_Smooth4(2,:);
                          Area4(1,:)=Save_Area_Smooth4(2,:);
                          FitValid4(1,:) = Save_FitValid_Smooth4(2,:);
                          Peak4(1,:) = MaxPos_Smooth4(2,:);
                          Peak_Manu4(1,:) =Max_Pos_Manu_array_Smooth4 (2,:);
                      end
                      number_Image4(1,:)=Save_number_Image4(1,:);
                      Error4(1,:) = Save_Error4(2,:);
                  end
              elseif val_Strip_Scan4 == 3                  
                  if h.Strip3 == 1
                      if h.Save_Smooth_chk4 ==0
                          Widths4(1,:)=Save_Widths4(3,:);
                          Area4(1,:)=Save_Area4(3,:);
                          FitValid4(1,:) = Save_FitValid4(3,:);
                          Peak4(1,:) = MaxPos4(3,:);
                          Peak_Manu4(1,:) =Max_Pos_Manu_array4 (3,:);
                      else
                          Widths4(1,:)=Save_Widths_Smooth4(3,:);
                          Area4(1,:)=Save_Area_Smooth4(3,:);
                          FitValid4(1,:) = Save_FitValid_Smooth4(3,:);
                          Peak4(1,:) = MaxPos_Smooth4(3,:);
                          Peak_Manu4(1,:) =Max_Pos_Manu_array_Smooth4 (3,:);
                      end
                      number_Image4(1,:)=Save_number_Image4(1,:);
                      Error4(1,:) = Save_Error4(3,:);
                  end
              elseif val_Strip_Scan4 == 4
                  if h.Strip4 == 1
                      if h.Save_Smooth_chk4 ==0
                          Widths4(1,:)=Save_Widths4(4,:);
                          Area4(1,:)=Save_Area4(4,:);
                          FitValid4(1,:) = Save_FitValid4(4,:);
                          Peak4(1,:) = MaxPos4(4,:);
                          Peak_Manu4(1,:) =Max_Pos_Manu_array4 (4,:);
                      else
                          Widths4(1,:)=Save_Widths_Smooth4(4,:);
                          Area4(1,:)=Save_Area_Smooth4(4,:);
                          FitValid4(1,:) = Save_FitValid_Smooth4(4,:);
                          Peak4(1,:) = MaxPos_Smooth4(4,:);
                          Peak_Manu4(1,:) =Max_Pos_Manu_array_Smooth4(4,:);                          
                      end
                      number_Image4(1,:)=Save_number_Image4(1,:);
                      Error4(1,:) = Save_Error4(4,:);
                  end
              end
              
             
            end

            %% Energy micron Change
            if h.Scan_compare_Check_Energy_Val ==1                
                if h.Scan_compare_Check (1,1) == 1                    
                        Energy_Step_value=h.Energy_Step_value1 ;                   
                        [a_Image,b_Image] =size(number_Image1);
                    for i_Image=1:b_Image
                        number_Image1(1,i_Image) = Energy_Step_value*(number_Image1(1,i_Image)-Position_1)+Energy_1;
                    end
                end
                if h.Scan_compare_Check (1,2) == 2         ;                               
                    Energy_Step_value=h.Energy_Step_value2     
                    [a_Image,b_Image] =size(number_Image2);
                    for i_Image=1:b_Image
                        number_Image2(1,i_Image) = Energy_Step_value*(number_Image2(1,i_Image)-Position_2)+Energy_2;
                    end
                end
                if h.Scan_compare_Check (1,3) == 3                                        
                    Energy_Step_value=h.Energy_Step_value3 ;
                    [a_Image,b_Image] =size(number_Image3);
                    for i_Image=1:b_Image
                        number_Image3(1,i_Image) = Energy_Step_value*(number_Image3(1,i_Image)-Position_3)+Energy_3;
                    end
                end
                if h.Scan_compare_Check (1,4) == 4                                        
                    Energy_Step_value=h.Energy_Step_value4   ;
                    [a_Image,b_Image] =size(number_Image4);
                    for i_Image=1:b_Image
                        number_Image4(1,i_Image) = Energy_Step_value*(number_Image4(1,i_Image)-Position_4)+Energy_4;
                    end
                end    
            end
            if h.Scan_compare_Check_micron_Val == 1
                
                if h.Scan_compare_Check (1,1) == 1
                    ColumnRange1 = Save_Colum_Int1 * micron_1;
                    x_values1 = Save_x_values1 * micron_1;
                    MaxPos1 = Save_Peak1 * micron_1;
                    Max_Pos_Manu_array1 = Save_Peak_Manu1* micron_1;
                    if Save_Smooth ==1  
                        MaxPos_Smooth1 = Save_Peak_Smooth1 * micron_1;
                        Max_Pos_Manu_array_Smooth1 = Save_Peak_Manu_Smooth1* micron_1;                        
                    end                    

                elseif h.Scan_compare_Check (1,2) == 2
                    ColumnRange2 = Save_Colum_Int2 * micron_2;
                    x_values2 = Save_x_values2 * micron_2;
                    MaxPos2 = Save_Peak2 * micron_2;
                    Max_Pos_Manu_array2 = Save_Peak_Manu2* micron_2;
                    if Save_Smooth ==1  
                        MaxPos_Smooth2 = Save_Peak_Smooth2 * micron_2;
                        Max_Pos_Manu_array_Smooth2 = Save_Peak_Manu_Smooth2* micron_2;
                    end

                elseif h.Scan_compare_Check (1,3) == 3
                    ColumnRange3 = Save_Colum_Int3 * micron_3;
                    x_values3 = Save_x_values3 * micron_3;
                    MaxPos3 = Save_Peak3 * micron_3;
                    Max_Pos_Manu_array3 = Save_Peak_Manu3* micron_3;
                    if Save_Smooth ==1  
                        MaxPos_Smooth3 = Save_Peak_Smooth3 * micron_3;
                        Max_Pos_Manu_array_Smooth3 = Save_Peak_Manu_Smooth3* micron_3;
                    end
                    
                elseif h.Scan_compare_Check (1,4) == 4
                    ColumnRange4 = Save_Colum_Int4 * micron_4;
                    x_values4 = Save_x_values4 * micron_4;
                    MaxPos4 = Save_Peak4 * micron_4;
                    Max_Pos_Manu_array4 = Save_Peak_Manu4* micron_4;
                    if Save_Smooth ==1  
                        MaxPos_Smooth4 = Save_Peak_Smooth4 * micron_4;
                        Max_Pos_Manu_array_Smooth4 = Save_Peak_Manu_Smooth4 * micron_4;
                    end
                    
                end
            else
                
            end
            %% ---Plot
            if Figure_compare_plot ==1
                
                axes(h.I_Fig_Compare_In)
                
                if h.Scan_compare_Check (1,1) == 1
                    if val_Strip_Scan1 ==1

                        if h.Strip1 == 1 
                            plot(ColumnRange1 (1,:),Save_Strip_Int1(1,:,Picture1),'Parent',h.I_Fig_Compare_In,'Color','r')
                            hold on
                            plot(x_values1(1,:),Background1(1,:),'Parent', h.I_Fig_Compare_In,'Color','r','LineStyle','--');
                            plot(x_values1(1,:),Save_Strip_fit1(1,:,Picture1),'Parent', h.I_Fig_Compare_In,'Color','r','LineStyle',':');                        
                        end
                    end
                    if val_Strip_Scan1 ==2
                        if h.Strip2 == 1                             
                            plot(ColumnRange1 (1,:),Save_Strip_Int1(1,:,Picture1),'Parent',h.I_Fig_Compare_In,'Color','r')
                            hold on
                            plot(x_values1(1,:),Background1(1,:),'Parent', h.I_Fig_Compare_In,'Color','r','LineStyle','--');
                            plot(x_values1(1,:),Save_Strip_fit1(1,:,Picture1),'Parent', h.I_Fig_Compare_In,'Color','r','LineStyle',':');
                        end
                    end
                    if val_Strip_Scan1 ==3
                        if h.Strip3 == 1 
                            plot(ColumnRange1 (1,:),Save_Strip_Int1(1,:,Picture1),'Parent',h.I_Fig_Compare_In,'Color','r')
                            hold on
                            plot(x_values1(1,:),Background1(1,:),'Parent', h.I_Fig_Compare_In,'Color','r','LineStyle','--');                        
                            plot(x_values1(1,:),Save_Strip_fit1(1,:,Picture1),'Parent', h.I_Fig_Compare_In,'Color','r','LineStyle',':');
                        end
                    end
                    if val_Strip_Scan1 ==4
                        if h.Strip4 == 1 
                            plot(ColumnRange1 (1,:),Save_Strip_Int1(1,:,Picture1),'Parent',h.I_Fig_Compare_In,'Color','r')
                            hold on
                            plot(x_values1(1,:),Background1(1,:),'Parent', h.I_Fig_Compare_In,'Color','r','LineStyle','--');            
                            plot(x_values1(1,:),Save_Strip_fit1(1,:,Picture1),'Parent', h.I_Fig_Compare_In,'Color','r','LineStyle',':');                            
                        end
                    end                    
                    pause(1)
                end
                if h.Scan_compare_Check (1,2) == 2
                    if val_Strip_Scan2 ==1
                        if h.Strip1 == 1 
                            plot(ColumnRange2 (1,:),Save_Strip_Int2(1,:,Picture2),'Parent',h.I_Fig_Compare_In,'Color','y')
                            hold on
                            plot(x_values2(1,:),Background2(1,:),'Parent', h.I_Fig_Compare_In,'Color','y','LineStyle','--');
                            plot(x_values2(1,:),Save_Strip_fit2(1,:,Picture2),'Parent', h.I_Fig_Compare_In,'Color','y','LineStyle',':');                            
                        end
                    end
                    if val_Strip_Scan2 ==2
                        if h.Strip2 == 1 
                            plot(ColumnRange2 (1,:),Save_Strip_Int2(1,:,Picture2),'Parent',h.I_Fig_Compare_In,'Color','y')
                            hold on
                            plot(x_values2(1,:),Background2(1,:),'Parent', h.I_Fig_Compare_In,'Color','y','LineStyle','--');
                            plot(x_values2(1,:),Save_Strip_fit2(1,:,Picture2),'Parent', h.I_Fig_Compare_In,'Color','y','LineStyle',':');                            
                        end
                    end
                     if val_Strip_Scan2 ==3
                         if h.Strip3 == 1 
                             plot(ColumnRange2 (1,:),Save_Strip_Int2(1,:,Picture2),'Parent',h.I_Fig_Compare_In,'Color','y')
                             hold on
                             plot(x_values2(1,:),Background2(1,:),'Parent', h.I_Fig_Compare_In,'Color','y','LineStyle','--');
                             plot(x_values2(1,:),Save_Strip_fit2(1,:,Picture2),'Parent', h.I_Fig_Compare_In,'Color','y','LineStyle',':');                             
                         end
                     end
                     if val_Strip_Scan2 ==4
                         if h.Strip4 == 1 
                             plot(ColumnRange2 (1,:),Save_Strip_Int2(1,:,Picture2),'Parent',h.I_Fig_Compare_In,'Color','y')
                             hold on
                             plot(x_values2(1,:),Background2(1,:),'Parent', h.I_Fig_Compare_In,'Color','y','LineStyle','--');
                             plot(x_values2(1,:),Save_Strip_fit2(1,:,Picture2),'Parent', h.I_Fig_Compare_In,'Color','y','LineStyle',':');                         
                         end
                     end
                         
                    pause(1)
                end
                if h.Scan_compare_Check (1,3) == 3
                    if val_Strip_Scan3 ==1
                        if h.Strip1 == 1 
                            plot(ColumnRange3 (1,:),Save_Strip_Int3(1,:,Picture3),'Parent',h.I_Fig_Compare_In,'Color','c')
                            hold on
                            plot(x_values3(1,:),Background3(1,:),'Parent', h.I_Fig_Compare_In,'Color','c','LineStyle','--');
                            plot(x_values3(1,:),Save_Strip_fit3(1,:,Picture3),'Parent', h.I_Fig_Compare_In,'Color','c','LineStyle',':');                            
                        end
                    elseif val_Strip_Scan3 ==2
                        if h.Strip2 == 1 
                            plot(ColumnRange3 (1,:),Save_Strip_Int3(1,:,Picture3),'Parent',h.I_Fig_Compare_In,'Color','c')
                            hold on
                            plot(x_values3(1,:),Background3(1,:),'Parent', h.I_Fig_Compare_In,'Color','c','LineStyle','--');
                            plot(x_values3(1,:),Save_Strip_fit3(1,:,Picture3),'Parent', h.I_Fig_Compare_In,'Color','c','LineStyle',':');                            
                        end
                    elseif val_Strip_Scan3 ==3
                        if h.Strip3 == 1 
                            plot(ColumnRange3 (1,:),Save_Strip_Int3(1,:,Picture3),'Parent',h.I_Fig_Compare_In,'Color','c')
                            hold on
                            plot(x_values3(1,:),Background3(1,:),'Parent', h.I_Fig_Compare_In,'Color','c','LineStyle','--');
                            plot(x_values3(1,:),Save_Strip_fit3(1,:,Picture3),'Parent', h.I_Fig_Compare_In,'Color','c','LineStyle',':');                        
                        end
                    elseif val_Strip_Scan3 ==4
                        if h.Strip4 == 1 
                            plot(ColumnRange3 (1,:),Save_Strip_Int3(1,:,Picture3),'Parent',h.I_Fig_Compare_In,'Color','c')
                            hold on
                            plot(x_values3(1,:),Background3(1,:),'Parent', h.I_Fig_Compare_In,'Color','c','LineStyle','--');
                            plot(x_values3(1,:),Save_Strip_fit3(1,:,Picture3),'Parent', h.I_Fig_Compare_In,'Color','c','LineStyle',':');
                        end
                    end
                    pause(1)
                end
                if h.Scan_compare_Check (1,4) == 4
                    if val_Strip_Scan4 ==1
                        if h.Strip1 == 1 
                            plot(ColumnRange4 (1,:),Save_Strip_Int4(1,:,Picture4),'Parent',h.I_Fig_Compare_In,'Color','k')
                            hold on                
                            plot(x_values4(1,:),Background4(1,:),'Parent', h.I_Fig_Compare_In,'Color','k','LineStyle','--');
                            plot(x_values4(1,:),Save_Strip_fit4(1,:,Picture4),'Parent', h.I_Fig_Compare_In,'Color','k','LineStyle',':');
                            end
                    elseif val_Strip_Scan4 ==2
                        if h.Strip2 == 1 
                            plot(ColumnRange4 (1,:),Save_Strip_Int4(1,:,Picture4),'Parent',h.I_Fig_Compare_In,'Color','k')
                            hold on                
                            plot(x_values4(1,:),Background4(1,:),'Parent', h.I_Fig_Compare_In,'Color','k','LineStyle','--');
                            plot(x_values4(1,:),Save_Strip_fit4(1,:,Picture4),'Parent', h.I_Fig_Compare_In,'Color','k','LineStyle',':');
                        end
                    elseif val_Strip_Scan4 ==3
                        if h.Strip3 == 1 
                            plot(ColumnRange4 (1,:),Save_Strip_Int4(1,:,Picture4),'Parent',h.I_Fig_Compare_In,'Color','k')
                            hold on                
                            plot(x_values4(1,:),Background4(1,:),'Parent', h.I_Fig_Compare_In,'Color','k','LineStyle','--');
                            plot(x_values4(1,:),Save_Strip_fit4(1,:,Picture4),'Parent', h.I_Fig_Compare_In,'Color','k','LineStyle',':');                            
                        end
                    elseif val_Strip_Scan4 ==4
                        if h.Strip4 == 1 
                            plot(ColumnRange4 (1,:),Save_Strip_Int4(1,:,Picture4),'Parent',h.I_Fig_Compare_In,'Color','k')
                            hold on                
                            plot(x_values4(1,:),Background4(1,:),'Parent', h.I_Fig_Compare_In,'Color','k','LineStyle','--');
                            plot(x_values4(1,:),Save_Strip_fit4(1,:,Picture4),'Parent', h.I_Fig_Compare_In,'Color','k','LineStyle',':');                            
                        end
                    end
                        
                    pause(1)
                end
                
                if h.Scan_compare_Check_micron_Val ==1
                    xlabel('Position (um)')
                else
                    xlabel('Position (um)')
                end
                ylabel('Intensity (arb units)')
                
            elseif Figure_compare_plot ==2
                axes(h.I_Fig_Compare_In)
                
                if h.Scan_compare_Check (1,1) == 1
                    if val_Strip_Scan1 ==1
                        if h.Strip1 == 1 
                            plot(ColumnRange1(1,:),mean(Save_Strip_Int1(1,:,:),3),'Parent',h.I_Fig_Compare_In,'Color','r','LineWidth',2,'Color','r')
                            hold on  
                            plot(ColumnRange1(1,:),Background1(1,:),'Color','r','LineStyle','--','Parent',h.I_Fig_Compare_In);
                        end
                    elseif val_Strip_Scan1 ==2
                        if h.Strip2 == 1 
                            plot(ColumnRange1(1,:),mean(Save_Strip_Int1(1,:,i_im1),3),'Parent',h.I_Fig_Compare_In,'Color','r','LineWidth',2,'Color','r')
                            hold on  
                            plot(ColumnRange1(1,:),Background1(1,:),'Color','r','LineStyle','--','Parent',h.I_Fig_Compare_In);
                        end
                    elseif val_Strip_Scan1 ==3
                        if h.Strip3 == 1 
                            plot(ColumnRange1(1,:),mean(Save_Strip_Int1(1,:,i_im1),3),'Parent',h.I_Fig_Compare_In,'Color','r','LineWidth',2,'Color','r')
                            hold on  
                            plot(ColumnRange1(1,:),Background1(1,:),'Color','r','LineStyle','--','Parent',h.I_Fig_Compare_In);
                        end
                    elseif val_Strip_Scan1 ==4
                        if h.Strip4 == 1
                            plot(ColumnRange1(1,:),mean(Save_Strip_Int1(1,:,i_im1),3),'Parent',h.I_Fig_Compare_In,'Color','r','LineWidth',2,'Color','r')
                            hold on  
                            plot(ColumnRange1(1,:),Background1(1,:),'Color','r','LineStyle','--','Parent',h.I_Fig_Compare_In);
                        end
                    end
                    pause(1)
                end
                if h.Scan_compare_Check (1,2) == 2
                    if val_Strip_Scan2 ==1
                        if h.Strip1 == 1 
                            plot(ColumnRange2(1,:),mean(Save_Strip_Int2(1,:,i_im2),3),'Parent',h.I_Fig_Compare_In,'Color','r','LineWidth',2,'Color','y')
                            hold on  
                            plot(ColumnRange2(1,:),Background2(1,:),'Color','y','LineStyle','--','Parent',h.I_Fig_Compare_In);
                        end
                    elseif val_Strip_Scan2 ==2
                        if h.Strip2 == 1 
                            plot(ColumnRange2(1,:),mean(Save_Strip_Int2(1,:,i_im2),3),'Parent',h.I_Fig_Compare_In,'Color','r','LineWidth',2,'Color','y')
                            hold on  
                            plot(ColumnRange2(1,:),Background2(1,:),'Color','y','LineStyle','--','Parent',h.I_Fig_Compare_In);
                        end
                    elseif val_Strip_Scan2 ==3
                        if h.Strip3 == 1 
                            plot(ColumnRange2(1,:),mean(Save_Strip_Int2(1,:,i_im2),3),'Parent',h.I_Fig_Compare_In,'Color','r','LineWidth',2,'Color','y')
                            hold on  
                            plot(ColumnRange2(1,:),Background2(1,:),'Color','y','LineStyle','--','Parent',h.I_Fig_Compare_In);
                        end
                    elseif val_Strip_Scan2 ==4
                        if h.Strip4 == 1 
                            plot(ColumnRange2(1,:),mean(Save_Strip_Int2(1,:,i_im2),3),'Parent',h.I_Fig_Compare_In,'Color','r','LineWidth',2,'Color','y')
                            hold on  
                            plot(ColumnRange2(1,:),Background2(1,:),'Color','y','LineStyle','--','Parent',h.I_Fig_Compare_In);
                        end
                    end
                    pause(1)
                end
                if h.Scan_compare_Check (1,3) == 3
                    if val_Strip_Scan3 ==1
                        if h.Strip1 == 1 
                            plot(ColumnRange3(1,:),mean(Save_Strip_Int3(1,:,i_im3),3),'Parent',h.I_Fig_Compare_In,'Color','r','LineWidth',2,'Color','c')
                            hold on  
                            plot(ColumnRange3(1,:),Background3(1,:),'Color','c','LineStyle','--','Parent',h.I_Fig_Compare_In);
                        end
                    elseif val_Strip_Scan3 ==2
                        if h.Strip2 == 1 
                            plot(ColumnRange3(1,:),mean(Save_Strip_Int3(1,:,i_im3),3),'Parent',h.I_Fig_Compare_In,'Color','r','LineWidth',2,'Color','c')
                            hold on  
                            plot(ColumnRange3(1,:),Background3(1,:),'Color','c','LineStyle','--','Parent',h.I_Fig_Compare_In);
                        end
                    elseif val_Strip_Scan3 ==3
                        if h.Strip3 == 1 
                            plot(ColumnRange3(1,:),mean(Save_Strip_Int3(1,:,i_im3),3),'Parent',h.I_Fig_Compare_In,'Color','r','LineWidth',2,'Color','c')
                            hold on  
                            plot(ColumnRange3(1,:),Background3(1,:),'Color','c','LineStyle','--','Parent',h.I_Fig_Compare_In);
                        end
                    elseif val_Strip_Scan3 ==4
                        if h.Strip4 == 1
                            plot(ColumnRange3(1,:),mean(Save_Strip_Int3(1,:,i_im3),3),'Parent',h.I_Fig_Compare_In,'Color','r','LineWidth',2,'Color','c')
                            hold on  
                            plot(ColumnRange3(1,:),Background3(1,:),'Color','c','LineStyle','--','Parent',h.I_Fig_Compare_In);
                        end
                    end
                    pause(1)
                end
                if h.Scan_compare_Check (1,4) == 4
                    if val_Strip_Scan4 ==1
                        if h.Strip1 == 1 
                            plot(ColumnRange4(1,:),mean(Save_Strip_Int4(1,:,i_im4),3),'Parent',h.I_Fig_Compare_In,'Color','r','LineWidth',2,'Color','k')
                            hold on  
                            plot(ColumnRange4(1,:),Background4(1,:),'Color','k','LineStyle','--','Parent',h.I_Fig_Compare_In);
                        end
                    elseif val_Strip_Scan4 ==2
                        if h.Strip2 == 1 
                            plot(ColumnRange4(1,:),mean(Save_Strip_Int4(1,:,i_im4),3),'Parent',h.I_Fig_Compare_In,'Color','r','LineWidth',2,'Color','k')
                            hold on  
                            plot(ColumnRange4(1,:),Background4(1,:),'Color','k','LineStyle','--','Parent',h.I_Fig_Compare_In);
                        end
                    elseif val_Strip_Scan4 ==3
                        if h.Strip3 == 1 
                            plot(ColumnRange4(1,:),mean(Save_Strip_Int4(1,:,i_im4),3),'Parent',h.I_Fig_Compare_In,'Color','r','LineWidth',2,'Color','k')
                            hold on  
                            plot(ColumnRange4(1,:),Background4(1,:),'Color','k','LineStyle','--','Parent',h.I_Fig_Compare_In);
                        end
                    elseif val_Strip_Scan4 ==4
                        if h.Strip4 == 1 
                            plot(ColumnRange4(1,:),mean(Save_Strip_Int4(1,:,i_im4),3),'Parent',h.I_Fig_Compare_In,'Color','r','LineWidth',2,'Color','k')
                            hold on  
                            plot(ColumnRange4(1,:),Background4(1,:),'Color','k','LineStyle','--','Parent',h.I_Fig_Compare_In);
                        end
                    end
                    pause(1)
                end
                
                title(sprintf('F3: Strip %d, %d - %d pix',1,StripRanges1(1,1),StripRanges1(1,2)),'Parent', h.I_Fig_Compare_In);
                
                if h.Scan_compare_Check_micron_Val ==1
                    xlabel('Position (um)')
                else
                    xlabel('Position (um)')
                end
                ylabel('Intensity (arb units)')
                
            elseif Figure_compare_plot ==3   
                
                axes(h.I_Fig_Compare_In)
                if h.Scan_compare_Check (1,1) == 1
                    if val_Strip_Scan1 ==1
                        if h.Strip1 == 1
                            plot(number_Image1,Area1,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r','Parent',h.I_Fig_Compare_In)
                            hold on   
                            plot(number_Image1(FitValid1 ==1),Widths1(FitValid1 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.I_Fig_Compare_In)   
                            errorbar(number_Image1(FitValid1 == 1),Widths1(FitValid1 == 1),Error1(FitValid1 == 1),'Parent',h.I_Fig_Compare_In,'MarkerEdgeColor','r')                           
                        end
                    elseif val_Strip_Scan1 ==2
                        if h.Strip2 == 1
                            plot(number_Image1,Area1,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r','Parent',h.I_Fig_Compare_In)
                            hold on   
                            plot(number_Image1(FitValid1 ==1),Widths1(FitValid1 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.I_Fig_Compare_In)   
                            errorbar(number_Image1(FitValid1 == 1),Widths1(FitValid1 == 1),Error1(FitValid1 == 1),'Parent',h.I_Fig_Compare_In,'MarkerEdgeColor','r')                                                    
                        end
                    elseif val_Strip_Scan1 ==3
                        if h.Strip3 == 1
                        
                                plot(number_Image1,Area1,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r','Parent',h.I_Fig_Compare_In)
                                hold on   
                                plot(number_Image1(FitValid1 ==1),Widths1(FitValid1 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.I_Fig_Compare_In)   
                                errorbar(number_Image1(FitValid1 == 1),Widths1(FitValid1 == 1),Error1(FitValid1 == 1),'Parent',h.I_Fig_Compare_In,'MarkerEdgeColor','r')                            
                        
                        end
                    elseif val_Strip_Scan1 ==4
                        if h.Strip4 == 1
                        
                                plot(number_Image1,Area1,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r','Parent',h.I_Fig_Compare_In)
                                hold on   
                                plot(number_Image1(FitValid1 ==1),Widths1(FitValid1 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.I_Fig_Compare_In)   
                                errorbar(number_Image1(FitValid1 == 1),Widths1(FitValid1 == 1),Error1(FitValid1 == 1),'Parent',h.I_Fig_Compare_In,'MarkerEdgeColor','r')                            
                        
                        end
                    end
                    
                    if h.Scan_compare_Check_Energy_Val == 0
                        xlabel('Image')
                    else
                        xlabel('Energy(eV)')
                    end
                    
                    ylabel('Intensity(abr units)')
                    
                    xlim auto
                    ylim auto
                    pause(1)
                end
                
                if h.Scan_compare_Check (1,2) == 2
                    if val_Strip_Scan2 ==1
                        if h.Strip1 == 1
                        
                                plot(number_Image2,Area2,'LineStyle','none','Marker','o','MarkerFaceColor','y','MarkerEdgeColor','y','Parent',h.I_Fig_Compare_In)
                                hold on   
                                plot(number_Image2(FitValid2 ==1),Widths2(FitValid2 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','y','Parent',h.I_Fig_Compare_In)   
                                errorbar(number_Image2(FitValid2 == 1),Widths2(FitValid2 == 1),Error2(FitValid2 == 1),'Parent',h.I_Fig_Compare_In,'MarkerEdgeColor','y')                             
                        
                        end
                    elseif val_Strip_Scan2 ==2
                        if h.Strip2 == 1
                        
                                plot(number_Image2,Area2,'LineStyle','none','Marker','o','MarkerFaceColor','y','MarkerEdgeColor','y','Parent',h.I_Fig_Compare_In)
                                hold on   
                                plot(number_Image2(FitValid2 ==1),Widths2(FitValid2 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','y','Parent',h.I_Fig_Compare_In)   
                                errorbar(number_Image2(FitValid2 == 1),Widths2(FitValid2 == 1),Error2(FitValid2 == 1),'Parent',h.I_Fig_Compare_In,'MarkerEdgeColor','y')                             
                        
                        end
                    elseif val_Strip_Scan2 ==3
                        if h.Strip3 == 1
                        
                                plot(number_Image2,Area2,'LineStyle','none','Marker','o','MarkerFaceColor','y','MarkerEdgeColor','y','Parent',h.I_Fig_Compare_In)
                                hold on   
                                plot(number_Image2(FitValid2 ==1),Widths2(FitValid2 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','y','Parent',h.I_Fig_Compare_In)   
                                errorbar(number_Image2(FitValid2 == 1),Widths2(FitValid2 == 1),Error2(FitValid2 == 1),'Parent',h.I_Fig_Compare_In,'MarkerEdgeColor','y')
                        end
                    elseif val_Strip_Scan2 ==4
                        if h.Strip4 == 1
                        
                                plot(number_Image2,Area2,'LineStyle','none','Marker','o','MarkerFaceColor','y','MarkerEdgeColor','y','Parent',h.I_Fig_Compare_In)
                                hold on   
                                plot(number_Image2(FitValid2 ==1),Widths2(FitValid2 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','y','Parent',h.I_Fig_Compare_In)   
                                errorbar(number_Image2(FitValid2 == 1),Widths2(FitValid2 == 1),Error2(FitValid2 == 1),'Parent',h.I_Fig_Compare_In,'MarkerEdgeColor','y')
                                
                        
                        end
                    end
                    if h.Scan_compare_Check_Energy_Val == 0
                        xlabel('Image')
                    else
                        xlabel('Energy(eV)')
                    end
                    
                    ylabel('Intensity(abr units)')
                    
                    xlim auto
                    ylim auto
                    pause(1)
                end
                
                if h.Scan_compare_Check (1,3) == 3
                    if val_Strip_Scan3 ==1
                    if h.Strip1 == 1
                        
                            plot(number_Image3,Area3,'LineStyle','none','Marker','o','MarkerFaceColor','c','MarkerEdgeColor','c','Parent',h.I_Fig_Compare_In)
                            hold on   
                            plot(number_Image3(FitValid3 ==1),Widths3(FitValid3 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','c','Parent',h.I_Fig_Compare_In)   
                            errorbar(number_Image3(FitValid3 == 1),Widths3(FitValid3 == 1),Error3(FitValid3 == 1),'Parent',h.I_Fig_Compare_In,'MarkerEdgeColor','c')
                            xlabel('Image')                            
                        
                    end
                    elseif val_Strip_Scan3 ==2
                    if h.Strip2 == 1
                        
                            plot(number_Image3,Area3,'LineStyle','none','Marker','o','MarkerFaceColor','c','MarkerEdgeColor','c','Parent',h.I_Fig_Compare_In)
                            hold on   
                            plot(number_Image3(FitValid3 ==1),Widths3(FitValid3 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','c','Parent',h.I_Fig_Compare_In)   
                            errorbar(number_Image3(FitValid3 == 1),Widths3(FitValid3 == 1),Error3(FitValid3 == 1),'Parent',h.I_Fig_Compare_In,'MarkerEdgeColor','c')                            
                        
                    end
                    elseif val_Strip_Scan3 ==3
                    if h.Strip3 == 1
                        
                            plot(number_Image3,Area3,'LineStyle','none','Marker','o','MarkerFaceColor','c','MarkerEdgeColor','c','Parent',h.I_Fig_Compare_In)
                            hold on   
                            plot(number_Image3(FitValid3 ==1),Widths3(FitValid3 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','c','Parent',h.I_Fig_Compare_In)   
                            errorbar(number_Image3(FitValid3 == 1),Widths3(FitValid3 == 1),Error3(FitValid3 == 1),'Parent',h.I_Fig_Compare_In,'MarkerEdgeColor','c')                        
                        
                    end
                    elseif val_Strip_Scan3 ==4
                    if h.Strip4 == 1
                          
                            plot(number_Image3,Area3,'LineStyle','none','Marker','o','MarkerFaceColor','c','MarkerEdgeColor','c','Parent',h.I_Fig_Compare_In)
                            hold on   
                            plot(number_Image3(FitValid3 ==1),Widths3(FitValid3 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','c','Parent',h.I_Fig_Compare_In)   
                            errorbar(number_Image3(FitValid3 == 1),Widths3(FitValid3 == 1),Error3(FitValid3 == 1),'Parent',h.I_Fig_Compare_In,'MarkerEdgeColor','c')
                        
                    end
                    end
                    if h.Scan_compare_Check_Energy_Val ==0                        
                        xlabel('Image')
                    else
                        xlabel('Energy(eV)')
                    end
                    
                    ylabel('Intensity(abr units)')
                    
                    xlim auto
                    ylim auto
                    pause(1)
                end
                
                if h.Scan_compare_Check (1,4) == 4
                    if val_Strip_Scan4 ==1
                    if h.Strip1 == 1
                     
                            plot(number_Image4,Area4,'LineStyle','none','Marker','o','MarkerFaceColor','k','MarkerEdgeColor','k','Parent',h.I_Fig_Compare_In)
                            hold on   
                            plot(number_Image4(FitValid4 ==1),Widths4(FitValid4 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','k','Parent',h.I_Fig_Compare_In)   
                     
                    end
                    elseif val_Strip_Scan4 ==2
                    if h.Strip2 == 1
                     
                            plot(number_Image4,Area4,'LineStyle','none','Marker','o','MarkerFaceColor','k','MarkerEdgeColor','k','Parent',h.I_Fig_Compare_In)
                            hold on   
                            plot(number_Image4(FitValid4 ==1),Widths4(FitValid4 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','k','Parent',h.I_Fig_Compare_In)   
                            errorbar(number_Image4(FitValid4 == 1),Widths4(FitValid4 == 1),Error4(FitValid4 == 1),'Parent',h.I_Fig_Compare_In,'MarkerFaceColor','k')
                     
                    end
                    elseif val_Strip_Scan4 ==3
                    if h.Strip3 == 1
                     
                            plot(number_Image4,Area4,'LineStyle','none','Marker','o','MarkerFaceColor','k','MarkerEdgeColor','k','Parent',h.I_Fig_Compare_In)
                            hold on   
                            plot(number_Image4(FitValid4 ==1),Widths4(FitValid4 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','k','Parent',h.I_Fig_Compare_In)   
                            errorbar(number_Image4(FitValid4 == 1),Widths4(FitValid4 == 1),Error4(FitValid4 == 1),'Parent',h.I_Fig_Compare_In,'MarkerFaceColor','k')
                     
                    end
                    elseif val_Strip_Scan4 ==4
                    if h.Strip4 == 1
                     
                            plot(number_Image4,Area4,'LineStyle','none','Marker','o','MarkerFaceColor','k','MarkerEdgeColor','k','Parent',h.I_Fig_Compare_In)
                            hold on   
                            plot(number_Image4(FitValid4 ==1),Widths4(FitValid4 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','k','Parent',h.I_Fig_Compare_In)   
                            errorbar(number_Image4(FitValid4 == 1),Widths4(FitValid4 == 1),Error4(FitValid4 == 1),'Parent',h.I_Fig_Compare_In,'MarkerFaceColor','k')
                      end
                    end
                    if h.Scan_compare_Check_Energy_Val ==0
                        xlabel('Image')                        
                    else
                        xlabel('Energy(eV)')                        
                    end
                    ylabel('Intensity(abr units)')
                    
                    xlim auto
                    ylim auto
                    pause(1)
                end
                
            elseif Figure_compare_plot ==4
                axes(h.I_Fig_Compare_In)
                if h.Scan_compare_Check (1,1) == 1
                    if val_Strip_Scan1 ==1
                    if h.Strip1 == 1
                        
                            plot(number_Image1(FitValid1 ==1),Peak1(FitValid1 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.I_Fig_Compare_In)                  
                            hold on   
                            plot(number_Image1,Peak_Manu1,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r','Parent',h.I_Fig_Compare_In)                    
                        
                    end
                    elseif val_Strip_Scan1 ==2
                    if h.Strip2 == 1
                        
                            plot(number_Image1(FitValid1 ==1),Peak1(FitValid1 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.I_Fig_Compare_In)                  
                            hold on   
                            plot(number_Image1,Peak_Manu1,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r','Parent',h.I_Fig_Compare_In)                    
                        
                    end
                    elseif val_Strip_Scan1 ==3
                    if h.Strip3 == 1                        
                        
                            plot(number_Image1(FitValid1 ==1),Peak1(FitValid1 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.I_Fig_Compare_In)                  
                            hold on   
                            plot(number_Image1,Peak_Manu1,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r','Parent',h.I_Fig_Compare_In)                    
                        
                    end
                    elseif val_Strip_Scan1 ==4
                    if h.Strip4 == 1
                        
                            plot(number_Image1(FitValid1 ==1),Peak1(FitValid1 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.I_Fig_Compare_In)                  
                            hold on   
                            plot(number_Image1,Peak_Manu1,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r','Parent',h.I_Fig_Compare_In)                    
                        
                    end
                    end
                    
                    if h.Scan_compare_Check_Energy_Val ==0
                        xlabel('Image')                        
                    else
                        xlabel('Energy(eV)')                        
                    end
                        
                    xlim auto
                    ylim auto
                    
                    if h.Scan_compare_Check_micron_Val ==1
                        ylabel('Position (um)')
                    else
                        ylabel('Position (um)')
                        
                    end
                    pause(1)
                end
                if h.Scan_compare_Check (1,2) == 2
                    if val_Strip_Scan2 ==1
                     if h.Strip1 == 1
                        
                             plot(number_Image2(FitValid2 ==1),Peak2(FitValid2 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','y','Parent',h.I_Fig_Compare_In)                  
                             hold on   
                             plot(number_Image2,Peak_Manu2,'LineStyle','none','Marker','o','MarkerFaceColor','y','MarkerEdgeColor','y','Parent',h.I_Fig_Compare_In)                    
                        
                     end
                     elseif val_Strip_Scan2 ==2
                     if h.Strip2 == 1
                        
                             plot(number_Image2(FitValid2 ==1),Peak2(FitValid2 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','y','Parent',h.I_Fig_Compare_In)                  
                             hold on   
                             plot(number_Image2,Peak_Manu2,'LineStyle','none','Marker','o','MarkerFaceColor','y','MarkerEdgeColor','y','Parent',h.I_Fig_Compare_In)                    
                        
                     end
                     elseif val_Strip_Scan2 ==3
                     if h.Strip3 == 1
                        
                             plot(number_Image2(FitValid2 ==1),Peak2(FitValid2 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','y','Parent',h.I_Fig_Compare_In)                  
                             hold on   
                             plot(number_Image2,Peak_Manu2,'LineStyle','none','Marker','o','MarkerFaceColor','y','MarkerEdgeColor','y','Parent',h.I_Fig_Compare_In)                    
                        
                     end
                     elseif val_Strip_Scan2 ==4
                     if h.Strip4 == 1
                        
                             plot(number_Image2(FitValid2 ==1),Peak2(FitValid2 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','y','Parent',h.I_Fig_Compare_In)                  
                             hold on   
                             plot(number_Image2,Peak_Manu2,'LineStyle','none','Marker','o','MarkerFaceColor','y','MarkerEdgeColor','y','Parent',h.I_Fig_Compare_In)                    
                        
                     end
                    end
                    if h.Scan_compare_Check_Energy_Val ==0
                        xlabel('Image')                        
                    else
                        xlabel('Energy(eV)')                        
                    end
                        
                    xlim auto
                    ylim auto
                    
                    if h.Scan_compare_Check_micron_Val ==1
                        ylabel('Position (um)')
                    else
                        ylabel('Position (um)')
                        
                    end
                    pause(1)
                end
                if h.Scan_compare_Check (1,3) == 3
                    if val_Strip_Scan3 ==1
                    if h.Strip1 == 1
                        
                            plot(number_Image3(FitValid3 ==1),Peak3(FitValid3 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','c','Parent',h.I_Fig_Compare_In)                  
                            hold on   
                            plot(number_Image3,Peak_Manu3,'LineStyle','none','Marker','o','MarkerFaceColor','c','MarkerEdgeColor','c','Parent',h.I_Fig_Compare_In)                    
                        
                    end
                    elseif val_Strip_Scan3 ==2
                    if h.Strip2 == 1
                        
                            plot(number_Image3(FitValid3 ==1),Peak3(FitValid3 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','c','Parent',h.I_Fig_Compare_In)                  
                            hold on   
                            plot(number_Image3,Peak_Manu3,'LineStyle','none','Marker','o','MarkerFaceColor','c','MarkerEdgeColor','c','Parent',h.I_Fig_Compare_In)                    
                        
                    end
                    elseif val_Strip_Scan3 ==3
                    if h.Strip3 == 1
                        
                            plot(number_Image3(FitValid3 ==1),Peak3(FitValid3 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','c','Parent',h.I_Fig_Compare_In)                  
                            hold on   
                            plot(number_Image3,Peak_Manu3,'LineStyle','none','Marker','o','MarkerFaceColor','c','MarkerEdgeColor','c','Parent',h.I_Fig_Compare_In)                    
                        
                    end
                    elseif val_Strip_Scan3 ==4
                    if h.Strip4 == 1
                        
                            plot(number_Image3(FitValid3 ==1),Peak3(FitValid3 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','c','Parent',h.I_Fig_Compare_In)                  
                            hold on   
                            plot(number_Image3,Peak_Manu3,'LineStyle','none','Marker','o','MarkerFaceColor','c','MarkerEdgeColor','c','Parent',h.I_Fig_Compare_In)                    
                        
                    end
                    end
                    if h.Scan_compare_Check_Energy_Val ==0
                        xlabel('Image')                        
                    else
                        xlabel('Energy(eV)')                        
                    end
                        
                    xlim auto
                    ylim auto
                    
                    if h.Scan_compare_Check_micron_Val ==1
                        ylabel('Position (um)')
                    else
                        ylabel('Position (um)')
                        
                    end
                    pause(1)
                end
                if h.Scan_compare_Check (1,4) == 4
                    if val_Strip_Scan4 ==1
                    if h.Strip1 == 1
                            plot(number_Image4(FitValid4 ==1),Peak4(FitValid4 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','k','Parent',h.I_Fig_Compare_In)                  
                            hold on   
                            plot(number_Image4,Peak_Manu4,'LineStyle','none','Marker','o','MarkerFaceColor','k','MarkerEdgeColor','k','Parent',h.I_Fig_Compare_In)                                        
                    end
                    elseif val_Strip_Scan4 ==2
                    if h.Strip2 == 1                        
                        plot(number_Image4(FitValid4 ==1),Peak4(FitValid4 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','k','Parent',h.I_Fig_Compare_In)                  
                        hold on   
                        plot(number_Image4,Peak_Manu4,'LineStyle','none','Marker','o','MarkerFaceColor','k','MarkerEdgeColor','k','Parent',h.I_Fig_Compare_In)                    
                    
                    end
                    elseif val_Strip_Scan4 ==3
                    if h.Strip3 == 1
                    
                            plot(number_Image4(FitValid4 ==1),Peak4(FitValid4 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','k','Parent',h.I_Fig_Compare_In)                  
                            hold on   
                            plot(number_Image4,Peak_Manu4,'LineStyle','none','Marker','o','MarkerFaceColor','k','MarkerEdgeColor','k','Parent',h.I_Fig_Compare_In)                    
                    
                    end
                    elseif val_Strip_Scan4 ==4
                    if h.Strip4 == 1
                    
                            plot(number_Image4(FitValid4 ==1),Peak4(FitValid4 ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','k','Parent',h.I_Fig_Compare_In)                  
                            hold on   
                            plot(number_Image4,Peak_Manu4,'LineStyle','none','Marker','o','MarkerFaceColor','k','MarkerEdgeColor','k','Parent',h.I_Fig_Compare_In)                    
                    
                    end
                    end
                    if h.Scan_compare_Check_Energy_Val ==0
                        xlabel('Image')                        
                    else
                        xlabel('Energy(eV)')                        
                    end
                        
                    xlim auto
                    ylim auto
                    
                    if h.Scan_compare_Check_micron_Val ==1
                        ylabel('Position (um)')
                    else
                        ylabel('Position (um)')
                        
                    end
                    pause(1)
                end
            end
        end
                
    end

   
% Print 2D or Smooth or 2n1
    function Print_Chk(source,eventdata)
        
        if source == h.Log_Pre_plot
            val_Scan_Log = get(h.Log_Pre_plot,'Value') ;
            if val_Scan_Log == 1                
                set(h.Log_Pre_plot,'Value',1)                                   
            elseif val_Scan_Log == 0
                set(h.Log_Pre_plot,'Value',0)                   
            end                   
            
        elseif source == h.Scan_2D
            val_Scan_2D = get(h.Scan_2D,'Value') ;
            if val_Scan_2D == 1
                h.Scan_2D_val = 1;
                set(h.Scan_2D,'Value',1)                                   
            elseif val_Scan_2D == 0
                h.Scan_2D_val = 0;
                set(h.Scan_2D,'Value',0)                   
            end                   
        elseif source== h.Scan_2n1
            val_Scan_2n1 = get(h.Scan_2n1,'Value') ;
            if val_Scan_2n1 == 1
                h.Scan_2n1_val = 1;
                set(h.Scan_2n1,'Value',1)                                   
            elseif val_Scan_2n1 == 0
                h.Scan_2n1_val = 0;
                set(h.Scan_2n1,'Value',0)                   
            end
        elseif source== h.Scan_Smooth_Print            
            val_Scan_2n1 = get(h.Scan_Smooth_Print,'Value') ;
            if val_Scan_2n1 == 1
                h.Scan_Smooth_Print_val = 1;
                set(h.Scan_Smooth_Print,'Value',1)                                   
            elseif val_Scan_2n1 == 0
                h.Scan_Smooth_Print_val = 0;
                set(h.Scan_Smooth_Print,'Value',0)                   
            end            
        end        
    end

% Shows the values of the cursor
    function Data_Cursor_funct(source, eventdata)
        if source == h.Data_Cursor
            val = get(h.Data_Cursor, 'Value');
            if val ==1
                set(h.Data_Cursor, 'Value', 1);                
                datacursormode on
            else
                set(h.Data_Cursor, 'Value', 0);
                datacursormode off
            end                 
            
        end
    end


%% Strip Selection
%Selection of Strip
    function Strip_Chk(source,eventdata)
        Strip = h.Strip;
        Save_Area = h.Save_Area;
        Save_Peak = h.Save_Peak;
        Save_Widths = h.Save_Widths;
        Save_number_Image = h.Save_number_Image;
        i_im= h.i_im;
        StripRanges = h.StripRanges;
        Save_Background = h.Save_Background;

        if h.Strip1 == 1
            Save_Colum_Int1 = h.Save_Colum_Int1;
            Save_x_values1 = h.Save_x_values1;
            Save_Strip_Int1 = h.Save_Strip_Int1;
            Save_Strip_fit1 = h.Save_Strip_fit1;
            mean_Strip1 = h.mean_Strip1;  
            val_Strip_Scan = 1;   
            background = Save_Background*ones(1,size(Save_Colum_Int1,2));
        end

        if h.Strip2 == 1
            Save_Colum_Int2 = h.Save_Colum_Int2;
            Save_x_values2 = h.Save_x_values2;
            Save_Strip_Int2 = h.Save_Strip_Int2;
            Save_Strip_fit2 = h.Save_Strip_fit2;
            mean_Strip2 = h.mean_Strip2;
            val_Strip_Scan = 2;
            background = Save_Background*ones(1,size(Save_Colum_Int2,2));
        end
            
        if h.Strip3 == 1
            Save_Colum_Int3 = h.Save_Colum_Int3;
            Save_x_values3 = h.Save_x_values3;
            Save_Strip_Int3 = h.Save_Strip_Int3;
            Save_Strip_fit3 = h.Save_Strip_fit3;
            mean_Strip3 = h.mean_Strip3;            
            val_Strip_Scan = 3;
            background = Save_Background*ones(1,size(Save_Colum_Int3,2));
        end
        
        if h.Strip4 == 1
            Save_Colum_Int4 = h.Save_Colum_Int4;
            Save_x_values4 = h.Save_x_values4;
            Save_Strip_Int4 = h.Save_Strip_Int4;    
            Save_Strip_fit4 = h.Save_Strip_fit4;
            mean_Strip4 = h.mean_Strip4;
            val_Strip_Scan = 4;
            background = Save_Background*ones(1,size(Save_Colum_Int4,2));
        end
        

  

        Save_FitValid = h.Save_FitValid;
        Save_Peak_Manu = h.Save_Peak_Manu;
        Save_Error = h.Save_Error;
        
        ImageNumbers = h.ImageNumbers;
        
        
        if source == h.Strip_scan
            val_Strip_Scan = 1;
        elseif source == h.Strip_scan1
            val_Strip_Scan = 2;
        elseif source == h.Strip_scan2            
            val_Strip_Scan = 3;
        elseif source == h.Strip_scan3
            val_Strip_Scan = 4;
        end
        
                
        if val_Strip_Scan ==1
            if h.Strip1 == 1    
                Save_x_values = Save_x_values1(1,:);
                Save_Colum_Int = Save_Colum_Int1(1,:);
                Strip_Int = mean_Strip1(1,:);
                Save_Strip_Int = Save_Strip_Int1(1,:,:); 
                Strip_fit = Save_Strip_fit1(1,:,:); 
                [tonto,size_Int]=size(Strip_Int);
                Background = ones(size_Int,1)*Save_Background(val_Strip_Scan,1);
            end
        elseif val_Strip_Scan ==2
            if h.Strip2 == 1
                Save_x_values = Save_x_values2(1,:);
                Save_Colum_Int= Save_Colum_Int2(1,:);
                Strip_Int = mean_Strip2(1,:);
                Save_Strip_Int = Save_Strip_Int2(1,:,:); 
                Strip_fit = Save_Strip_fit2(1,:,:); 
                [tonto,size_Int]=size(Strip_Int);
                Background = ones(size_Int,1)*Save_Background(val_Strip_Scan,1);
            end
        elseif val_Strip_Scan ==3
            if h.Strip3 == 1
                Save_x_values = Save_x_values3(1,:);
                Save_Colum_Int = Save_Colum_Int3(1,:);
                Strip_Int = mean_Strip3(1,:);
                Save_Strip_Int= Save_Strip_Int3(1,:,:); 
                Strip_fit = Save_Strip_fit3(1,:,:); 
                [tonto,size_Int]=size(Strip_Int);
                Background = ones(size_Int,1)*Save_Background(val_Strip_Scan,1);
            end
        elseif val_Strip_Scan ==4
            if h.Strip4 == 1  
                Save_x_values = Save_x_values4(1,:);
                Save_Colum_Int = Save_Colum_Int4(1,:);
                Strip_Int = mean_Strip4(1,:);
                Save_Strip_Int = Save_Strip_Int4(1,:,:);  
                Strip_fit = Save_Strip_fit4(1,:,:); 
                [tonto,size_Int]=size(Strip_Int);
                Background = ones(size_Int,1)*Save_Background(val_Strip_Scan,1);
            end
            
        end
        
        Save_Background = h.Save_Background;
        
        Picture_Plot = eval(get(h.Picture,'String')) ;            
        Picture = Picture_Plot-ImageNumbers(1,1)+1;    
        
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
            
           
            child = get(h.PlotS_Result4_Fig,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
            if val_Strip_Scan ==1
            if h.Strip1 == 1           
                if h.micro_Check == 1                    
                    micro_val = h.micro_value;
                    ColumnRange = Save_Colum_Int * micro_val;
                    x_values = Save_x_values * micro_val;
                    MaxPos = Save_Peak * micro_val;
                    Max_Pos_Manu_array = Save_Peak_Manu* micro_val;
                else
                    ColumnRange = Save_Colum_Int;
                    x_values = Save_x_values;
                    MaxPos = Save_Peak;
                    Max_Pos_Manu_array = Save_Peak_Manu;
                end
            end
            end
            if val_Strip_Scan ==2
                if h.Strip2 == 1            
                    if h.micro_Check == 1                    
                        micro_val = h.micro_value;
                        ColumnRange = Save_Colum_Int * micro_val;
                        x_values = Save_x_values * micro_val;
                        MaxPos = Save_Peak * micro_val;
                        Max_Pos_Manu_array = Save_Peak_Manu* micro_val;
                    else
                        ColumnRange = Save_Colum_Int;
                        x_values = Save_x_values;
                        MaxPos = Save_Peak;
                        Max_Pos_Manu_array = Save_Peak_Manu;
                    end
                end
            end
            if val_Strip_Scan ==3
                if h.Strip3 == 1
                    if h.micro_Check == 1                    
                        micro_val = h.micro_value;
                        ColumnRange = Save_Colum_Int * micro_val;
                        x_values = Save_x_values * micro_val;
                        MaxPos = Save_Peak * micro_val;
                        Max_Pos_Manu_array = Save_Peak_Manu* micro_val;
                    else
                        ColumnRange = Save_Colum_Int;
                        x_values = Save_x_values;
                        MaxPos = Save_Peak;
                        Max_Pos_Manu_array = Save_Peak_Manu;
                    end
                end
            end
            if val_Strip_Scan ==4
                if h.Strip4 == 1
                    if h.micro_Check == 1                    
                        micro_val = h.micro_value;
                        ColumnRange = Save_Colum_Int * micro_val;
                        x_values = Save_x_values * micro_val;
                        MaxPos = Save_Peak * micro_val;
                        Max_Pos_Manu_array = Save_Peak_Manu* micro_val;
                    else
                        ColumnRange = Save_Colum_Int;
                        x_values = Save_x_values;
                        MaxPos = Save_Peak;
                        Max_Pos_Manu_array = Save_Peak_Manu;
                    end
                end
            end
%            FWHM = h.FWHM;
%            RSquare = h.RSquare;
            

            
        if source == h.Strip_scan_all
            val_Strip_Scan = get(h.Strip_scan_all,'Value') ;
            if val_Strip_Scan ==1
                Strip = [1 2 3 4];
            end
            
            if h.i_Save ==1
                set(h.x_Data_Cursor,'String',num2str(FWHM(1,i_im)))
                set(h.y_Data_Cursor,'String',num2str(RSquare(1,i_im)))
            end
            
            set(h.Strip_scan_all,'Value',1)
            set(h.Strip_scan,'Value',1)
            set(h.Strip_scan1,'Value',1)
            set(h.Strip_scan2,'Value',1)
            set(h.Strip_scan3,'Value',1)
            
             axes(h.PlotS_Fig)
            hold off
 
            [a_image,b_image] = size(Save_number_Image);
                for i_im = 1:b_image
                    plot(ColumnRange(1,:),Save_Strip_Int(1,:,i_im),'Parent', h.PlotS_Fig,'Color','b') ;               
                    hold on  
                  
                end
                
                plot(ColumnRange(1,:),Strip_Int(1,:),...
                    'Parent', h.PlotS_Fig,'LineWidth',2,'Marker','s','MarkerSize',2,'Color','g');            
                title(sprintf('F1: Strip %d, %d - %d pix',1,StripRanges(1,1),StripRanges(1,2)),'Parent',h.PlotS_Fig);
                xlim auto
                ylim auto  
            
            axes(h.PlotRS_Fig)
            plot(ColumnRange (1,:),Save_Strip_Int(1,:,Picture),'Parent',h.PlotRS_Fig)
            hold on
            plot(x_values(1,:),Background(1,:),'Parent', h.PlotRS_Fig,'Color','k','LineStyle','--');
            plot(x_values,Strip_fit(1,:,Picture),'Parent', h.PlotRS_Fig,'Color','r','LineStyle',':');   
            title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(Picture),1,StripRanges(1,1),StripRanges(1,2)),'Parent', h.PlotRS_Fig);
            if h.micro_Check ==1
                xlabel('Position (um)')
            else
                xlabel('Position (um)')
            end
            ylabel('Intensity (arb units)')
            
            axes(h.PlotS_Result_Fig)
            plot(ColumnRange(1,:),Save_Strip_Int(1,:,i_im+1),'Parent',h.PlotS_Result_Fig,'Color','r','LineWidth',2)
            hold on  
            plot(ColumnRange(1,:),Background(1,:),'Color','k','LineStyle','--','Parent',h.PlotS_Result_Fig);
            title(sprintf('F3: Strip %d, %d - %d pix',1,StripRanges(1,1),StripRanges(1,2)),'Parent', h.PlotS_Result_Fig);
            
            if h.micro_Check ==1
                xlabel('Position (um)')
            else
                xlabel('Position (um)')
            end
            ylabel('Intensity (arb units)')

            
            Widths(1,:)=Save_Widths(1,:);
            Area(1,:)=Save_Area(1,:);
            FitValid(1,:) = Save_FitValid(1,:);
            Peak(1,:) = MaxPos(1,:);
             Peak_Manu(1,:) =Max_Pos_Manu_array (1,:);
            number_Image(1,:)=Save_number_Image(1,:);
            Error(1,:) = Save_Error(1,:);
            
            if h.Energy_Check == 1                
                [a_Image,b_Image] =size(number_Image);
                Energy_Step_value=h.Energy_Step_value;
                Energy_value = h.Energy_value;
                Image_Theta = h.Image_Theta;
                for i_Image=1:b_Image
                    Energy_Image(1,i_Image) = Energy_Step_value*(number_Image(1,i_Image)-Image_Theta);
                end
            end
            

            
            axes(h.PlotS_Result3_Fig)                    
                    
            if h.Energy_Check == 0   
                plot(number_Image,Area,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r','Parent',h.PlotS_Result3_Fig)
                hold on   
                plot(number_Image(FitValid ==1),Widths(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','b','Parent',h.PlotS_Result3_Fig)   
                errorbar(number_Image(FitValid == 1),Widths(FitValid == 1),Error(FitValid == 1),'Parent',h.PlotS_Result3_Fig)
                xlabel('Image')
                title(sprintf('F5: Intensity  --- Strip %d, %d - %d pix',1,StripRanges(1,1),StripRanges(1,2)),'Parent',h.PlotS_Result3_Fig);                        
            elseif h.Energy_Check == 1   
                plot(Energy_Image,Area,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r','Parent',h.PlotS_Result3_Fig)
                hold on   
                plot(Energy_Image(FitValid ==1),Widths(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','b','Parent',h.PlotS_Result3_Fig)   
                errorbar(Energy_Image(FitValid == 1),Widths(FitValid == 1),Error(FitValid == 1),'Parent',h.PlotS_Result3_Fig)
                xlabel('Energy(eV)')
                title(sprintf('F5: Intensity  --- Strip %d, %d - %d pix, 0 position =  %d eV',1,StripRanges(1,1),StripRanges(1,2),Energy_value),'Parent',h.PlotS_Result3_Fig);                        
            end            
            ylabel('Intensity(abr units)')                           

            xlim auto
            ylim auto
            
            axes(h.PlotS_Result4_Fig)
            
                    
            if h.Energy_Check == 0   
                plot(number_Image(FitValid ==1),Peak(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.PlotS_Result4_Fig)                  
                hold on   
                plot(number_Image,Peak_Manu,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Result4_Fig)                    
                xlabel('Image')
                title(sprintf('F6: Peak position  --- Strip %d,%d - %dpix',1,StripRanges(1,1),StripRanges(1,2)),'Parent',h.PlotS_Result4_Fig)  
            elseif h.Energy_Check == 1   
                plot(Energy_Image(FitValid ==1),Peak(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.PlotS_Result4_Fig)                  
                hold on   
                plot(Energy_Image,Peak_Manu,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Result4_Fig)                    
                xlabel('Energy(eV)')
                title(sprintf('F6: Peak position --- Strip %d, 0 position =  %d eV',1,Energy_value),'Parent',h.PlotS_Result4_Fig)                
            end            
            xlim auto
            ylim auto
            
            if h.micro_Check == 1
                ylabel('Position (um)')
            else
                ylabel('Position (um)')
                
            end
            
            
            
        elseif source == h.Strip_scan
            
            if h.Strip1 == 1
            val_Strip_Scan = get(h.Strip_scan,'Value') ;
            if val_Strip_Scan ==1
                Strip = [1 0 0 0];
            end
            
%            if h.i_Save ==1
%                set(h.x_Data_Cursor,'String',num2str(FWHM(1,i_im)))
%                set(h.y_Data_Cursor,'String',num2str(RSquare(1,i_im)))
%            end
            set(h.Strip_scan_all,'Value',0)
            set(h.Strip_scan,'Value',1)
            set(h.Strip_scan1,'Value',0)
            set(h.Strip_scan2,'Value',0)
            set(h.Strip_scan3,'Value',0)
            

            axes(h.PlotS_Fig)
            hold off
 
            [a_image,b_image] = size(Save_number_Image);
                for i_im = 1:b_image
                    plot(ColumnRange(1,:),Save_Strip_Int(1,:,i_im),'Parent', h.PlotS_Fig,'Color','b') ;               
                    hold on  
                  
                end
                
                plot(ColumnRange(1,:),Strip_Int(1,:),...
                    'Parent', h.PlotS_Fig,'LineWidth',2,'Marker','s','MarkerSize',2,'Color','g');            
                title(sprintf('F1: Strip %d, %d - %d pix',1,StripRanges(1,1),StripRanges(1,2)),'Parent',h.PlotS_Fig);
                xlim auto
                ylim auto  
            
            axes(h.PlotRS_Fig)
            plot(ColumnRange (1,:),Save_Strip_Int(1,:,Picture),'Parent',h.PlotRS_Fig)
            hold on
                        plot(x_values(1,:),Background(1,:),'Parent', h.PlotRS_Fig,'Color','k','LineStyle','--');
            plot(x_values,Strip_fit(1,:,Picture),'Parent', h.PlotRS_Fig,'Color','r','LineStyle',':'); 
            title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(Picture),1,StripRanges(1,1),StripRanges(1,2)),'Parent', h.PlotRS_Fig);
            if h.micro_Check ==1
                xlabel('Position (um)')
            else
                xlabel('Position (um)')
            end
            ylabel('Intensity (arb units)')
            
            axes(h.PlotS_Result_Fig)
            plot(ColumnRange(1,:),Save_Strip_Int(1,:,i_im+1),'Parent',h.PlotS_Result_Fig,'Color','r','LineWidth',2)
            hold on  
            plot(ColumnRange(1,:),Background(1,:),'Color','k','LineStyle','--','Parent',h.PlotS_Result_Fig);
            title(sprintf('F3: Strip %d, %d - %d pix',1,StripRanges(1,1),StripRanges(1,2)),'Parent', h.PlotS_Result_Fig);
            
            if h.micro_Check ==1
                xlabel('Position (um)')
            else
                xlabel('Position (um)')
            end
            ylabel('Intensity (arb units)')

            
            Widths(1,:)=Save_Widths(1,:);
            Area(1,:)=Save_Area(1,:);
            FitValid(1,:) = Save_FitValid(1,:);
            Peak(1,:) = MaxPos(1,:);
            Peak_Manu(1,:) =Max_Pos_Manu_array (1,:);
            number_Image(1,:)=Save_number_Image(1,:);
            Error(1,:) = Save_Error(1,:);
            
            if h.Energy_Check == 1                
                [a_Image,b_Image] =size(number_Image);
                Energy_Step_value=h.Energy_Step_value;
                Energy_value = h.Energy_value;
                Image_Theta = h.Image_Theta;
                for i_Image=1:b_Image
                    Energy_Image(1,i_Image) = Energy_Step_value*(number_Image(1,i_Image)-Image_Theta);
                end
            end
            

            
            axes(h.PlotS_Result3_Fig)                    
                    
            if h.Energy_Check == 0   
                plot(number_Image,Area,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r','Parent',h.PlotS_Result3_Fig)
                hold on   
                plot(number_Image(FitValid ==1),Widths(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','b','Parent',h.PlotS_Result3_Fig)   
                errorbar(number_Image(FitValid == 1),Widths(FitValid == 1),Error(FitValid == 1),'Parent',h.PlotS_Result3_Fig)
                xlabel('Image')
                title(sprintf('F5: Intensity  --- Strip %d, %d - %d pix',1,StripRanges(1,1),StripRanges(1,2)),'Parent',h.PlotS_Result3_Fig);                        
            elseif h.Energy_Check == 1   
                plot(Energy_Image,Area,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r','Parent',h.PlotS_Result3_Fig)
                hold on   
                plot(Energy_Image(FitValid ==1),Widths(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','b','Parent',h.PlotS_Result3_Fig)   
                errorbar(Energy_Image(FitValid == 1),Widths(FitValid == 1),Error(FitValid == 1),'Parent',h.PlotS_Result3_Fig)
                xlabel('Energy(eV)')
                title(sprintf('F5: Intensity  --- Strip %d, %d - %d pix, 0 position =  %d eV',1,StripRanges(1,1),StripRanges(1,2),Energy_value),'Parent',h.PlotS_Result3_Fig);                        
            end            
            ylabel('Intensity(abr units)')                           

            xlim auto
            ylim auto
            
            axes(h.PlotS_Result4_Fig)
            
                    
            if h.Energy_Check == 0   
                plot(number_Image(FitValid ==1),Peak(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.PlotS_Result4_Fig)                  
                hold on   
                plot(number_Image,Peak_Manu,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Result4_Fig)                    
                xlabel('Image')
                title(sprintf('F6: Peak position  --- Strip %d,%d - %dpix',1,StripRanges(1,1),StripRanges(1,2)),'Parent',h.PlotS_Result4_Fig)  
            elseif h.Energy_Check == 1   
                plot(Energy_Image(FitValid ==1),Peak(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.PlotS_Result4_Fig)                  
                hold on   
                plot(Energy_Image,Peak_Manu,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Result4_Fig)                    
                xlabel('Energy(eV)')
                title(sprintf('F6: Peak position --- Strip %d, 0 position =  %d eV',1,Energy_value),'Parent',h.PlotS_Result4_Fig)                
            end            
            xlim auto
            ylim auto
            
            if h.micro_Check == 1
                ylabel('Position (um)')
            else
                ylabel('Position (um)')
                
            end
            end
            
        elseif source == h.Strip_scan1
            if h.Strip2 == 1
            
            val_Strip_Scan1 = get(h.Strip_scan1,'Value') ;
            if val_Strip_Scan1 ==1
                Strip = [0 2 0 0];
            end
            set(h.Strip_scan_all,'Value',0)
            set(h.Strip_scan,'Value',0)
            set(h.Strip_scan1,'Value',1)
            set(h.Strip_scan2,'Value',0)
            set(h.Strip_scan3,'Value',0)
            
%            if h.i_Save ==1
%                set(h.x_Data_Cursor,'String',num2str(FWHM(2,i_im)))
%                set(h.y_Data_Cursor,'String',num2str(RSquare(2,i_im)))
 %           end
            
            
            axes(h.PlotS_Fig)
             hold off
 
            [a_image,b_image] = size(Save_number_Image);
                for i_im = 1:b_image
                    plot(ColumnRange(1,:),Save_Strip_Int(1,:,i_im),'Parent', h.PlotS_Fig,'Color','b') ;               
                    hold on  
                  
                end
                
                plot(ColumnRange(1,:),Strip_Int(1,:),...
                    'Parent', h.PlotS_Fig,'LineWidth',2,'Marker','s','MarkerSize',2,'Color','g');            
                title(sprintf('F1: Strip %d, %d - %d pix',2,StripRanges(1,1),StripRanges(1,2)),'Parent',h.PlotS_Fig);
                xlim auto
                ylim auto 
            
            axes(h.PlotRS_Fig)
            plot(ColumnRange(1,:),Save_Strip_Int(1,:,Picture),'Parent',h.PlotRS_Fig);
            hold on
            plot(x_values(1,:),Background(1,:),'Parent', h.PlotRS_Fig,'Color','k','LineStyle','--');
            plot(x_values,Strip_fit(1,:,Picture),'Parent', h.PlotRS_Fig,'Color','r','LineStyle',':'); 
            title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(Picture),2,StripRanges(2,1),StripRanges(2,2)),'Parent', h.PlotRS_Fig);
            if h.micro_Check ==1
                xlabel('Position (um)')
            else
                xlabel('Position (um)')
            end
            ylabel('Intensity (arb units)')
            
            axes(h.PlotS_Result_Fig)
            plot(ColumnRange(1,:),Save_Strip_Int(1,:,i_im+1),'Parent',h.PlotS_Result_Fig,'Color','r','LineWidth',2)
            hold on        
            plot(ColumnRange(1,:),Background(1,:),'Color','k','LineStyle','--','Parent',h.PlotS_Result_Fig);
            title(sprintf('F3: Strip %d, %d - %d pix',2,StripRanges(2,1),StripRanges(2,2)),'Parent', h.PlotS_Result_Fig);
            if h.micro_Check ==1
                xlabel('Position (um)')
            else
                xlabel('Position (um)')
            end
            ylabel('Intensity (arb units)')
            

            
            Widths(1,:)=Save_Widths(1,:);
            Area(1,:)=Save_Area(2,:);
            FitValid(1,:) = Save_FitValid(2,:);
            Peak(1,:) = MaxPos(2,:);
            Peak_Manu(1,:) =Max_Pos_Manu_array (2,:);
            number_Image(1,:)=Save_number_Image(1,:);
            Error(1,:) = Save_Error(2,:);
            
             if h.Energy_Check == 1                
                [a_Image,b_Image] =size(number_Image);
                Energy_Step_value=h.Energy_Step_value;
                Energy_value = h.Energy_value;
                Image_Theta = h.Image_Theta;
                for i_Image=1:b_Image
                    Energy_Image(1,i_Image) = Energy_Step_value*(number_Image(1,i_Image)-Image_Theta);
                end
            end
            

            
            axes(h.PlotS_Result3_Fig)                    
                    
            if h.Energy_Check == 0   
                plot(number_Image,Area,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r','Parent',h.PlotS_Result3_Fig)
                hold on   
                plot(number_Image(FitValid ==1),Widths(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','b','Parent',h.PlotS_Result3_Fig)   
                errorbar(number_Image(FitValid == 1),Widths(FitValid == 1),Error(FitValid == 1),'Parent',h.PlotS_Result3_Fig)
                xlabel('Image')
                title(sprintf('F5: Intensity  --- Strip %d, %d - %d pix',1,StripRanges(1,1),StripRanges(1,2)),'Parent',h.PlotS_Result3_Fig);                        
            elseif h.Energy_Check == 1   
                plot(Energy_Image,Area,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r','Parent',h.PlotS_Result3_Fig)
                hold on   
                plot(Energy_Image(FitValid ==1),Widths(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','b','Parent',h.PlotS_Result3_Fig)   
                errorbar(Energy_Image(FitValid == 1),Widths(FitValid == 1),Error(FitValid == 1),'Parent',h.PlotS_Result3_Fig)
                xlabel('Energy(eV)')
                title(sprintf('F5: Intensity  --- Strip %d, %d - %d pix, 0 position =  %d eV',1,StripRanges(1,1),StripRanges(1,2),Energy_value),'Parent',h.PlotS_Result3_Fig);                        
            end            
            ylabel('Intensity(abr units)')                           

            xlim auto
            ylim auto
            
            axes(h.PlotS_Result4_Fig)
            
                    
            if h.Energy_Check == 0   
                plot(number_Image(FitValid ==1),Peak(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.PlotS_Result4_Fig)                  
                hold on   
                plot(number_Image,Peak_Manu,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Result4_Fig)                    
                xlabel('Image')
                title(sprintf('F6: Peak position  --- Strip %d,%d - %dpix',1,StripRanges(1,1),StripRanges(1,2)),'Parent',h.PlotS_Result4_Fig)  
            elseif h.Energy_Check == 1   
               plot(Energy_Image(FitValid ==1),Peak(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.PlotS_Result4_Fig)                  
                hold on   
                plot(Energy_Image,Peak_Manu,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Result4_Fig)                    
                xlabel('Energy(eV)')
                title(sprintf('F6: Peak position --- Strip %d, 0 position =  %d eV',1,Energy_value),'Parent',h.PlotS_Result4_Fig)                
            end            
            xlim auto
            ylim auto
            
            if h.micro_Check == 1
                ylabel('Position (um)')
            else
                ylabel('Position (um)')
                
            end
            
            end
        elseif source == h.Strip_scan2
            if h.Strip3 == 1
             val_Strip_Scan2 = get(h.Strip_scan2,'Value')  ;
            if val_Strip_Scan2 ==1
                Strip = [0 0 3 0];
            end

            set(h.Strip_scan_all,'Value',0)
            set(h.Strip_scan,'Value',0)
            set(h.Strip_scan1,'Value',0)
            set(h.Strip_scan2,'Value',1)
            set(h.Strip_scan3,'Value',0)
            
%            if h.i_Save ==1
%            set(h.x_Data_Cursor,'String',num2str(FWHM(3,i_im)))
%            set(h.y_Data_Cursor,'String',num2str(RSquare(3,i_im)))
%            end
            
            axes(h.PlotS_Fig)
            
             hold off
 
            [a_image,b_image] = size(Save_number_Image);
                for i_im = 1:b_image
                    plot(ColumnRange(1,:),Save_Strip_Int(1,:,i_im),'Parent', h.PlotS_Fig,'Color','b') ;               
                    hold on                    
                end
                
                plot(ColumnRange(1,:),Strip_Int(1,:),...
                    'Parent', h.PlotS_Fig,'LineWidth',2,'Marker','s','MarkerSize',2,'Color','g');            
                title(sprintf('F1: Strip %d, %d - %d pix',3,StripRanges(1,1),StripRanges(1,2)),'Parent',h.PlotS_Fig);
                xlim auto
                ylim auto   
            
            axes(h.PlotRS_Fig)
            plot(ColumnRange(1,:),Save_Strip_Int(1,:,Picture),'Parent',h.PlotRS_Fig)
            hold on              
            plot(x_values(1,:),Background(1,:),'Parent', h.PlotRS_Fig,'Color','k','LineStyle','--');
            plot(x_values,Strip_fit(1,:,Picture),'Parent', h.PlotRS_Fig,'Color','r','LineStyle',':'); 
            title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(Picture),3,StripRanges(3,1),StripRanges(3,2)),'Parent', h.PlotRS_Fig);
            if h.micro_Check ==1
                xlabel('Position (um)')
            else
                xlabel('Position (um)')
            end
            ylabel('Intensity (arb units)')
            
            axes(h.PlotS_Result_Fig)
            plot(ColumnRange(1,:),Save_Strip_Int(1,:,i_im+1),'Parent',h.PlotS_Result_Fig,'Color','r','LineWidth',2)
            hold on    
            plot(ColumnRange(1,:),Background(1,:),'Color','k','LineStyle','--','Parent',h.PlotS_Result_Fig);
            title(sprintf('F3: Strip %d, %d - %d pix',3,StripRanges(3,1),StripRanges(3,2)),'Parent', h.PlotS_Result_Fig);
            if h.micro_Check ==1
                xlabel('Position (um)')
            else
                xlabel('Position (um)')
            end
            ylabel('Intensity (arb units)')


            
            Widths(1,:)=Save_Widths(3,:);
            Area(1,:)=Save_Area(3,:);
            FitValid(1,:) = Save_FitValid(3,:);
           Peak(1,:) = MaxPos(3,:);
            Peak_Manu(1,:) =Max_Pos_Manu_array (3,:);
            number_Image(1,:)=Save_number_Image(1,:);
            Error(1,:) = Save_Error(3,:); 
            
            if h.Energy_Check == 1                
                [a_Image,b_Image] =size(number_Image);
                Energy_Step_value=h.Energy_Step_value;
                Energy_value = h.Energy_value;
                Image_Theta = h.Image_Theta;
                for i_Image=1:b_Image
                    Energy_Image(1,i_Image) = Energy_Step_value*(number_Image(1,i_Image)-Image_Theta);
                end
            end
            

            
            axes(h.PlotS_Result3_Fig)                    
                    
            if h.Energy_Check == 0   
                plot(number_Image,Area,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r','Parent',h.PlotS_Result3_Fig)
                hold on   
                plot(number_Image(FitValid ==1),Widths(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','b','Parent',h.PlotS_Result3_Fig)   
                errorbar(number_Image(FitValid == 1),Widths(FitValid == 1),Error(FitValid == 1),'Parent',h.PlotS_Result3_Fig)
                xlabel('Image')
                title(sprintf('F5: Intensity  --- Strip %d, %d - %d pix',1,StripRanges(1,1),StripRanges(1,2)),'Parent',h.PlotS_Result3_Fig);                        
            elseif h.Energy_Check == 1   
                plot(Energy_Image,Area,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r','Parent',h.PlotS_Result3_Fig)
                hold on   
                plot(Energy_Image(FitValid ==1),Widths(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','b','Parent',h.PlotS_Result3_Fig)   
                errorbar(Energy_Image(FitValid == 1),Widths(FitValid == 1),Error(FitValid == 1),'Parent',h.PlotS_Result3_Fig)
                xlabel('Energy(eV)')
                title(sprintf('F5: Intensity  --- Strip %d, %d - %d pix, 0 position =  %d eV',1,StripRanges(1,1),StripRanges(1,2),Energy_value),'Parent',h.PlotS_Result3_Fig);                        
            end            
            ylabel('Intensity(abr units)')                           

            xlim auto
            ylim auto
            
            axes(h.PlotS_Result4_Fig)
            
                    
            if h.Energy_Check == 0   
                plot(number_Image(FitValid ==1),Peak(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.PlotS_Result4_Fig)                  
                hold on   
                plot(number_Image,Peak_Manu,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Result4_Fig)                    
                xlabel('Image')
                title(sprintf('F6: Peak position  --- Strip %d,%d - %dpix',1,StripRanges(1,1),StripRanges(1,2)),'Parent',h.PlotS_Result4_Fig)  
            elseif h.Energy_Check == 1   
                plot(Energy_Image(FitValid ==1),Peak(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.PlotS_Result4_Fig)                  
                hold on   
                plot(Energy_Image,Peak_Manu,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Result4_Fig)                    
                xlabel('Energy(eV)')
                title(sprintf('F6: Peak position --- Strip %d, 0 position =  %d eV',1,Energy_value),'Parent',h.PlotS_Result4_Fig)                
            end            
            xlim auto
            ylim auto
            
            if h.micro_Check == 1
                ylabel('Position (um)')
            else
                ylabel('Position (um)')
                
            end        
            end
            
        elseif source == h.Strip_scan3
            if h.Strip4 == 1
            val_Strip_Scan3 = get(h.Strip_scan3,'Value')  ;
            if val_Strip_Scan3 ==1
                Strip = [0 0 0 4];
            end
            
            set(h.Strip_scan_all,'Value',0)
            set(h.Strip_scan,'Value',0)
            set(h.Strip_scan1,'Value',0)
            set(h.Strip_scan2,'Value',0)
            set(h.Strip_scan3,'Value',1)
            
%            if h.i_Save ==1
%            set(h.x_Data_Cursor,'String',num2str(FWHM(4,i_im)))
%            set(h.y_Data_Cursor,'String',num2str(RSquare(4,i_im)))
%            end
            
            axes(h.PlotS_Fig)
            
             hold off
 
            [a_image,b_image] = size(Save_number_Image);
                for i_im = 1:b_image
                    plot(ColumnRange(1,:),Save_Strip_Int(1,:,i_im),'Parent', h.PlotS_Fig,'Color','b') ;               
                    hold on                    
                end
                
                plot(ColumnRange(1,:),Strip_Int(1,:),...
                    'Parent', h.PlotS_Fig,'LineWidth',2,'Marker','s','MarkerSize',2,'Color','g');            
                title(sprintf('F1: Strip %d, %d - %d pix',4,StripRanges(1,1),StripRanges(1,2)),'Parent',h.PlotS_Fig);
                xlim auto
                ylim auto 
            
            axes(h.PlotRS_Fig)
            plot(ColumnRange(1,:),Save_Strip_Int(1,:,Picture),'Parent',h.PlotRS_Fig)
            hold on
            plot(x_values(1,:),Background(1,:),'Parent', h.PlotRS_Fig,'Color','k','LineStyle','--');
            plot(x_values,Strip_fit(1,:,Picture),'Parent', h.PlotRS_Fig,'Color','r','LineStyle',':'); 
            title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(Picture),4,StripRanges(4,1),StripRanges(4,2)),'Parent', h.PlotRS_Fig);
            if h.micro_Check ==1
                xlabel('Position (um)')
            else
                xlabel('Position (um)')
            end
            ylabel('Intensity (arb units)')
            
            axes(h.PlotS_Result_Fig)
            hold off
            plot(ColumnRange(1,:),Save_Strip_Int(1,:,i_im+1),'Parent',h.PlotS_Result_Fig,'Color','r','LineWidth',2)
            hold on          
            plot(ColumnRange(1,:),Background(1,:),'Color','k','LineStyle','--','Parent',h.PlotS_Result_Fig);
            title(sprintf('F3: Strip %d, %d - %d pix',4,StripRanges(4,1),StripRanges(4,2)),'Parent', h.PlotS_Result_Fig);
            if h.micro_Check ==1
                xlabel('Position (um)')
            else
                xlabel('Position (um)')
            end
            ylabel('Intensity (arb units)')

           
            Widths(1,:)=Save_Widths(4,:);
            Area(1,:)=Save_Area(4,:);
            FitValid(1,:) = Save_FitValid(4,:);
            Peak(1,:) = MaxPos(4,:);
            Peak_Manu(1,:) =Max_Pos_Manu_array (4,:);
            number_Image(1,:)=Save_number_Image(1,:);
            Error(1,:) = Save_Error(4,:);
            
            
            if h.Energy_Check == 1                
                [a_Image,b_Image] =size(number_Image);
                Energy_Step_value=h.Energy_Step_value;
                Energy_value = h.Energy_value;
                Image_Theta = h.Image_Theta;
                for i_Image=1:b_Image
                    Energy_Image(1,i_Image) = Energy_Step_value*(number_Image(1,i_Image)-Image_Theta);
                end
            end
            

            
            axes(h.PlotS_Result3_Fig)                    
                    
            if h.Energy_Check == 0   
                plot(number_Image,Area,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r','Parent',h.PlotS_Result3_Fig)
                hold on   
                plot(number_Image(FitValid ==1),Widths(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','b','Parent',h.PlotS_Result3_Fig)   
                errorbar(number_Image(FitValid == 1),Widths(FitValid == 1),Error(FitValid == 1),'Parent',h.PlotS_Result3_Fig)
                xlabel('Image')
                title(sprintf('F5: Intensity  --- Strip %d, %d - %d pix',1,StripRanges(1,1),StripRanges(1,2)),'Parent',h.PlotS_Result3_Fig);                        
            elseif h.Energy_Check == 1   
                plot(Energy_Image,Area,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r','Parent',h.PlotS_Result3_Fig)
                hold on   
                plot(Energy_Image(FitValid ==1),Widths(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','b','Parent',h.PlotS_Result3_Fig)   
                errorbar(Energy_Image(FitValid == 1),Widths(FitValid == 1),Error(FitValid == 1),'Parent',h.PlotS_Result3_Fig)
                xlabel('Energy(eV)')
                title(sprintf('F5: Intensity  --- Strip %d, %d - %d pix, 0 position =  %d eV',1,StripRanges(1,1),StripRanges(1,2),Energy_value),'Parent',h.PlotS_Result3_Fig);                        
            end            
            ylabel('Intensity(abr units)')                           

            xlim auto
            ylim auto
            
            axes(h.PlotS_Result4_Fig)
            
                    
            if h.Energy_Check == 0   
                plot(number_Image(FitValid ==1),Peak(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.PlotS_Result4_Fig)                  
                hold on   
                plot(number_Image,Peak_Manu,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Result4_Fig)                    
                xlabel('Image')
                title(sprintf('F6: Peak position  --- Strip %d,%d - %dpix',1,StripRanges(1,1),StripRanges(1,2)),'Parent',h.PlotS_Result4_Fig)  
            elseif h.Energy_Check == 1   
                plot(Energy_Image(FitValid ==1),Peak(FitValid ==1),'LineStyle','none','Marker','o','MarkerFaceColor','none','MarkerEdgeColor','r','Parent',h.PlotS_Result4_Fig)                  
                hold on   
                plot(Energy_Image,Peak_Manu,'LineStyle','none','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b','Parent',h.PlotS_Result4_Fig)                    
                xlabel('Energy(eV)')
                title(sprintf('F6: Peak position --- Strip %d, 0 position =  %d eV',1,Energy_value),'Parent',h.PlotS_Result4_Fig)                
            end            
            xlim auto
            ylim auto
            
            
            ylabel('Position (um)')
            
            end
        end
        h.Strip =Strip;
    end

    function Strip_Chk_compare(source, eventdata)
        
        
        
        if source == h.Strip_compare_scan1_1
            val_Strip_Scan1 = 1;
            set(h.Strip_compare_scan1_1,'Value',1)
            set(h.Strip_compare_scan1_2,'Value',0)
            set(h.Strip_compare_scan1_3,'Value',0)
            set(h.Strip_compare_scan1_4,'Value',0)
            h.val_Strip_Scan1 = val_Strip_Scan1;
        elseif source == h.Strip_compare_scan1_2
            val_Strip_Scan1 = 2;
            set(h.Strip_compare_scan1_1,'Value',0)
            set(h.Strip_compare_scan1_2,'Value',1)
            set(h.Strip_compare_scan1_3,'Value',0)
            set(h.Strip_compare_scan1_4,'Value',0)
            h.val_Strip_Scan1 = val_Strip_Scan1;
        elseif source == h.Strip_compare_scan1_3
            val_Strip_Scan1 = 3;
            set(h.Strip_compare_scan1_1,'Value',0)
            set(h.Strip_compare_scan1_2,'Value',0)
            set(h.Strip_compare_scan1_3,'Value',1)
            set(h.Strip_compare_scan1_4,'Value',0)
            h.val_Strip_Scan1 = val_Strip_Scan1;
        elseif source == h.Strip_compare_scan1_4
            val_Strip_Scan1 = 4;            
            set(h.Strip_compare_scan1_1,'Value',0)
            set(h.Strip_compare_scan1_2,'Value',0)
            set(h.Strip_compare_scan1_3,'Value',0)
            set(h.Strip_compare_scan1_4,'Value',1)
            h.val_Strip_Scan1 = val_Strip_Scan1;
        end
        
        if source == h.Strip_compare_scan2_1
            val_Strip_Scan2 = 1;
            set(h.Strip_compare_scan2_1,'Value',1)
            set(h.Strip_compare_scan2_2,'Value',0)
            set(h.Strip_compare_scan2_3,'Value',0)
            set(h.Strip_compare_scan2_4,'Value',0)
            h.val_Strip_Scan2 = val_Strip_Scan2;
        elseif source == h.Strip_compare_scan2_2
            val_Strip_Scan2 = 2;
            set(h.Strip_compare_scan2_1,'Value',0)
            set(h.Strip_compare_scan2_2,'Value',1)
            set(h.Strip_compare_scan2_3,'Value',0)
            set(h.Strip_compare_scan2_4,'Value',0)
            h.val_Strip_Scan2 = val_Strip_Scan2;
        elseif source == h.Strip_compare_scan2_3
            val_Strip_Scan2 = 3;
            set(h.Strip_compare_scan2_1,'Value',0)
            set(h.Strip_compare_scan2_2,'Value',0)
            set(h.Strip_compare_scan2_3,'Value',1)
            set(h.Strip_compare_scan2_4,'Value',0)
            h.val_Strip_Scan2 = val_Strip_Scan2;
        elseif source == h.Strip_compare_scan2_4
            val_Strip_Scan2 = 4;            
            set(h.Strip_compare_scan2_1,'Value',0)
            set(h.Strip_compare_scan2_2,'Value',0)
            set(h.Strip_compare_scan2_3,'Value',0)
            set(h.Strip_compare_scan2_4,'Value',1)
            h.val_Strip_Scan2 = val_Strip_Scan2;
        end               

        
        if source == h.Strip_compare_scan3_1
            val_Strip_Scan3 = 1;
            set(h.Strip_compare_scan3_1,'Value',1)
            set(h.Strip_compare_scan3_2,'Value',0)
            set(h.Strip_compare_scan3_3,'Value',0)
            set(h.Strip_compare_scan3_4,'Value',0)
            h.val_Strip_Scan3 = val_Strip_Scan3;
        elseif source == h.Strip_compare_scan3_2
            val_Strip_Scan3 = 2;
            set(h.Strip_compare_scan3_1,'Value',0)
            set(h.Strip_compare_scan3_2,'Value',1)
            set(h.Strip_compare_scan3_3,'Value',0)
            set(h.Strip_compare_scan3_4,'Value',0)
            h.val_Strip_Scan3 = val_Strip_Scan3;
        elseif source == h.Strip_compare_scan3_3
            val_Strip_Scan3 = 3;
            set(h.Strip_compare_scan3_1,'Value',0)
            set(h.Strip_compare_scan3_2,'Value',0)
            set(h.Strip_compare_scan3_3,'Value',1)
            set(h.Strip_compare_scan3_4,'Value',0)
            h.val_Strip_Scan3 = val_Strip_Scan3;
        elseif source == h.Strip_compare_scan3_4
            val_Strip_Scan3 = 4;            
            set(h.Strip_compare_scan3_1,'Value',0)
            set(h.Strip_compare_scan3_2,'Value',0)
            set(h.Strip_compare_scan3_3,'Value',0)
            set(h.Strip_compare_scan3_4,'Value',1)
            h.val_Strip_Scan3 = val_Strip_Scan3;
        end
        
        
        if source == h.Strip_compare_scan4_1
            val_Strip_Scan4 = 1;
            set(h.Strip_compare_scan4_1,'Value',1)
            set(h.Strip_compare_scan4_2,'Value',0)
            set(h.Strip_compare_scan4_3,'Value',0)
            set(h.Strip_compare_scan4_4,'Value',0)
            h.val_Strip_Scan4 = val_Strip_Scan4;
        elseif source == h.Strip_compare_scan4_2
            val_Strip_Scan4 = 2;
            set(h.Strip_compare_scan4_1,'Value',0)
            set(h.Strip_compare_scan4_2,'Value',1)
            set(h.Strip_compare_scan4_3,'Value',0)
            set(h.Strip_compare_scan4_4,'Value',0)
            h.val_Strip_Scan4 = val_Strip_Scan4;
        elseif source == h.Strip_compare_scan4_3
            val_Strip_Scan4 = 3;
            set(h.Strip_compare_scan4_1,'Value',0)
            set(h.Strip_compare_scan4_2,'Value',0)
            set(h.Strip_compare_scan4_3,'Value',1)
            set(h.Strip_compare_scan4_4,'Value',0)
            h.val_Strip_Scan4 = val_Strip_Scan4;
        elseif source == h.Strip_compare_scan4_4
            val_Strip_Scan4 = 4;            
            set(h.Strip_compare_scan4_1,'Value',0)
            set(h.Strip_compare_scan4_2,'Value',0)
            set(h.Strip_compare_scan4_3,'Value',0)
            set(h.Strip_compare_scan4_4,'Value',1)
            h.val_Strip_Scan4 = val_Strip_Scan4;
        end
        
        if source == h.Strip_compare_scan_Smooth1 
           Save_Smooth_chk1 = get(h.Strip_compare_scan_Smooth1 ,'Value');
           if Save_Smooth_chk1 ==1
               h.Save_Smooth_chk1 =1;
           else
               h.Save_Smooth_chk1 =0;
           end
        end
            
        if source == h.Strip_compare_scan_Smooth2 
            Save_Smooth_chk2 = get(h.Strip_compare_scan_Smooth2 ,'Value');
           if Save_Smooth_chk2 ==1
               h.Save_Smooth_chk2 =1;
           else
               h.Save_Smooth_chk2 =0;
           end
        end
        if source == h.Strip_compare_scan_Smooth3
            Save_Smooth_chk3 = get(h.Strip_compare_scan_Smooth3 ,'Value');
           if Save_Smooth_chk3 ==1
               h.Save_Smooth_chk3 =1;
           else
               h.Save_Smooth_chk3 =0;
           end
        end
        if source == h.Strip_compare_scan_Smooth4 
            Save_Smooth_chk4 = get(h.Strip_compare_scan_Smooth4 ,'Value');
           if Save_Smooth_chk4 ==1
               h.Save_Smooth_chk4 =1;
           else
               h.Save_Smooth_chk4 =0;
           end
        end


        
    end

% Selection of the Strips to perform scans
    function Strip_Extract_Chk(source,eventdata)
        Strip_Extract = h.Strip_Extract;
        
        if source ==h.Strip_scan_Extract_1
            
            val_Strip_Scan = get(h.Strip_scan_Extract_1,'Value') ;
            if val_Strip_Scan ==1
                Strip_Extract = Strip_Extract + [1 0 0 0];
            elseif val_Strip_Scan ==0
                Strip_Extract = Strip_Extract - [1 0 0 0];
            end
            
        elseif source ==h.Strip_scan_Extract_2            
            val_Strip_Scan = get(h.Strip_scan_Extract_2,'Value') ;
            if val_Strip_Scan ==1
                Strip_Extract = Strip_Extract + [0 2 0 0];
            elseif val_Strip_Scan ==0
                Strip_Extract = Strip_Extract - [0 2 0 0];
            end            
            
        elseif source ==h.Strip_scan_Extract_3
            val_Strip_Scan = get(h.Strip_scan_Extract_3,'Value') ;
            if val_Strip_Scan ==1
                Strip_Extract = Strip_Extract + [0 0 3 0];
            elseif val_Strip_Scan ==0
                Strip_Extract = Strip_Extract - [0 0 3 0];
            end
            
        elseif source ==h.Strip_scan_Extract_4
            
            val_Strip_Scan = get(h.Strip_scan_Extract_4,'Value') ;
            if val_Strip_Scan ==1
                Strip_Extract = Strip_Extract + [0 0 0 4];
            elseif val_Strip_Scan ==0
                Strip_Extract = Strip_Extract - [0 0 0 4];
            end
        end
        h.Strip_Extract = Strip_Extract;
        
    end

% Plots the different strips for the dufferent imagenes
      function name_Picture(source,eventdata)

            Strip = h.Strip;
            Save_Colum_Int1 = h.Save_Colum_Int1;
            Save_Colum_Int2 = h.Save_Colum_Int2;
            Save_Colum_Int3 = h.Save_Colum_Int3;
            Save_Colum_Int4 = h.Save_Colum_Int4;
            
            Save_x_values1 = h.Save_x_values1;
            Save_x_values2 = h.Save_x_values2;
            Save_x_values3 = h.Save_x_values3;
            Save_x_values4 = h.Save_x_values4;
            
            Save_Strip_Int1 = h.Save_Strip_Int1;
            Save_Strip_Int2 = h.Save_Strip_Int2;
            Save_Strip_Int3 = h.Save_Strip_Int3;
            Save_Strip_Int4 = h.Save_Strip_Int4;
            
            Save_Strip_fit1 = h.Save_Strip_fit1;
            Save_Strip_fit2 = h.Save_Strip_fit2;
            Save_Strip_fit3 = h.Save_Strip_fit3;
            Save_Strip_fit4 = h.Save_Strip_fit4;
     
            
            if Strip == [1 0 0 0]
                val_Strip_Scan = 1;
            elseif Strip == [0 2 0 0]
                val_Strip_Scan = 2;
            elseif Strip == [0 0 3 0]
                val_Strip_Scan = 3;
            elseif Strip == [0 0 0 4]
                val_Strip_Scan = 4;
            end
            
            if val_Strip_Scan ==1
                Save_x_values = Save_x_values1(1,:);
                Save_Colum_Int = Save_Colum_Int1(1,:);
                Save_Strip_Int = Save_Strip_Int1(1,:,:); 
                StripRanges= Save_Strip_Int1(1,:,:); 
                Strip_fit = Save_Strip_fit1(1,:,:); 
            elseif val_Strip_Scan ==2
                Save_x_values = Save_x_values2(1,:);
                Save_Colum_Int= Save_Colum_Int2(1,:);
                Save_Strip_Int = Save_Strip_Int2(1,:,:); 
                StripRanges= Save_Strip_Int2(1,:,:); 
                Strip_fit = Save_Strip_fit2(1,:,:); 
            elseif val_Strip_Scan ==3
                Save_x_values = Save_x_values3(1,:);
                Save_Colum_Int = Save_Colum_Int3(1,:);
                Save_Strip_Int= Save_Strip_Int3(1,:,:); 
                StripRanges= Save_Strip_Int3(1,:,:); 
                Strip_fit = Save_Strip_fit3(1,:,:); 
            elseif val_Strip_Scan ==4
                Save_x_values = Save_x_values4(1,:);
                Save_Colum_Int = Save_Colum_Int4(1,:);
                Save_Strip_Int = Save_Strip_Int4(1,:,:);     
                StripRanges= Save_Strip_Int4(1,:,:); 
                Strip_fit = Save_Strip_fit4(1,:,:); 
            end
            
            StripRanges = Save_Strip_Int;
            
            Save_Background = h.Save_Background;
            [tonto,size_Int]=size(StripRanges);
            
            Background = ones(size_Int,1)*Save_Background(val_Strip_Scan,1);
            
            
            
            if h.micro_Check == 1
                micro_val = h.micro_value;
                Save_Colum_Int = Save_Colum_Int * micro_val;
                ColumnRange=Save_Colum_Int * micro_val;
                Save_x_values = Save_x_values * micro_val;            
            else
                Save_Colum_Int = Save_Colum_Int;
                ColumnRange=Save_Colum_Int;
                Save_x_values = Save_x_values;                
            end 
            
            [tonto,size_colum]=size(Save_Colum_Int);
            [tonto,size_colum]=size(Save_Colum_Int);
            i_im= h.i_im;
            
%             Save_Strip_fit = h.Save_Strip_fit;
            
            ImageNumbers = h.ImageNumbers;
            
            if source == h.name_Picture
                Picture_Plot = eval(get(h.Picture,'String'));       
            elseif source == h.Picture_Plus
                Picture_Plot = eval(get(h.Picture,'String'));
                Picture_Plot = Picture_Plot+1;
                set(h.Picture,'String',Picture_Plot)
            elseif source == h.Picture_Minus
                Picture_Plot = eval(get(h.Picture,'String'));       
                Picture_Plot = Picture_Plot-1;
                set(h.Picture,'String',Picture_Plot)
            end
                
                
            Picture = Picture_Plot-ImageNumbers(1,1)+1;
            
%             FWHM = h.FWHM;
%             RSquare = h.RSquare;

            h.Picture_number =Picture;
            
            child = get(h.PlotRS_Fig,'Children');
            for i=1:length(child)
                delete(child(i));
            end
                            
                if h.Zoom_In_Act == 1
                    size_StripMin = h.size_StripMin ;
                    size_StripMax= h.size_StripMax;
                    size_ColMin= h.size_ColMin;
                    size_ColMax = h.size_ColMax;
                end
                
            
            val_Strip_Scan = get(h.name_Picture,'Value') ;
            
            Strip_scan = (get(h.Strip_scan,'Value'));
            Strip_scan1 = (get(h.Strip_scan1,'Value'));
            Strip_scan2 = (get(h.Strip_scan2,'Value'));
            Strip_scan3 = (get(h.Strip_scan3,'Value'));
            
             child = get(h.ExtractS_Fig,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            axes(h.ExtractS_Fig)
            min_I =eval(get(h.min_I, 'String'));
            max_I = eval(get(h.max_I, 'String'));

           
            
            
            % for i_Strip = 1:N_StripRanges
           ImageNumbers = h.Save_number_Image;
           
           Folder = get(h.Folder,'String');
           
           name_Folder = strcat(Folder,'/s%0.5d');
           
           File = get(h.File,'String');
           
           ScanNumber = eval(get( h.Scan, 'String'));
           name_File = strcat(File,'_%0.3d.tif');
           name_File1 = strcat(File,'_0%0.3d.tiff');
           name_File2 = strcat(File,'_%0.3d.tiff');
                     
           directoryname_Images = sprintf(name_Folder,ScanNumber);   
           directoryname_file = sprintf(name_File,Picture_Plot);  
           directoryname_file1 = sprintf(name_File1,Picture_Plot);  
           directoryname_file2 = sprintf(name_File2,Picture_Plot);  
                      
           filename_Image = sprintf('%s/%s',directoryname_Images,directoryname_file);
           filename_Image1 = sprintf('%s/%s',directoryname_Images,directoryname_file1);
           filename_Image2 = sprintf('%s/%s',directoryname_Images,directoryname_file2);

           
              
                if (exist(filename_Image,'file') == 2)|| (exist(filename_Image1,'file') == 2) || (exist(filename_Image2,'file') == 2)                            
                    
                    if(exist(filename_Image,'file') == 2)
                        andor_image = imread(filename_Image,'tif');
                    elseif(exist(filename_Image1,'file') == 2)
                        andor_image = imread(filename_Image1,'tif');
                    elseif(exist(filename_Image2,'file') == 2)
                        andor_image = imread(filename_Image2,'tif');
                    end
                    
                    fprintf('Loading %s\n',filename_Image);
                    
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
                    
                                   
                    imagesc(andor_image,'Parent',h.ExtractS_Fig);
                    
                    if h.Color_Map == 1
                        colormap winter 
                    elseif h.Color_Map == 0
                        colormap gray
                    elseif h.Color_Map == 2
                        colormap hsv
                    end
                    
                    colorbar   
                    
                    axis ij equal tight
                    if h.Zoom_In_Act == 1
                    
                        Initial_ColMin = eval(get(h.Size_ColMin,'String'));
                        Initial_ColMax = eval(get(h.Size_ColMax,'String'));
                        Initial_StripMin = eval(get(h.Size_StripMin,'String'));
                        Initial_StripMax = eval(get(h.Size_StripMax,'String'));
                        
                        andor_image = imcrop(andor_image,[Initial_StripMin Initial_ColMin Initial_StripMax Initial_ColMax]);   
                        
                    end
                    
                    min_Contrast_I = eval(get(h.min_Contrast_I,'String'));
                    max_Contrast_I = eval(get(h.max_Contrast_I,'String'));
                
                    andor_image_ave = imadjust(andor_image,stretchlim(andor_image),[min_Contrast_I max_Contrast_I]);
                    
                    Stretchlim = stretchlim(andor_image_ave);
                    Stretchlim_Min = num2str(Stretchlim(1,1));
                    Stretchlim_Max = num2str(Stretchlim(2,1));                    
                    h.Stretchlim = Stretchlim;                    
                    set(h.min_Contrast_I,'String',Stretchlim_Min);
                    set(h.max_Contrast_I,'String',Stretchlim_Max);
                    
                    imagesc(andor_image_ave,'Parent',h.ExtractS_Fig);
                    title(sprintf('F7: Scan %d',ScanNumber));
                    colorbar
                    
                end

               
               
               
%                if h.Save_multi_yes == 1
%                    x_values_multi = h.Save_x_values_multi;
%                    y_values_multi = h.Save_y_values_multi;
%                    
% 
%                    axes(h.PlotRS_Fig)
%                    plot(Save_Colum_Int(1,:),Save_Strip_Int(1,:,Picture),'Parent',h.PlotRS_Fig)
%                    hold on
% 
%                    x_values(1,:)= x_values_multi(1,:);
%                    plot(x_values,Save_Strip_fit(1,:,Picture),'Parent', h.PlotRS_Fig,'Color','r','LineStyle',':');   
% 
%                    if h.Gaussian_Check ==0
%                        switch h.Number_MultiGauss_val
%                            case 1
%                                
%                                x_values(1,:)= x_values_multi(1,:);
%                                y_values(1,:) = y_values_multi(1,:);                         
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','g','LineStyle','-.');   
%                                
%                            case 2                             
%                                
%                                x_values(1,:)= x_values_multi(1,:);
%                                y_values(1,:) = y_values_multi(1,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','g','LineStyle','-.');  
%                                
%                                y_values(1,:) = y_values_multi(2,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','y','LineStyle','--');   
%                            case 3
%                                
%                                x_values(1,:)= x_values_multi(1,:);
%                                y_values(1,:) = y_values_multi(1,:);                         
%                                plot(x_values,y_values ,'Parent', h.PlotRS_Fig,'Color','g','LineStyle','-.');  
%                                
%                                y_values(1,:) = y_values_multi(2,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','y','LineStyle','--');
%                                                               
%                                y_values(1,:) = y_values_multi(3,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','c','LineStyle','-.');
%                                
%                            case 4  
%                                hold on
%                                x_values(1,:)= x_values_multi(1,:);
%                                y_values(1,:) = y_values_multi(1,:);                        
%                                plot(x_values,y_values ,'Parent', h.PlotRS_Fig,'Color','g','LineStyle','-.');  
%                                                   pause (1)
%                                y_values(1,:) = y_values_multi(2,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','y','LineStyle','--');   
%                                                   pause (1)
%                                y_values(1,:) = y_values_multi(3,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','c','LineStyle','-.');
%                                                                      pause (1)            
%                                y_values(1,:) = y_values_multi(4,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','k','LineStyle','--');
%                                                   pause (1)
%                            case 5
%                                
%                                x_values(1,:)= x_values_multi(1,:);
%                                y_values(1,:) = y_values_multi(1,:);                            
%                                plot(x_values,y_values ,'Parent', h.PlotRS_Fig,'Color','g','LineStyle','-.');
%                                
%                                y_values(1,:) = y_values_multi(2,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','y','LineStyle','--');
%                                
%                                y_values(1,:) = y_values_multi(3,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','c','LineStyle','-.');
%                                
%                                y_values(1,:) = y_values_multi(4,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','k','LineStyle','--');
%  
%                                y_values(1,:) = y_values_multi(5,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','m','LineStyle','-.');                               
%                            case 6
%                                
%                                
%                                x_values(1,:)= x_values_multi(1,:);
%                                y_values(1,:) = y_values_multi(1,:);                            
%                                plot(x_values,y_values ,'Parent', h.PlotRS_Fig,'Color','g','LineStyle','-.');
%                                
%                                y_values(1,:) = y_values_multi(2,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','y','LineStyle','--');
%                                
%                                y_values(1,:) = y_values_multi(3,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','c','LineStyle','-.');
%                                
%                                y_values(1,:) = y_values_multi(4,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','k','LineStyle','--');
%  
%                                y_values(1,:) = y_values_multi(5,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','m','LineStyle','-.');
%                              
%                                y_values(1,:) = y_values_multi(6,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','r','LineStyle','--');
%                                
%                            case 7            
%                                
%                                x_values(1,:)= x_values_multi(1,:);
%                                y_values(1,:) = y_values_multi(1,:);                            
%                                plot(x_values,y_values ,'Parent', h.PlotRS_Fig,'Color','g','LineStyle','-.');
%                                
%                                y_values(1,:) = y_values_multi(2,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','y','LineStyle','--');
%                                
%                                y_values(1,:) = y_values_multi(3,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','c','LineStyle','-.');
%                                
%                                y_values(1,:) = y_values_multi(4,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','k','LineStyle','--');
%  
%                                y_values(1,:) = y_values_multi(5,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','m','LineStyle','-.');
%                              
%                                y_values(1,:) = y_values_multi(6,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','r','LineStyle','--');
%                                
%                                y_values(1,:) = y_values_multi(7,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','b','LineStyle','-.');
%                                
%                            case 8                             
%                                
%                                x_values(1,:)= x_values_multi(1,:);
%                                y_values(1,:) = y_values_multi(1,:);                            
%                                plot(x_values,y_values ,'Parent', h.PlotRS_Fig,'Color','g','LineStyle','-.');
%                                
%                                y_values(1,:) = y_values_multi(2,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','y','LineStyle','--');
%                                
%                                y_values(1,:) = y_values_multi(3,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','c','LineStyle','-.');
%                                
%                                y_values(1,:) = y_values_multi(4,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','k','LineStyle','--');
%  
%                                y_values(1,:) = y_values_multi(5,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','m','LineStyle','-.');
%                              
%                                y_values(1,:) = y_values_multi(6,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','r','LineStyle','--');
%                                
%                                y_values(1,:) = y_values_multi(7,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','b','LineStyle','-.');
%                                
%                                y_values(1,:) = y_values_multi(8,:); 
%                                plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','g','LineStyle','--');                             
%                        end
%                    else
%                        
%                        x_values(1,:)= x_values_multi(1,:);
%                        y_values(1,:) = y_values_multi(1,:);                         
%                        plot(x_values,y_values,'Parent', h.PlotRS_Fig,'Color','g','LineStyle','-.');   
%                      
%                  end
%                  
%                else
                   
                   if Strip_scan == 1
                       x_Strip_min = StripRanges(1,1);
                       x_Strip_max = StripRanges(1,2);
                       y_Strip_min = ColumnRange(1,1);                
                       y_Strip_max = ColumnRange(1,2);             
                       

                       drawnow   
                       
                       axes(h.PlotRS_Fig)
                       plot(Save_Colum_Int(1,:),Save_Strip_Int(1,:,Picture),'Parent',h.PlotRS_Fig)
                       hold on                       
                       plot(Save_x_values(1,:),Background(1,:),'Parent', h.PlotRS_Fig,'Color','k','LineStyle','--');
                       plot(Save_x_values,Strip_fit(1,:,Picture),'Parent', h.PlotRS_Fig,'Color','r','LineStyle',':'); 
                       title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(Picture),1,StripRanges(1,1),StripRanges(1,2)),'Parent', h.PlotRS_Fig);
                       
%                        if h.i_Save ==1
%                            set(h.x_Data_Cursor,'String',num2str(FWHM(1,Picture)))
%                            set(h.y_Data_Cursor,'String',num2str(RSquare(1,Picture)))
%                        end
                       
                   elseif Strip_scan1 == 1
                       x_Strip_min = StripRanges(1,1);
                       x_Strip_max = StripRanges(1,2);
                       y_Strip_min = ColumnRange(1,1);                
                       y_Strip_max = ColumnRange(1,2);             
                       
                
                       
                       drawnow   
                       
                       axes(h.PlotRS_Fig)
                       plot(Save_Colum_Int(1,:),Save_Strip_Int(1,:,Picture),'Parent',h.PlotRS_Fig)
                       hold on
                       plot(Save_x_values(1,:),Background(1,:),'Parent', h.PlotRS_Fig,'Color','k','LineStyle','--');
                       plot(Save_x_values,Strip_fit(1,:,Picture),'Parent', h.PlotRS_Fig,'Color','r','LineStyle',':'); 
                       title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(Picture),2,StripRanges(1,1),StripRanges(1,2)),'Parent', h.PlotRS_Fig);                
%                        if h.i_Save ==1
%                            set(h.x_Data_Cursor,'String',num2str(FWHM(2,Picture)))
%                            set(h.y_Data_Cursor,'String',num2str(RSquare(2,Picture)))
%                        end
                       
                   elseif Strip_scan2 == 1
                       x_Strip_min = StripRanges(1,1);
                       x_Strip_max = StripRanges(1,2);
                       y_Strip_min = ColumnRange(1,1);                
                       y_Strip_max = ColumnRange(1,2);             
                       
                 
                       
                       drawnow  
                       
                       axes(h.PlotRS_Fig)
                       plot(Save_Colum_Int(1,:),Save_Strip_Int(1,:,Picture),'Parent',h.PlotRS_Fig)
                       hold on
                       plot(Save_x_values(1,:),Background(1,:),'Parent', h.PlotRS_Fig,'Color','k','LineStyle','--');
                       plot(Save_x_values,Strip_fit(1,:,Picture),'Parent', h.PlotRS_Fig,'Color','r','LineStyle',':'); 
                       title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(Picture),3,StripRanges(1,1),StripRanges(1,2)),'Parent', h.PlotRS_Fig);
%                        if h.i_Save ==1
%                            set(h.x_Data_Cursor,'String',num2str(FWHM(3,Picture)))
%                            set(h.y_Data_Cursor,'String',num2str(RSquare(3,Picture)))
%                        end
                       
                   elseif Strip_scan3 == 1
                       x_Strip_min = StripRanges(1,1);
                       x_Strip_max = StripRanges(1,2);
                       y_Strip_min = ColumnRange(1,1);                
                       y_Strip_max = ColumnRange(1,2);             
                       

                       
                       drawnow  
                       
                       axes(h.PlotRS_Fig)
                       plot(Save_Colum_Int(1,:),Save_Strip_Int(1,:,Picture),'Parent',h.PlotRS_Fig)

                       hold on
                       plot(Save_x_values(1,:),Background(1,:),'Parent', h.PlotRS_Fig,'Color','k','LineStyle','--');
                       plot(Save_x_values,Strip_fit(1,:,Picture),'Parent', h.PlotRS_Fig,'Color','r','LineStyle',':'); 
                       title(sprintf('F2: Image %d, Strip %d, %d - %d pix',ImageNumbers(Picture),4,StripRanges(1,1),StripRanges(1,2)),'Parent', h.PlotRS_Fig);
%                        if h.i_Save ==1
%                            set(h.x_Data_Cursor,'String',num2str(FWHM(4,Picture)))
%                            set(h.y_Data_Cursor,'String',num2str(RSquare(4,Picture)))
%                        end
                   end
%                end
               
               
               set(h.name_Picture,'Value',0)

      end

% Same Value Strip
    function Same_Chk(source,eventdata)
        if source == h.Same_Column
            val_Column = get(h.Same_Column,'Value')  ;
            if val_Column ==1
            ColumnRangeMax1 = get(h.ColumnRangeMax1, 'String');
            ColumnRangeMin1 = get(h.ColumnRangeMin1, 'String');
                        
            set(h.ColumnRangeMax2 ,'String',ColumnRangeMax1); 
            set(h.ColumnRangeMin2,'String',ColumnRangeMin1); 
            
            set(h.ColumnRangeMax3 ,'String',ColumnRangeMax1); 
            set(h.ColumnRangeMin3,'String',ColumnRangeMin1); 
            
            set(h.ColumnRangeMax4 ,'String',ColumnRangeMax1); 
            set(h.ColumnRangeMin4,'String',ColumnRangeMin1); 
            
            set(h.ColumnRangeMax_MB ,'String',ColumnRangeMax1); 
            set(h.ColumnRangeMin_MB,'String',ColumnRangeMin1); 
            
            end

        elseif source == h.Same_Strip
            val_Strip = get(h.Same_Strip,'Value')  ;
            if val_Strip ==1
            StripRangeMax1 = get(h.StripRanges1Max, 'String');
            StripRangeMin1 = get(h.StripRanges1Min, 'String');
                        
            set(h.StripRanges2Max ,'String',StripRangeMax1); 
            set(h.StripRanges2Min,'String',StripRangeMin1); 
            
            set(h.StripRanges3Max ,'String',StripRangeMax1); 
            set(h.StripRanges3Min,'String',StripRangeMin1); 
            
            set(h.StripRanges4Max ,'String',StripRangeMax1); 
            set(h.StripRanges4Min,'String',StripRangeMin1); 
            
            set(h.StripRangesMax_MB ,'String',StripRangeMax1); 
            set(h.StripRangesMin_MB,'String',StripRangeMin1); 
            end
            
            
        elseif source == h.Horizontal_Chk
            val_Strip = get(h.Horizontal_Chk,'Value')  ;
            if val_Strip ==1
                h.Angle_rotation_val = 1;
            else
                h.Angle_rotation_val = 0;
            end

        end
    end


%% Horizontal, Rotates the image to center the beam
    function Fix_Ranges_Horizontal(source,eventdata)
        
        
        child = get(h.ExtractS_Fig,'Children');
        for i=1:length(child)
            delete(child(i));
        end

            
        axes(h.ExtractS_Fig)     
        if source == h.Fix_Ranges_to_Horizontal
            
            min_I =eval(get(h.min_I, 'String'));
            max_I = eval(get(h.max_I, 'String'));
            set(h.Fix_Ranges_to_Horizontal,'Value',0)
            
            ColumnRange = eval(get(h.Col_Horizontal_Width, 'String'));
            RowRange = eval(get(h.Row_Horizontal_Width, 'String'));
            
            StripRanges1x = eval(get(h.Strips_Horizontal_x_1, 'String'));
            StripRanges1y = eval(get(h.Strips_Horizontal_y_1, 'String'));
            StripRanges2x = eval(get(h.Strips_Horizontal_x_2, 'String'));
            StripRanges2y = eval(get(h.Strips_Horizontal_y_2, 'String'));
            StripRanges3x = eval(get(h.Strips_Horizontal_x_3, 'String'));
            StripRanges3y = eval(get(h.Strips_Horizontal_y_3, 'String'));
            StripRanges4x = eval(get(h.Strips_Horizontal_x_4, 'String'));
            StripRanges4y = eval(get(h.Strips_Horizontal_y_4, 'String'));
            StripRanges5x = eval(get(h.Strips_Horizontal_x_5, 'String'));
            StripRanges5y = eval(get(h.Strips_Horizontal_y_5, 'String'));
            StripRanges6x = eval(get(h.Strips_Horizontal_x_6, 'String'));
            StripRanges6y = eval(get(h.Strips_Horizontal_y_6, 'String'));
            StripRanges7x = eval(get(h.Strips_Horizontal_x_7, 'String'));
            StripRanges7y = eval(get(h.Strips_Horizontal_y_7, 'String'));
            StripRanges8x = eval(get(h.Strips_Horizontal_x_8, 'String'));
            StripRanges8y = eval(get(h.Strips_Horizontal_y_8, 'String'));
            StripRanges9x = eval(get(h.Strips_Horizontal_x_9, 'String'));
            StripRanges9y = eval(get(h.Strips_Horizontal_y_9, 'String'));
            StripRanges10x = eval(get(h.Strips_Horizontal_x_10, 'String'));
            StripRanges10y = eval(get(h.Strips_Horizontal_y_10, 'String'));
            StripRanges11x = eval(get(h.Strips_Horizontal_x_11, 'String'));
            StripRanges11y = eval(get(h.Strips_Horizontal_y_11, 'String'));
            StripRanges12x = eval(get(h.Strips_Horizontal_x_12, 'String'));
            StripRanges12y = eval(get(h.Strips_Horizontal_y_12, 'String'));
            
            
            ColumnRange = [StripRanges1y-ColumnRange/2 StripRanges1y+ColumnRange/2;StripRanges2y-ColumnRange/2 StripRanges2y+ColumnRange/2;StripRanges3y-ColumnRange/2 StripRanges3y+ColumnRange/2;StripRanges4y-ColumnRange/2 StripRanges4y+ColumnRange/2;StripRanges5y-ColumnRange/2 StripRanges5y+ColumnRange/2;StripRanges6y-ColumnRange/2 StripRanges6y+ColumnRange/2;StripRanges7y-ColumnRange/2 StripRanges7y+ColumnRange/2;StripRanges8y-ColumnRange/2 StripRanges8y+ColumnRange/2;StripRanges9y-ColumnRange/2 StripRanges9y+ColumnRange/2;StripRanges10y-ColumnRange/2 StripRanges10y+ColumnRange/2;StripRanges11y-ColumnRange/2 StripRanges11y+ColumnRange/2;StripRanges12y-ColumnRange/2 StripRanges12y+ColumnRange/2];
            h.Column_Center = [StripRanges1y;StripRanges2y;StripRanges3y;StripRanges4y;StripRanges5y;StripRanges6y;StripRanges7y;StripRanges8y;StripRanges9y;StripRanges10y;StripRanges11y;StripRanges12y];
            StripRanges = [StripRanges1x-RowRange/2 StripRanges1x+RowRange/2;StripRanges2x-RowRange/2 StripRanges2x+RowRange/2;StripRanges3x-RowRange/2 StripRanges3x+RowRange/2;StripRanges4x-RowRange/2 StripRanges4x+RowRange/2;StripRanges5x-RowRange/2 StripRanges5x+RowRange/2;StripRanges6x-RowRange/2 StripRanges6x+RowRange/2;StripRanges7x-RowRange/2 StripRanges7x+RowRange/2;StripRanges8x-RowRange/2 StripRanges8x+RowRange/2;StripRanges9x-RowRange/2 StripRanges9x+RowRange/2;StripRanges10x-RowRange/2 StripRanges10x+RowRange/2;StripRanges11x-RowRange/2 StripRanges11x+RowRange/2;StripRanges12x-RowRange/2 StripRanges12x+RowRange/2];
            h.Strip_Center = [StripRanges1x;StripRanges2x;StripRanges3x;StripRanges4x;StripRanges5x;StripRanges6x;StripRanges7x;StripRanges8x;StripRanges9x;StripRanges10x;StripRanges11x;StripRanges12x];
            
            h.ColumnRange_Horizontal = ColumnRange;
            h.StripRanges_Horizontal =StripRanges;
           % for i_Strip = 1:N_StripRanges
           
           Size_ScanF  = eval(get(h.Size_ScanF, 'String'));
           Size_ScanI = eval(get(h.Size_ScanI, 'String'));
           Scan_Horizontal_Image = eval(get(h.Scan_Horizontal_Image, 'String'));
           ImageNumbers = [Size_ScanI : Size_ScanF];
           ScanNumber = eval(get( h.Scan, 'String'));
             
           if h.Zoom_In_Act == 1
               size_StripMin = h.size_StripMin ;
               size_StripMax= h.size_StripMax;
               size_ColMin= h.size_ColMin;
               size_ColMax = h.size_ColMax;
           end
           
           
           Folder = get(h.Folder,'String');
           
           name_Folder = strcat(Folder,'/s%0.4d');
           
           File = get(h.File,'String');
                 
           
           name_File = strcat(File,'_0%0.3d.tif');
           name_File1 = strcat(File,'_0%0.3d.tif');
           name_File2 = strcat(File,'_%0.3d.tiff');
           
           directoryname_Images = sprintf(name_Folder,ScanNumber);   
           directoryname_file = sprintf(name_File,Scan_Horizontal_Image);  
           directoryname_file1 = sprintf(name_File1,Scan_Horizontal_Image);  
           directoryname_file2 = sprintf(name_File2,Scan_Horizontal_Image); 
           
           filename_Image = sprintf('%s/%s',directoryname_Images,directoryname_file);
           filename_Image1 = sprintf('%s/%s',directoryname_Images,directoryname_file1);
            filename_Image2 = sprintf('%s/%s',directoryname_Images,directoryname_file2);
           
           if (exist(filename_Image,'file') == 2) || (exist(filename_Image1,'file') == 2)|| (exist(filename_Image2,'file') == 2)
               
               if (exist(filename_Image,'file') == 2)
                %         fprintf('File %3d found\n',i_im)
               andor_image = imread(filename_Image,'tif');
               fprintf('Loading %s\n',filename_Image);
               
               elseif (exist(filename_Image1,'file') == 2)
                %         fprintf('File %3d found\n',i_im)
               andor_image = imread(filename_Image1,'tif');
               fprintf('Loading %s\n',filename_Image1);
               
               elseif (exist(filename_Image2,'file') == 2)
                %         fprintf('File %3d found\n',i_im)
               andor_image = imread(filename_Image2,'tif');
               fprintf('Loading %s\n',filename_Image2);
               end
               andor_image_initial = andor_image;
               
               
%                Noise_Load = eval(get(h.Noise_Load,'String'));
%                
%                if Noise_Load==0                
%                    h.Noise_sub_on = 0;
%                elseif Noise_Load==1
%                    name_File_Noise = 'bill4_1.tif';
%                    h.Noise_sub_on = 1;
%                elseif Noise_Load==2
%                    name_File_Noise = 'bill4_2.tif';
%                    h.Noise_sub_on = 1;
%                elseif Noise_Load==3
%                    name_File_Noise = 'bill4_3.tif';
%                    h.Noise_sub_on = 1;
%                elseif Noise_Load==4
%                    name_File_Noise = 'bill4_4.tif';
%                    h.Noise_sub_on = 1;
%                elseif Noise_Load==5
%                    name_File_Noise = 'bill4_5.tif';
%                    h.Noise_sub_on = 1;
%                elseif Noise_Load==6
%                    name_File_Noise = 'bill4_6.tif';  
%                    h.Noise_sub_on = 1;
%                elseif Noise_Load==7
%                    name_File_Noise = 'bill4_7.tif'; 
%                    h.Noise_sub_on = 1;
%                elseif Noise_Load==11
%                    name_File_Noise = 'bill4_11.tif';
%                    h.Noise_sub_on = 1;
%                elseif Noise_Load==12
%                    name_File_Noise = 'bill4_12.tif';
%                    h.Noise_sub_on = 1;
%                elseif Noise_Load==13
%                    name_File_Noise = 'bill4_13.tif';
%                    h.Noise_sub_on = 1;
%                elseif Noise_Load==14
%                    name_File_Noise = 'bill4_14.tif';
%                    h.Noise_sub_on = 1;
%                end
%                
%                
%                if Noise_Load==0
%                    
%                else
%                    andor_image_Noise = imread(name_File_Noise,'tif');                   
%                    andor_image =  andor_image - andor_image_Noise;                   
%                end
               
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
                             
               end
               
               
               andor_image_ave = andor_image;
               
               imagesc(andor_image,'Parent',h.ExtractS_Fig);
               [Initial_ColMax,Initial_StripMax,c]=size(andor_image);
               caxis([min_I max_I])       
               
               if h.Color_Map == 1
                   colormap winter 
               elseif h.Color_Map == 0
                   colormap gray
               elseif h.Color_Map == 2
                   colormap hsv
               end
               
               colorbar
               %         min_image = 0;
               %         max_image = max_I;
               axis ij equal tight
               if h.Zoom_In_Act == 1
                   axis([size_StripMin size_StripMax size_ColMin size_ColMax ])   
               end
                title(sprintf('F7: scan%0.3d Image%0.3d',ScanNumber,Scan_Horizontal_Image));
                                    
                min_Contrast_I = eval(get(h.min_Contrast_I,'String'));
                max_Contrast_I = eval(get(h.max_Contrast_I,'String'));
                
                    andor_image_ave = imadjust(andor_image_ave,stretchlim(andor_image_ave),[min_Contrast_I max_Contrast_I]);
                    Stretchlim = stretchlim(andor_image_ave);
                    Stretchlim_Min = num2str(Stretchlim(1,1));
                    Stretchlim_Max = num2str(Stretchlim(2,1));                    
                    h.Stretchlim = Stretchlim;                    
                    set(h.min_Contrast_I,'String',Stretchlim_Min);
                    set(h.max_Contrast_I,'String',Stretchlim_Max);
                    
                    imshow(andor_image_ave)
                    colorbar
               
           end
           
            for i_Strip = 1:12
                x_Strip_min = StripRanges(i_Strip,1);
                x_Strip_max = StripRanges(i_Strip,2);
                y_Strip_min = ColumnRange(i_Strip,1);
                y_Strip_max = ColumnRange(i_Strip,2);                       
                
                rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','y');                     
                
             end
                    
             drawnow
             
             Size_ScanI_string = num2str(Size_ScanI);
             set(h.Picture,'String',Size_ScanI_string)        

             set(h.Size_ColMin,'String',0);
             set(h.Size_ColMax,'String',size(andor_image_initial,1));
             set(h.Size_StripMin,'String',0);
             set(h.Size_StripMax,'String',size(andor_image_initial,2));             
        end
             

    end

    function Load_Scan_Horizontal(source,eventdata)
        child = get(h.ExtractS_Fig,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.PlotS_Result2_Fig,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
            
        axes(h.ExtractS_Fig)
        if source == h.Load_Scan_H
             min_I =eval(get(h.min_I_H, 'String'));
             max_I = eval(get(h.max_I_H, 'String'));
             
             h.min_I_H_val = min_I;
             h.max_I_H_val = max_I;
             
             ScanNumber = eval(get( h.Scan, 'String'));
             Scan_Horizontal_Image = eval(get(h.Scan_Horizontal_Image, 'String'));
           
             
             if h.Zoom_In_Act == 1
                 size_StripMin = h.size_StripMin ;
                 size_StripMax= h.size_StripMax;
                 size_ColMin= h.size_ColMin;
                 size_ColMax = h.size_ColMax;
             end
           
           
             Folder = get(h.Folder,'String');
             
             name_Folder = strcat(Folder,'/s%0.4d');
             
             File = get(h.File,'String');
             name_File = strcat(File,'_0%0.3d.tif');
             name_File1 = strcat(File,'_0%0.3d.tif');
             name_File2 = strcat(File,'_%0.3d.tiff');
             
             directoryname_Images = sprintf(name_Folder,ScanNumber);   
             directoryname_file = sprintf(name_File,Scan_Horizontal_Image);  
             directoryname_file1 = sprintf(name_File1,Scan_Horizontal_Image);  
             directoryname_file2 = sprintf(name_File2,Scan_Horizontal_Image); 
             
             filename_Image = sprintf('%s/%s',directoryname_Images,directoryname_file);
             filename_Image1 = sprintf('%s/%s',directoryname_Images,directoryname_file1);
             filename_Image2 = sprintf('%s/%s',directoryname_Images,directoryname_file2);
             
             if (exist(filename_Image,'file') == 2) || (exist(filename_Image1,'file') == 2)|| (exist(filename_Image2,'file') == 2)
                 
                 if (exist(filename_Image,'file') == 2)                     
                     andor_image = imread(filename_Image,'tif');
                     fprintf('Loading %s\n',filename_Image);
                     
                 elseif (exist(filename_Image1,'file') == 2)
                     andor_image = imread(filename_Image1,'tif');
                     fprintf('Loading %s\n',filename_Image1);
                     
                 elseif (exist(filename_Image2,'file') == 2)                     
                     andor_image = imread(filename_Image2,'tif');
                     fprintf('Loading %s\n',filename_Image2);
                 end
                 
                 andor_image_ave = andor_image;
                 
                 Angle_Horizontal=eval(get(h.AngleHorizontal,'String'));
                 h.Angle_Horizontal = Angle_Horizontal;
                 andor_image = imrotate(andor_image,Angle_Horizontal,'bilinear','crop');
                 
                 
                 Initial_ColMin = eval(get(h.Size_ColMin,'String'));
                 Initial_ColMax = eval(get(h.Size_ColMax,'String'));
                 Initial_StripMin = eval(get(h.Size_StripMin,'String'));
                 Initial_StripMax = eval(get(h.Size_StripMax,'String'));
                 
                 andor_image = imcrop(andor_image,[Initial_StripMin Initial_ColMin Initial_StripMax Initial_ColMax]);                    
                 
                 imagesc(andor_image,'Parent',h.ExtractS_Fig);
                 

                 
                 %min_image = 0;
                 %max_image = max_I;
                 
                 axis ij equal tight
                 
                 if h.Zoom_In_Act == 1
                     axis([size_StripMin size_StripMax size_ColMin size_ColMax ])   
                 end
                 %caxis([min_I max_I])
                 
                 title(sprintf('F7: bill4_%0.3d',ScanNumber));     
                 
                 min_Contrast_I = eval(get(h.min_Contrast_I,'String'));                    
                 max_Contrast_I = eval(get(h.max_Contrast_I,'String'));
                 
                 andor_image_ave = imadjust(andor_image,stretchlim(andor_image),[min_Contrast_I max_Contrast_I]);
                 
                 Stretchlim = stretchlim(andor_image_ave);
                 Stretchlim_Min = num2str(Stretchlim(1,1));
                 Stretchlim_Max = num2str(Stretchlim(2,1));                    
                 h.Stretchlim = Stretchlim; 
                 set(h.min_Contrast_I,'String',Stretchlim_Min);
                 set(h.max_Contrast_I,'String',Stretchlim_Max);
                 imshow(andor_image_ave)
                 
                 if h.Color_Map == 1
                     colormap winter
                 elseif h.Color_Map == 2
                     colormap hsv
                 elseif h.Color_Map == 0
                     colormap gray
                 end
                 colorbar
                 axes(h.PlotS_Result2_Fig)
                 imhist(andor_image_ave)
                 
                 h.Initial_ColMin = Initial_ColMin;
                 h.Initial_ColMax = Initial_ColMax;
                 h.Initial_StripMin = Initial_StripMin;
                 h.Initial_StripMax = Initial_StripMax;
                 
             end  
             
        end        
    end

    function Horizontal(source,eventdata)
        
        if source == h.Rest_to_Horizontal 
            
            set(h.Rest_to_Horizontal,'Value',0) 
            
            
            min_I =eval(get(h.min_I_H, 'String'));
            max_I = eval(get(h.max_I_H, 'String'));
            
            h.min_I_H_val = min_I;
            h.max_I_H_val = max_I;
             
            
            ColumnRange = h.ColumnRange_Horizontal;
            StripRanges = h.StripRanges_Horizontal;
            
            ColumnWidth = eval(get(h.Col_Horizontal_Width, 'String'))+1;
            RowWidth = eval(get(h.Row_Horizontal_Width, 'String'))+1;
            
            
            ScanNumber = eval(get(h.Scan,'String'));
            ImageNumbers = eval(get(h.Scan_Horizontal_Image,'String'));
            Scan_Horizontal = eval(get(h.Scan_Horizontal_Image, 'String'));
            
            min_I =eval(get(h.min_I, 'String'));
            max_I = eval(get(h.max_I, 'String'));                    
             
            %%            
            N_images = length(ImageNumbers);
            N_StripRanges = size(StripRanges,1);
            N_ColumnRanges = size(ColumnRange,1);

            %directoryname_Images = sprintf('../../CHESS_April_2015/april2015/Camera_2/S%0.5d',ScanNumber);
            
            axes(h.ExtractS_Fig)
            n_im = 0;
            StripIntensities = zeros(N_images,N_ColumnRanges,RowWidth);
            size(StripIntensities)
            
           Folder = get(h.Folder,'String');
           
           name_Folder = strcat(Folder,'/s%0.4d');
           
           File = get(h.File,'String');
           
           name_File = strcat(File,'_0%0.03d.tif');
                     
           directoryname_Images = sprintf(name_Folder,ScanNumber);   
           directoryname_file = sprintf(name_File,Scan_Horizontal);  
                      
           filename_Image = sprintf('%s/%s',directoryname_Images,directoryname_file);       
               
            if (exist(filename_Image,'file') == 2)
                
                n_im = n_im + 1;
                andor_image = imread(filename_Image,'tif');
                fprintf('Loading %s\n',filename_Image);
                
                if get(h.Load_Noise_Scan_Check,'Value') == 1
                    ScanNumber_Noise = eval(get(h.Noise_Load,'String'));
                    
                    Noise_Load = get(h.Noise_Load_path,'String');
                    name_File_Noise = strcat(Noise_Load,'_0%0.3d.tif')   ;         
                    
                    directoryname_file_Noise = sprintf(name_File_Noise,ScanNumber_Noise);
                    
                    filename_Image_Noise =  sprintf('%s/%s',directoryname_Images,directoryname_file_Noise);           
                    
                    andor_image_Noise = imread(filename_Image_Noise,'tif');                   
                    andor_image =  andor_image - andor_image_Noise;                   
                end
                
                if (n_im == 1)
                    andor_image_ave = andor_image;
                else
                    andor_image_ave = andor_image_ave + andor_image;
                end
                
                imagesc(andor_image,'Parent',h.ExtractS_Fig);
               
                [Initial_ColMax,Initial_StripMax,c]=size(andor_image);  
                
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
                
                andor_image_ave = imadjust(andor_image_ave,stretchlim(andor_image_ave),[min_Contrast_I max_Contrast_I]);
                
                %axis ij equal tight
               % caxis([min_I max_I])
                title(sprintf('F7: scan%0.3d Image%0.3d',ScanNumber,ImageNumbers));
                                
                for i_Strip = 1:N_StripRanges
                    
                    x_Strip_min = StripRanges(i_Strip,1);
                    x_Strip_max = StripRanges(i_Strip,2);
                    y_Strip_min = ColumnRange(i_Strip,1);
                    y_Strip_max = ColumnRange(i_Strip,2);                                        
                   
                    rectangle('Position',[x_Strip_min y_Strip_min x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','g');
                    pause(0.001)
                    t_Sum_Strip = 1;
                    
                    for i_Sum_Strip=y_Strip_min:y_Strip_max
                        sum_andor = andor_image(y_Strip_min:y_Strip_max,x_Strip_min:x_Strip_max);   
                        StripIntensities(n_im,i_Strip,:) = sum(sum_andor,1);                        
                        t_Sum_Strip = t_Sum_Strip +1     ;          
                    end
                    
                pause(0.1)    
                end
                drawnow   
                pause(0.1)
            end
            
            
            
            Delta_x_min = h.min_I_value;
            Delta_x_max = h.max_I_value;
            Delta_x_bg = Delta_x_max;
            
            
            %%
            GaussFunction = fittype('a0*exp(-((x-xcenter)/halfwidth).^2/2)+baseline','independent',{'x'},'coefficients',{'a0','xcenter','halfwidth','baseline'});
            
            InitialWidth_pix = 20;
            
            rsquare_min = 0.2;
            
            
            
            %%
            
            for i_Strip = 1:N_StripRanges
                
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
                
                N_ColumnPixels = StripRanges(i_Strip,2)-StripRanges(i_Strip,1)+1;
                
                StripIntensities_mean = (mean(squeeze(StripIntensities(:,i_Strip,:)),2) )';
                
                Background = mean(StripIntensities_mean([(1:Delta_x_bg) (int16(N_ColumnPixels)-Delta_x_bg:int16(N_ColumnPixels))]));
                
                max_I = 0;                
                YMin = 1.1*max_I;
                YMax = 0.9*Background;
                
                plot((StripRanges(i_Strip,1):StripRanges(i_Strip,2))',squeeze(StripIntensities(1,i_Strip,:)),'Parent', h.PlotS_Result2_Fig,'LineWidth',2,'MarkerSize',2,'Color','b');
                axes(h.PlotS_Result2_Fig)
                title(sprintf('F4: Image %d, Strip %d, %d - %d pix',ImageNumbers,i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Result2_Fig);
                xlabel('Position (um)')
                ylabel('Intentisty (arb units)')
                
                
                
                [max_I_image, index_max_image] = max(StripIntensities(1,i_Strip,:));
                x_values = (StripRanges(i_Strip,1):StripRanges(i_Strip,2));
                x_max = x_values(index_max_image);
                max_I = max(max_I,max_I_image);

                
                
                StartPoints = [max_I-Background, x_max, InitialWidth_pix, Background];

                [FittedFunction,FitQuality] = fit(x_values',squeeze(StripIntensities(1,i_Strip,:)),GaussFunction,'Start', StartPoints);
                FittedCoefficients = coeffvalues(FittedFunction);
                if (FitQuality.rsquare >= rsquare_min)
                    MaxPos_y(i_Strip,1) = FittedCoefficients(2);                    
                end
                
                 axes(h.PlotS_Result2_Fig)
                 hold on
                 plot(x_values,feval(FittedFunction,x_values),'Parent', h.PlotS_Result2_Fig,'Color','r','LineStyle','--');          
                 title(sprintf('F4:  Image %d, Strip %d, %d - %d pix',ImageNumbers,i_Strip,StripRanges(i_Strip,1),StripRanges(i_Strip,2)),'Parent', h.PlotS_Result2_Fig);
                 pause(1)
                 axes(h.PlotS_Result2_Fig)
                 xlabel('Position (um)')
                 
                 ylabel('Intentisty (arb units)')
                 hold off                
        
            end
            
            %Steps
            Column_Center =h.Column_Center;
            Strip_Center = h.Strip_Center;
            MaxPos_x = Column_Center;
            
            i_Maxx = 0;
            for i_Max = 1:size(MaxPos_y)
                if MaxPos_y(i_Max,1) == 0

                else
                    i_Maxx =   i_Maxx +1;
                    MaxPos_y2 (i_Maxx,1)= MaxPos_y (i_Max,1);
                    MaxPos_x2 (i_Maxx,1)= MaxPos_x (i_Max,1);
                end                
            end
            
            i_3 = 1;

           for i_1= 1:i_Maxx
                                
                for i_2 = i_1:i_Maxx
                
                    y(1,i_3) = (MaxPos_y2(i_2,1) - MaxPos_y2(i_1,1))/2;
                    x(1,i_3) = (MaxPos_x2(i_2,1) - MaxPos_x2(i_1,1))/2;
                    
                    i_3 = i_3+1;
                end
            end
            
             y = median(y);
             x = median(x)   ;                   
                      
            Angle_Horizontal= -atan(y/x)*180/pi;
            
            axes(h.ExtractS_Fig)
            B = imrotate(andor_image,Angle_Horizontal,'bilinear','crop');

            imagesc(B,'Parent',h.ExtractS_Fig);
            if h.Color_Map == 1
                colormap winter 
            elseif h.Color_Map == 0
                colormap gray
            elseif h.Color_Map == 2
                colormap hsv
            end
            
            colorbar
            
            axis ij equal tight
            title(sprintf('F7: scan%0.3d Image%0.3d',ScanNumber,ImageNumbers));
            
            Angle_str = num2str(Angle_Horizontal);
            set(h.AngleHorizontal,'String',Angle_str)           
            
            h.Angle_Horizontal= Angle_Horizontal;
            h.Angle_rotation_val = 1;
            
            set(h.Horizontal_Chk,'Value',1)
            

        end
            
            
        
    end

    function Select_Horizontal_positions(source,eventdata)
       
        if source == h.Select_Horizontal_Max
            if get(h.Select_Horizontal_Max, 'Value')==1
                [x_points, y_points] = getpts(h.ExtractS_Fig);
                
                set(h.Strips_Horizontal_x_1,'String',num2str(int16(x_points(1,1))))
                set(h.Strips_Horizontal_x_2,'String',num2str(int16(x_points(2,1))))
                set(h.Strips_Horizontal_x_3,'String',num2str(int16(x_points(3,1))))
                set(h.Strips_Horizontal_x_4,'String',num2str(int16(x_points(4,1))))
                set(h.Strips_Horizontal_x_5,'String',num2str(int16(x_points(5,1))))
                set(h.Strips_Horizontal_x_6,'String',num2str(int16(x_points(6,1))))
                set(h.Strips_Horizontal_x_7,'String',num2str(int16(x_points(7,1))))
                set(h.Strips_Horizontal_x_8,'String',num2str(int16(x_points(8,1))))
                set(h.Strips_Horizontal_x_9,'String',num2str(int16(x_points(9,1))))
                set(h.Strips_Horizontal_x_10,'String',num2str(int16(x_points(10,1))))               
                set(h.Strips_Horizontal_x_11,'String',num2str(int16(x_points(11,1))))               
                set(h.Strips_Horizontal_x_12,'String',num2str(int16(x_points(12,1))))              
                
                set(h.Strips_Horizontal_y_1,'String',num2str(int16(y_points(1,1))))
                set(h.Strips_Horizontal_y_2,'String',num2str(int16(y_points(2,1))))
                set(h.Strips_Horizontal_y_3,'String',num2str(int16(y_points(3,1))))
                set(h.Strips_Horizontal_y_4,'String',num2str(int16(y_points(4,1))))
                set(h.Strips_Horizontal_y_5,'String',num2str(int16(y_points(5,1))))
                set(h.Strips_Horizontal_y_6,'String',num2str(int16(y_points(6,1))))
                set(h.Strips_Horizontal_y_7,'String',num2str(int16(y_points(7,1))))
                set(h.Strips_Horizontal_y_8,'String',num2str(int16(y_points(8,1))))
                set(h.Strips_Horizontal_y_9,'String',num2str(int16(y_points(9,1))))
                set(h.Strips_Horizontal_y_10,'String',num2str(int16(y_points(10,1))))               
                set(h.Strips_Horizontal_y_11,'String',num2str(int16(y_points(11,1))))               
                set(h.Strips_Horizontal_y_12,'String',num2str(int16(y_points(12,1))))              
            end
           
       end
    end
   
%% Save Scan & Load
    function Save_Scans_Values(source,eventdata)
        
        if source == h.Save_values_scan
            get(h.Save_values_scan,'Value');
            ScanNumber = h.Scan_number_save;
            directoryname_Images =h.directoryname_Images;
            
            Save_Area = h.Save_Area;
            Save_Peak = h.Save_Peak;
            Save_Widths = h.Save_Widths;
            
            if h.Smooth ==1
                Save_Area_Smooth = h.Save_Area_Smooth;
                Save_Peak_Smooth = h.Save_Peak_Smooth;
                Save_Widths_Smooth = h.Save_Widths_Smooth;
                Save_FitValid_Smooth = h.Save_FitValid_Smooth;
                Save_Peak_Manu_Smooth = h.Save_Peak_Manu_Smooth;
            end
            
            Save_number_Image = h.Save_number_Image;
            Save_Background = h.Save_Background;

            
            Save_FitValid = h.Save_FitValid;
            Save_Peak_Manu = h.Save_Peak_Manu;
            Save_Error = h.Save_Error;
            Save_i_im = h.Save_i_im;
            Save_StripRanges = h.StripRanges;
            Save_ImageNumbers = h.ImageNumbers;
            
            FWHM = h.FWHM;
            RSquare = h.RSquare;
            
            Strips_in = [0 0 0 0] ;
            
            Save_ColumnRange_Def = h.ColumnRange;
            Save_StripRange_Def = h.StripRanges;
            
            %ColumnRange = [ColumnRangeMax1 ColumnRangeMin1;ColumnRangeMax2 ColumnRangeMin2;ColumnRangeMax3 ColumnRangeMin3;ColumnRangeMax4 ColumnRangeMin4];
            %StripRanges = [StripRanges1Max StripRanges1Min; StripRanges2Max StripRanges2Min; StripRanges3Max StripRanges3Min; StripRanges4Max StripRanges4Min];            
                   
            if get(h.Strip_scan_Extract_1,'Value') == 1
                Save_Colum_Int1 = h.Save_Colum_Int1;
                Save_Strip_Int1 = h.Save_Strip_Int1;                
                mean_Strip1 = h.mean_Strip1;
                Save_x_values1 = h.Save_x_values1;
                Save_Strip_fit1 = h.Save_Strip_fit1;     
                if h.Smooth ==1
                    Save_Strip_Smooth_Int1 = h.Save_Strip_Smooth_Int1;                    
                    Save_Strip_Smooth_fit1 = h.Save_Strip_Smooth_fit1;     
                end
                
                limits_strip = sprintf('Column%0.3d_%0.3d_Raw%0.3d_%0.3d',Save_ColumnRange_Def(1,1),Save_ColumnRange_Def(1,2),Save_StripRange_Def(1,1),Save_StripRange_Def(1,2));
                filename_Output = sprintf('%s/Save_all_1_%s.mat',directoryname_Images,limits_strip);    
                filename_Output1 = sprintf('%s/Save_all_1.mat',directoryname_Images); 
                
                if h.Smooth == 1
                    save(filename_Output,'Save_Area','Save_Colum_Int1','Save_Strip_Int1','mean_Strip1','Save_number_Image','Save_Background','Save_x_values1','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit1','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int1','Save_Strip_Smooth_fit1','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');
                    save(filename_Output1,'Save_Area','Save_Colum_Int1','Save_Strip_Int1','mean_Strip1','Save_number_Image','Save_Background','Save_x_values1','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit1','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int1','Save_Strip_Smooth_fit1','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');
                else
                    save(filename_Output,'Save_Area','Save_Colum_Int1','Save_Strip_Int1','mean_Strip1','Save_number_Image','Save_Background','Save_x_values1','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit1','FWHM','RSquare','Save_Error','Save_FitValid');
                    save(filename_Output1,'Save_Area','Save_Colum_Int1','Save_Strip_Int1','mean_Strip1','Save_number_Image','Save_Background','Save_x_values1','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit1','FWHM','RSquare','Save_Error','Save_FitValid');
                end
                
                Strips_in = Strips_in +[1 0 0 0] ;
            end
            if get(h.Strip_scan_Extract_2,'Value') == 1
                Save_Colum_Int2 = h.Save_Colum_Int2;
                Save_Strip_Int2 = h.Save_Strip_Int2;
                mean_Strip2 = h.mean_Strip2;
                Save_x_values2 = h.Save_x_values2;
                Save_Strip_fit2 = h.Save_Strip_fit2;
                
                if h.Smooth ==1
                    Save_Strip_Smooth_Int2 = h.Save_Strip_Smooth_Int2;
                    Save_Strip_Smooth_fit2 = h.Save_Strip_Smooth_fit2;
                end
                
                limits_strip = sprintf('Column%0.3d_%0.3d_Raw%0.3d_%0.3d',Save_ColumnRange_Def(2,1),Save_ColumnRange_Def(2,2),Save_StripRange_Def(2,1),Save_StripRange_Def(2,2));                
                filename_Output = sprintf('%s/Save_all_2_%s.mat',directoryname_Images,limits_strip); 
                filename_Output1 = sprintf('%s/Save_all_2.mat',directoryname_Images);
                
                if h.Smooth == 1
                    save(filename_Output,'Save_Area','Save_Colum_Int2','Save_Strip_Int2','mean_Strip2','Save_number_Image','Save_Background','Save_x_values2','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit2','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int2','Save_Strip_Smooth_fit2','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');
                    save(filename_Output1,'Save_Area','Save_Colum_Int2','Save_Strip_Int2','mean_Strip2','Save_number_Image','Save_Background','Save_x_values2','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit2','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int2','Save_Strip_Smooth_fit2','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');
                else
                    save(filename_Output,'Save_Area','Save_Colum_Int2','Save_Strip_Int2','mean_Strip2','Save_number_Image','Save_Background','Save_x_values2','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit2','FWHM','RSquare','Save_Error','Save_FitValid');
                    save(filename_Output1,'Save_Area','Save_Colum_Int2','Save_Strip_Int2','mean_Strip2','Save_number_Image','Save_Background','Save_x_values2','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit2','FWHM','RSquare','Save_Error','Save_FitValid');
                end
                Strips_in = Strips_in +[0 2 0 0] ;
            end
            if get(h.Strip_scan_Extract_3,'Value') == 1
                Save_Colum_Int3 = h.Save_Colum_Int3;
                Save_Strip_Int3 = h.Save_Strip_Int3;
                mean_Strip3 = h.mean_Strip3;
                Save_x_values3 = h.Save_x_values3;
                Save_Strip_fit3 = h.Save_Strip_fit3;
                
                if h.Smooth ==1
                    Save_Strip_Smooth_Int3 = h.Save_Strip_Smooth_Int3;
                    Save_Strip_Smooth_fit3 = h.Save_Strip_Smooth_fit3;
                end
                
                limits_strip = sprintf('Column%0.3d_%0.3d_Raw%0.3d_%0.3d',Save_ColumnRange_Def(3,1),Save_ColumnRange_Def(3,2),Save_StripRange_Def(3,1),Save_StripRange_Def(3,2));                
                filename_Output = sprintf('%s/Save_all_3_%s.mat',directoryname_Images,limits_strip); 
                filename_Output1 = sprintf('%s/Save_all_3.mat',directoryname_Images); 
                
                if h.Smooth == 1
                    save(filename_Output,'Save_Area','Save_Colum_Int3','Save_Strip_Int3','mean_Strip3','Save_number_Image','Save_Background','Save_x_values3','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit3','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int3','Save_Strip_Smooth_fit3','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');
                    save(filename_Output1,'Save_Area','Save_Colum_Int3','Save_Strip_Int3','mean_Strip3','Save_number_Image','Save_Background','Save_x_values3','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit3','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int3','Save_Strip_Smooth_fit3','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');
                else
                    save(filename_Output,'Save_Area','Save_Colum_Int3','Save_Strip_Int3','mean_Strip3','Save_number_Image','Save_Background','Save_x_values3','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit3','FWHM','RSquare','Save_Error','Save_FitValid');
                    save(filename_Output1,'Save_Area','Save_Colum_Int3','Save_Strip_Int3','mean_Strip3','Save_number_Image','Save_Background','Save_x_values3','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit3','FWHM','RSquare','Save_Error','Save_FitValid');
                end
                
                Strips_in = Strips_in +[0 0 3 0] ;
            end
            if get(h.Strip_scan_Extract_4,'Value') == 1
                Save_Colum_Int4 = h.Save_Colum_Int4;
                Save_Strip_Int4 = h.Save_Strip_Int4;
                mean_Strip4 = h.mean_Strip4;
                Save_x_values4 = h.Save_x_values4;
                Save_Strip_fit4 = h.Save_Strip_fit4;
                
                if h.Smooth ==1
                    Save_Strip_Smooth_Int4 = h.Save_Strip_Smooth_Int4;
                    Save_Strip_Smooth_fit4 = h.Save_Strip_Smooth_fit4;
                end
                
                limits_strip = sprintf('Column%0.3d_%0.3d_Raw%0.3d_%0.3d',Save_ColumnRange_Def(4,1),Save_ColumnRange_Def(4,2),Save_StripRange_Def(4,1),Save_StripRange_Def(4,2));
                filename_Output = sprintf('%s/Save_all_4_%s.mat',directoryname_Images,limits_strip);  
                filename_Output1 = sprintf('%s/Save_all_4.mat',directoryname_Images);                  
                
                if h.Smooth == 1
                    save(filename_Output,'Save_Area','Save_Colum_Int4','Save_Strip_Int4','mean_Strip4','Save_number_Image','Save_Background','Save_x_values4','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit4','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int4','Save_Strip_Smooth_fit4','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');
                    save(filename_Output1,'Save_Area','Save_Colum_Int4','Save_Strip_Int4','mean_Strip4','Save_number_Image','Save_Background','Save_x_values4','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit4','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int4','Save_Strip_Smooth_fit4','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');
                else
                    save(filename_Output,'Save_Area','Save_Colum_Int4','Save_Strip_Int4','mean_Strip4','Save_number_Image','Save_Background','Save_x_values4','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit4','FWHM','RSquare','Save_Error','Save_FitValid');
                    save(filename_Output1,'Save_Area','Save_Colum_Int4','Save_Strip_Int4','mean_Strip4','Save_number_Image','Save_Background','Save_x_values4','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit4','FWHM','RSquare','Save_Error','Save_FitValid');
                end
                
                Strips_in = Strips_in +[0 0 0 4] ;
            end
            
            filename_Output1 = sprintf('%s/Save_all_new.mat',directoryname_Images);
            i_Save = 1;            
            Save_Smooth = h.Smooth;
            save(filename_Output1,'i_Save','Strips_in','Save_ColumnRange_Def','Save_StripRange_Def','Save_Smooth');
            set(h.Save_values_scan,'Value', 0)
            
        end
    end

    function Load_Scans_Values(source,eventdata)
        
        if source == h.Load_values_scan
            clear all
            
            get(h.Load_values_scan,'Value');            
            
            Folder = get(h.Folder,'String');
            
            name_Folder = strcat(Folder,'/s%0.4d');
            
            File = get(h.File,'String');
            
            name_File = strcat(File,'_%0.3d.tif');
            ScanNumber = eval(get(h.Scan_number_load,'String'));
            
            directoryname_Images = sprintf(name_Folder,ScanNumber);  
            
            
            h.Scan_number_save = ScanNumber;
            
            h.directoryname_Images =directoryname_Images;
            
            filename_Output1 = sprintf('%s/Save_all_new.mat',directoryname_Images);
            load(filename_Output1,'i_Save','Strips_in','Save_ColumnRange_Def','Save_StripRange_Def','Save_Smooth');
            
            h.i_Save = i_Save;
            
            h.Save_Smooth = Save_Smooth;
            
            if Strips_in (1,1) == 1
               h.Strip1= 1;
               
            else
                h.Strip1= 0;
            end
            
            if Strips_in (1,2) == 2
                h.Strip2= 1; 
            else
                h.Strip2= 0;
            end
            
            if Strips_in (1,3) == 3
                h.Strip3= 1; 
            else
                h.Strip3= 0;
            end
                        
            if Strips_in (1,4) == 4
                h.Strip4= 1;
            else
                h.Strip4= 0;
            end
                
            
            if h.Strip1== 1
                filename_Output = sprintf('%s/Save_all_1.mat',directoryname_Images);
                %load(filename_Output,'Save_Area','Save_Peak','Save_Widths','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_Strip_fit','Save_x_values','Save_FitValid','Save_Peak_Manu','Save_Error','Save_i_im','Save_StripRanges','Save_ImageNumbers','FWHM','RSquare');
                %load(filename_Output,'Save_Area','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_x_values','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers');
                if Save_Smooth ==1
                    load(filename_Output,'Save_Area','Save_Colum_Int1','Save_Strip_Int1','mean_Strip1','Save_number_Image','Save_Background','Save_x_values1','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit1','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int1','Save_Strip_Smooth_fit1','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');
                else
                     load(filename_Output,'Save_Area','Save_Colum_Int1','Save_Strip_Int1','mean_Strip1','Save_number_Image','Save_Background','Save_x_values1','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit1','FWHM','RSquare','Save_Error','Save_FitValid');
                end
                h.Save_Colum_Int1 = Save_Colum_Int1;
                h.Save_Strip_Int1 = Save_Strip_Int1;
                h.mean_Strip1 = mean_Strip1;
                h.Save_x_values1 = Save_x_values1;
                h.Save_Strip_fit1 = Save_Strip_fit1;
                h.Save_Smooth = Save_Smooth;
                if h.Save_Smooth == 1
                    h.Save_Strip_Smooth_Int1 = Save_Strip_Smooth_Int1;
                    h.Save_Strip_Smooth_fit1 = Save_Strip_Smooth_fit1;
                end
            end
            if h.Strip2 == 1
                filename_Output = sprintf('%s/Save_all_2.mat',directoryname_Images);
                %load(filename_Output,'Save_Area','Save_Peak','Save_Widths','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_Strip_fit','Save_x_values','Save_FitValid','Save_Peak_Manu','Save_Error','Save_i_im','Save_StripRanges','Save_ImageNumbers','FWHM','RSquare');
                %load(filename_Output,'Save_Area','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_x_values','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers');
                if Save_Smooth ==1
                    load(filename_Output,'Save_Area','Save_Colum_Int2','Save_Strip_Int2','mean_Strip2','Save_number_Image','Save_Background','Save_x_values2','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit2','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int2','Save_Strip_Smooth_fit2','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');
                else
                    load(filename_Output,'Save_Area','Save_Colum_Int2','Save_Strip_Int2','mean_Strip2','Save_number_Image','Save_Background','Save_x_values2','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit2','FWHM','RSquare','Save_Error','Save_FitValid');
                end
                h.Save_Colum_Int2 = Save_Colum_Int2;
                h.Save_Strip_Int2 = Save_Strip_Int2;
                h.mean_Strip2 = mean_Strip2;
                h.Save_x_values2 = Save_x_values2;
                h.Save_Strip_fit2 = Save_Strip_fit2;
                if Save_Smooth ==1
                    h.Save_Strip_Smooth_Int2 = Save_Strip_Smooth_Int2;
                    h.Save_Strip_Smooth_fit2 = Save_Strip_Smooth_fit2;
                end
            end
            
            if h.Strip3 == 1                
                filename_Output = sprintf('%s/Save_all_3.mat',directoryname_Images);
                %load(filename_Output,'Save_Area','Save_Peak','Save_Widths','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_Strip_fit','Save_x_values','Save_FitValid','Save_Peak_Manu','Save_Error','Save_i_im','Save_StripRanges','Save_ImageNumbers','FWHM','RSquare');
                %load(filename_Output,'Save_Area','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_x_values','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers');
                if Save_Smooth ==1
                    load(filename_Output,'Save_Area','Save_Colum_Int3','Save_Strip_Int3','mean_Strip3','Save_number_Image','Save_Background','Save_x_values3','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit3','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int3','Save_Strip_Smooth_fit3','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');                   
                else
                    load(filename_Output,'Save_Area','Save_Colum_Int3','Save_Strip_Int3','mean_Strip3','Save_number_Image','Save_Background','Save_x_values3','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit3','FWHM','RSquare','Save_Error','Save_FitValid');                   
                end
                h.Save_Colum_Int3 = Save_Colum_Int3;
                h.Save_Strip_Int3 = Save_Strip_Int3;
                h.mean_Strip3 = mean_Strip3;
                h.Save_x_values3 = Save_x_values3;
                h.Save_Strip_fit3 = Save_Strip_fit3;
                if Save_Smooth ==1
                    h.Save_Strip_Smooth_Int3 = Save_Strip_Smooth_Int3;
                    h.Save_Strip_Smooth_fit3 = Save_Strip_Smooth_fit3;
                end
            end
            
            if h.Strip4== 1
                filename_Output = sprintf('%s/Save_all_4.mat',directoryname_Images);
                %load(filename_Output,'Save_Area','Save_Peak','Save_Widths','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_Strip_fit','Save_x_values','Save_FitValid','Save_Peak_Manu','Save_Error','Save_i_im','Save_StripRanges','Save_ImageNumbers','FWHM','RSquare');
                %load(filename_Output,'Save_Area','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_x_values','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers');
                if Save_Smooth ==1
                    load(filename_Output,'Save_Area','Save_Colum_Int4','Save_Strip_Int4','mean_Strip4','Save_number_Image','Save_Background','Save_x_values4','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit4','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int4','Save_Strip_Smooth_fit4','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');
                else
                    load(filename_Output,'Save_Area','Save_Colum_Int4','Save_Strip_Int4','mean_Strip4','Save_number_Image','Save_Background','Save_x_values4','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit4','FWHM','RSquare','Save_Error','Save_FitValid');
                end
                h.Save_Colum_Int4 = Save_Colum_Int4;
                h.Save_Strip_Int4 = Save_Strip_Int4;
                h.mean_Strip4 = mean_Strip4;
                h.Save_x_values4 = Save_x_values4;
                h.Save_Strip_fit4 = Save_Strip_fit4;
                if Save_Smooth ==1
                    h.Save_Strip_Smooth_Int4 = Save_Strip_Smooth_Int4;
                    h.Save_Strip_Smooth_fit4 = Save_Strip_Smooth_fit4;
                end
            end
            
            if h.Save_Smooth == 1
                h.Save_Area_Smooth = Save_Area_Smooth;
                h.Save_Peak_Smooth = Save_Peak_Smooth;
                h.Save_Widths_Smooth = Save_Widths_Smooth;
                
                h.Save_FitValid_Smooth = Save_FitValid_Smooth;
                h.Save_Peak_Manu_Smooth = Save_Peak_Manu_Smooth;
            end
            
            h.Save_Area = Save_Area;  
            
            h.Save_Peak = Save_Peak;
            h.Save_Widths = Save_Widths;
            
            h.Save_number_Image = Save_number_Image;
            h.Save_Background = Save_Background;             
            
             h.Save_FitValid = Save_FitValid;
            h.Save_Peak_Manu = Save_Peak_Manu;
             h.Save_Error = Save_Error;
            
           
            h.i_im = Save_i_im;
            h.StripRanges = Save_StripRanges;
            h.ImageNumbers = Save_ImageNumbers ;                        
                       
        elseif source == h.Load_Scan_compare
            
            
            get(h.Load_Scan_compare,'Value');            
            Scan_compare_Check = h.Scan_compare_Check;
            
            if Scan_compare_Check(1,1) == 1  
                
                Folder = get(h.Scan_folder_load_compare1,'String');
                ScanNumber = eval(get(h.Scan_number_load_compare1,'String'));
                
                name_Folder = strcat(Folder,'/s%0.5d');
                
                
                directoryname_Images = sprintf(name_Folder,ScanNumber)   ;
                
                
                h.Scan_number_save = ScanNumber;
                
                h.directoryname_Images =directoryname_Images;
                
                 filename_Output1 = sprintf('%s/Save_all_new.mat',directoryname_Images);
                 load(filename_Output1,'i_Save','Strips_in','Save_ColumnRange_Def','Save_StripRange_Def','Save_Smooth'); 
                 h.Save_Smooth= Save_Smooth;
                 
                 h.i_Save = i_Save;
            
            if Strips_in (1,1) == 1
               h.Strip1= 1;
               
            else
                h.Strip1= 0;
            end
            
            if Strips_in (1,2) == 2
                h.Strip2= 1; 
            else
                h.Strip2= 0;
            end
            
            if Strips_in (1,3) == 3
                h.Strip3= 1; 
            else
                h.Strip3= 0;
            end
                        
            if Strips_in (1,4) == 4
                h.Strip4= 1;
            else
                h.Strip4= 0;
            end
                
                if h.Strip1 == 1
                    filename_Output = sprintf('%s/Save_all_1.mat',directoryname_Images);
                    %load(filename_Output,'Save_Area','Save_Peak','Save_Widths','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_Strip_fit','Save_x_values','Save_FitValid','Save_Peak_Manu','Save_Error','Save_i_im','Save_StripRanges','Save_ImageNumbers','FWHM','RSquare');
                    %load(filename_Output,'Save_Area','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_x_values','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers');
                    if Save_Smooth ==1
                        load(filename_Output,'Save_Area','Save_Colum_Int1','Save_Strip_Int1','mean_Strip1','Save_number_Image','Save_Background','Save_x_values1','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit1','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int1','Save_Strip_Smooth_fit1','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');             
                    else
                        load(filename_Output,'Save_Area','Save_Colum_Int1','Save_Strip_Int1','mean_Strip1','Save_number_Image','Save_Background','Save_x_values1','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit1','FWHM','RSquare','Save_Error','Save_FitValid');             
                    end
                    
                    h.Save_Colum_Int11 = Save_Colum_Int1;
                    h.Save_Strip_Int11 = Save_Strip_Int1;
                    h.mean_Strip11 = mean_Strip1;
                    h.Save_x_values11 = Save_x_values1;
                    h.Save_Strip_fit11 = Save_Strip_fit1;
                    if Save_Smooth ==1
                        h.Save_Strip_Smooth_Int11 = Save_Strip_Smooth_Int1;
                        h.Save_Strip_Smooth_fit11 = Save_Strip_Smooth_fit1;
                    end
                end
                if h.Strip2 == 1
                    filename_Output = sprintf('%s/Save_all_2.mat',directoryname_Images);
                    %load(filename_Output,'Save_Area','Save_Peak','Save_Widths','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_Strip_fit','Save_x_values','Save_FitValid','Save_Peak_Manu','Save_Error','Save_i_im','Save_StripRanges','Save_ImageNumbers','FWHM','RSquare');
                    %load(filename_Output,'Save_Area','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_x_values','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers');                    
                    if Save_Smooth ==1
                        load(filename_Output,'Save_Area','Save_Colum_Int2','Save_Strip_Int2','mean_Strip2','Save_number_Image','Save_Background','Save_x_values2','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit2','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int2','Save_Strip_Smooth_fit2','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');             
                    else
                        load(filename_Output,'Save_Area','Save_Colum_Int2','Save_Strip_Int2','mean_Strip2','Save_number_Image','Save_Background','Save_x_values2','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit2','FWHM','RSquare','Save_Error','Save_FitValid');             
                    end
                    h.Save_Colum_Int12 = Save_Colum_Int2;
                    h.Save_Strip_Int12 = Save_Strip_Int2;
                    h.mean_Strip12 = mean_Strip2;
                    h.Save_x_values12 = Save_x_values2;
                    h.Save_Strip_fit12 = Save_Strip_fit2;
                    if Save_Smooth ==1
                        h.Save_Strip_Smooth_Int12 = Save_Strip_Smooth_Int2;
                        h.Save_Strip_Smooth_fit12 = Save_Strip_Smooth_fit2;
                    end
                end
                
                if h.Strip3 == 1
                    filename_Output = sprintf('%s/Save_all_3.mat',directoryname_Images);
                    %load(filename_Output,'Save_Area','Save_Peak','Save_Widths','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_Strip_fit','Save_x_values','Save_FitValid','Save_Peak_Manu','Save_Error','Save_i_im','Save_StripRanges','Save_ImageNumbers','FWHM','RSquare');
                    %load(filename_Output,'Save_Area','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_x_values','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers');
                    if Save_Smooth ==1
                        load(filename_Output,'Save_Area','Save_Colum_Int3','Save_Strip_Int3','mean_Strip3','Save_number_Image','Save_Background','Save_x_values3','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit3','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int3','Save_Strip_Smooth_fit3','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');
                    else
                        load(filename_Output,'Save_Area','Save_Colum_Int3','Save_Strip_Int3','mean_Strip3','Save_number_Image','Save_Background','Save_x_values3','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit3','FWHM','RSquare','Save_Error','Save_FitValid');
                    end
                    h.Save_Colum_Int13 = Save_Colum_Int3;                    
                    h.Save_Strip_Int13 = Save_Strip_Int3;
                    h.mean_Strip13 = mean_Strip3;
                    h.Save_x_values13 = Save_x_values3;
                    h.Save_Strip_fit13 = Save_Strip_fit3;
                    if Save_Smooth ==1
                        h.Save_Strip_Smooth_Int13 = Save_Strip_Smooth_Int3;
                        h.Save_Strip_Smooth_fit13 = Save_Strip_Smooth_fit3;
                    end
                end
                
                if h.Strip4 == 1
                    filename_Output = sprintf('%s/Save_all_4.mat',directoryname_Images);
                    %load(filename_Output,'Save_Area','Save_Peak','Save_Widths','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_Strip_fit','Save_x_values','Save_FitValid','Save_Peak_Manu','Save_Error','Save_i_im','Save_StripRanges','Save_ImageNumbers','FWHM','RSquare');
                    %load(filename_Output,'Save_Area','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_x_values','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers');
                    if Save_Smooth ==1
                        load(filename_Output,'Save_Area','Save_Colum_Int4','Save_Strip_Int4','mean_Strip4','Save_number_Image','Save_Background','Save_x_values4','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit4','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int4','Save_Strip_Smooth_fit4','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');
                    else
                        load(filename_Output,'Save_Area','Save_Colum_Int4','Save_Strip_Int4','mean_Strip4','Save_number_Image','Save_Background','Save_x_values4','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit4','FWHM','RSquare','Save_Error','Save_FitValid');
                    end
                    h.Save_Colum_Int14 = Save_Colum_Int4;
                    h.Save_Strip_Int14 = Save_Strip_Int4;
                    h.mean_Strip14 = mean_Strip4;
                    h.Save_x_values14 = Save_x_values4;
                    h.Save_Strip_fit14 = Save_Strip_fit4;
                    if Save_Smooth ==1
                        h.Save_Strip_Smooth_Int14 = Save_Strip_Smooth_Int4;
                        h.Save_Strip_Smooth_fit14 = Save_Strip_Smooth_fit4;
                    end
                end
                
                filename_Output1 = sprintf('%s/Save_all_new.mat',directoryname_Images);
                h.Save_Area1 = Save_Area;    
                h.Save_Peak1 = Save_Peak;
                h.Save_Widths1 = Save_Widths;                             
                h.Save_number_Image1 = Save_number_Image;
                h.Save_Background1 = Save_Background;                
                h.Save_FitValid1 = Save_FitValid;
                h.Save_Peak_Manu1 = Save_Peak_Manu;
                h.Save_Error1 = Save_Error;
                
                if h.Save_Smooth == 1
                    h.Save_Area_Smooth1 = Save_Area_Smooth;
                    h.Save_Peak_Smooth1 = Save_Peak_Smooth;
                    h.Save_Widths_Smooth1 = Save_Widths_Smooth;
                    
                    h.Save_FitValid_Smooth1 = Save_FitValid_Smooth;
                    h.Save_Peak_Manu_Smooth1 = Save_Peak_Manu_Smooth;
                end
                
                
                h.i_im1 = Save_i_im;
                h.StripRanges1 = Save_StripRanges;
                h.ImageNumbers1 = Save_ImageNumbers ;
            end 
            
            if Scan_compare_Check(1,2) == 2
                
                Folder = get(h.Scan_folder_load_compare2,'String');
                ScanNumber = eval(get(h.Scan_number_load_compare2,'String'));
  
                
                name_Folder = strcat(Folder,'/s%0.5d');
                                
                directoryname_Images = sprintf(name_Folder,ScanNumber)   ;
                
                h.Scan_number_save = ScanNumber;
                
                h.directoryname_Images =directoryname_Images;
                
                if h.Strip1 == 1
                    filename_Output = sprintf('%s/Save_all_1.mat',directoryname_Images);
                    %load(filename_Output,'Save_Area','Save_Peak','Save_Widths','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_Strip_fit','Save_x_values','Save_FitValid','Save_Peak_Manu','Save_Error','Save_i_im','Save_StripRanges','Save_ImageNumbers','FWHM','RSquare');
                    %load(filename_Output,'Save_Area','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_x_values','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers');
                    if Save_Smooth ==1
                        load(filename_Output,'Save_Area','Save_Colum_Int1','Save_Strip_Int1','mean_Strip1','Save_number_Image','Save_Background','Save_x_values1','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit1','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int1','Save_Strip_Smooth_fit1','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');             
                    else
                        load(filename_Output,'Save_Area','Save_Colum_Int1','Save_Strip_Int1','mean_Strip1','Save_number_Image','Save_Background','Save_x_values1','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit1','FWHM','RSquare','Save_Error','Save_FitValid');             
                    end                    
                    h.Save_Colum_Int21 = Save_Colum_Int1;
                    h.Save_Strip_Int21 = Save_Strip_Int1;
                    h.mean_Strip21 = mean_Strip1;
                    h.Save_x_values21 = Save_x_values1;
                    h.Save_Strip_fit21 = Save_Strip_fit1;                    
                    if Save_Smooth ==1
                        h.Save_Strip_Smooth_Int21 = Save_Strip_Smooth_Int1;
                        h.Save_Strip_Smooth_fit21 = Save_Strip_Smooth_fit1;
                    end
                end
                if h.Strip2== 1
                    filename_Output = sprintf('%s/Save_all_2.mat',directoryname_Images);
                    %load(filename_Output,'Save_Area','Save_Peak','Save_Widths','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_Strip_fit','Save_x_values','Save_FitValid','Save_Peak_Manu','Save_Error','Save_i_im','Save_StripRanges','Save_ImageNumbers','FWHM','RSquare');
                    %load(filename_Output,'Save_Area','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_x_values','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers');
                    if Save_Smooth ==1
                        load(filename_Output,'Save_Area','Save_Colum_Int2','Save_Strip_Int2','mean_Strip2','Save_number_Image','Save_Background','Save_x_values2','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit2','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int2','Save_Strip_Smooth_fit2','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');             
                    else
                        load(filename_Output,'Save_Area','Save_Colum_Int2','Save_Strip_Int2','mean_Strip2','Save_number_Image','Save_Background','Save_x_values2','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit2','FWHM','RSquare','Save_Error','Save_FitValid');             
                    end
                    h.Save_Colum_Int22 = Save_Colum_Int2;
                    h.Save_Strip_Int22 = Save_Strip_Int2;
                    h.mean_Strip22 = mean_Strip2;
                    h.Save_x_values22 = Save_x_values2;
                    h.Save_Strip_fit22 = Save_Strip_fit2;
                    
                    if Save_Smooth ==1
                        h.Save_Strip_Smooth_Int22 = Save_Strip_Smooth_Int2;
                        h.Save_Strip_Smooth_fit22 = Save_Strip_Smooth_fit2;
                    end
                end
                
                if h.Strip3 == 1
                    filename_Output = sprintf('%s/Save_all_3.mat',directoryname_Images);
                    %load(filename_Output,'Save_Area','Save_Peak','Save_Widths','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_Strip_fit','Save_x_values','Save_FitValid','Save_Peak_Manu','Save_Error','Save_i_im','Save_StripRanges','Save_ImageNumbers','FWHM','RSquare');
                    %load(filename_Output,'Save_Area','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_x_values','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers');
                     if Save_Smooth ==1
                        load(filename_Output,'Save_Area','Save_Colum_Int3','Save_Strip_Int3','mean_Strip3','Save_number_Image','Save_Background','Save_x_values3','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit3','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int3','Save_Strip_Smooth_fit3','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');
                    else
                        load(filename_Output,'Save_Area','Save_Colum_Int3','Save_Strip_Int3','mean_Strip3','Save_number_Image','Save_Background','Save_x_values3','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit3','FWHM','RSquare','Save_Error','Save_FitValid');
                     end
                    h.Save_Colum_Int23 = Save_Colum_Int2;
                    h.Save_Strip_Int23 = Save_Strip_Int3;
                    h.mean_Strip23 = mean_Strip3;
                    h.Save_x_values23 = Save_x_values3;
                    h.Save_Strip_fit23 = Save_Strip_fit3;
                    
                    if Save_Smooth ==1
                        h.Save_Strip_Smooth_Int23 = Save_Strip_Smooth_Int3;
                        h.Save_Strip_Smooth_fit23 = Save_Strip_Smooth_fit3;
                    end
                end
                
                if h.Strip4 == 1
                    filename_Output = sprintf('%s/Save_all_4.mat',directoryname_Images);
                    %load(filename_Output,'Save_Area','Save_Peak','Save_Widths','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_Strip_fit','Save_x_values','Save_FitValid','Save_Peak_Manu','Save_Error','Save_i_im','Save_StripRanges','Save_ImageNumbers','FWHM','RSquare');
                    %load(filename_Output,'Save_Area','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_x_values','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers');
                    if Save_Smooth ==1
                        load(filename_Output,'Save_Area','Save_Colum_Int4','Save_Strip_Int4','mean_Strip4','Save_number_Image','Save_Background','Save_x_values4','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit4','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int4','Save_Strip_Smooth_fit4','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');
                    else
                        load(filename_Output,'Save_Area','Save_Colum_Int4','Save_Strip_Int4','mean_Strip4','Save_number_Image','Save_Background','Save_x_values4','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit4','FWHM','RSquare','Save_Error','Save_FitValid');
                    end
                    h.Save_Colum_Int24 = Save_Colum_Int4;
                    h.Save_Strip_Int24 = Save_Strip_Int4;
                    h.mean_Strip24 = mean_Strip4;
                    h.Save_x_values24 = Save_x_values4;
                    h.Save_Strip_fit24 = Save_Strip_fit4;
                    
                    if Save_Smooth ==1
                        h.Save_Strip_Smooth_Int24 = Save_Strip_Smooth_Int4;
                        h.Save_Strip_Smooth_fit24 = Save_Strip_Smooth_fit4;
                    end
                end
                
                filename_Output1 = sprintf('%s/Save_all_new.mat',directoryname_Images);
                
                h.Save_Area2 = Save_Area;    
                h.Save_Peak2 = Save_Peak;
                h.Save_Widths2 = Save_Widths;                
                h.Save_number_Image2 = Save_number_Image;
                h.Save_Background2 = Save_Background;                
                h.Save_FitValid2 = Save_FitValid;
                h.Save_Peak_Manu2 = Save_Peak_Manu;
                h.Save_Error2 = Save_Error;
                h.i_im2 = Save_i_im;
                h.StripRanges2 = Save_StripRanges;
                h.ImageNumbers2 = Save_ImageNumbers ;
                if h.Save_Smooth == 1
                    h.Save_Area_Smooth2 = Save_Area_Smooth;
                    h.Save_Peak_Smooth2 = Save_Peak_Smooth;
                    h.Save_Widths_Smooth2 = Save_Widths_Smooth;
                    
                    h.Save_FitValid_Smooth2 = Save_FitValid_Smooth;
                    h.Save_Peak_Manu_Smooth2 = Save_Peak_Manu_Smooth;
                end
            end
            
            if Scan_compare_Check(1,3) == 3
                
                Folder = get(h.Scan_folder_load_compare3,'String');
                ScanNumber = eval(get(h.Scan_number_load_compare3,'String'));

                
                name_Folder = strcat(Folder,'/s%0.5d');
                                
                directoryname_Images = sprintf(name_Folder,ScanNumber)   ;
                
                
                h.Scan_number_save = ScanNumber;
                
                h.directoryname_Images =directoryname_Images;
                if h.Strip1 == 1
                    filename_Output = sprintf('%s/Save_all_1.mat',directoryname_Images);
                    %load(filename_Output,'Save_Area','Save_Peak','Save_Widths','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_Strip_fit','Save_x_values','Save_FitValid','Save_Peak_Manu','Save_Error','Save_i_im','Save_StripRanges','Save_ImageNumbers','FWHM','RSquare');
                    %load(filename_Output,'Save_Area','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_x_values','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers');
                    if Save_Smooth ==1
                        load(filename_Output,'Save_Area','Save_Colum_Int1','Save_Strip_Int1','mean_Strip1','Save_number_Image','Save_Background','Save_x_values1','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit1','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int1','Save_Strip_Smooth_fit1','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');             
                    else
                        load(filename_Output,'Save_Area','Save_Colum_Int1','Save_Strip_Int1','mean_Strip1','Save_number_Image','Save_Background','Save_x_values1','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit1','FWHM','RSquare','Save_Error','Save_FitValid');             
                    end
                    
                    h.Save_Colum_Int31 = Save_Colum_Int1;
                    h.Save_Strip_Int31 = Save_Strip_Int1;
                    h.mean_Strip31 = mean_Strip1;
                    h.Save_x_values31 = Save_x_values1;
                    h.Save_Strip_fit31 = Save_Strip_fit1;
                    
                    if Save_Smooth ==1
                        h.Save_Strip_Smooth_Int31 = Save_Strip_Smooth_Int1;
                        h.Save_Strip_Smooth_fit31 = Save_Strip_Smooth_fit1;
                    end
                end
                if h.Strip2 == 1
                    filename_Output = sprintf('%s/Save_all_2.mat',directoryname_Images);
                    %load(filename_Output,'Save_Area','Save_Peak','Save_Widths','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_Strip_fit','Save_x_values','Save_FitValid','Save_Peak_Manu','Save_Error','Save_i_im','Save_StripRanges','Save_ImageNumbers','FWHM','RSquare');
                    %load(filename_Output,'Save_Area','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_x_values','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers');                    
                    if Save_Smooth ==1
                        load(filename_Output,'Save_Area','Save_Colum_Int2','Save_Strip_Int2','mean_Strip2','Save_number_Image','Save_Background','Save_x_values2','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit2','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int2','Save_Strip_Smooth_fit2','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');             
                    else
                        load(filename_Output,'Save_Area','Save_Colum_Int2','Save_Strip_Int2','mean_Strip2','Save_number_Image','Save_Background','Save_x_values2','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit2','FWHM','RSquare','Save_Error','Save_FitValid');             
                    end
                    h.Save_Colum_Int32 = Save_Colum_Int2;
                    h.Save_Strip_Int32 = Save_Strip_Int2;
                    h.mean_Strip32 = mean_Strip2;
                    h.Save_x_values32 = Save_x_values2;
                    h.Save_Strip_fit32 = Save_Strip_fit2;
                    
                    if Save_Smooth ==1
                        h.Save_Strip_Smooth_Int32 = Save_Strip_Smooth_Int2;
                        h.Save_Strip_Smooth_fit32 = Save_Strip_Smooth_fit2;
                    end
                end
                
                if h.Strip3 == 1
                    filename_Output = sprintf('%s/Save_all_3.mat',directoryname_Images);
                    %load(filename_Output,'Save_Area','Save_Peak','Save_Widths','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_Strip_fit','Save_x_values','Save_FitValid','Save_Peak_Manu','Save_Error','Save_i_im','Save_StripRanges','Save_ImageNumbers','FWHM','RSquare');
                    %load(filename_Output,'Save_Area','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_x_values','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers');
                     if Save_Smooth ==1
                        load(filename_Output,'Save_Area','Save_Colum_Int3','Save_Strip_Int3','mean_Strip3','Save_number_Image','Save_Background','Save_x_values3','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit3','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int3','Save_Strip_Smooth_fit3','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');
                    else
                        load(filename_Output,'Save_Area','Save_Colum_Int3','Save_Strip_Int3','mean_Strip3','Save_number_Image','Save_Background','Save_x_values3','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit3','FWHM','RSquare','Save_Error','Save_FitValid');
                    end
                    h.Save_Colum_Int33 = Save_Colum_Int3;                    
                    h.Save_Strip_Int33 = Save_Strip_Int3;
                    h.mean_Strip33 = mean_Strip3;
                    h.Save_x_values33 = Save_x_values3;
                    h.Save_Strip_fit33 = Save_Strip_fit3;
                    
                    if Save_Smooth ==1
                        h.Save_Strip_Smooth_Int33 = Save_Strip_Smooth_Int3;
                        h.Save_Strip_Smooth_fit33 = Save_Strip_Smooth_fit3;
                    end
                end
                
                if h.Strip4 == 1
                    filename_Output = sprintf('%s/Save_all_4.mat',directoryname_Images);
                    %load(filename_Output,'Save_Area','Save_Peak','Save_Widths','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_Strip_fit','Save_x_values','Save_FitValid','Save_Peak_Manu','Save_Error','Save_i_im','Save_StripRanges','Save_ImageNumbers','FWHM','RSquare');
                    %load(filename_Output,'Save_Area','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_x_values','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers');
                    if Save_Smooth ==1
                        load(filename_Output,'Save_Area','Save_Colum_Int4','Save_Strip_Int4','mean_Strip4','Save_number_Image','Save_Background','Save_x_values4','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit4','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int4','Save_Strip_Smooth_fit4','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');
                    else
                        load(filename_Output,'Save_Area','Save_Colum_Int4','Save_Strip_Int4','mean_Strip4','Save_number_Image','Save_Background','Save_x_values4','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit4','FWHM','RSquare','Save_Error','Save_FitValid');
                    end
                    h.Save_Colum_Int34 = Save_Colum_Int4;
                    h.Save_Strip_Int34 = Save_Strip_Int4;
                    h.mean_Strip34 = mean_Strip4;
                    h.Save_x_values34 = Save_x_values4;
                    h.Save_Strip_fit34 = Save_Strip_fit4;
                    
                    if Save_Smooth ==1
                        h.Save_Strip_Smooth_Int34 = Save_Strip_Smooth_Int4;
                        h.Save_Strip_Smooth_fit34 = Save_Strip_Smooth_fit4;
                    end
                end
                filename_Output1 = sprintf('%s/Save_all_new.mat',directoryname_Images);
                                
                h.Save_Area3 = Save_Area;    
                h.Save_Peak3 = Save_Peak;
                h.Save_Widths3 = Save_Widths;
                h.Save_number_Image3 = Save_number_Image;
                h.Save_Background3 = Save_Background;                
                h.Save_FitValid3 = Save_FitValid;
                h.Save_Peak_Manu3 = Save_Peak_Manu;
                h.Save_Error3 = Save_Error;
                
                
                h.i_im3 = Save_i_im;
                h.StripRanges3 = Save_StripRanges;
                h.ImageNumbers3 = Save_ImageNumbers;
                
                if h.Save_Smooth == 1
                    h.Save_Area_Smooth3 = Save_Area_Smooth;
                    h.Save_Peak_Smooth3 = Save_Peak_Smooth;
                    h.Save_Widths_Smooth3 = Save_Widths_Smooth;
                    
                    h.Save_FitValid_Smooth3 = Save_FitValid_Smooth;
                    h.Save_Peak_Manu_Smooth3 = Save_Peak_Manu_Smooth;
                end
            end    
            if Scan_compare_Check(1,4) == 4
                
                Folder = get(h.Scan_folder_load_compare4,'String');
                
                ScanNumber = eval(get(h.Scan_number_load_compare4,'String'));

                
                name_Folder = strcat(Folder,'/s%0.5d');
                
                directoryname_Images = sprintf(name_Folder,ScanNumber)   ;                
                
                h.Scan_number_save = ScanNumber;
                
                h.directoryname_Images =directoryname_Images;   
                
                if h.Strip1 == 1                    
                    filename_Output = sprintf('%s/Save_all_1.mat',directoryname_Images);
                    %load(filename_Output,'Save_Area','Save_Peak','Save_Widths','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_Strip_fit','Save_x_values','Save_FitValid','Save_Peak_Manu','Save_Error','Save_i_im','Save_StripRanges','Save_ImageNumbers','FWHM','RSquare');
                    %load(filename_Output,'Save_Area','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_x_values','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers');
                    if Save_Smooth ==1
                        load(filename_Output,'Save_Area','Save_Colum_Int1','Save_Strip_Int1','mean_Strip1','Save_number_Image','Save_Background','Save_x_values1','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit1','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int1','Save_Strip_Smooth_fit1','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');             
                    else
                        load(filename_Output,'Save_Area','Save_Colum_Int1','Save_Strip_Int1','mean_Strip1','Save_number_Image','Save_Background','Save_x_values1','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit1','FWHM','RSquare','Save_Error','Save_FitValid');             
                    end
                    
                    h.Save_Colum_Int41 = Save_Colum_Int1;
                    h.Save_Strip_Int41 = Save_Strip_Int1;
                    h.mean_Strip41 = mean_Strip1;
                    h.Save_x_values41 = Save_x_values1;
                    h.Save_Strip_fit41 = Save_Strip_fit1;
                    
                    if Save_Smooth ==1
                        h.Save_Strip_Smooth_Int41 = Save_Strip_Smooth_Int1;
                        h.Save_Strip_Smooth_fit41 = Save_Strip_Smooth_fit1;
                    end
                end
                if h.Strip2 == 1
                    filename_Output = sprintf('%s/Save_all_2.mat',directoryname_Images);
                    %load(filename_Output,'Save_Area','Save_Peak','Save_Widths','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_Strip_fit','Save_x_values','Save_FitValid','Save_Peak_Manu','Save_Error','Save_i_im','Save_StripRanges','Save_ImageNumbers','FWHM','RSquare');
                    %load(filename_Output,'Save_Area','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_x_values','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers');
                    if Save_Smooth ==1
                        load(filename_Output,'Save_Area','Save_Colum_Int2','Save_Strip_Int2','mean_Strip2','Save_number_Image','Save_Background','Save_x_values2','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit2','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int2','Save_Strip_Smooth_fit2','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');             
                    else
                        load(filename_Output,'Save_Area','Save_Colum_Int2','Save_Strip_Int2','mean_Strip2','Save_number_Image','Save_Background','Save_x_values2','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit2','FWHM','RSquare','Save_Error','Save_FitValid');             
                    end
                    h.Save_Colum_Int42 = Save_Colum_Int2;
                    h.Save_Strip_Int42 = Save_Strip_Int2;
                    h.mean_Strip42 = mean_Strip2;
                    h.Save_x_values42 = Save_x_values2;
                    h.Save_Strip_fit42 = Save_Strip_fit2;
                    
                    if Save_Smooth ==1
                        h.Save_Strip_Smooth_Int42 = Save_Strip_Smooth_Int2;
                        h.Save_Strip_Smooth_fit42 = Save_Strip_Smooth_fit2;
                    end
                end
                
                if h.Strip3 == 1
                    filename_Output = sprintf('%s/Save_all_3.mat',directoryname_Images);
                    %load(filename_Output,'Save_Area','Save_Peak','Save_Widths','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_Strip_fit','Save_x_values','Save_FitValid','Save_Peak_Manu','Save_Error','Save_i_im','Save_StripRanges','Save_ImageNumbers','FWHM','RSquare');
                    %load(filename_Output,'Save_Area','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_x_values','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers');
                    if Save_Smooth ==1
                        load(filename_Output,'Save_Area','Save_Colum_Int3','Save_Strip_Int3','mean_Strip3','Save_number_Image','Save_Background','Save_x_values3','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit3','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int3','Save_Strip_Smooth_fit3','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');
                    else
                        load(filename_Output,'Save_Area','Save_Colum_Int3','Save_Strip_Int3','mean_Strip3','Save_number_Image','Save_Background','Save_x_values3','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit3','FWHM','RSquare','Save_Error','Save_FitValid');
                    end
                    h.Save_Colum_Int43 = Save_Colum_Int3;                    
                    h.Save_Strip_Int43 = Save_Strip_Int3;
                    h.mean_Strip43 = mean_Strip3;
                    h.Save_x_values43 = Save_x_values3;
                    h.Save_Strip_fit43 = Save_Strip_fit3;
                    
                    if Save_Smooth ==1
                        h.Save_Strip_Smooth_Int43 = Save_Strip_Smooth_Int3;
                        h.Save_Strip_Smooth_fit43 = Save_Strip_Smooth_fit3;
                    end
                end
                
                if h.Strip4 == 1
                    filename_Output = sprintf('%s/Save_all_4.mat',directoryname_Images);
                    %load(filename_Output,'Save_Area','Save_Peak','Save_Widths','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_Strip_fit','Save_x_values','Save_FitValid','Save_Peak_Manu','Save_Error','Save_i_im','Save_StripRanges','Save_ImageNumbers','FWHM','RSquare');
                    %load(filename_Output,'Save_Area','Save_Colum_Int','Save_Strip_Int','mean_Strip','Save_number_Image','Save_Background','Save_x_values','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers');
                    if Save_Smooth ==1
                        load(filename_Output,'Save_Area','Save_Colum_Int4','Save_Strip_Int4','mean_Strip4','Save_number_Image','Save_Background','Save_x_values4','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit4','FWHM','RSquare','Save_Error','Save_FitValid','Save_Strip_Smooth_Int4','Save_Strip_Smooth_fit4','Save_FitValid_Smooth','Save_Peak_Manu_Smooth','Save_Area_Smooth','Save_Peak_Smooth','Save_Widths_Smooth');
                    else
                        load(filename_Output,'Save_Area','Save_Colum_Int4','Save_Strip_Int4','mean_Strip4','Save_number_Image','Save_Background','Save_x_values4','Save_Peak_Manu','Save_i_im','Save_StripRanges','Save_ImageNumbers','Save_Peak','Save_Widths','Save_Strip_fit4','FWHM','RSquare','Save_Error','Save_FitValid');
                    end
                    h.Save_Colum_Int44 = Save_Colum_Int4;
                    h.Save_Strip_Int44 = Save_Strip_Int4;
                    h.mean_Strip44 = mean_Strip4;
                    h.Save_x_values44 = Save_x_values4;
                    h.Save_Strip_fit44 = Save_Strip_fit4;
                    
                    if Save_Smooth ==1
                        h.Save_Strip_Smooth_Int44 = Save_Strip_Smooth_Int4;
                        h.Save_Strip_Smooth_fit44 = Save_Strip_Smooth_fit4;
                    end
                end
                
                filename_Output1 = sprintf('%s/Save_all_new.mat',directoryname_Images);
                
                
                h.Save_Area4 = Save_Area;    
                h.Save_Peak4 = Save_Peak;
                h.Save_Widths4 = Save_Widths;                                
                h.Save_number_Image4 = Save_number_Image;
                h.Save_Background4 = Save_Background;
                h.Save_FitValid4 = Save_FitValid;
                h.Save_Peak_Manu4 = Save_Peak_Manu;
                h.Save_Error4 = Save_Error;
                
                
                h.i_im4 = Save_i_im;
                h.StripRanges4 = Save_StripRanges;
                h.ImageNumbers4 = Save_ImageNumbers ;
                
                if h.Save_Smooth == 1
                    h.Save_Area_Smooth4 = Save_Area_Smooth;
                    h.Save_Peak_Smooth4 = Save_Peak_Smooth;
                    h.Save_Widths_Smooth4 = Save_Widths_Smooth;
                    
                    h.Save_FitValid_Smooth4 = Save_FitValid_Smooth;
                    h.Save_Peak_Manu_Smooth4 = Save_Peak_Manu_Smooth;
                end
                
            end
            
            set(h.Load_Scan_compare,'Value', 0)
            Scan_compare_Check = h.Scan_compare_Check;
            
            
        end
    end

    function Scan_Chk (source, eventdata)
        
        if source == h.Scan_compare_Check1
            val_Strip_Scan1 = get(h.Scan_compare_Check1,'Value') ;
            if val_Strip_Scan1 == 1
                h.Scan_compare_Check = h.Scan_compare_Check + [1 0 0 0];
            else
                 h.Scan_compare_Check = h.Scan_compare_Check - [1 0 0 0];
            end
        
        elseif source == h.Scan_compare_Check2
            val_Strip_Scan1 = get(h.Scan_compare_Check2,'Value') ;
            if val_Strip_Scan1 == 1
                h.Scan_compare_Check = h.Scan_compare_Check + [0 2 0 0];
            else
                 h.Scan_compare_Check = h.Scan_compare_Check - [0 2 0 0];
            end
        
        elseif source == h.Scan_compare_Check3
            val_Strip_Scan1 = get(h.Scan_compare_Check3,'Value') ;
            if val_Strip_Scan1 == 1
                h.Scan_compare_Check = h.Scan_compare_Check + [0 0 3 0];
            else
                 h.Scan_compare_Check = h.Scan_compare_Check - [0 0 3 0];
            end
        
        elseif source == h.Scan_compare_Check4
            val_Strip_Scan1 = get(h.Scan_compare_Check4,'Value') ;
            if val_Strip_Scan1 == 1
                h.Scan_compare_Check = h.Scan_compare_Check + [0 0 0 4];
            else
                 h.Scan_compare_Check = h.Scan_compare_Check - [0 0 0 4];
            end
        end    
        if source == h.Scan_compare_Check_micron
            h.Scan_compare_Check_micron_Val = get(h.Scan_compare_Check_micron,'Value');
        end
        
        if source == h.Scan_compare_Check_Energy
            h.Scan_compare_Check_Energy_Val = get(h.Scan_compare_Check_Energy,'Value');
            
        end
    end
   
%% Fix Ranges
    function beam_size_Image(source,eventdata)
        
        if source == h.name_Beam_units_size
            
            
            
            child = get(h.ExtractS_Fig,'Children');
            for i=1:length(child)
                delete(child(i));
            end
          
            
            axes(h.ExtractS_Fig)
            
            ScanNumberString = get( h.Scan, 'String');
            ScanNumber = eval(ScanNumberString);
                                  
            % for i_Strip = 1:N_StripRanges
            Size_ScanF  = eval(get(h.Size_ScanF, 'String'));
            Size_ScanI = eval(get(h.Size_ScanI, 'String'));
            Size_ScanI_Load = eval(get(h.Size_ScanI_Load, 'String'));
            ImageNumbers = [Size_ScanI : Size_ScanF];
            
            Beam_size_image = eval(get(h.Beam_size_image,'string'));
                       
            h.SaveParameter_1 = get(h.Save_Parameter,'Value');

            min_I =eval(get(h.min_I, 'String'));
            max_I = eval(get(h.max_I, 'String'));
            h.min_I_value = min_I;
            h.max_I_value = max_I;
            
            set(h.max_I_H,'String',max_I);
            
            ColumnRangeMax1 = eval(get(h.Col_beam_size_Max, 'String'));
            ColumnRangeMin1 = eval(get(h.Col_beam_size_Min, 'String'));
            
            StripRanges1Max = eval(get(h.Strip_beam_size_Max, 'String'));
            StripRanges1Min = eval(get(h.Strip_beam_size_Min, 'String'));

            
            ColumnRange = [ColumnRangeMax1 ColumnRangeMin1];
            StripRanges = [StripRanges1Max StripRanges1Min];            
            
            h.ColumnRange = ColumnRange;
            h.StripRanges = StripRanges;                
           
                      
           if ScanNumber == h.ScanNumber
           else
               h.Angle_rotation_val = 0;
           end
           h.ScanNumber =ScanNumber;
            
           if h.Zoom_In_Act == 1
               size_StripMin = h.size_StripMin ;
               size_StripMax= h.size_StripMax;
               size_ColMin= h.size_ColMin;
               size_ColMax = h.size_ColMax;
           end
           
           Folder = get(h.Folder,'String');
           
           name_Folder = strcat(Folder,'/s%0.5d');
           
           File = get(h.File,'String');
           
           name_File = strcat(File,'_%0.3d.tif');
                     
           directoryname_Images = sprintf(name_Folder,ScanNumber);   
           directoryname_file = sprintf(name_File,Beam_size_image);  
                      
           filename_Image = sprintf('%s/%s',directoryname_Images,directoryname_file);
           
  
           if (exist(filename_Image,'file') == 2)
               %         fprintf('File %3d found\n',i_im)
               andor_image = imread(filename_Image,'tif');
               fprintf('Loading %s\n',filename_Image);
               
               
               if h.Angle_rotation_val == 1
                   Angle_Horizontal= h.Angle_Horizontal;
                   andor_image = imrotate(andor_image,Angle_Horizontal,'bilinear','crop');         
                   
                   Initial_ColMin = eval(get(h.Size_ColMin,'String'));
                   Initial_ColMax = eval(get(h.Size_ColMax,'String'));
                   Initial_StripMin = eval(get(h.Size_StripMin,'String'));
                   Initial_StripMax = eval(get(h.Size_StripMax,'String'));
                   
                   andor_image = imcrop(andor_image,[Initial_StripMin Initial_ColMin Initial_StripMax Initial_ColMax]);    
               end
               andor_image_ave = andor_image;
               
               imagesc(andor_image,'Parent',h.ExtractS_Fig);
               [Initial_ColMax,Initial_StripMax,c]=size(andor_image);
               caxis([min_I max_I])       
               if h.Color_Map == 1
                   colormap winter 
               elseif h.Color_Map == 0
                   colormap gray
               elseif h.Color_Map == 2
                   colormap hsv
               end
               
               colorbar

               axis ij equal tight
               if h.Zoom_In_Act == 1
                   axis([size_StripMin size_StripMax size_ColMin size_ColMax ])   
               end
                title(sprintf('F7: scan%0.3d Image%0.3d',ScanNumber,Size_ScanI_Load));
                
                min_Contrast_I = eval(get(h.min_Contrast_I,'String'));
                max_Contrast_I = eval(get(h.max_Contrast_I,'String'));
                
                andor_image_ave = imadjust(andor_image_ave,stretchlim(andor_image_ave),[min_Contrast_I max_Contrast_I]);
                Stretchlim = stretchlim(andor_image_ave);
                Stretchlim_Min = num2str(Stretchlim(1,1));
                Stretchlim_Max = num2str(Stretchlim(2,1));                    
                h.Stretchlim = Stretchlim;                    
                set(h.min_Contrast_I,'String',Stretchlim_Min);
                set(h.max_Contrast_I,'String',Stretchlim_Max);
                
                imshow(andor_image_ave)
                colorbar

           end
           
           x_Strip_min = StripRanges(1,1);
           x_Strip_max = StripRanges(1,2);
           y_Strip_min = ColumnRange(1,1);
           y_Strip_max = ColumnRange(1,2);                      
                
           rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','y');                     

           drawnow
           
           t_Sum_Strip = 1;
           
           sum_andor = andor_image(y_Strip_min:y_Strip_max,x_Strip_min:x_Strip_max)  ;
           sum(sum_andor,1)
           StripIntensities(1,:) = sum(sum_andor,1);


           drawnow
           pause(0.01)
           
           child = get(h.PlotS_Result2_Fig,'Children');
           for i=1:length(child)
               delete(child(i));
           end
           
           axes(h.PlotS_Result3_Fig)

            ColumnRange = StripRanges(1,1):StripRanges(1,2);
            StripInten (1,:)= StripIntensities(1,:);   
            size(ColumnRange)
            size(StripInten)
            plot(ColumnRange,StripInten,'Parent', h.PlotS_Result3_Fig,'Color','b');
                        
        end
        
    end

    function Select_Strip (source, eventdata)
        
        if source == h.name_Ranges_1            
            
          
            min_I =eval(get(h.min_I, 'String'));
            max_I = eval(get(h.max_I, 'String'));
            
            ScanNumberString = get( h.Scan, 'String');
            ScanNumber = eval(ScanNumberString);
            Size_ScanI_Load = eval(get(h.Size_ScanI_Load, 'String'));
            
            Folder = get(h.Folder,'String');
           
           name_Folder = strcat(Folder,'/s%0.4d');
           
           File = get(h.File,'String');
           
           name_File = strcat(File,'_%0.3d.tif');
           name_File1 = strcat(File,'_0%0.3d.tif');
           name_File2 = strcat(File,'_%0.3d.tiff');
                     
           directoryname_Images = sprintf(name_Folder,ScanNumber);   
           directoryname_file = sprintf(name_File,Size_ScanI_Load); 
           directoryname_file1 = sprintf(name_File1,Size_ScanI_Load);
           directoryname_file2 = sprintf(name_File2,Size_ScanI_Load);
                      
           
           filename_Image = sprintf('%s/%s',directoryname_Images,directoryname_file);
           filename_Image1 = sprintf('%s/%s',directoryname_Images,directoryname_file1);
           filename_Image2 = sprintf('%s/%s',directoryname_Images,directoryname_file2);
           

            
            rect = getrect(h.ExtractS_Fig);
            
            child = get(h.ExtractS_Fig,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
           if (exist(filename_Image,'file') == 2) || (exist(filename_Image1,'file') == 2)||(exist(filename_Image2,'file') == 2)
               %         fprintf('File %3d found\n',i_im)
               if (exist(filename_Image,'file') == 2)
                   andor_image = imread(filename_Image,'tif');
               elseif (exist(filename_Image1,'file') == 2)
                   andor_image = imread(filename_Image1,'tif');
               elseif (exist(filename_Image2,'file') == 2)
                   andor_image = imread(filename_Image2,'tif');
               end
                       
               fprintf('Loading %s\n',filename_Image);
               
               
               if h.Angle_rotation_val == 1
                   Angle_Horizontal= h.Angle_Horizontal;
                   andor_image = imrotate(andor_image,Angle_Horizontal,'bilinear','crop');         
                   
                   Initial_ColMin = eval(get(h.Size_ColMin,'String'));
                   Initial_ColMax = eval(get(h.Size_ColMax,'String'));
                   Initial_StripMin = eval(get(h.Size_StripMin,'String'));
                   Initial_StripMax = eval(get(h.Size_StripMax,'String'));
                   
                   andor_image = imcrop(andor_image,[Initial_StripMin Initial_ColMin Initial_StripMax Initial_ColMax]);    
               end
               andor_image_ave = andor_image;
               
               imagesc(andor_image,'Parent',h.ExtractS_Fig);
               [Initial_ColMax,Initial_StripMax,c]=size(andor_image);
               caxis([min_I max_I])       
               if h.Color_Map == 1
                   colormap winter 
               elseif h.Color_Map == 0
                   colormap gray
               elseif h.Color_Map == 2
                   colormap hsv
               end
                    
               colorbar
               %         min_image = 0;
               %         max_image = max_I;
               axis ij equal tight
               if h.Zoom_In_Act == 1
                   axis([size_StripMin size_StripMax size_ColMin size_ColMax ])   
               end
                title(sprintf('F7: scan%0.3d Image%0.3d',ScanNumber,Size_ScanI_Load));
                
                min_Contrast_I = eval(get(h.min_Contrast_I,'String'));
                max_Contrast_I = eval(get(h.max_Contrast_I,'String'));
                
                    andor_image_ave = imadjust(andor_image_ave,stretchlim(andor_image_ave),[min_Contrast_I max_Contrast_I]);
                    Stretchlim = stretchlim(andor_image_ave);
                    Stretchlim_Min = num2str(Stretchlim(1,1));
                    Stretchlim_Max = num2str(Stretchlim(2,1));                    
                    h.Stretchlim = Stretchlim;                    
                    set(h.min_Contrast_I,'String',Stretchlim_Min);
                    set(h.max_Contrast_I,'String',Stretchlim_Max);
                    
                    imshow(andor_image_ave)
                    colorbar
               
           end
            x_1 = int16(rect(1,1));
            y_1 = int16(rect(1,2));
            dx = int16(rect(1,3));
            dy = int16(rect(1,4));          
            x_2 = x_1 + dx;
            y_2 = y_1 + dy;
            
            
            x_Strip_min = x_1;
            x_Strip_max = x_2;
            y_Strip_min = y_1;
            y_Strip_max = y_2;                       
            
            rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','r');

                        
            set(h.StripRanges1Max,'string',x_1)
            set(h.StripRanges1Min,'string',x_2)
            set(h.ColumnRangeMax1,'string',y_1)
            set(h.ColumnRangeMin1,'string',y_2)
            
            
            
            
        elseif source == h.name_Ranges_2           
                       
            min_I =eval(get(h.min_I, 'String'));
            max_I = eval(get(h.max_I, 'String'));
            
            ScanNumberString = get( h.Scan, 'String');
            ScanNumber = eval(ScanNumberString);
            Size_ScanI_Load = eval(get(h.Size_ScanI_Load, 'String'));
            
            Folder = get(h.Folder,'String');
           
           name_Folder = strcat(Folder,'/s%0.4d');
           
           File = get(h.File,'String');
           
           name_File = strcat(File,'_%0.3d.tif');
           name_File1 = strcat(File,'_0%0.3d.tif');
           name_File2 = strcat(File,'_%0.3d.tiff');
                     
           directoryname_Images = sprintf(name_Folder,ScanNumber);   
           directoryname_file = sprintf(name_File,Size_ScanI_Load);  
           directoryname_file1 = sprintf(name_File1,Size_ScanI_Load);  
           directoryname_file2 = sprintf(name_File2,Size_ScanI_Load);  
                      
           filename_Image = sprintf('%s/%s',directoryname_Images,directoryname_file);
           filename_Image1 = sprintf('%s/%s',directoryname_Images,directoryname_file1);
           filename_Image2 = sprintf('%s/%s',directoryname_Images,directoryname_file2);
           
                      
            rect = getrect(h.ExtractS_Fig);
            x_1 = int16(rect(1,1));
            y_1 = int16(rect(1,2));
            dx = int16(rect(1,3));
            dy = int16(rect(1,4));          
            x_2 = x_1 + dx;
            y_2 = y_1 + dy;
           
            child = get(h.ExtractS_Fig,'Children');
            for i=1:length(child)
                delete(child(i));
            end
           if (exist(filename_Image,'file') == 2) || (exist(filename_Image1,'file') == 2)||(exist(filename_Image2,'file') == 2)
               %         fprintf('File %3d found\n',i_im)
               if (exist(filename_Image,'file') == 2)
                   andor_image = imread(filename_Image,'tif');
               elseif (exist(filename_Image1,'file') == 2)
                   andor_image = imread(filename_Image1,'tif');
               elseif (exist(filename_Image2,'file') == 2)
                   andor_image = imread(filename_Image2,'tif');
               end
               fprintf('Loading %s\n',filename_Image);
               
               
               if h.Angle_rotation_val == 1
                   Angle_Horizontal= h.Angle_Horizontal;
                   andor_image = imrotate(andor_image,Angle_Horizontal,'bilinear','crop');         
                   
                   Initial_ColMin = eval(get(h.Size_ColMin,'String'));
                   Initial_ColMax = eval(get(h.Size_ColMax,'String'));
                   Initial_StripMin = eval(get(h.Size_StripMin,'String'));
                   Initial_StripMax = eval(get(h.Size_StripMax,'String'));
                   
                   andor_image = imcrop(andor_image,[Initial_StripMin Initial_ColMin Initial_StripMax Initial_ColMax]);    
               end
               andor_image_ave = andor_image;
               
               imagesc(andor_image,'Parent',h.ExtractS_Fig);
               [Initial_ColMax,Initial_StripMax,c]=size(andor_image);
               caxis([min_I max_I])   
               
               if h.Color_Map == 1
                   colormap winter 
               elseif h.Color_Map == 0
                   colormap gray
               elseif h.Color_Map == 2
                   colormap hsv
               end
               
               colorbar
               %         min_image = 0;
               %         max_image = max_I;
               axis ij equal tight
               if h.Zoom_In_Act == 1
                   axis([size_StripMin size_StripMax size_ColMin size_ColMax ])   
               end
                title(sprintf('F7: scan%0.3d Image%0.3d',ScanNumber,Size_ScanI_Load));
                
                min_Contrast_I = eval(get(h.min_Contrast_I,'String'));
                max_Contrast_I = eval(get(h.max_Contrast_I,'String'));
                
                    andor_image_ave = imadjust(andor_image_ave,stretchlim(andor_image_ave),[min_Contrast_I max_Contrast_I]);
                    Stretchlim = stretchlim(andor_image_ave);
                    Stretchlim_Min = num2str(Stretchlim(1,1));
                    Stretchlim_Max = num2str(Stretchlim(2,1));                    
                    h.Stretchlim = Stretchlim;                    
                    set(h.min_Contrast_I,'String',Stretchlim_Min);
                    set(h.max_Contrast_I,'String',Stretchlim_Max);
                    
                    imshow(andor_image_ave)
                    colorbar
               
           end
            
            x_Strip_min = x_1;
            x_Strip_max = x_2;
            y_Strip_min = y_1;
            y_Strip_max = y_2;                       
            
            rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','y');

                        
            set(h.StripRanges2Max,'string',x_1)
            set(h.StripRanges2Min,'string',x_2)
            set(h.ColumnRangeMax2,'string',y_1)
            set(h.ColumnRangeMin2,'string',y_2)
            
            
        elseif source == h.name_Ranges_3            
           
            
            min_I =eval(get(h.min_I, 'String'));
            max_I = eval(get(h.max_I, 'String'));
            
            ScanNumberString = get( h.Scan, 'String');
            ScanNumber = eval(ScanNumberString);
            Size_ScanI_Load = eval(get(h.Size_ScanI_Load, 'String'));
            
            Folder = get(h.Folder,'String');
           
           name_Folder = strcat(Folder,'/s%0.4d');
           
           File = get(h.File,'String');       
           
           name_File = strcat(File,'_%0.3d.tif');
           name_File1 = strcat(File,'_0%0.3d.tif');
           name_File2 = strcat(File,'_%0.3d.tiff');
                     
           directoryname_Images = sprintf(name_Folder,ScanNumber);   
           directoryname_file = sprintf(name_File,Size_ScanI_Load);  
           directoryname_file1 = sprintf(name_File1,Size_ScanI_Load);  
           directoryname_file2 = sprintf(name_File2,Size_ScanI_Load);  
                      
           filename_Image = sprintf('%s/%s',directoryname_Images,directoryname_file);
           filename_Image1 = sprintf('%s/%s',directoryname_Images,directoryname_file1);
           filename_Image2 = sprintf('%s/%s',directoryname_Images,directoryname_file2);
           
           
            
            rect = getrect(h.ExtractS_Fig);
            x_1 = int16(rect(1,1));
            y_1 = int16(rect(1,2));
            dx = int16(rect(1,3));
            dy = int16(rect(1,4));          
            x_2 = x_1 + dx;
            y_2 = y_1 + dy;
            
            
             child = get(h.ExtractS_Fig,'Children');
            for i=1:length(child)
                delete(child(i));
            end
  
           if (exist(filename_Image,'file') == 2) || (exist(filename_Image1,'file') == 2)||(exist(filename_Image2,'file') == 2)
               %         fprintf('File %3d found\n',i_im)
               if (exist(filename_Image,'file') == 2)
                   andor_image = imread(filename_Image,'tif');
               elseif (exist(filename_Image1,'file') == 2)
                   andor_image = imread(filename_Image1,'tif');
               elseif (exist(filename_Image2,'file') == 2)
                   andor_image = imread(filename_Image2,'tif');
               end
               fprintf('Loading %s\n',filename_Image);
               
               
               if h.Angle_rotation_val == 1
                   Angle_Horizontal= h.Angle_Horizontal;
                   andor_image = imrotate(andor_image,Angle_Horizontal,'bilinear','crop');         
                   
                   Initial_ColMin = eval(get(h.Size_ColMin,'String'));
                   Initial_ColMax = eval(get(h.Size_ColMax,'String'));
                   Initial_StripMin = eval(get(h.Size_StripMin,'String'));
                   Initial_StripMax = eval(get(h.Size_StripMax,'String'));
                   
                   andor_image = imcrop(andor_image,[Initial_StripMin Initial_ColMin Initial_StripMax Initial_ColMax]);    
               end
               andor_image_ave = andor_image;
               
               imagesc(andor_image,'Parent',h.ExtractS_Fig);
               [Initial_ColMax,Initial_StripMax,c]=size(andor_image);
               caxis([min_I max_I])       
               if h.Color_Map == 1
                   colormap winter 
               elseif h.Color_Map == 0
                   colormap gray
               elseif h.Color_Map == 2
                   colormap hsv
               end
               
               colorbar
               %         min_image = 0;
               %         max_image = max_I;
               axis ij equal tight
               if h.Zoom_In_Act == 1
                   axis([size_StripMin size_StripMax size_ColMin size_ColMax ])   
               end
                title(sprintf('F7: scan%0.3d Image%0.3d',ScanNumber,Size_ScanI_Load));
                
                min_Contrast_I = eval(get(h.min_Contrast_I,'String'));
                max_Contrast_I = eval(get(h.max_Contrast_I,'String'));
                
                    andor_image_ave = imadjust(andor_image_ave,stretchlim(andor_image_ave),[min_Contrast_I max_Contrast_I]);
                    Stretchlim = stretchlim(andor_image_ave);
                    Stretchlim_Min = num2str(Stretchlim(1,1));
                    Stretchlim_Max = num2str(Stretchlim(2,1));                    
                    h.Stretchlim = Stretchlim;                    
                    set(h.min_Contrast_I,'String',Stretchlim_Min);
                    set(h.max_Contrast_I,'String',Stretchlim_Max);
                    
                    imshow(andor_image_ave)
                    colorbar
               
           end
            
            x_Strip_min = x_1;
            x_Strip_max = x_2;
            y_Strip_min = y_1;
            y_Strip_max = y_2;                       
            
            rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','m');

                        
            set(h.StripRanges3Max,'string',x_1)
            set(h.StripRanges3Min,'string',x_2)
            set(h.ColumnRangeMax3,'string',y_1)
            set(h.ColumnRangeMin3,'string',y_2)
        
        elseif source == h.name_Ranges_4           
           
            
            min_I =eval(get(h.min_I, 'String'));
            max_I = eval(get(h.max_I, 'String'));
            
            ScanNumberString = get( h.Scan, 'String');
            ScanNumber = eval(ScanNumberString);
            Size_ScanI_Load = eval(get(h.Size_ScanI_Load, 'String'));
            
            Folder = get(h.Folder,'String');
           
           name_Folder = strcat(Folder,'/s%0.4d');
           
           File = get(h.File,'String');
           
           name_File = strcat(File,'_%0.3d.tif');
           name_File1 = strcat(File,'_0%0.3d.tif');
           name_File2 = strcat(File,'_%0.3d.tiff');
                     
           directoryname_Images = sprintf(name_Folder,ScanNumber);   
           directoryname_file = sprintf(name_File,Size_ScanI_Load);  
           directoryname_file1 = sprintf(name_File1,Size_ScanI_Load);  
           directoryname_file2 = sprintf(name_File2,Size_ScanI_Load);  
                      
           filename_Image = sprintf('%s/%s',directoryname_Images,directoryname_file);
           filename_Image1 = sprintf('%s/%s',directoryname_Images,directoryname_file1);
           filename_Image2 = sprintf('%s/%s',directoryname_Images,directoryname_file2);
           
            
            rect = getrect(h.ExtractS_Fig);
            
            x_1 = int16(rect(1,1));
            y_1 = int16(rect(1,2));
            dx = int16(rect(1,3));
            dy = int16(rect(1,4));          
            x_2 = x_1 + dx;
            y_2 = y_1 + dy;
             child = get(h.ExtractS_Fig,'Children');
            for i=1:length(child)
                delete(child(i));
            end
  
           if (exist(filename_Image,'file') == 2) || (exist(filename_Image1,'file') == 2)||(exist(filename_Image2,'file') == 2)
               %         fprintf('File %3d found\n',i_im)
               if (exist(filename_Image,'file') == 2)
                   andor_image = imread(filename_Image,'tif');
               elseif (exist(filename_Image1,'file') == 2)
                   andor_image = imread(filename_Image1,'tif');
               elseif (exist(filename_Image2,'file') == 2)
                   andor_image = imread(filename_Image2,'tif');
               end
               fprintf('Loading %s\n',filename_Image);
               
               
               if h.Angle_rotation_val == 1
                   Angle_Horizontal= h.Angle_Horizontal;
                   andor_image = imrotate(andor_image,Angle_Horizontal,'bilinear','crop');         
                   
                   Initial_ColMin = eval(get(h.Size_ColMin,'String'));
                   Initial_ColMax = eval(get(h.Size_ColMax,'String'));
                   Initial_StripMin = eval(get(h.Size_StripMin,'String'));
                   Initial_StripMax = eval(get(h.Size_StripMax,'String'));
                   
                   andor_image = imcrop(andor_image,[Initial_StripMin Initial_ColMin Initial_StripMax Initial_ColMax]);    
               end
               andor_image_ave = andor_image;
               
               imagesc(andor_image,'Parent',h.ExtractS_Fig);
               [Initial_ColMax,Initial_StripMax,c]=size(andor_image);
               caxis([min_I max_I])  
               
               if h.Color_Map == 1
                   colormap winter 
               elseif h.Color_Map == 0
                   colormap gray
               elseif h.Color_Map == 2
                   colormap hsv
               end
               
               colorbar
               %         min_image = 0;
               %         max_image = max_I;
               axis ij equal tight
               if h.Zoom_In_Act == 1
                   axis([size_StripMin size_StripMax size_ColMin size_ColMax ])   
               end
                title(sprintf('F7: scan%0.3d Image%0.3d',ScanNumber,Size_ScanI_Load));
                
                min_Contrast_I = eval(get(h.min_Contrast_I,'String'));
                max_Contrast_I = eval(get(h.max_Contrast_I,'String'));
                
                    andor_image_ave = imadjust(andor_image_ave,stretchlim(andor_image_ave),[min_Contrast_I max_Contrast_I]);
                    Stretchlim = stretchlim(andor_image_ave);
                    Stretchlim_Min = num2str(Stretchlim(1,1));
                    Stretchlim_Max = num2str(Stretchlim(2,1));                    
                    h.Stretchlim = Stretchlim;                    
                    set(h.min_Contrast_I,'String',Stretchlim_Min);
                    set(h.max_Contrast_I,'String',Stretchlim_Max);
                    
                    imshow(andor_image_ave)
                    colorbar
               
           end
            
            x_Strip_min = x_1;
            x_Strip_max = x_2;
            y_Strip_min = y_1;
            y_Strip_max = y_2;                       
            
            rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','w');

                        
            set(h.StripRanges4Max,'string',x_1)
            set(h.StripRanges4Min,'string',x_2)
            set(h.ColumnRangeMax4,'string',y_1)
            set(h.ColumnRangeMin4,'string',y_2)     
            elseif source == h.name_Ranges_Sub           
                       
            min_I =eval(get(h.min_I, 'String'));
            max_I = eval(get(h.max_I, 'String'));
            
            ScanNumberString = get( h.Scan, 'String');
            ScanNumber = eval(ScanNumberString);
            Size_ScanI_Load = eval(get(h.Size_ScanI_Load, 'String'));
            
            Folder = get(h.Folder,'String');
           
           name_Folder = strcat(Folder,'/s%0.4d');
           
           File = get(h.File,'String');
           
           name_File = strcat(File,'_%0.3d.tif');
           name_File1 = strcat(File,'_0%0.3d.tif');
           name_File2 = strcat(File,'_%0.3d.tiff');
                     
           directoryname_Images = sprintf(name_Folder,ScanNumber);   
           directoryname_file = sprintf(name_File,Size_ScanI_Load);  
           directoryname_file1 = sprintf(name_File1,Size_ScanI_Load);  
           directoryname_file2 = sprintf(name_File2,Size_ScanI_Load);  
                      
           filename_Image = sprintf('%s/%s',directoryname_Images,directoryname_file);
           filename_Image1 = sprintf('%s/%s',directoryname_Images,directoryname_file1);
           filename_Image2 = sprintf('%s/%s',directoryname_Images,directoryname_file2);
           
                      
            rect = getrect(h.ExtractS_Fig);
            x_1 = int16(rect(1,1));
            y_1 = int16(rect(1,2));
            dx = int16(rect(1,3));
            dy = int16(rect(1,4));          
            x_2 = x_1 + dx;
            y_2 = y_1 + dy;
           
            child = get(h.ExtractS_Fig,'Children');
            for i=1:length(child)
                delete(child(i));
            end
           if (exist(filename_Image,'file') == 2) || (exist(filename_Image1,'file') == 2)||(exist(filename_Image2,'file') == 2)
               %         fprintf('File %3d found\n',i_im)
               if (exist(filename_Image,'file') == 2)
                   andor_image = imread(filename_Image,'tif');
               elseif (exist(filename_Image1,'file') == 2)
                   andor_image = imread(filename_Image1,'tif');
               elseif (exist(filename_Image2,'file') == 2)
                   andor_image = imread(filename_Image2,'tif');
               end
               fprintf('Loading %s\n',filename_Image);
               
               
               if h.Angle_rotation_val == 1
                   Angle_Horizontal= h.Angle_Horizontal;
                   andor_image = imrotate(andor_image,Angle_Horizontal,'bilinear','crop');         
                   
                   Initial_ColMin = eval(get(h.Size_ColMin,'String'));
                   Initial_ColMax = eval(get(h.Size_ColMax,'String'));
                   Initial_StripMin = eval(get(h.Size_StripMin,'String'));
                   Initial_StripMax = eval(get(h.Size_StripMax,'String'));
                   
                   andor_image = imcrop(andor_image,[Initial_StripMin Initial_ColMin Initial_StripMax Initial_ColMax]);    
               end
               andor_image_ave = andor_image;
               
               imagesc(andor_image,'Parent',h.ExtractS_Fig);
               [Initial_ColMax,Initial_StripMax,c]=size(andor_image);
               caxis([min_I max_I])   
               
               if h.Color_Map == 1
                   colormap winter 
               elseif h.Color_Map == 0
                   colormap gray
               elseif h.Color_Map == 2
                   colormap hsv
               end
               
               colorbar
               %         min_image = 0;
               %         max_image = max_I;
               axis ij equal tight
               if h.Zoom_In_Act == 1
                   axis([size_StripMin size_StripMax size_ColMin size_ColMax ])   
               end
                title(sprintf('F7: scan%0.3d Image%0.3d',ScanNumber,Size_ScanI_Load));
                
                min_Contrast_I = eval(get(h.min_Contrast_I,'String'));
                max_Contrast_I = eval(get(h.max_Contrast_I,'String'));
                
                    andor_image_ave = imadjust(andor_image_ave,stretchlim(andor_image_ave),[min_Contrast_I max_Contrast_I]);
                    Stretchlim = stretchlim(andor_image_ave);
                    Stretchlim_Min = num2str(Stretchlim(1,1));
                    Stretchlim_Max = num2str(Stretchlim(2,1));                    
                    h.Stretchlim = Stretchlim;                    
                    set(h.min_Contrast_I,'String',Stretchlim_Min);
                    set(h.max_Contrast_I,'String',Stretchlim_Max);
                    
                    imshow(andor_image_ave)
                    colorbar
               
           end
            
            x_Strip_min = x_1;
            x_Strip_max = x_2;
            y_Strip_min = y_1;
            y_Strip_max = y_2;                       
            
            rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','y');

                        
            set(h.StripRangesMax_Sub,'string',x_1)
            set(h.StripRangesMin_Sub,'string',x_2)
            set(h.ColumnRangeMax_Sub,'string',y_1)
            set(h.ColumnRangeMin_Sub,'string',y_2)
            
        elseif source == h.Roi_Ranges
            if get(h.Roi_Range_Check,'Value') ==1
                min_I =eval(get(h.min_I, 'String'));
                max_I = eval(get(h.max_I, 'String'));
                
                ScanNumberString = get( h.Scan, 'String');
                ScanNumber = eval(ScanNumberString);
                Size_ScanI_Load = eval(get(h.Size_ScanI_Load, 'String'));
                
                Folder = get(h.Folder,'String');
                
                name_Folder = strcat(Folder,'/s%0.4d');
                
                File = get(h.File,'String');
                
                name_File = strcat(File,'_%0.3d.tif');
                name_File1 = strcat(File,'_0%0.3d.tif');
                name_File2 = strcat(File,'_%0.3d.tiff');
                
                directoryname_Images = sprintf(name_Folder,ScanNumber);   
                directoryname_file = sprintf(name_File,Size_ScanI_Load);  
                directoryname_file1 = sprintf(name_File1,Size_ScanI_Load);  
                directoryname_file2 = sprintf(name_File2,Size_ScanI_Load);  
                
                filename_Image = sprintf('%s/%s',directoryname_Images,directoryname_file);
                filename_Image1 = sprintf('%s/%s',directoryname_Images,directoryname_file1);
                filename_Image2 = sprintf('%s/%s',directoryname_Images,directoryname_file2);
                
                
                rect = getrect(h.ExtractS_Fig);
                
                x_1 = int16(rect(1,1));
                y_1 = int16(rect(1,2));
                dx = int16(rect(1,3));
                dy = int16(rect(1,4));          
                x_2 = x_1 + dx;
                y_2 = y_1 + dy;
                child = get(h.ExtractS_Fig,'Children');
                for i=1:length(child)
                    delete(child(i));
                end
                
                if (exist(filename_Image,'file') == 2) || (exist(filename_Image1,'file') == 2)||(exist(filename_Image2,'file') == 2)
                    %         fprintf('File %3d found\n',i_im)
                    if (exist(filename_Image,'file') == 2)
                        andor_image = imread(filename_Image,'tif');
                    elseif (exist(filename_Image1,'file') == 2)
                        andor_image = imread(filename_Image1,'tif');
                    elseif (exist(filename_Image2,'file') == 2)
                        andor_image = imread(filename_Image2,'tif');
                    end
                    fprintf('Loading %s\n',filename_Image);
                    
                    
                    if h.Angle_rotation_val == 1
                        Angle_Horizontal= h.Angle_Horizontal;
                        andor_image = imrotate(andor_image,Angle_Horizontal,'bilinear','crop');         
                        
                        Initial_ColMin = eval(get(h.Size_ColMin,'String'));
                        Initial_ColMax = eval(get(h.Size_ColMax,'String'));
                        Initial_StripMin = eval(get(h.Size_StripMin,'String'));
                        Initial_StripMax = eval(get(h.Size_StripMax,'String'));
                        
                        andor_image = imcrop(andor_image,[Initial_StripMin Initial_ColMin Initial_StripMax Initial_ColMax]);    
                    end
                    andor_image_ave = andor_image;
                    
                    imagesc(andor_image,'Parent',h.ExtractS_Fig);
                    [Initial_ColMax,Initial_StripMax,c]=size(andor_image);
                    caxis([min_I max_I])  
               
               if h.Color_Map == 1
                   colormap winter 
               elseif h.Color_Map == 0
                   colormap gray
               elseif h.Color_Map == 2
                   colormap hsv
               end
               
               colorbar
               %         min_image = 0;
               %         max_image = max_I;
               axis ij equal tight
               if h.Zoom_In_Act == 1
                   axis([size_StripMin size_StripMax size_ColMin size_ColMax ])   
               end
                title(sprintf('F7: scan%0.3d Image%0.3d',ScanNumber,Size_ScanI_Load));
                
                min_Contrast_I = eval(get(h.min_Contrast_I,'String'));
                max_Contrast_I = eval(get(h.max_Contrast_I,'String'));
                
                    andor_image_ave = imadjust(andor_image_ave,stretchlim(andor_image_ave),[min_Contrast_I max_Contrast_I]);
                    Stretchlim = stretchlim(andor_image_ave);
                    Stretchlim_Min = num2str(Stretchlim(1,1));
                    Stretchlim_Max = num2str(Stretchlim(2,1));                    
                    h.Stretchlim = Stretchlim;                    
                    set(h.min_Contrast_I,'String',Stretchlim_Min);
                    set(h.max_Contrast_I,'String',Stretchlim_Max);
                    
                    imshow(andor_image_ave)
                    colorbar
               
           end
            
            x_Strip_min = x_1;
            x_Strip_max = x_2;
            y_Strip_min = y_1;
            y_Strip_max = y_2;                       
            
            rectangle('Parent', h.ExtractS_Fig,'Position',[x_Strip_min y_Strip_min x_Strip_max-x_Strip_min  y_Strip_max-y_Strip_min],'EdgeColor','g');
            
            h.x_roi_min = x_1;
            h.x_roi_max = x_2;
            h.y_roi_min = y_1;
            h.y_roi_max = y_2;

            end
        elseif source ==h.Roi_Range_Check
            if get(h.Roi_Range_Check,'Value') ==1
                set(h.Roi_Range_Check ,'Value',1)
                set(h.Roi_Range_Check ,'String','on')
            else
               set(h.Roi_Range_Check ,'Value',0)
               set(h.Roi_Range_Check ,'String','off')
           end
        end
           
    end
    

%% Pause & Stop extraction of data
    function Pause (source,eventdata)
        
        if source == h.Name_Pause
            Pause = get(h.Name_Pause,'Value');
            h.Pause = Pause;
            h.Save_Manuel = 0;
        end

    end

    function Stop_Gui(source,eventdata)
        
        if source ==h.Stop
            Stop_value = get(h.Stop,'Value');
            h.Stop_value = Stop_value;
            set(h.Stop,'Value',0)
        elseif source ==  h.Stop_Horizontal
            Stop_value = get(h.Stop_Horizontal,'Value');
            h.Stop_value = Stop_value;
            set(h.Stop_Horizontal,'Value',0)
        end
    end

%% Help
    function Help(source,evendata)
        % While using help_write, user should save in .docx and .pdf from
        % Word.
       if source == h.help_GUI_SLS_Diamond
           if h.help_Write_Chk == 1
               winopen('Help_GUI_SLS_Diamond.docx')               
           else
               winopen('Help_GUI_SLS_Diamond.pdf')
           end
       elseif source == h.help_Horizontal_Image
           if h.help_Write_Chk == 1
               winopen('Help_Horizontal_Image.docx')
           else
               winopen('Help_Horizontal_Image.pdf')
           end
       elseif source == h.help_Compare
           if h.help_Write_Chk == 1
               winopen('Help_Compare.docx')
           else
               winopen('Help_Compare.pdf')
           end
       elseif source == h.help_Fix_Ranges
           if h.help_Write_Chk == 1
               winopen('Help_Fix_Ranges.docx')
           else
               winopen('Help_Fix_Ranges.pdf')
           end
       elseif source == h.help_Fit_Sections
           if h.help_Write_Chk == 1
               winopen('Help_Fit_Sections.docx')
           else
               winopen('Help_Fit_Sections.pdf')
           end
       elseif source == h.help_Print
           if h.help_Write_Chk == 1
               winopen('Help_Print.docx')
           else
               winopen('Help_Print.pdf')
           end
       elseif source == h.help_Write
           code = eval(get(h.help_Write_num,'String'));
           if code == 3603
               h.help_Write_Chk = get(h.help_Write,'Value');
           else
               h.help_Write_Chk = 0;
           end
           
       end
    end

end
