%%% Simulates the multiple scattering signal of a crystal system
% Strain,multicrystal monochromators, multilayers,...

function Simulation_FBD_Beam_Strain_GUI
%Inital values
%values_exp = 1;  %1 Si 111 asy 54.37deg 8keV Nanomax
%values_exp = 2;  %2 Si 400 9.4 keV MicroXAS 
%values_exp = 3;  %3 InSb 220 6.2 cSAXS
%values_exp = 4;  %4 Ni 111 8keV
%values_exp = 5;  %5 C 111 9keV SDL
%values_exp = 6;  %6 Si 220 LD 8.34keV ID01 ESRF
%values_exp = 7;  %7 Si 311 12.56keV MicroXAS
values_exp = 8;  %8 Si 220 9keV MID 300 um
%values_exp = 9;  %9 Au 111 9keV
%values_exp = 10;  %10 to define


%center beam

h.cluster = true;
h.Beam_2D_x_center_val = 0;
h.Beam_2D_y_center_val = 0;

%constast
h.c_light= 299792458; %Light Speed m/s
h.h_planck = 4.13566733e-15;% eV

%% Principal GUI Figure
d = floor(rand*100);
h.f = figure(d);
Font_size = 12;

h.lp_fit = figure(d);
Name_version = 'Dynamical_Diffraction_FBD_GUI_Strain_V.16_05_2018';
set(h.lp_fit,'Name',Name_version,...
    'NumberTitle', 'Off','Units','normalized',...
    'Position', [0.001 0.75 0.5 0.2],'Color',[0.5 0.5 0.5],...
    'Menubar','none','KeyReleaseFcn',@Press);


%NanoMAX
if values_exp == 1
    element = 'Si';
    Geometry = 4;                    % 1 BD, 2 FBD, 3 LD and 4 FLD
    h_miller = 1;    k_miller = 1;    l_miller = 1;
    asymmetry = 54.7356;
    energy = 8000;
    N_Steps = 400;
    polarization = 'p';
    thickness = 100;
    
    monochromato_check = 1;
    h_miller_mono = 1;     k_miller_mono = 1;    l_miller_mono = 1;
    energy_scan = 1;
    
    focus_x = 0.2;   range_x = 100;  Nstep_x_Beam = 4000;
    focus_y = 0.2; range_y = 2;   Nstep_y_Beam = 80;
    
    Range_Left = -10 ; Range_Right  = 10;   N_Steps = 400;

    Lorenztian_Distribution = 1;
    Gaussian_Distribution = 0;
    
    Steps_Mono = 1;     Range_pos_Mono = -4.2;     Range_neg_Mono = -4.2;
    h.F6_x1 = -5;     h.F6_x2 = 120;    %lim for figure 6
    
    % MiroXAS
elseif values_exp==2
    element = 'Si';
    Geometry = 2;                    % 1 BD, 2 FBD, 3 LD and 4 FLD
    h_miller = 4;    k_miller = 0;    l_miller = 0;
    asymmetry = 0;
    energy = 9400;
    polarization = 's';
    thickness = 100;
    
    monochromato_check = 1;
    h_miller_mono = 3;    k_miller_mono = 1;    l_miller_mono = 1;
    energy_scan = 1;
  
    focus_x = 1;    range_x = 200;   Nstep_x_Beam = 1000;
    focus_y = 1;    range_y = 10;    Nstep_y_Beam = 100;
    
    Range_Left = -10 ; Range_Right  = 10;   N_Steps = 2000;

    Lorenztian_Distribution = 0;
    Gaussian_Distribution = 1;
    
    Steps_Mono = 1;     Range_pos_Mono = -5;     Range_neg_Mono = -5;
    h.F6_x1 = -5;     h.F6_x2 = 120;    %lim for figure 6

    % cSAXS
elseif values_exp==3
    element = 'InSb';
    Geometry = 3;                    % 1 BD, 2 FBD, 3 LD and 4 FLD
    h_miller = 2;    k_miller = 2;    l_miller = 0;
    asymmetry = 7;
    energy = 6200;
    polarization = 's';
    thickness = 10;
    
    monochromato_check = 1;
    h_miller_mono = 1;    k_miller_mono = 1;    l_miller_mono = 1;
    energy_scan = 1;    
    
    focus_x = 0.1;    range_x = 20;   Nstep_x_Beam = 400;
    focus_y = 0.1;     range_y = 2;    Nstep_y_Beam = 40;
    Range_Left = -10 ; Range_Right  = 10;   N_Steps = 400;

    Lorenztian_Distribution = 0;
    Gaussian_Distribution = 1;
    
    Steps_Mono = 1;     Range_pos_Mono = -5;     Range_neg_Mono = -5;
    h.F6_x1 = -5;     h.F6_x2 = 20;    %lim for figure 6
    
    % Ni
elseif values_exp==4
    element = 'Ni';
    Geometry = 3;                    % 1 BD, 2 FBD, 3 LD and 4 FLD
    h_miller = 1;    k_miller = 1;    l_miller = 1;
    asymmetry = 54.73;
    energy = 8333;
    polarization = 's';
    thickness = 10;
    
    monochromato_check = 1;
    h_miller_mono = 1;    k_miller_mono = 1;    l_miller_mono = 1;
    energy_scan = 1;

    focus_x = 0.1;    range_x = 20;   Nstep_x_Beam = 400;
    focus_y = 0.1;     range_y = 2;    Nstep_y_Beam = 40;
    Range_Left = -10 ; Range_Right  = 10;   N_Steps = 400;
    
    Lorenztian_Distribution = 0;
    Gaussian_Distribution = 1;
    
    Steps_Mono = 1;     Range_pos_Mono = -5;     Range_neg_Mono = -5;
    h.F6_x1 = -5;     h.F6_x2 = 15;    %lim for figure 6

    %Diamond SDL
elseif values_exp==5
    element = 'C';
    Geometry = 1;                    % 1 BD, 2 FBD, 3 LD and 4 FLD
    h_miller = 1;    k_miller = 1;    l_miller = 1;
    asymmetry = 0;
    energy = 9000;
    polarization = 's';
    thickness = 20;
    
    monochromato_check = 1;
    h_miller_mono = 1;    k_miller_mono = 1;    l_miller_mono = 1;
    energy_scan = 1;

    focus_x = 1;    range_x = 40;   Nstep_x_Beam = 400;
    focus_y = 1;     range_y = 4;    Nstep_y_Beam = 40;
    Range_Left = -10 ; Range_Right  = 10;   N_Steps = 400;
    
    Lorenztian_Distribution = 0;    Gaussian_Distribution = 1;
    
    Steps_Mono = 1;     Range_pos_Mono = -5;     Range_neg_Mono = -5;
    h.F6_x1 = -5;     h.F6_x2 = 60;    %lim for figure 6
    
    %Si  ID01 220  
elseif values_exp == 6
    element = 'Si';
    Geometry = 3;                    % 1 BD, 2 FBD, 3 LD and 4 FLD
    h_miller = 2;    k_miller = 2;    l_miller = 0;
    asymmetry = 0;
    energy = 8346;
    polarization = 'p';
    thickness = 100;
    
    monochromato_check = 1;
    h_miller_mono = 1;    k_miller_mono = 1;    l_miller_mono = 1;
    energy_scan = 1;

    focus_x = 0.1;    range_x = 200;   Nstep_x_Beam = 4000;
    focus_y = 0.1;     range_y = 1;    Nstep_y_Beam = 80;
    Range_Left = -10 ; Range_Right  = 10;   N_Steps = 2000;
    
    Lorenztian_Distribution = 0;    Gaussian_Distribution = 1;
    
    Steps_Mono = 1;     Range_pos_Mono = -4.4;     Range_neg_Mono = -4.4;
    h.F6_x1 = -5;     h.F6_x2 = 85;    %lim for figure 6

    %MicroXAS
elseif values_exp == 7
    element = 'Si';
    Geometry = 3;                    % 1 BD, 2 FBD, 3 LD and 4 FLD
    h_miller = 3;    k_miller = 1;    l_miller = 1;
    asymmetry = 72.48;
    energy = 12570;
    polarization = 'p';
    thickness = 96;
    
    monochromato_check = 1;
    h_miller_mono = 3;    k_miller_mono = 1;    l_miller_mono = 1;
    energy_scan = 1;

    focus_x = 1;    range_x = 250;   Nstep_x_Beam = 5000;
    focus_y = 1;     range_y = 4;    Nstep_y_Beam = 80;
    Range_Left = -10 ; Range_Right  = 10;   N_Steps = 2000;
    
    Lorenztian_Distribution = 0;    Gaussian_Distribution = 1;
    
    Steps_Mono = 1;     Range_pos_Mono = -4.4;     Range_neg_Mono = -4.4;

    h.F6_x1 = -5;     h.F6_x2 = 100;    %lim for figure 6

% MID experiment
elseif values_exp == 8
    element = 'Si';
    Geometry = 3;                    % 1 BD, 2 FBD, 3 LD and 4 FLD
    h_miller = 2;    k_miller = 2;    l_miller = 0;
    asymmetry = 0;
    energy = 9000;
    polarization = 'p';
    thickness = 300;
    
    monochromato_check = 1;
    h_miller_mono = 1;    k_miller_mono = 1;    l_miller_mono = 1;
    energy_scan = 1;

    focus_x = 0.5;    range_x = 500;   Nstep_x_Beam = 1000;
    focus_y = 0.5;     range_y = 1;    Nstep_y_Beam = 40;
    Range_Left = -3 ; Range_Right  = 3;   N_Steps = 1000;
    
    Lorenztian_Distribution = 0;    Gaussian_Distribution = 1;
    
    Steps_Mono = 1;     Range_pos_Mono = -5;     Range_neg_Mono = -5;
    h.F6_x1 = -5;     h.F6_x2 = 300;    %lim for figure 6

    %Au SPIE 9 keV
elseif values_exp == 9
    element = 'Au';
    Geometry = 3;                    % 1 BD, 2 FBD, 3 LD and 4 FLD
    h_miller = 1;    k_miller = 1;    l_miller = 1;
    asymmetry = 0;
    energy = 9000;
    polarization = 's';
    thickness = 3;
    
    monochromato_check = 1;
    h_miller_mono = 1;    k_miller_mono = 1;    l_miller_mono = 1;
    energy_scan = 1;

    focus_x = 0.1;    range_x = 5;   Nstep_x_Beam = 500;
    focus_y = 0.1;     range_y = 2;    Nstep_y_Beam = 200;
    Range_Left = -40 ; Range_Right  = 40;   N_Steps = 400;
    
    Lorenztian_Distribution = 0;    Gaussian_Distribution = 1;
    
    Steps_Mono = 1;     Range_pos_Mono = -5;     Range_neg_Mono = -5;
    h.F6_x1 = -5;     h.F6_x2 = 10;    %lim for figure 6

end

%Non strain Initially
h.da_MCC = 0;
h.db_MCC = 0;
h.dc_MCC = 0;
h.Thickness_MCC = 0;


%% Fit Theory
h.name_Dynamical_Theory = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','FontWeight','bold','String','Dynamical Theory',...
    'Position',[0. 0.9 0.13 0.1],'BackgroundColor',[0.4 0.4 0.4],'FontSize',Font_size-2);

h.name_Plots_open = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','FontWeight','bold','String','Plot:',...
    'Position',[0.13 0.9 0.04 0.1],'BackgroundColor',[0.4 0.4 0.4],'FontSize',Font_size-2);

h.Dynamical_Theory_Plots = uicontrol('Parent',h.lp_fit,...
    'Style','push','Units','normalized','String','1D','FontWeight','bold',...
    'Position',[0.17 0.9 0.025 0.1],'BackgroundColor',[0.4 0.4 0.4],'FontSize',Font_size,...
    'Callback',@Dynamical_Reflectivity_Extra);

h.Beam_simulation_Plots = uicontrol('Parent',h.lp_fit,...
    'Style','push','Units','normalized','String','3D','FontWeight','bold',...
    'Position',[0.195 0.9 0.025 0.1],'BackgroundColor',[0.4 0.4 0.4],'FontSize',Font_size,...
    'Callback',@Beam_3D_plot);

h.Help_FBD_Simulations = uicontrol('Parent',h.lp_fit,...
    'Style','push','Units','normalized','String','Help','FontWeight','bold',...
    'Position',[0.223 0.9 0.08 0.1],'BackgroundColor',[0 0 0.8],'FontSize',Font_size,...
    'Callback',@Help_FBD);

h.Bragg_Check =  uicontrol('Parent',h.lp_fit,...
    'Style' , 'Check','Enable', 'on','Value', 1,'String','BD',...
    'FontName','Helvetica','Units','Normalized','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.31 0.9 0.06 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Callback',@Bragg_Fit_Check);

h.Bragg_FBD_Check =  uicontrol('Parent',h.lp_fit,...
    'Style' , 'Check','Enable', 'on','Value', 0,'String','FBD',...
    'FontName','Helvetica','Units','Normalized','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.37 0.9 0.06 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...    
    'Callback',@Bragg_Fit_Check);

h.Laue_Check =  uicontrol('Parent',h.lp_fit,...
    'Style' , 'Check','Enable', 'on','Value', 0,'String','LD',...
    'FontName','Helvetica','Units','Normalized','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.43 0.9 0.06 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...    
    'Callback',@Bragg_Fit_Check);    

h.Laue_FBD_Check =  uicontrol('Parent',h.lp_fit,...
    'Style' , 'Check','Enable', 'on','Value', 0,'String','FLD',...
    'FontName','Helvetica','Units','Normalized','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.49 0.9 0.06 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...    
    'Callback',@Bragg_Fit_Check);

if Geometry == 1
    set(h.Bragg_Check ,'value',1)
    set(h.Bragg_FBD_Check ,'value',0)
    set(h.Laue_Check ,'value',0)
    set(h.Laue_FBD_Check ,'value',0)
elseif Geometry == 2
    set(h.Bragg_Check ,'value',0)
    set(h.Bragg_FBD_Check ,'value',1)
    set(h.Laue_Check ,'value',0)
    set(h.Laue_FBD_Check ,'value',0)
elseif Geometry == 3
    set(h.Bragg_Check ,'value',0)
    set(h.Bragg_FBD_Check ,'value',0)
    set(h.Laue_Check ,'value',1)
    set(h.Laue_FBD_Check ,'value',0)
elseif Geometry == 4
    set(h.Bragg_Check ,'value',0)
    set(h.Bragg_FBD_Check ,'value',0)
    set(h.Laue_Check ,'value',0)
    set(h.Laue_FBD_Check ,'value',1)
end

% Definition of the Symmetries, Element and cell parameters
h.name_Element = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','Compound',...
    'Position',[0. 0.8 0.06 0.1],'BackgroundColor',[0.4 0.4 0.4],'FontSize',Font_size);

h.Element = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','C',...    
    'Position',[0.06 0.8 0.03 0.1],'FontSize',Font_size);
set(h.Element,'string',element)
    
h.name_a_Parameter = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','a',...
    'Position',[0.09 0.8 0.015 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);

h.a_parameter = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','-',...
    'Position',[0.105 0.8 0.035 0.1],'FontSize',Font_size);

h.name_b_Parameter = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','b',...
    'Position',[0.14 0.8 0.015 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);

h.b_parameter = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','-',...
    'Position',[0.155 0.8 0.035 0.1],'FontSize',Font_size);

h.name_c_Parameter = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','c',...
    'Position',[0.19 0.8 0.015 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);

h.c_parameter = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','-',...
    'Position',[0.205 0.8 0.035 0.1],'FontSize',Font_size);

amstrong = char(197);
h.name_amstrong_Parameter = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String',amstrong,...
    'Position',[0.24 0.8 0.015 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);

h.name_DWF = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','D-W',...
    'Position',[0.255 0.8 0.025 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);

h.DWF = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','1',...
    'Position',[0.28 0.8 0.023 0.1],'FontSize',Font_size);



% row Auto complete, Absorption, diffraction direction and angles from cell
h.CParameter_Check =  uicontrol('Parent',h.lp_fit,...
    'Style' , 'Check','Enable', 'on','Value', 0,'String','Auto',...
    'FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center','Units','Normalized',...
    'Position', [0.0 0.7 0.045 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Callback',@Bragg_Fit_Check);

h.Absorption =  uicontrol('Parent',h.lp_fit,...
    'Style' , 'Check','Enable', 'on','Value', 1,'String','Abs',...
    'FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center','Units','Normalized',...
    'Position', [0.045 0.7 0.045 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Callback',@Bragg_Fit_Check);

h.name_alpha_Parameter = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','a','FontName','symbol',...
    'Position',[0.09 0.7 0.015 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);

h.alpha_parameter = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','90',...
    'Position',[0.105 0.7 0.035 0.1],'FontSize',Font_size);

h.name_beta_Parameter = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','b','FontName','symbol',...
    'Position',[0.14 0.7 0.015 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);

h.beta_parameter = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','90',...
    'Position',[0.155 0.7 0.035 0.1],'FontSize',Font_size);

h.name_gamma_Parameter = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','c','FontName','symbol',...
    'Position',[0.19 0.7 0.015 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);

h.gamma_parameter = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','90',...
    'Position',[0.205 0.7 0.035 0.1],'FontSize',Font_size);

degree = char(176);
h.name_g_Parameter = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String',degree,...
    'Position',[0.24 0.7 0.015 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);


% diffraction + or -
h.crystal_orientation = uicontrol('Parent',h.lp_fit,...
    'Style' , 'Check','Enable', 'on','Value', 1,...
    'FontName','Helvetica','HorizontalAlignment','center','Units','Normalized',...
    'FontWeight','normal','String','Nor +','FontSize',Font_size-2,...
    'Position', [0.25 0.7 0.053 0.1],'BackgroundColor',[0.45 0.45 0.45],'Callback',@Bragg_Fit_Check);

% refletion and thickness
h.name_Thickness = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','T(um)',...
    'BackgroundColor',[0.45 0.45 0.45],'Position',[0.0 0.6 0.05 0.1],'FontSize',Font_size);

h.Thickness = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','500',...
    'Position',[0.05 0.6 0.04 0.1],'FontSize',Font_size);


h.name_h_miller = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String',' h ',...
    'BackgroundColor',[0.45 0.45 0.45],'Position',[0.09 0.6 0.02 0.1],'FontSize',Font_size);

h.h_miller = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','4',...
    'Position',[0.11 0.6 0.02 0.1],'FontSize',Font_size);

h.name_k_miller = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String',' k ',...
    'Position',[0.13 0.6 0.02 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);

h.k_miller = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','0',...
    'Position',[0.15 0.6 0.02 0.1],'FontSize',Font_size);

h.name_l_miller = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String',' l ',...
    'BackgroundColor',[0.45 0.45 0.45],'Position',[0.17 0.6 0.02 0.1],'FontSize',Font_size);

h.l_miller = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','0',...
    'Position',[0.19 0.6 0.02 0.1],'FontSize',Font_size);

h.name_Asymmetry= uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','FontName','symbol','String','d',...
    'Position',[0.21 0.6 0.04 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);

h.Asymmetry =  uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','0',...
    'Position',[0.25 0.6 0.04 0.1],'FontSize',Font_size);

h.name_Asymmetry= uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String',degree,...
    'Position',[0.29 0.6 0.013 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
set(h.Thickness,'string',thickness)
set(h.h_miller,'string',h_miller)
set(h.k_miller,'string',k_miller)
set(h.l_miller,'string',l_miller)
set(h.Asymmetry,'string',asymmetry)


%% Calculation of Theta Bragg
h.name_Energy = uicontrol('Parent',h.lp_fit,...
    'Style','text',...
    'Units','normalized',...
    'Position',[0.31 0.8 0.06 0.1],...
    'String','Energy (eV)',...
    'BackgroundColor',[0.4 0.4 0.4],...
    'FontSize',Font_size);
h.Energy_input = uicontrol('Parent',h.lp_fit,...
    'Style','Edit',...
    'Units','normalized',...
    'Position',[0.37 0.8 0.05 0.1],...
    'String','9830',...
    'FontSize',Font_size);
set(h.Energy_input, 'string',energy)

% Range definition
h.name_Range_Left = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','Range -',...
    'Position',[0.42 0.8 0.04 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.Range_Left = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','-10',...
    'Position',[0.46 0.8 0.025 0.1],'FontSize',Font_size-2);
set(h.Range_Left,'string',Range_Left)

h.name_Range_Right = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','Range +',...
    'Position',[0.485 0.8 0.04 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.Range_Right = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','10',...
    'Position',[0.525 0.8 0.025 0.1],'FontSize',Font_size-2);
set(h.Range_Right,'string',Range_Right)

h.name_N_Steps = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','Steps',...
    'Position',[0.4 0.7 0.03 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.N_Steps = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','1000',...
    'Position',[0.43 0.7 0.04 0.1],'FontSize',Font_size);
set(h.N_Steps,'string',N_Steps)
    

h.Range_Deg =uicontrol('Parent',h.lp_fit,...
    'Style','Check','FontName','Helvetica','Value', 0,'String','Deg',...
    'HorizontalAlignment','center','Units','Normalized','FontSize',Font_size-2,...
    'Position', [0.47 0.7 0.04 0.1],'BackgroundColor',[0.45 0.45 0.45],...
    'Callback',@Bragg_Fit_Check);

h.Range_meV =uicontrol('Parent',h.lp_fit,...
    'Style', 'Check','FontName','Helvetica', 'String','eV',...
    'HorizontalAlignment','center','Units','Normalized','Value', 1,...
    'Position', [0.51 0.7 0.04 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Callback',@Bragg_Fit_Check);


% polatization selection
h.Polarization = uicontrol('Parent',h.lp_fit,...
    'Style' , 'text','FontName','Helvetica','String','Polar',...
    'FontWeight','normal','HorizontalAlignment','center','Units','Normalized',...
    'BackgroundColor',[0.45 0.45 0.45],'Position', [0.31 0.7 0.03 0.1],'FontSize',Font_size-2);

h.Polarization_s = uicontrol('Parent',h.lp_fit,...
    'Style' , 'Check','Enable', 'on','Value', 1,...
    'FontName','Helvetica','String','s','Units','Normalized','HorizontalAlignment','center','FontWeight','normal',...
    'BackgroundColor',[0.45 0.45 0.45],'Position', [0.34 0.7 0.03 0.1],'FontSize',Font_size-2,...
    'Callback',@Bragg_Fit_Check);
h.Polarization_p = uicontrol('Parent',h.lp_fit,...
    'Style' , 'Check','Enable', 'on','Value', 0,...
    'FontName','Helvetica','String','p','Units','Normalized','HorizontalAlignment','center','FontWeight','normal',...
    'BackgroundColor',[0.45 0.45 0.45],'Position', [0.37 0.7 0.03 0.1],'FontSize',Font_size-2,...
    'Callback',@Bragg_Fit_Check);
if polarization == 's'
    set(h.Polarization_s,'value',1)
    set(h.Polarization_p,'value',0)
else
    set(h.Polarization_s,'value',0)
    set(h.Polarization_p,'value',1)
end


% calculate and bragg angle
h.name_Theta_view = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','FontName','symbol','String','q',...
    'Position',[0.31 0.6 0.02 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);

h.Theta_view = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','Enable', 'off','String',' [] ',...
    'Position',[0.33 0.6 0.04 0.1],'FontSize',Font_size-2);

h.name_Theta_view = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','FontName','symbol','String',degree,...
    'Position',[0.37 0.6 0.01 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);

h.name_DarwinWidth = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','Dh',...
    'Position',[0.381 0.6 0.025 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);

h.DarwinWidth = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','Enable','off','String','[]',...
    'Position',[0.405 0.6 0.055 0.1],'FontSize',Font_size-2);

h.Dynamical_Reflectivity_1D = uicontrol('Parent',h.lp_fit,...
    'Style','push','Units','normalized','String','Reflectivity 1D',...
    'Position',[0.46 0.6 0.09 0.1],'BackgroundColor',[0 0.95 0],'FontSize',Font_size,...
    'Callback',@Dynamical_Reflectivity_1D);


%% Crystal
h.name_info_geometry_crystal = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','Xtal Geo',...
    'Position',[0.56 0.9 0.09 0.1],'BackgroundColor',[0.4 0.4 0.4],'FontSize',Font_size);

h.name_info_geometry_crystal_chk = uicontrol('Parent',h.lp_fit,...
    'Style','check','Units','normalized','String','off',...
    'Position',[0.56+0.09 0.9 0.05 0.1],'BackgroundColor',[0.4 0.4 0.4],'FontSize',Font_size-2,...
    'value',0,'Callback',@Bragg_Fit_Check);

%Surface normal to Crystal
h.name_Surface_geometry_crystal = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','Surface',...
    'Position',[0.56 0.8 0.05 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-1);

h.name_h_Surface_geometry_crystal = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','h',...
    'Position',[0.56+0.05 0.8 0.01 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.h_Surface_geometry_crystal = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','1',...
    'Position',[0.56+0.06 0.8 0.02 0.1],'BackgroundColor',[0.9 0.9 0.9],'FontSize',Font_size);

h.name_k_Surface_geometry_crystal = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','k',...
    'Position',[0.56+0.08 0.8 0.01 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.k_Surface_geometry_crystal = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','0',...
    'Position',[0.56+0.09 0.8 0.02 0.1],'BackgroundColor',[0.9 0.9 0.9],'FontSize',Font_size);

h.name_l_Surface_geometry_crystal = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','l',...
    'Position',[0.56+0.11 0.8 0.01 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.l_Surface_geometry_crystal = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','0',...
    'Position',[0.56+0.12 0.8 0.02 0.1],'BackgroundColor',[0.9 0.9 0.9],'FontSize',Font_size);


% Tagential component crystal
h.name_Tangential_geometry_crystal = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','Edge',...
    'Position',[0.56 0.7 0.05 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-1);

h.name_h_Tangential_geometry_crystal = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','h',...
    'Position',[0.56+0.05 0.7 0.01 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.h_Tangential_geometry_crystal = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','0',...
    'Position',[0.56+0.06 0.7 0.02 0.1],'BackgroundColor',[0.9 0.9 0.9],'FontSize',Font_size);

h.name_k_Tangential_geometry_crystal = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','k',...
    'Position',[0.56+0.08 0.7 0.01 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.k_Tangential_geometry_crystal = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','1',...
    'Position',[0.56+0.09 0.7 0.02 0.1],'BackgroundColor',[0.9 0.9 0.9],'FontSize',Font_size);

h.name_l_Tangential_geometry_crystal = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','l',...
    'Position',[0.56+0.11 0.7 0.01 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.l_Tangential_geometry_crystal = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','1',...
    'Position',[0.56+0.12 0.7 0.02 0.1],'BackgroundColor',[0.9 0.9 0.9],'FontSize',Font_size);


% Azimutal and chi angle for diffraction
h.name_chi_angle  = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','miscut',...
    'Position',[0.56 0.6 0.03 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.chi_angle = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','0',...
    'Position',[0.56+0.03 0.6 0.03 0.1],'BackgroundColor',[0.9 0.9 0.9],'FontSize',Font_size); 
h.name_chi_angle_unit  = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String',degree,...
    'Position',[0.56+0.06 0.6 0.01 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);

h.name_azimuthal_angle  = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','FontName','symbol','String','j',...
    'Position',[0.56+0.07 0.6 0.03 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.azimuthal_angle = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Enable','off','Units','normalized','String','-',...
    'Position',[0.56+0.1 0.6 0.03 0.1],'BackgroundColor',[0.9 0.9 0.9],'FontSize',Font_size); 

h.ame_azimuthal_angle_unit  = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String',degree,...
    'Position',[0.56+0.13 0.6 0.01 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);


%% Calculation of Chi_0 and Chi_h
h.name_f0 = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','SFactor',...
    'Position',[0.71 0.9 0.04 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);

h.f_check_values =uicontrol('Parent',h.lp_fit,...
    'Style','Check','Units','Normalized','String','Auto',...
    'FontName','Helvetica','HorizontalAlignment','center',...
    'Position', [0.71+0.04 0.9 0.05 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Value', 0,'Callback',@Bragg_Fit_Check);

h.name_f0 = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','F0',...
    'Position',[0.71 0.8 0.04 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.f0 = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','-',...
    'Enable','off',...
    'Position',[0.71+0.04 0.8 0.05 0.1],'FontSize',Font_size-2);

h.name_f1 = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','FH',...
    'Position',[0.71 0.7 0.04 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.f1 = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','-',...
    'Enable','off',...
    'Position',[0.71+0.04 0.7 0.05 0.1],'FontSize',Font_size-2);

h.name_f2 = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','F-H',...
    'Position',[0.71 0.6 0.04 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.f2 = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','-',...
    'Enable','off',...
    'Position',[0.71+0.04 0.6 0.05 0.1],'FontSize',Font_size-2);

%% More crystal elements
h.Single_Crystal = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','SingleXtals',...
    'Position',[0.8 0.9 0.07 0.1],'BackgroundColor',[0 0.95 0.95],'FontSize',Font_size-2);

h.Single_Crystal_Chk = uicontrol('Parent',h.lp_fit,...
    'Style','check','Units','normalized','String','off',...
    'Position',[0.87 0.9 0.05 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'value',1,'Callback',@More_Crystal);

h.More_Crystal = uicontrol('Parent',h.lp_fit,...
    'Style','push','Units','normalized','String','MoreXtals',...
    'Position',[0.8 0.8 0.07 0.1],'BackgroundColor',[0 0.95 0.95],'FontSize',Font_size-2,...    
    'Callback',@More_Crystal);
h.More_Crystal_Chk = uicontrol('Parent',h.lp_fit,...
    'Style','check','Units','normalized','String','off',...
    'Position',[0.87 0.8 0.05 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'value',0,'Callback',@More_Crystal);

h.name_info_number_crystal = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','NXtal',...
    'Position',[0.92 0.9 0.04 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);

h.info_number_crystal = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','-',...    
    'enable','off',...
    'Position',[0.96 0.9 0.04 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);

h.name_crystal_show= uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','SwXtal',...
    'Position',[0.92 0.8 0.04 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.crystal_show = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','1',...
    'enable','on',...
    'Position',[0.96 0.8 0.04 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);

%% Strain crystal
h.Strain_Crystal = uicontrol('Parent',h.lp_fit,...
    'Style','push','Units','normalized','String','StrainXtal',...
    'Position',[0.8 0.7 0.07 0.1],'BackgroundColor',[0 0.95 0.95],'FontSize',Font_size-2,...
    'Callback',@Strain_Crystal);

h.Strain_Crystal_Chk = uicontrol('Parent',h.lp_fit,...
    'Style','check','Units','normalized','String','off',...
    'Position',[0.87 0.7 0.05 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'value',0,'Callback',@Strain_Crystal);


h.Save_strain_2D =uicontrol('Parent',h.lp_fit,...
               'Style','Check','Units','Normalized','String','Save Strain 2D',...
               'FontName','Helvetica','HorizontalAlignment','center',...
               'Position', [0.92 0.7 0.08 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
               'Value', 0,'Callback',@Strain_Crystal);

%h.Xtal_2D = uicontrol('Parent',h.lp_fit,...
%    'Style','push','Units','normalized','String','Xtal_2D',...
%    'Position',[0.92 0.7 0.08 0.1],'BackgroundColor',[0 0.95 0.95],'FontSize',Font_size-2,...
%    'Callback',@Xtal_2D);

%h.name_XTAL_2D_CHK= uicontrol('Parent',h.lp_fit,...
%    'Style','check','Units','normalized','FontWeight','bold','String','On',...
%    'Position',[0.92 0.6 0.08 0.1],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size,...
%    'value',1,'Callback',@Xtal_2D);

h.Strain_Crystal = uicontrol('Parent',h.lp_fit,...
    'Style','push','Units','normalized','String','StrainXtal',...
    'Position',[0.8 0.7 0.07 0.1],'BackgroundColor',[0 0.95 0.95],'FontSize',Font_size-2,...
    'Callback',@Strain_Crystal);

h.Name_Strain_Thomsen = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','Thomsen',...
    'Position',[0.8 0.6 0.07 0.1],'BackgroundColor',[0.5 0.5 0.5],'FontSize',Font_size-2);

h.Strain_Thomsen_Chk = uicontrol('Parent',h.lp_fit,...
    'Style','check','Units','normalized','String','off',...
    'Position',[0.87 0.6 0.05 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'value',0,'Callback',@Strain_Crystal);


%% Beam properities
h.name_Beam_simulation_Theory = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','Beam:',...
    'FontWeight','bold',...
    'Position',[0. 0.45 0.04 0.1],'BackgroundColor',[0.4 0.4 0.4],'FontSize',Font_size);

%Flux
h.name_beam_flux= uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','Flux:',...
    'FontWeight','bold',...
    'Position',[0.041 0.45 0.039 0.1],'BackgroundColor',[0.4 0.4 0.4],'FontSize',Font_size);

h.Flux_Beam =uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','1e9',...
    'Position',[0.08 0.45 0.03 0.1],'FontSize',Font_size);

h.name_Flux_Beam =uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','ph',...
    'Position',[0.11 0.45 0.02 0.1],'BackgroundColor',[0.5 0.5 0.5],'FontSize',Font_size);
h.Flux_Beam_Check =  uicontrol('Parent',h.lp_fit,...
    'Style' , 'Check','Units','Normalized','String','off',...
    'Enable', 'on','FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.13 0.45 0.04 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Value', 0,'Callback',@Beam_3D_plot);

h.Temporal_SASE_Check = uicontrol('Parent',h.lp_fit,...
    'Style','Check','Units','normalized','FontWeight','bold','String','Heav',...
    'Position',[0.17 0.45 0.053 0.1],'BackgroundColor',[0.4 0.4 0.4],'FontSize',Font_size-3,...
    'Callback',@Beam_3D_plot);



%% Beam dimensions
h.name_flat_field = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','Flat',...
    'FontWeight','bold',...
    'Position',[0.0 0.35 0.04 0.1],'BackgroundColor',[0.4 0.4 0.4],'FontSize',Font_size);

h.flat_field = uicontrol('Parent',h.lp_fit,...
    'Style','check','Units','normalized','String','off',...
    'FontWeight','bold',...
    'Position',[0.041 0.35 0.04 0.1],'BackgroundColor',[0.4 0.4 0.4],'FontSize',Font_size-4,...
    'Callback',@Dynamical_Reflectivity_Extra);

h.name_Beam_Sigma = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','s',...
    'FontWeight','bold','FONTNAME','Symbol',...
    'Position',[0.081 0.35 0.03 0.1],'BackgroundColor',[0.4 0.4 0.4],'FontSize',Font_size-2);

h.name_Beam_Sigma = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','N Steps',...
    'FontWeight','bold',...
    'Position',[0.112 0.35 0.05 0.1],'BackgroundColor',[0.4 0.4 0.4],'FontSize',Font_size-2);
h.name_initial_range =uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','Range',...
    'FontWeight','bold',...
    'Position',[0.163 0.35 0.06 0.1],'BackgroundColor',[0.4 0.4 0.4],'FontSize',Font_size);

h.Gaussian_Beam_1D_Check =  uicontrol('Parent',h.lp_fit,...
    'Style' , 'Check','Units','Normalized','String','1D',...
    'Enable', 'on','FontWeight','normal','FontName','Helvetica','HorizontalAlignment','center',...
    'Position', [0.0 0.25 0.04 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Value', 0,'Callback',@Beam_3D_plot);
h.name_size_T_Beam =uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','t:',...
    'Position',[0.041 0.25 0.02 0.1],'BackgroundColor',[0.5 0.5 0.5],'FontSize',Font_size);
h.size_T_Beam =uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','[]',...
    'Position',[0.061 0.25 0.05 0.1],'FontSize',Font_size);
h.Nstep_t_Beam =uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','1000',...
    'Enable','off',...
    'Position',[0.112 0.25 0.05 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);    
    
h.initial_range_t =uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','500',...
    'Position',[0.163 0.25 0.04 0.1],'FontSize',Font_size);
h.name_size_t_Beam =uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','fs',...
    'Position',[0.203 0.25 0.02 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);

h.Gaussian_Beam_2D_Check =  uicontrol('Parent',h.lp_fit,...
    'Style' , 'Check','Units','Normalized','String','2D',...
    'Enable', 'on','FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.0 0.15 0.04 0.1], 'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Value', 0,'Callback',@Beam_3D_plot);

h.name_size_X_Beam =uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','x:',...
    'Position',[0.041 0.15 0.02 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);
h.size_X_Beam =uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','1',...
    'Position',[0.061 0.15 0.05 0.1],'FontSize',Font_size);

h.Nstep_x_Beam =uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','100',...
    'Position',[0.112 0.15 0.05 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);

h.initial_range_x =uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','200',...
    'Position',[0.163 0.15 0.04 0.1],'FontSize',Font_size);
h.name_size_X_Beam =uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','um',...
    'Position',[0.203 0.15 0.02 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);

h.Gaussian_Beam_3D_Check =  uicontrol('Parent',h.lp_fit,...
    'Style' , 'Check','Units','Normalized','String','3D',...
    'Enable', 'on','FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0. 0.05 0.04 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Value', 1,'Callback',@Beam_3D_plot);
h.name_size_Y_Beam =uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','y:',...
    'Position',[0.041 0.05 0.02 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);
h.size_Y_Beam =uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','1',...
    'Position',[0.061 0.05 0.05 0.1],'FontSize',Font_size);
h.Nstep_y_Beam =uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','30',...
    'Position',[0.112 0.05 0.05 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);
h.initial_range_y =uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','60',...
    'Position',[0.163 0.05 0.04 0.1],'FontSize',Font_size);
h.name_size_Y_Beam =uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','um',...
    'Position',[0.203 0.05 0.02 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);
set(h.Nstep_x_Beam,'string',Nstep_x_Beam)
set(h.Nstep_y_Beam,'string',Nstep_y_Beam)
set(h.size_X_Beam,'string',focus_x)
set(h.size_Y_Beam,'string',focus_y)
set(h.initial_range_x,'string',range_x)
set(h.initial_range_y,'string',range_y)

%% Mono
h.lp_Mono_simulation_Theory = uipanel('Parent',h.lp_fit,...
    'Units','normalized',...
    'Position',[0.24 0.05 0.26 0.5],'BackgroundColor',[0.4 0.4 0.4],'FontSize',Font_size);
h.name_Mono_simulation_Theory = uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style','text','Units','normalized','String','Monochromator',...
    'FontWeight','bold',...
    'Position',[0.0 0.8 0.5 0.2],'BackgroundColor',[0.4 0.4 0.4],'FontSize',Font_size);

h.Mono_Beam_Check =  uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style' , 'Check','Units','Normalized','String','off',...
    'Enable', 'on','FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.5 0.8 0.2 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Value', 0,'Callback',@Beam_3D_plot);

%Diffraction direction
h.crystal_orientation_Mono = uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style' , 'Check','Units','Normalized','String','Normal +',...
    'Enable', 'on','FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.0 0.6 0.3 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Value', 1,'Callback',@Beam_3D_plot);
        
h.name_Element_Mono =uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style','text','Units','normalized','String','Element',...
    'Position',[0.3 0.6 0.2 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.Element_Mono =uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style','Edit','Units','normalized','String','Si',...
    'Enable', 'on',...
    'Position',[0.5 0.6 0.2 0.2],'FontSize',Font_size);

%
h.name_H_Mono =uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style','text','Units','normalized','String','h',...
    'Position',[0. 0.4 0.07 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);
h.H_Mono =uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style','Edit','Units','normalized','String','3',...
    'Enable', 'on',...
    'Position',[0.07 0.4 0.07 0.2],'FontSize',Font_size);
h.name_K_Mono =uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style','text','Units','normalized','String','k',...
    'Position',[0.14 0.4 0.07 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);
h.K_Mono =uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style','Edit','Units','normalized','String','1',...
    'Enable', 'on',...
    'Position',[0.21 0.4 0.07 0.2],'FontSize',Font_size);
h.name_L_Mono =uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style','text','Units','normalized','String','l',...
    'Position',[0.28 0.4 0.07 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);
h.L_Mono =uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style','Edit','Units','normalized','String','1',...
    'Enable', 'on',...
    'Position',[0.35 0.4 0.07 0.2],'FontSize',Font_size);

h.name_Polarization_Mono =uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style','text','Units','normalized','String','Pola',...
    'Position',[0.0 0.2 0.1 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);

h.Polarization_s_Mono=  uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style' , 'Check','Units','Normalized','String','s',...
    'Enable', 'on','FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.1 0.2 0.2 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Value', 1,'Callback',@Beam_3D_plot);

h.Polarization_p_Mono =  uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style' , 'Check','Units','Normalized','String','p',...
    'Enable', 'on','FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.3 0.2 0.2 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Value', 0,'Callback',@Beam_3D_plot);

h.name_Thickness_Mono =uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style','text','Units','normalized','String','T(um)',...
    'Position',[0.2 0.0 0.15 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);

h.Thickness_Mono =uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style','Edit','Units','normalized','String','1e3',...
    'Position',[0.35 0.0 0.15 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);

h.name_Asymmetry_Mono =uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style','text','Units','normalized','String','f',...
    'FontName','symbol',...
    'Position',[0.0 0.0 0.1 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);

h.Asymmetry_Mono=uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style','Edit','Units','normalized','String','0',...
    'Enable', 'on',...
    'Position',[0.1 0.0 0.1 0.2],'FontSize',Font_size);


h.name_f0 = uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style','text','Units','normalized','String',' F0 ',...
    'Position',[0.5 0.4 0.1 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);
h.f0_Mono = uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style','Edit','Units','normalized','Enable','off','String','-',...
    'Position',[0.6 0.4 0.1 0.2],'FontSize',Font_size);

h.name_f1 = uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style','text','Units','normalized','String','FH',...
    'Position',[0.5 0.2 0.1 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);
h.f1_Mono = uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style','Edit','Units','normalized','Enable','off','String','-',...
    'Position',[0.6 0.2 0.1 0.2],'FontSize',Font_size);

h.name_f2 = uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style','text','Units','normalized','String','F-H',...
    'Position',[0.5 0.0 0.1 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);
h.f2_Mono = uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style','Edit','Units','normalized','Enable','off','String','-',...
    'Position',[0.6 0.0 0.1 0.2],'FontSize',Font_size);

set(h.Mono_Beam_Check,'value',monochromato_check)
set(h.H_Mono,'string',h_miller_mono)
set(h.K_Mono,'string',k_miller_mono)
set(h.L_Mono,'string',l_miller_mono)


%% Shift FFT
h.name_Shift_Time =  uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style' , 'text','Units','Normalized','String','Shift Range',...
    'Enable', 'on','FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.7 0.8 0.3 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);

h.Shift_t =  uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style' , 'Check','Units','Normalized','String','Shift t',...
    'Enable', 'on','FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.7 0.6 0.3 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Value', 1,'Callback',@Beam_3D_plot);

h.Shift_x =  uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style' , 'Check','Units','Normalized','String','Shift x',...
    'Enable', 'on','FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.7 0.4 0.3 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Value', 1,'Callback',@Beam_3D_plot);

h.Shift_y =  uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style' , 'Check','Units','Normalized','String','Shift y',...
    'Enable', 'on','FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.7 0.2 0.3 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Value', 1,'Callback',@Beam_3D_plot);

h.Shift_t2 =  uicontrol('Parent',h.lp_Mono_simulation_Theory,...
    'Style' , 'Check','Units','Normalized','String','Shift E',...
    'Enable', 'on','FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.7 0. 0.3 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Value', 1,'Callback',@Beam_3D_plot);


%% Energy Scan
h.lp_energy_scan = uipanel('Parent',h.lp_fit,...
    'Units','normalized',...
    'Position',[0.5 0.05 0.2 0.5],'BackgroundColor',[0.4 0.4 0.4],'FontSize',Font_size);

h.Mono_Scan_Check =  uicontrol('Parent',h.lp_energy_scan,...
    'Style' , 'Check','Units','Normalized','String','EScan',...
    'Enable', 'on','FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.0 0.8 0.35 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Value', 0,'Callback',@Beam_3D_plot);

h.Gaussian_Beam_SASE_Check =  uicontrol('Parent',h.lp_energy_scan,...
    'Style' , 'Check','Units','Normalized','String','SASE',...
    'Enable', 'on','FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.35 0.8 0.35 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...    
    'Value', 0,'Callback',@Beam_3D_plot);

h.name_rhoparameter = uicontrol('Parent',h.lp_energy_scan,...
    'Style','text','Units','normalized','String','r',...
    'FontWeight','bold','FontName','Symbol',...
    'Position',[0.7 0.8 0.05 0.2],'BackgroundColor',[0.4 0.4 0.4],'FontSize',Font_size-2);
h.rhoparameter =uicontrol('Parent',h.lp_energy_scan,...
    'Style','Edit','Units','normalized','String','5e-4',...
    'Position',[0.75 0.8 0.15 0.2],'FontSize',Font_size-2);
h.name_size_X_Beam =uicontrol('Parent',h.lp_energy_scan,...
    'Style','text','Units','normalized','String','%',...
    'Position',[0.9 0.8 0.1 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);


h.name_Range_pos_Mono = uicontrol('Parent',h.lp_energy_scan,...
    'Style','text','Units','normalized','String','Range +',...
    'Position',[0.0 0.6 0.3 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.Range_pos_Mono = uicontrol('Parent',h.lp_energy_scan,...
    'Style','Edit','Units','normalized','String','0',...
    'Position',[0.3 0.6 0.2 0.2],'FontSize',Font_size);

h.name_Range_neg_Mono = uicontrol('Parent',h.lp_energy_scan,...
    'Style','text','Units','normalized','String','Range -',...
    'Position',[0.5 0.6 0.3 0.2],'BackgroundColor',[0.55 0.45 0.45],'FontSize',Font_size-2);
h.Range_neg_Mono = uicontrol('Parent',h.lp_energy_scan,...
    'Style','Edit','Units','normalized','String','-5',...
    'Position',[0.8 0.6 0.2 0.2],'FontSize',Font_size);

h.name_Steps_Mono = uicontrol('Parent',h.lp_energy_scan,...
    'Style','text','Units','normalized','String','Steps',...
    'Position',[0.0 0.4 0.3 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.Steps_Mono = uicontrol('Parent',h.lp_energy_scan,...
    'Style','Edit','Units','normalized','String','5',...
    'Position',[0.3 0.4 0.2 0.2],'FontSize',Font_size);

set(h.Mono_Scan_Check,'value',energy_scan)
set(h.Steps_Mono,'string',Steps_Mono)
set(h.Range_pos_Mono,'string',Range_pos_Mono)
set(h.Range_neg_Mono,'string',Range_neg_Mono)

%% Repetition and average
h.name_Repetition_ave = uicontrol('Parent',h.lp_energy_scan,...
    'Style','text','Units','normalized','String','Average',...
    'Position',[0.0 0.2 0.3 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.Repetition_ave = uicontrol('Parent',h.lp_energy_scan,...
    'Style','Edit','Units','normalized','String','1',...
    'Position',[0.3 0.2 0.2 0.2],'FontSize',Font_size);

h.name_Repetition_channel = uicontrol('Parent',h.lp_energy_scan,...
    'Style','text','Units','normalized','String','Channel',...
    'Position',[0.0 0.0 0.3 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);

number_channel = randperm(99,1);
h.Repetition_channel = uicontrol('Parent',h.lp_energy_scan,...
    'Style','Edit','Units','normalized','String',number_channel,...
    'Position',[0.3 0.0 0.2 0.2],'FontSize',Font_size);

h.Channel_Save_average_Check =  uicontrol('Parent',h.lp_energy_scan,...
    'Style' , 'Check','Units','Normalized','String','Save average steps',...
    'Enable', 'on','FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.5 0.4 0.5 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Value', 0,'Callback',@Beam_3D_plot);

h.Channel_Save_All_Check =  uicontrol('Parent',h.lp_energy_scan,...
    'Style' , 'Check','Units','Normalized','String','All',...
    'Enable', 'on','FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.5 0.2 0.25 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'FontWeight','normal',...
    'Value', 0,'Callback',@Beam_3D_plot);

h.Channel_Save_XY_Check =  uicontrol('Parent',h.lp_energy_scan,...
    'Style' , 'Check','Units','Normalized','String','XY',...
    'Enable', 'on','FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.5 0.0 0.25 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Value', 1,'Callback',@Beam_3D_plot);

h.Channel_Save_XT_Check =  uicontrol('Parent',h.lp_energy_scan,...
    'Style' , 'Check','Units','Normalized','String','XT',...
    'Enable', 'on','FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.75 0.2 0.25 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Value', 1,'Callback',@Beam_3D_plot);

h.Channel_Save_YT_Check =  uicontrol('Parent',h.lp_energy_scan,...
    'Style' , 'Check','Units','Normalized','String','YT',...
    'Enable', 'on','FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.75 0.0 0.25 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Value', 0,'Callback',@Beam_3D_plot);

%% Laser steps
h.lp_laser = uipanel('Parent',h.lp_fit,...
    'Units','normalized',...
    'Position',[0.7 0.05 0.15 0.5],'BackgroundColor',[0.4 0.4 0.4],'FontSize',Font_size);
h.name_laser_para = uicontrol('Parent',h.lp_laser,...
    'Style','push','Units','normalized','String','Laser',...
    'Position',[0.0 0.8 0.5 0.2],'BackgroundColor',[0.4 0.4 0.4],'FontSize',Font_size-2,...    
    'Callback',@laser_plot);

%steps in Z
h.name_Thickness_Laser= uicontrol('Parent',h.lp_laser,...
    'Style','text','Units','normalized','String','Depth (um)',...
    'Position',[0.0 0.6 0.25 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.Thickness_Laser = uicontrol('Parent',h.lp_laser,...
    'Style','edit','Units','normalized','String','1',...
    'Position',[0.25 0.6 0.25 0.2],'BackgroundColor',[0.9 0.9 0.9],'FontSize',Font_size-2);

h.name_Steps_depth= uicontrol('Parent',h.lp_laser,...
    'Style','text','Units','normalized','String','Steps_z',...
    'Position',[0.5 0.6 0.25 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.Steps_depth = uicontrol('Parent',h.lp_laser,...
    'Style','edit','Units','normalized','String','100000',...
    'Position',[0.75 0.6 0.25 0.2],'BackgroundColor',[0.9 0.9 0.9],'FontSize',Font_size-2);

%time is in 10 femtosecond
h.name_Step_time= uicontrol('Parent',h.lp_laser,...
    'Style','text','Units','normalized','String','Steps_t',...
    'Position',[0.0 0.4 0.25 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.Step_time = uicontrol('Parent',h.lp_laser,...
    'Style','edit','Units','normalized','String','1000',...
    'Position',[0.25 0.4 0.25 0.2],'BackgroundColor',[0.9 0.9 0.9],'FontSize',Font_size-2);

h.name_time_step= uicontrol('Parent',h.lp_laser,...
    'Style','text','Units','normalized','String','Time_step',...
    'Position',[0.5 0.4 0.25 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.time_step = uicontrol('Parent',h.lp_laser,...
    'Style','edit','Units','normalized','String','10',...
    'Position',[0.75 0.4 0.25 0.2], 'BackgroundColor',[0.9 0.9 0.9],'FontSize',Font_size-2);

%Energy laser
h.name_Q_Laser= uicontrol('Parent',h.lp_laser,...
    'Style','text','Units','normalized','String','Energy (J)',...
    'Position',[0.0 0.2 0.25 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.Q_Laser = uicontrol('Parent',h.lp_laser,...
    'Style','edit','Units','normalized','String','100e-6',...
    'Position',[0.25 0.2 0.25 0.2],'BackgroundColor',[0.9 0.9 0.9],'FontSize',Font_size-2);

%Reflectivity laser
h.name_R_Laser= uicontrol('Parent',h.lp_laser,...
    'Style','text','Units','normalized','String','Reflec',...
    'Position',[0.5 0.2 0.25 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.R_Laser = uicontrol('Parent',h.lp_laser,...
    'Style','edit','Units','normalized','String','0.98',...
    'Position',[0.75 0.2 0.25 0.2],'BackgroundColor',[0.9 0.9 0.9],'FontSize',Font_size-2);

%Depth laser
h.name_depth_l= uicontrol('Parent',h.lp_laser,...
    'Style','text','Units','normalized','String','Depth(nm)',...
    'Position',[0.0 0. 0.25 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.depth_l = uicontrol('Parent',h.lp_laser,...
    'Style','edit','Units','normalized','String','10',...
    'Position',[0.25 0. 0.25 0.2],'BackgroundColor',[0.9 0.9 0.9],'FontSize',Font_size-2);
%area of the laser (m)
h.name_Area_l= uicontrol('Parent',h.lp_laser,...
    'Style','text','Units','normalized','String','Area(um2)',...
    'Position',[0.5 0. 0.25 0.2],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.Area_l = uicontrol('Parent',h.lp_laser,...
    'Style','edit','Units','normalized','String','90000',...
    'Position',[0.75 0. 0.25 0.2],'BackgroundColor',[0.9 0.9 0.9],'FontSize',Font_size-2);


%% diffraction electronic density
h.name_Chi_0 = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','Chi0',...
    'Position',[0.85 0.45 0.025 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.Chi_0 = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','[]',...
    'Enable','off',...
    'Position',[0.875 0.45 0.05 0.1],'FontSize',Font_size-2);

h.name_Chi_h = uicontrol('Parent',h.lp_fit,...
    'Style','text','Units','normalized','String','ChiH',...
    'Position',[0.925 0.45 0.025 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
h.Chi_h = uicontrol('Parent',h.lp_fit,...
    'Style','Edit','Units','normalized','String','[]',...
    'Enable','off',...
    'Position',[0.95 0.45 0.05 0.1],'FontSize',Font_size-2);

%% Shape XY
h.Lorenztian_Distribution =  uicontrol('Parent',h.lp_fit,...
    'Style','Check','Units','Normalized','String','Cauchy',...
    'Enable', 'on','FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.85 0.35 0.075 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Value', 0,'Callback',@Beam_3D_plot);

h.Gaussian_Distribution =  uicontrol('Parent',h.lp_fit,...
    'Style' , 'Check','Units','Normalized','String','Gaussian',...
    'Enable', 'on','FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.925 0.35 0.075 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Value', 1,'Callback',@Beam_3D_plot);

set(h.Lorenztian_Distribution,'value',Lorenztian_Distribution)
set(h.Gaussian_Distribution,'value',Gaussian_Distribution)

%if cluster == true then runs C files to speed up, false runs slow.
h.cluster_Check =  uicontrol('Parent',h.lp_fit,...
    'Style' , 'Check','Units','Normalized','String','Cluster',...
    'Enable', 'on','FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.85 0.25 0.075 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Value', 1,'Callback',@Beam_3D_plot);

%if Plot_on == true Shows interactive, false shows end.
h.Plot_on_Check =  uicontrol('Parent',h.lp_fit,...
    'Style' , 'Check','Units','Normalized','String','Plot all',...
    'Enable', 'on','FontName','Helvetica','FontWeight','normal','HorizontalAlignment','center',...
    'Position', [0.925 0.25 0.075 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2,...
    'Value', 1,'Callback',@Beam_3D_plot);

h.Beam_simulation = uicontrol('Parent',h.lp_fit,...
    'Style','push','FontWeight','bold','Units','normalized','String','Beam Simulation',...
    'Position',[0.85 0.05 0.15 0.2],'BackgroundColor',[0 0.95 0],'FontSize',Font_size,...
    'Callback',@Energy_Scan);


%% functions

    function laser_plot (source,eventdata)
        Thickness_layer = eval(get(h.Thickness_Laser,'String'))*1e-6; %nanometer
        element = get(h.Element,'String');
        steps_depth = eval(get(h.Steps_depth ,'string'));
        step_time = eval(get(h.Step_time ,'string'));
        Q_Laser = eval(get(h.Q_Laser ,'string'))*1e-6;
        Reflec_l = eval(get(h.R_Laser ,'string'));
        depth_l = eval(get(h.depth_l,'string'))*1e-9;
        Area_l = eval(get(h.Area_l,'string'))*1e-08;
        time_step = eval(get(h.time_step,'string'));
        
        [z,strainTH] = Strain_Thomsen(element, Reflec_l, Q_Laser,...
            Area_l, depth_l,time_step,step_time,Thickness_layer,steps_depth);
        
        h.strainTH = strainTH;
        h.Thickness_layer = Thickness_layer;
        
        figure
        plot(z, strainTH)
        title_strain = sprintf('Time %s ps',num2str(time_step)*1e-3);
        title(title_strain)
    end

    function Dynamical_Reflectivity_1D(source,evendata)
     
        if source == h.Dynamical_Reflectivity_1D
            
             %Clean figures
            child = get(h.I_Fig_Reflectivity_In,'Children'); %Reflectivity
            for i=1:length(child)
                delete(child(i));
            end
            
            child = get(h.I_Fig_Reflectivity_time_In,'Children'); %FFT reflectivity
            for i=1:length(child)
                delete(child(i));
            end
                        
            Dynamical_Refletivity_1D_call
            
            t_array = h.t_array;
            R_0H_S = h.R_0H_S;
            G_0H = h.G_0H;
            E_Scan = h.E_Scan;
            
            element =h.element;
            geometry_fecho = h.geometry_fecho;
            Energy_center = h.Energy_center;
            h_Miller = h.h_Miller;
            k_Miller = h.k_Miller;
            l_Miller = h.l_Miller;
            a_Par = h.a_Par;
            b_Par = h.b_Par;
            c_Par = h.c_Par;
            Thickness = h.Thickness_name;
            Polarization = h.Polarization;
            Strain_string = h.Strain_string;
            
            Ang_asy_Deg = h.Ang_asy_Deg;
            Theta_Bragg = h.Theta_Bragg;
            da_MCC = h.da_MCC;
            db_MCC = h.db_MCC;
            dc_MCC = h.dc_MCC;
            Thickness_MCC = h.Thickness_MCC; 
            
            if get(h.More_Crystal_Chk,'value') == 1
                R_0H_S_array = h.R_0H_S_array;
            end
                
            %Set array energy and time
            if get(h.K_Space_center_Check, 'Value') == 1
                E_Scan =  eval(get(h.K_Space_center,'String'))- E_Scan;
            end
            
            if get(h.Range_Deg, 'Value') == 1
                lambda_point = h.c_light * h.h_planck ./ Energy_center;
                d_spacing = 1/sqrt((h_Miller/a_Par)^2 + (k_Miller/b_Par)^2+ (l_Miller/c_Par)^2);
                d_spacing = d_spacing *1e-10;
                theta_point_rad = asin((h.c_light * h.h_planck ./ E_Scan) / (2*d_spacing));

                theta_Scan = theta_point_rad*180/pi + Ang_asy_Deg;
                E_Scan = theta_Scan;
                xlabel_name = '\theta (deg)';

            else
                xlabel_name = 'Energy (eV)';
            end
            
            if get(h. Time_center_Check, 'Value') == 1
                t_array = t_array -eval(get(h.Time_center,'String'));
            end
            
            %plots in energy
            axes(h.I_Fig_Reflectivity_In)
            hold on
            plot(E_Scan,abs(R_0H_S).^2,'Parent',h.I_Fig_Reflectivity_In)
            
            if get(h.phase_and_amplitud, 'value') == 1
                radius_R_0H_S = sqrt(real(R_0H_S).^2+imag(R_0H_S).^2);
                imag_R_0H_S = atan2(imag(R_0H_S),real(R_0H_S));
                
                %Calculation of phase and amplitud for Ana and Mariana
                imag_R_0H_S_cent = imag_R_0H_S(size(imag_R_0H_S,2));
                radius_R_0H_S_cent = radius_R_0H_S(size(imag_R_0H_S,2));
                
                Instensity = abs(R_0H_S).^2;
                Instensity_cent = Instensity(size(imag_R_0H_S,2));
                
                figure
                subplot(2,1,1)
                plot(E_Scan,radius_R_0H_S)
                title('amplitud')
                
                subplot(2,1,2)
                title('phase')
                plot(E_Scan,imag_R_0H_S)
            end
            
            %case multiple cryst plots all
            if get(h.More_Crystal_Chk,'value') == 1
                if get(h.Strain_Crystal_Chk,'value') == 1
                else
                    for i_cryst = 1:size(h.pos_MCC,2)
                        plot(E_Scan,abs(R_0H_S_array(i_cryst,:)).^2,'Parent',h.I_Fig_Reflectivity_In)
                    end
                end
            end
            title('Reflectivity Bragg vs Energy')
            xlabel(xlabel_name)
            axis auto
            
            if get(h.log_Reflectivity_Fig_Check,'value')  == 1
                set(h.I_Fig_Reflectivity_In, 'YScale', 'log')
            else
                set(h.I_Fig_Reflectivity_In, 'YScale', 'linear')
            end
            
            %calculate k space    
            if get(h.name_lim_K_Space_center,'value') == 1
                lim_k = eval(get(h.lim_K_Space_center,'String'));
                set(h.I_Fig_Reflectivity_In,'Xlim',[-lim_k lim_k])
            end
            
            [peaks,locs,width,cosa] = findpeaks(abs(G_0H).^2,'MinPeakDistance',2);
            [maxpeak,numpeak] = max(peaks);
            last_value = abs(G_0H(1,size(G_0H,2))).^2;
            
            %Fourier transform of the enegy to time
            if (locs(numpeak) > size(G_0H,2)/2) || (maxpeak < last_value)
                G_0H = fftshift(G_0H);
            end
            
            %save_folder_intermediate = '/das/work/p15/p15366/RN84/SwissFEL Simulations/Calculation_Support';
            if h.cluster == true
                save_folder_intermediate_Fit = '/gpfs/exfel/data/user/rodrigfa/Results/Fit/Strain';
            else
                save_folder_intermediate_Fit = '/Users/rodrigfa/Desktop/MultiBeam_calculator/Temporal_Data/Fit/Strain';
            end            
            
            %chose if we want to see the location of maxima following
            %shydv'ko formula.
            if get(h.Transverse_um_Check,'value') == 0
                
                %time femtosecond
                t_array_fs = t_array * 1e15;
                
                %Search peaks to center
                [peaks,locs,width,cosa] = findpeaks(abs(G_0H).^2,t_array_fs,'MinPeakDistance',2);

                %Center the peaks to position of the first maxima
                t_array_center = t_array_fs - locs(1,1);
                
                %Intensity
                Transverse_displacement = abs(G_0H).^2;
                
                %Smooth to find peaks
                Transverse_displacement_smooth = smoothdata(Transverse_displacement,'movmedian');%,'movmean');
                
                %plot
                axes(h.I_Fig_Reflectivity_time_In)
                hold on      
                findpeaks(Transverse_displacement_smooth,t_array_center,'MinPeakDistance',0.1,'minpeakprominence', 1, 'minpeakwidth',0.2);
                plot(t_array_center,abs(G_0H).^2,'Parent',h.I_Fig_Reflectivity_time_In)
                axis auto
                title('Temporal delay')
                xlabel('Time (fs)')
                
                [peaks,locs,width,promi] = findpeaks(Transverse_displacement_smooth,t_array_center,'MinPeakDistance',0.1,'minpeakprominence', 1, 'minpeakwidth',0.2);
                    
                i_peaks_count = 0;
                for i_peaks = 1:size(peaks,2)                    
                    if width(1,i_peaks) > 0.2
                        i_peaks_count = i_peaks_count +1;
                        
                        number(i_peaks_count,1) = i_peaks_count;
                        Intensity (i_peaks_count,1) = peaks(1,i_peaks);                        
                        Positions(i_peaks_count,1)  = locs(1,i_peaks);
                        witdh_table(i_peaks_count,1)  = width(1,i_peaks);
                        
                    end
                end
                
                if get(h.name_lim_Time_center,'value') == 1
                    lim_time = eval(get(h.lim_Time_center,'String'));
                    set(h.I_Fig_Reflectivity_time_In,'Xlim',[-lim_time lim_time])
                end
                
                if get(h.log_Time_Fig_Check,'value')  == 1
                    set(h.I_Fig_Reflectivity_time_In, 'YScale', 'log')
                else
                    set(h.I_Fig_Reflectivity_time_In, 'YScale', 'linear')
                end
                
                %Table Results
                names_table = ["Number", "Positions", "Intensity", "FWHM"];
                Table_Results(:,1) = number;
                Table_Results(:,2) = Positions;
                Table_Results(:,3) = Intensity;
                Table_Results(:,4) = witdh_table;
                
               %Save folder results               
                Name_File_echoes = sprintf('Temporal_Profile_Fit_%s_%s_E%.3deV_%d%d%d_t%dum_As%.2d_polar_%s_%s.txt',element,geometry_fecho,Energy_center,h_Miller,k_Miller,l_Miller,Thickness,Ang_asy_Deg,Polarization,Strain_string);
                
                %Add
                 Name_path_echoes = fullfile(save_folder_intermediate_Fit, Name_File_echoes);
%                   %dlmwrite(Name_path_echoes,'','delimiter','\t','-append', 'roffset', 1);
                 
                 header_echoes = 'Fit table';                 
%                  %dlmwrite(Name_path_echoes,header_echoes,'delimiter','\t','-append', 'roffset', 1);
%                  %dlmwrite(Name_path_echoes,Table_Results(:,:),'delimiter','\t','-append', 'roffset', 1);
            
            else %Transverse displacement                

                %The Bragg angle calculated in together with asymmetry, in not Bragg angle but incident angle
                Ang_asy = Ang_asy_Deg *pi/180;
                % we Substract the asymetry to the incident angle
                Theta_Bragg_Shvyd = Theta_Bragg-Ang_asy;
                %Print the Bragg angle to see that fits the correct value
                %in theotry
                Theta_Bragg_deg = Theta_Bragg_Shvyd *180 / pi;
                %Shvyd'ko factor spatiotemporal coupling
                Factor = cot(Theta_Bragg_Shvyd);
                %%%%%%%%%%%%%%%%%%%%
                                
                %Transverse displacment time equation shvyd'ko
                x_array = h.c_light.*t_array *1e6 * Factor; %position in microns
                
               %Intensity
                Transverse_displacement = abs(G_0H).^2;
                
                %Smooth to find peaks
                Transverse_displacement_smooth = smoothdata(Transverse_displacement,'movmedian');%,'movmean');
                
                %Search peaks to center
                [peaks,locs,width,cosa] = findpeaks(Transverse_displacement_smooth,x_array,'MinPeakDistance',0.1);
                [maxpeak,numpeak] = max(peaks);

                %Center the peaks to position of the first maxima
                x_array_center = x_array - locs(1,numpeak);
                
                %plot
                axes(h.I_Fig_Reflectivity_time_In)
                hold on      
                findpeaks(Transverse_displacement_smooth,x_array_center,'MinPeakDistance',.1);
                plot(x_array_center,Transverse_displacement,'Parent',h.I_Fig_Reflectivity_time_In)
                axis auto
                title('Transverse displacemnt depdendence')
                xlabel('Transverse direction (\mum)')
                
                [peaks,locs,width,promi] = findpeaks(Transverse_displacement_smooth,x_array_center,'MinPeakDistance',.1);
               
                i_peaks_count = 0;
                for i_peaks = 1:size(peaks,2)
                    
                    if width(1,i_peaks) > 0.4
                        i_peaks_count = i_peaks_count +1;
                        
                        number(i_peaks_count,1) = i_peaks_count;
                        Intensity (i_peaks_count,1) = peaks(1,i_peaks);                        
                        Positions(i_peaks_count,1)  = locs(1,i_peaks);
                        witdh_table(i_peaks_count,1)  = width(1,i_peaks);
                        
                    end
                end
                                
                if get(h.name_lim_Time_center,'value') == 1
                    lim_time = eval(get(h.lim_Time_center,'String'));
                    set(h.I_Fig_Reflectivity_time_In,'Xlim',[-lim_time lim_time])
                end
                
                if get(h.log_Time_Fig_Check,'value')  == 1
                    set(h.I_Fig_Reflectivity_time_In, 'YScale', 'log')
                else
                    set(h.I_Fig_Reflectivity_time_In, 'YScale', 'linear')
                end
                                
            end
            
            if get(h.plot_results_fit_1D,'value') == 1
                %open figure
                h.I_Fig_Reflectivity_Dynamical_Res = figure(d+195);
                %close to errase previous
                close(d+195)
                %re open figure
                h.I_Fig_Reflectivity_Dynamical_Res = figure(d+195);
                
                Position_Fig_Strain = get(h.lp_fit,'Position');
                Position_x = Position_Fig_Strain(1,1);
                Position_y = Position_Fig_Strain(1,2);
                width_x = Position_Fig_Strain(1,3);
                width_y = Position_Fig_Strain(1,4);
                
                set(h.I_Fig_Reflectivity_Dynamical_Res,'Name','Dynamical reflectivity',...
                    'NumberTitle', 'on','Toolbar','figure','visible','on','Units','normalized','Menubar','figure',...
                    'Position', [Position_x+0.25 Position_y-(width_y+0.1) width_x width_y+0.05],'Color',[1 1 1],...
                    'KeyReleaseFcn',@Press);
                
                h.I_Fig_Transverse_displacement = axes('Parent',h.I_Fig_Reflectivity_Dynamical_Res, 'Units','normalized',...
                    'box','on','LineWidth',0.5,'FontName','Helvetica','FontWeight','bold',...
                    'Position',[0.6 0.15 0.35 0.68],'Color',[1 1 1],'FontSize',Font_size,...
                    'Xlim',[-1 1]);
                title('Transverse displacement')
                xlabel('Transverse displacement (\mum)')
                ylabel('Intensity (arb. unit)')
                grid('on');
                
                h.name_Result_Fit_1D =  uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical_Res,...
                    'Style' , 'text','Enable','on','FontName','Helvetica','String','Result Fit',...
                    'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                    'Position',[0.01 0.85 0.25 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size);
                
                %Table Results
                names_table = ["Number", "Positions", "Intensity", "FWHM"];
                Table_Results(:,1) = number;
                Table_Results(:,2) = Positions;
                Table_Results(:,3) = Intensity;
                Table_Results(:,4) = witdh_table;
                
                h.uit = uitable(h.I_Fig_Reflectivity_Dynamical_Res);
                h.uit.Data = Table_Results;
                h.uit.ColumnEditable = true;
                h.uit.Position = [5 50 355 200];
                h.uit.ColumnName = names_table;
                %                    h.uit.DisplayDataChangedFcn = @updatePlot;
                
                %save results
                Name_File_echoes = sprintf('Spatial_Profile_Fit_%s_%s_E%.3deV_%d%d%d_t%dum_As%.2d_polar_%s_%s.txt',element,geometry_fecho,Energy_center,h_Miller,k_Miller,l_Miller,Thickness,Ang_asy_Deg,Polarization,Strain_string);
                
                %Add
                Name_path_echoes = fullfile(save_folder_intermediate_Fit, Name_File_echoes);
                %                     %dlmwrite(Name_path_echoes,'','delimiter','\t','-append', 'roffset', 1);
                
                header_echoes = 'Fit table';
                %                     %dlmwrite(Name_path_echoes,header_echoes,'delimiter','\t','-append', 'roffset', 1);
                %                     %dlmwrite(Name_path_echoes,Table_Results(:,:),'delimiter','\t','-append', 'roffset', 1);
                
                if get(h.Strain_Crystal_Chk,'value') == 1
                    h.name_Strain_model_1D =  uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical_Res,...
                        'Style' , 'text','Enable','on','FontName','Helvetica','String','Strain Model',...
                        'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                        'Position',[0.3 0.85 0.2 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size);
                    
                    %Table Strain
                    layer = linspace(1,size(da_MCC,2),size(da_MCC,2))';
                    da_layer = da_MCC * 1e3;
                    
                    thickness_Layer = Thickness_MCC';
                    names_table = ["Layer", "T (\mum)", "da/a (1e-3)"];
                    Table_Strain(:,1) = layer;
                    Table_Strain(:,2) = thickness_Layer;
                    Table_Strain(:,3) = da_layer';
                    
                    h.uit2 = uitable(h.I_Fig_Reflectivity_Dynamical_Res);
                    h.uit2.Data = Table_Strain;
                    h.uit2.ColumnEditable = true;
                    h.uit2.Position = [360 50 270 200];
                    h.uit2.ColumnName = names_table;
                    %                         h.uit2.DisplayDataChangedFcn = @updatePlot;
                    header_Strain = 'Strain pofile';
                    
                    %                         %dlmwrite(Name_path_echoes,header_Strain,'delimiter','\t','-append', 'roffset', 1);
                    %                         %dlmwrite(Name_path_echoes,Table_Strain(:,:),'delimiter','\t','-append', 'roffset', 1);
                end
                
                %Clean figure
                child = get(h.I_Fig_Transverse_displacement,'Children'); %Reflectivity
                for i=1:length(child)
                    delete(child(i));
                end
                
                if get(h.Transverse_um_Check,'value') == 0
                    axes(h.I_Fig_Transverse_displacement)
                    hold on
                    findpeaks(Transverse_displacement_smooth,t_array_center,'MinPeakDistance',0.2,'minpeakprominence', 1, 'minpeakwidth',0.2)
                    set(h.I_Fig_Transverse_displacement, 'YScale', 'log')
                else
                    axes(h.I_Fig_Transverse_displacement)
                    hold on
                    findpeaks(Transverse_displacement_smooth,x_array_center,'MinPeakDistance',.1,'minpeakprominence', 1, 'minpeakwidth',0.2)
                    set(h.I_Fig_Transverse_displacement, 'YScale', 'log')
                end
                
            end
        end
    end

    function Dynamical_Refletivity_1D_call(source,eventdata)
        
        Thickness = eval(get(h.Thickness,'String'));                    %Thickness
        element = get(h.Element,'String');                              %Element
        crystal_orientation = get(h.crystal_orientation,'value');       %Geometry and transmission
        
        Energy_center = eval(get(h.Energy_input,'String'));             %Energy
        
        Energy_Bragg =  Energy_center;                                  %We do easy calculation and keep center of Energy as Energy of Bragg
        h_Miller = eval(get(h.h_miller,'String'));                      %hkl Miller index
        k_Miller = eval(get(h.k_miller,'String'));                      %hkl Miller index
        l_Miller = eval(get(h.l_miller,'String'));                      %hkl Miller index
        
        DWF = eval(get(h.DWF,'String'));                                %Debye Waller effect constant
        
        Range_E_neg = (-1)*eval(get(h.Range_Left,'String'));            %Range negative around energy Bragg energy in eV
        Range_E_pos = eval(get(h.Range_Right,'String'));                %Range positive around energy Bragg energy in eV
        
        Absorption = get(h.Absorption,'Value');                         %Absorption true or false
        
        Ang_asy_Deg = eval(get(h.Asymmetry,'String'));                  %Asymmetry for Bragg angle to the surface (alfa),  for Laue (alfa-90)
        
        N_Steps = eval(get(h.N_Steps,'String'));                        %Number of points in reflectivity calculation
        set(h.Nstep_t_Beam,'String',N_Steps)
        
        if get(h.Polarization_s,'Value') == 1                           % Polarization of the diffraction assuming sigma polarized incoming beam
            Polarization = 's';                                         % vertical diffraction condition
        else
            Polarization = 'p';                                         % horizontal diffraction condition
        end
        
        %Strain cases with multilatyers type studies
        if get(h.Strain_Crystal_Chk,'value') == 1
            
            if get(h.Strain_Thomsen_Chk,'value') == 1 %temporal dependence model of strain
                [Z,F0,FH,F_H,a_Par,b_Par,c_Par,alpha_Par,beta_Par,gamma_Par] = Element_Bragg_temp_Gui(element,h_Miller,k_Miller,l_Miller,Energy_center);
                i_cryst = 1;
                
            else %Stratic strain Hokanen et al and multilayer system. As in Stepanov layers of crystals
                
                pos_MCC = h.pos_MCC;                                        %Layer position
                Element_MCC = h.Element_MCC;                                %element
                h_MCC = h.h_MCC;    k_MCC = h.k_MCC;   l_MCC = h.l_MCC;     %hkl
                Thickness_MCC = h.Thickness_MCC;                            %Thickness of each layer
                Geometry_MCC = h.Geometry_MCC;                              %Geometry of each layer
                Transmission_MCC = h.Transmission_MCC;                      %Transmission of reflexion for each layer
                Asymmetry_MCC =h.Asymmetry_MCC;                             % Asymetry reflection fo each layer
                Normal_MCC = h.Normal_MCC;                                  %Normal for each layer
                polarization_MCC = h.polarization_MCC;                      %Polarization for each layer
                Energy_MCC = h.name_Energy;                                 %Energy for each layer
                Beam_MCC = h.name_Beam;                                     %Correction of energy for each layer
                da_MCC = h.da_MCC;  db_MCC = h.db_MCC; dc_MCC = h.dc_MCC;   %Variation of lattice parameter for each layer
                
                i_cryst_show = eval(get(h.crystal_show,'string'));          %Which layer should be shown
                
                for i_cryst = 1:size(pos_MCC,2)
                    element = char(Element_MCC(1,i_cryst));                                     % Element in char
                    vector_Miller = [h_MCC(1,i_cryst), k_MCC(1,i_cryst),l_MCC(1,i_cryst)];      % Miller index [h k l]
                    %call frunction Element_Bragg_temp_Gui
                    [Z_i, F0_i, FH_i, F_H_i, a_Par_i, b_Par_i, c_Par_i,alpha_Par_i,beta_Par_i,gamma_Par_i] =...
                        Element_Bragg_temp_Gui(element,h_MCC(1,i_cryst),k_MCC(1,i_cryst),l_MCC(1,i_cryst),Energy_center);
                    
                    %Structure factor for each layer
                    F0(1,i_cryst) = F0_i;  FH(1,i_cryst) = FH_i;   F_H(1,i_cryst) = F_H_i;
                    
                    %calculationof real d-spacing for each layer
                    a_Par(1,i_cryst) = a_Par_i + da_MCC(1,i_cryst)*a_Par_i;   b_Par(1,i_cryst) = b_Par_i + db_MCC(1,i_cryst)*b_Par_i;   c_Par(1,i_cryst) = c_Par_i + dc_MCC(1,i_cryst)*c_Par_i;
                    
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    % Perpendicular strain
                    strain_per = da_MCC; % need understanding of strain
                    % parallel strain
                    strain_par = da_MCC; % need understanding of strain
                end
            end
            
        elseif get(h.More_Crystal_Chk,'value') == 1 % Several crystals one after the other
            pos_MCC = h.pos_MCC;                                        %Crytal position
            Element_MCC = h.Element_MCC;                                %element
            h_MCC = h.h_MCC;    k_MCC = h.k_MCC;   l_MCC = h.l_MCC;     %hkl
            Thickness_MCC = h.Thickness_MCC;                            %Thickness of each crystal
            Geometry_MCC = h.Geometry_MCC;                              %Geometry of each crystal
            Transmission_MCC = h.Transmission_MCC;                      %Transmission of reflexion for each crystal
            Asymmetry_MCC =h.Asymmetry_MCC;                             % Asymetry reflection fo each crystal
            Normal_MCC = h.Normal_MCC;                                  %Normal for each crystal
            polarization_MCC = h.polarization_MCC ;                     %Polarization for each crystal
            Energy_MCC = h.name_Energy;                                 %Enegy for each crystal
            Beam_MCC = h.name_Beam;                                     %Correction of energy for each crystal
            da_MCC = h.da_MCC;  db_MCC = h.db_MCC; dc_MCC = h.dc_MCC;   %Variation of lattice parameter for each crystal
            
            i_cryst_show = eval(get(h.crystal_show,'string'));
            
            for i_cryst = 1:size(pos_MCC,2)
                element = char(Element_MCC(1,i_cryst));                                        % Element in char
                vector_Miller = [h_MCC(1,i_cryst), k_MCC(1,i_cryst),l_MCC(1,i_cryst)];         % Miller index [h k l]
                %call frunction Element_Bragg_temp_Gui
                [Z_i, F0_i, FH_i, F_H_i, a_Par_i, b_Par_i, c_Par_i,alpha_Par_i,beta_Par_i,gamma_Par_i] =...
                    Element_Bragg_temp_Gui(element,h_MCC(1,i_cryst),k_MCC(1,i_cryst),l_MCC(1,i_cryst),Energy_center);
                
                %Structure factor for each Crystal
                F0(1,i_cryst) = F0_i;  FH(1,i_cryst) = FH_i;   F_H(1,i_cryst) = F_H_i;
                %calculationof real d-spacing for each Crystal
                a_Par(1,i_cryst) = a_Par_i + da_MCC(1,i_cryst)*a_Par_i;   b_Par(1,i_cryst) = b_Par_i + db_MCC(1,i_cryst)*b_Par_i;   c_Par(1,i_cryst) = c_Par_i + dc_MCC(1,i_cryst)*c_Par_i;
                
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                % Perpendicular strain
                strain_per =  da_MCC + db_MCC + dc_MCC; % need understanding of strain
                % parallel strain
                strain_par = 0; %da_MCC + db_MCC + dc_MCC; % need understanding of strain
            end
            
        elseif get(h.Single_Crystal_Chk,'value') == 1  %Simple case, one crystal no strain
            %call frunction Element_Bragg_temp_Gui
            [Z,F0,FH,F_H,a_Par,b_Par,c_Par,alpha_Par,beta_Par,gamma_Par] = Element_Bragg_temp_Gui(element,h_Miller,k_Miller,l_Miller,Energy_center);
            i_cryst = 1;                                                % Same function call for 1 crysal
        end
        
        % Show information calculated in GUI
        set(h.f0,'String',F0(1,i_cryst))
        set(h.f1,'String',FH(1,i_cryst))
        set(h.f2,'String',F_H(1,i_cryst))
        
        %If user introduce a new cell parameter
        if get(h.CParameter_Check,'Value') == 1
            a_Par = eval(get(h.a_parameter,'String'));
            b_Par = eval(get(h.b_parameter,'String'));
            c_Par = eval(get(h.c_parameter,'String'));
        end
        %Show cell paramter of a crystal or layer
        set(h.a_parameter,'String',a_Par(1,i_cryst))
        set(h.b_parameter,'String',b_Par(1,i_cryst))
        set(h.c_parameter,'String',c_Par(1,i_cryst))
        
        
        %             %Possible improve to random oriented crystals
        %             if get(h.name_info_geometry_crystal_chk,'Value') == 1
        %
        %                 miscut =  eval(get(h.chi_angle,'string'));
        %
        %                 N(1,1) = eval(get(h.h_Surface_geometry_crystal,'string'));
        %                 N(1,2) = eval(get(h.k_Surface_geometry_crystal,'string'));
        %                 N(1,3) = eval(get(h.l_Surface_geometry_crystal,'string'));
        %
        %                 T(1,1) = eval(get(h.h_Tangential_geometry_crystal,'string'));
        %                 T(1,2) = eval(get(h.k_Tangential_geometry_crystal,'string'));
        %                 T(1,3) = eval(get(h.l_Tangential_geometry_crystal,'string'));
        %
        %                 S = cross(N,T);
        %                 % . should give back the azimuthal component and the
        %                 % assymmetry of the
        %
        %                 Azimuthal_Deg = 0;
        %                 set(h.azimuthal_angle,'string',Azimuthal_Deg)
        %                 Ang_asy_Deg = 0;
        %                 set(h.Asymmetry,'String',Ang_asy_Deg)
        %             end
        %
        %
        %             % Manual introduction of the structure factor
        %             if get(h.f_check_values,'Value') == 1
        %                 F0 = eval(get(h.f0,'String'));
        %                 FH = eval(get(h.f1,'String'));
        %                 F_H = eval(get(h.f2,'String'));
        %             end
        
        R_0H_S = [];
        G_0H = [];
        R_0H_S_array = [];
        
        if get(h.Strain_Crystal_Chk,'value') == 1 %Strain crystal
            
            if get(h.Strain_Thomsen_Chk,'value') == 1 %temporal model
                
                message = 'No support, function incorrect need to work on i'
                
                if (get(h.Bragg_Check,'Value')) || (get(h.Bragg_FBD_Check,'Value'))
                    [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_0H_S,E_Scan,G_0H,t_array,k_array,Dwidth] =...
                        Gui_temp_Bragg_1D_strain(a_Par,b_Par,c_Par,Energy_Bragg,Energy_center,h_Miller,k_Miller,l_Miller,...
                        DWF,F0,FH,F_H,Absorption,Range_E_neg,Range_E_pos,Polarization,Ang_asy_Deg,Thickness,N_Steps,...
                        get(h.Bragg_FBD_Check,'Value'),crystal_orientation,h.strainTH,h.Thickness_layer);
                    
                    if (get(h.Bragg_Check,'Value'))
                        set(h.BD_plot_Check,'Value',1)
                        geometry_fecho = 'BD';
                    elseif get(h.Bragg_FBD_Check,'Value')
                        set(h.FBD_plot_Check,'Value',1)
                        geometry_fecho = 'FBD';
                    end
                    
                elseif (get(h.Laue_FBD_Check,'Value')) ||(get(h.Laue_Check,'Value'))
                    [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_0H_S,E_Scan,G_0H,t_array,Dwidth] =...
                        Gui_temp_Laue_1D_strain(a_Par,b_Par,c_Par,Energy_Bragg,Energy_center,h_Miller,k_Miller,l_Miller,...
                        DWF,F0,FH,F_H,Absorption,Range_E_neg,Range_E_pos,Polarization,Ang_asy_Deg,Thickness,N_Steps,...
                        get(h.Laue_FBD_Check,'Value'),crystal_orientation,strainTH);
                    
                    if (get(h.Laue_FBD_Check,'Value'))
                        set(h.FLD_plot_Check,'Value',1)
                        geometry_fecho = 'FLD';
                    elseif get(h.Laue_Check,'Value')
                        set(h.LD_plot_Check,'Value',1)
                        geometry_fecho = 'LD';
                    end
                end
                
                
            else % Crystal with different layers (of strain)
                
                %different crystals
                if Geometry_MCC(1,i_cryst) ==1     %BraggD = 1;
%                     [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_0H_S,E_Scan,G_0H,t_array,Dwidth] =...
%                         Gui_temp_Bragg_1D_strain(a_Par,b_Par,c_Par,Energy_Bragg,Energy_center+Energy_MCC,...
%                         h_MCC,k_MCC,l_MCC,DWF,F0,FH,F_H,Absorption,Range_E_neg,Range_E_pos,Polarization,...
%                         Asymmetry_MCC,Thickness_MCC,N_Steps,Transmission_MCC,Normal_MCC,strain_per,strain_par);
                    [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_0H_S,E_Scan,G_0H,t_array,Dwidth] =...
                        Gui_temp_Bragg_1D_strain_inv(a_Par,b_Par,c_Par,Energy_Bragg,Energy_center+Energy_MCC,...
                        h_MCC,k_MCC,l_MCC,DWF,F0,FH,F_H,Absorption,Range_E_neg,Range_E_pos,Polarization,...
                        Asymmetry_MCC,Thickness_MCC,N_Steps,Transmission_MCC,Normal_MCC,strain_per,strain_par);
%                     
                    if (get(h.Bragg_Check,'Value'))
                        geometry_fecho = 'BD';
                    elseif get(h.Bragg_FBD_Check,'Value')
                        geometry_fecho = 'FBD';
                    end
                    
                else                                %LaueD = 1;
                    [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_0H_S,E_Scan,G_0H,t_array,Dwidth] =...
                        Gui_temp_Laue_1D_strain(a_Par,b_Par,c_Par,Energy_Bragg,Energy_center+Energy_MCC,...
                        h_MCC,k_MCC,l_MCC,DWF,F0,FH,F_H,Absorption,Range_E_neg,Range_E_pos,Polarization,...
                        Asymmetry_MCC,Thickness_MCC,N_Steps,Transmission_MCC,Normal_MCC,strain_per,strain_par);
                    if (get(h.Laue_Check,'Value'))
                        geometry_fecho = 'LD';
                    elseif get(h.Laue_FBD_Check,'Value')
                        geometry_fecho = 'FLD';
                    end
                end
                
            end
            G_0H = fft(R_0H_S);
            
            % More than 1 crystal
        elseif get(h.More_Crystal_Chk,'value') == 1
            
            R_0H_S = ones(1,N_Steps);
            for i_cryst = 1:size(pos_MCC,2)
                if polarization_MCC(1,i_cryst) == 1
                    Polarization = 's';
                else
                    Polarization = 'p';
                end
                
                Z = Element_MCC(1,i_cryst);
                
                if Geometry_MCC(1,i_cryst) == 1  %LaueD = 0;
                    [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_S_1D,E_Scan,G_0H_1D,t_array,Dwidth] =...
                        Gui_temp_Bragg_1D(a_Par(1,i_cryst),b_Par(1,i_cryst),c_Par(1,i_cryst),Energy_Bragg,...
                        Energy_center+Energy_MCC(1,i_cryst),h_MCC(1,i_cryst),k_MCC(1,i_cryst),l_MCC(1,i_cryst),...
                        DWF,F0(1,i_cryst),FH(1,i_cryst),F_H(1,i_cryst),Absorption,Range_E_neg,Range_E_pos,...
                        Polarization,Asymmetry_MCC(1,i_cryst),Thickness_MCC(1,i_cryst),N_Steps,...
                        Transmission_MCC(1,i_cryst),Normal_MCC(1,i_cryst));
                    
                    if Transmission_MCC(1,i_cryst) == 1
                        geometry_fecho = 'BD';
                    else
                        geometry_fecho = 'FBD';
                    end
                    
                else                                %LaueD = 1;
                    [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_S_1D,E_Scan,G_0H_1D,t_array,Dwidth] =...
                        Gui_temp_Laue_1D(a_Par(1,i_cryst),b_Par(1,i_cryst),c_Par(1,i_cryst),Energy_Bragg,...
                        Energy_center+Energy_MCC(1,i_cryst),h_MCC(1,i_cryst),k_MCC(1,i_cryst),l_MCC(1,i_cryst),...
                        DWF,F0(1,i_cryst),FH(1,i_cryst),F_H(1,i_cryst),Absorption,Range_E_neg,Range_E_pos,...
                        Polarization,Asymmetry_MCC(1,i_cryst),Thickness_MCC(1,i_cryst),N_Steps,...
                        Transmission_MCC(1,i_cryst),Normal_MCC(1,i_cryst));
                    
                    if Transmission_MCC(1,i_cryst) == 1
                        geometry_fecho = 'LD';
                    else
                        geometry_fecho = 'FLD';
                    end
                    
                end
               
                %Built the matrix of crystals.
                for i_pos_MCC = 1:8
                    if pos_MCC(1,i_cryst) == i_pos_MCC
                        R_0H_S_array(i_pos_MCC,:) = R_S_1D(1,:);
                    end
                end
                
                R_0H_S= R_0H_S.*R_S_1D(1,:);
                G_0H = fft(R_0H_S);                
            end            
            
        elseif get(h.More_Crystal_Chk,'value') == 0 %Normal case, only one crystal
            set(h.BD_plot_Check,'Value',0)
            set(h.FBD_plot_Check,'Value',0)
            set(h.LD_plot_Check,'Value',0)
            set(h.FLD_plot_Check,'Value',0)
            
            if (get(h.Bragg_Check,'Value')) || (get(h.Bragg_FBD_Check,'Value'))
                [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_0H_S,E_Scan,G_0H,t_array,k_array,Dwidth] =...
                    Gui_temp_Bragg_1D(a_Par,b_Par,c_Par,Energy_Bragg,Energy_center,h_Miller,k_Miller,l_Miller,DWF...
                    ,F0,FH,F_H,Absorption,Range_E_neg,Range_E_pos,Polarization,Ang_asy_Deg,Thickness,N_Steps,...
                    get(h.Bragg_FBD_Check,'Value'),crystal_orientation);
                
                
                if (get(h.Bragg_Check,'Value'))
                    set(h.BD_plot_Check,'Value',1)
                    geometry_fecho = 'BD';
                elseif get(h.Bragg_FBD_Check,'Value')
                    set(h.FBD_plot_Check,'Value',1)
                    geometry_fecho = 'FBD';
                end
                
            elseif (get(h.Laue_FBD_Check,'Value')) || (get(h.Laue_Check,'Value'))
                [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_0H_S,E_Scan,G_0H,t_array,k_array,Dwidth] =...
                    Gui_temp_Laue_1D(a_Par,b_Par,c_Par,Energy_Bragg,Energy_center,h_Miller,k_Miller,l_Miller,DWF,...
                    F0,FH,F_H,Absorption,Range_E_neg,Range_E_pos,Polarization,Ang_asy_Deg,Thickness,N_Steps,...
                    get(h.Laue_FBD_Check,'Value'),crystal_orientation);
                
                if (get(h.Laue_FBD_Check,'Value'))
                    set(h.FLD_plot_Check,'Value',1)
                    geometry_fecho = 'FLD';
                elseif get(h.Laue_Check,'Value')
                    set(h.LD_plot_Check,'Value',1)
                    geometry_fecho = 'LD';
                end
                
            end
            
            G_0H = fft(R_0H_S);
        end
    
        if (get(h.Laue_FBD_Check,'Value')) || (get(h.Laue_Check,'Value'))
            t_array = t_array;
            E_Scan = E_Scan;
            h.geometry_scan = 1;  %Define the  geometry 1 laue and 2 bragg.
        else
            t_array = t_array;
            E_Scan = -E_Scan;
            G_0H = flip(G_0H);
            h.geometry_scan = 2;
        end
                
        h.t_array = t_array;
        h.E_Scan = E_Scan;
        
        h.R_0H_S = R_0H_S;
        h.G_0H = G_0H;
        
        h.Ang_asy_Deg = Ang_asy_Deg;
        h.Theta_Bragg = Theta_Bragg;
        h.element =element;
        h.geometry_fecho = geometry_fecho;
        h.Energy_center = Energy_center;
        h.h_Miller = h_Miller;
        h.k_Miller = k_Miller;
        h.l_Miller = l_Miller;
        h.a_Par = a_Par;
        h.b_Par = b_Par;
        h.c_Par = c_Par;
        h.Thickness_name = Thickness;
        h.Polarization = Polarization;
        
        if get(h.More_Crystal_Chk,'value') == 1
            h.R_0H_S_array = R_0H_S_array;
        end
        
        %Only working for single case
        %check if is strain profile
        if get(h.Strain_Crystal_Chk,'value') == 0
            Strain_string ='no_Strain';
            
        else
            Type_Layer = get(h.Menu_Layer,'Value');
            stepstrain = eval(get(h.Crystal_Step_Layer,'string'))/10;  %step size of the strain model
            
            if Type_Layer == 1
                Type_strain ='Heaviside';
                depth_strain = h.strain_depth/10000;
                da = h.max_da_strain_layer;
                number_layers = h.number_layers;         %number layers
                Strain_string = sprintf('Strain_%s_depth%dum_Step%dnm_da%d_layers%d',Type_strain,depth_strain,stepstrain,da,number_layers);
                
            elseif Type_Layer == 2
                Type_strain ='Smooth_Heaviside';
                depth_strain = h.strain_depth/10000;
                da = h.max_da_strain_layer;
                number_layers = h.number_layers;          %number layers
                Strain_string = sprintf('Strain_%s_depth%dum_Step%dnm_da%d_layers%d',Type_strain,depth_strain,stepstrain,da,number_layers);
                
            elseif Type_Layer == 3
                Type_strain = 'Exponential';
                depth_strain = h.strain_depth/10000;
                da = h.max_da_strain_layer;
                Strain_string = sprintf('Strain_%s_depth%dum_Step%dnm_da%d',Type_strain,depth_strain,stepstrain,da);
                
            elseif Type_Layer == 4
                Type_strain = 'Atangent_Asy';
                depth_strain = h.strain_depth/10000;
                da = h.max_da_strain_layer;
                Strain_string = sprintf('Strain_%s_depth%dum_Step%dnm_da%d',Type_strain,depth_strain,stepstrain,da);
                
            elseif Type_Layer == 5
                Type_strain = 'Atangent_sym';
                depth_strain = h.strain_depth/10000;
                da = h.max_da_strain_layer;
                Strain_string = sprintf('Strain_%s_depth%dum_Step%dnm_da%d',Type_strain,depth_strain,stepstrain,da);
            
            elseif Type_Layer == 6
                Type_strain = 'Linnear_sym';
                depth_strain = h.strain_depth/10000;
                da = h.max_da_strain_layer;
                Strain_string = sprintf('Strain_%s_depth%dum_Step%dnm_da%d',Type_strain,depth_strain,stepstrain,da);
            
            elseif Type_Layer == 7
                Type_strain = 'Gaussian_sym';
                depth_strain = h.strain_depth/10000;
                da = h.max_da_strain_layer;
                Strain_string = sprintf('Strain_%s_depth%dum_Step%dnm_da%d',Type_strain,depth_strain,stepstrain,da); 

            elseif Type_Layer == 8
                Type_strain = 'From_file';
                depth_strain = h.strain_depth/10000;
                da = h.max_da_strain_layer;
                Strain_string = sprintf('Strain_%s_depth%dum_Step%dnm_da%d',Type_strain,depth_strain,stepstrain,da); 
            end
            
        end
        
        h.Strain_string = Strain_string;
         Chi_0_Cx
         Chi_h_Cx
        %Plot and Values
        set(h.Chi_0,'String',Chi_0_Cx)
        set(h.Chi_h,'String',Chi_h_Cx)
        set(h.Theta_view,'String',Theta_Bragg * 180/pi)
        set(h.DarwinWidth,'string',Dwidth)
        
    end

    function Dynamical_Reflectivity_Extra(source,eventdata)
        
        if source == h.Dynamical_Theory_Plots
            
            h.I_Fig_Reflectivity_Dynamical = figure(d+191);
            
            Position_Fig_Strain = get(h.lp_fit,'Position');
            Position_x = Position_Fig_Strain(1,1);
            Position_y = Position_Fig_Strain(1,2);
            width_x = Position_Fig_Strain(1,3);
            width_y = Position_Fig_Strain(1,4);
            
            set(h.I_Fig_Reflectivity_Dynamical,'Name','Dynamical reflectivity',...
                'NumberTitle', 'Off','Toolbar','figure','visible','on','Units','normalized','Menubar','none',...
                'Position', [Position_x Position_y-(width_y+0.1) width_x width_y+0.05],'Color',[1 1 1],...
                'KeyReleaseFcn',@Press);
            
            h.I_Fig_Reflectivity_In = axes('Parent',h.I_Fig_Reflectivity_Dynamical, 'Units','normalized',...
                'box','on','LineWidth',0.5,'FontName','Helvetica','FontWeight','bold',...
                'Position',[0.05 0.15 0.43 0.68],'Color',[1 1 1],'FontSize',Font_size,...
                'Xlim',[-1 1]);
            title('K Space')
            xlabel('Energy (eV)')
            ylabel('Intensity (arb. unit)')
            grid('on');
            
            h.name_log_Reflectivity_Fig_Check =  uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical,...
                'Style' , 'text','Enable','on','FontName','Helvetica','String','LogScale',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.05 0.01 0.06 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size);
            
            h.log_Reflectivity_Fig_Check =  uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 0,'FontName','Helvetica','String','off',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.11 0.01 0.05 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size,...
                'Callback',@Dynamical_Reflectivity_Extra);
            
            h.I_Fig_Reflectivity_time_In = axes('Parent',h.I_Fig_Reflectivity_Dynamical, 'Units','normalized',...
                'box','on','LineWidth',0.5,'FontName','Helvetica','FontWeight','bold',...
                'Position',[0.55 0.15 0.43 0.68],'Color',[1 1 1],'FontSize',Font_size,...
                'Xlim',[-1 1]);
            title('Real Space')
            xlabel('Time (s)')
            ylabel('Intensity (arb. unit)')
            grid('on');
            
            h.name_log_Time_Fig_Check =  uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical,...
                'Style' , 'text','Enable','on','FontName','Helvetica','String','LogScale',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.55 0.01 0.06 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size);
            
            h.log_Time_Fig_Check =  uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 1,'FontName','Helvetica','String','off',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.61 0.01 0.05 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size,...
                'Callback',@Dynamical_Reflectivity_Extra);
            
            h.Time_center_Check =  uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 0,'FontName','Helvetica','String','Center T (s)',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.8 0.95 0.1 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size,...
                'Callback',@Dynamical_Reflectivity_Extra);
            
            h.Time_center =  uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical,...
                'Style' , 'edit','Enable','on','FontName','Helvetica','String','-',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.8 0.9 0.1 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size);
          
            h.name_lim_Time_center =  uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical,...
                'Style' , 'Check','Value', 0,'Enable','on','FontName','Helvetica','String','Limit around 0',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.9 0.95 0.1 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size,...
                'Callback',@Dynamical_Reflectivity_Extra);
            
            h.lim_Time_center =  uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical,...
                'Style' , 'edit','Enable','on','FontName','Helvetica','String','-',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.9 0.9 0.1 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size);
            
            h.K_Space_center_Check =  uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 0,'FontName','Helvetica','String','Center K (eV)',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.3 0.95 0.1 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size,...
                'Callback',@Dynamical_Reflectivity_Extra);
            
            h.K_Space_center =  uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical,...
                'Style' , 'edit','Enable','on','FontName','Helvetica','String','-',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.3 0.9 0.1 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size);
            
            h.name_lim_K_Space_center =  uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical,...
                'Style' , 'Check','Value', 0,'Enable','on','FontName','Helvetica','String','Limit around 0',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.4 0.95 0.1 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size,...
                'Callback',@Dynamical_Reflectivity_Extra);
            
            h.lim_K_Space_center =  uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical,...
                'Style' , 'edit','Enable','on','FontName','Helvetica','String','-',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.4 0.9 0.1 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size);
            
            h.Time_um_Check =  uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 1,'FontName','Helvetica','String','Time (s)',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.5 0.95 0.1 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size,...
                'Callback',@Dynamical_Reflectivity_Extra);
            
            h.Transverse_um_Check =  uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 0,'FontName','Helvetica','String','X (m)',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.5 0.9 0.1 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size,...
                'Callback',@Dynamical_Reflectivity_Extra);
            
            h.plot_results_fit_1D =  uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 0,'FontName','Helvetica','String','fit off',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.7 0.9 0.1 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size,...
                'Callback',@Dynamical_Reflectivity_Extra);
                       
            h.BD_plot_Check =  uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 1,'FontName','Helvetica','String','BD',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.0 0.9 0.05 0.1],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size-2,...
                'Callback',@Dynamical_Reflectivity_Extra);
            
            h.FBD_plot_Check =  uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 0,'FontName','Helvetica','String','FBD',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.05 0.9 0.05 0.1],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size-2,...
                'Callback',@Dynamical_Reflectivity_Extra);
            
            h.LD_plot_Check =  uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 0,'FontName','Helvetica','String','LD',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.1 0.9 0.05 0.1],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size-2,...
                'Callback',@Dynamical_Reflectivity_Extra);
            
            h.FLD_plot_Check =  uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 0,'FontName','Helvetica','String','FLD',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.15 0.9 0.05 0.1],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size-2,...
                'Callback',@Dynamical_Reflectivity_Extra);
            
            h.name_phase_and_amplitud = uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical,...
                'Style' , 'text','FontName','Helvetica','String','Phase & Amplitud',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.6 0.95 0.1 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size-2);
            
            h.phase_and_amplitud =  uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 0,'FontName','Helvetica','String','off',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.6 0.9 0.1 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size-2,...
                'Callback',@Dynamical_Reflectivity_Extra);
            
            if get(h.Bragg_Check,'Value')== 1
                set(h.BD_plot_Check,'Value',1)
                set(h.FBD_plot_Check,'Value',0)
                set(h.FLD_plot_Check,'Value',0)
                set(h.LD_plot_Check,'Value',0)
            elseif get(h.Bragg_FBD_Check,'Value')== 1
                set(h.BD_plot_Check,'Value',0)
                set(h.FBD_plot_Check,'Value',1)
                set(h.FLD_plot_Check,'Value',0)
                set(h.LD_plot_Check,'Value',0)
            elseif get(h.Laue_Check,'Value')== 1
                set(h.BD_plot_Check,'Value',0)
                set(h.FBD_plot_Check,'Value',0)
                set(h.FLD_plot_Check,'Value',0)
                set(h.LD_plot_Check,'Value',1)
            elseif get(h.Laue_FBD_Check,'Value')== 1
                set(h.BD_plot_Check,'Value',0)
                set(h.FBD_plot_Check,'Value',0)
                set(h.LD_plot_Check,'Value',0)
                set(h.FLD_plot_Check,'Value',1)
            end
            
        %% functions check   
        elseif source == h.plot_results_fit_1D
            if get(h.plot_results_fit_1D,'value') == 1
                set(h.plot_results_fit_1D,'value',1,'string','fit on')
            else
                set(h.plot_results_fit_1D,'value',0,'string','fit off')
            end

            
        elseif source == h.phase_and_amplitud
            if get(h.phase_and_amplitud,'value') == 1
                set(h.phase_and_amplitud,'value',1,'string','on')
            else
                set(h.phase_and_amplitud,'value',0,'string','off')
            end
        elseif source == h.flat_field
            if get(h.flat_field,'value') == 1
                set(h.flat_field,'value',1,'string','on')
            else
                set(h.flat_field,'value',0,'string','off')
            end
            
        elseif source == h.Time_um_Check
            set(h.Time_um_Check,'Value',1)
            set(h.Transverse_um_Check,'Value',0)
            
        elseif source == h.Transverse_um_Check
            set(h.Time_um_Check,'Value',0)
            set(h.Transverse_um_Check,'Value',1)
            
        elseif source == h.name_lim_K_Space_center
            if get(h.name_lim_K_Space_center,'Value') == 1
                set(h.name_lim_K_Space_center,'Value',1)
            else
                set(h.name_lim_K_Space_center,'Value',0)
            end
            
        elseif source == h.name_lim_Time_center
            if get(h.name_lim_Time_center,'Value') == 1
                set(h.name_lim_Time_center,'Value',1)
            else
                set(h.name_lim_Time_center,'Value',0)
            end
            
        elseif source == h.K_Space_center_Check
            if get(h.K_Space_center_Check,'Value') == 1
                set(h.K_Space_center_Check,'Value',1)
            else
                set(h.K_Space_center_Check,'Value',0)
            end
        elseif source == h.Time_center_Check
            if get(h.Time_center_Check,'Value') == 1
                set(h.Time_center_Check,'Value',1)
            else
                set(h.Time_center_Check,'Value',0)
            end
            
        elseif source == h.BD_plot_Check
            set(h.BD_plot_Check,'Value',1)
            set(h.FBD_plot_Check,'Value',0)
            set(h.FLD_plot_Check,'Value',0)
            set(h.LD_plot_Check,'Value',0)
            set(h.Bragg_Check,'Value',1)
            set(h.Bragg_FBD_Check,'Value',0)
            set(h.Laue_Check,'Value',0)
            set(h.Laue_FBD_Check,'Value',0)
        elseif source == h.FBD_plot_Check
            set(h.BD_plot_Check,'Value',0)
            set(h.FBD_plot_Check,'Value',1)
            set(h.FLD_plot_Check,'Value',0)
            set(h.LD_plot_Check,'Value',0)
            set(h.Bragg_Check,'Value',0)
            set(h.Bragg_FBD_Check,'Value',1)
            set(h.Laue_Check,'Value',0)
            set(h.Laue_FBD_Check,'Value',0)
        elseif source == h.LD_plot_Check
            set(h.BD_plot_Check,'Value',0)
            set(h.FBD_plot_Check,'Value',0)
            set(h.FLD_plot_Check,'Value',0)
            set(h.LD_plot_Check,'Value',1)
            set(h.Bragg_Check,'Value',0)
            set(h.Bragg_FBD_Check,'Value',0)
            set(h.Laue_Check,'Value',1)
            set(h.Laue_FBD_Check,'Value',0)
        elseif source == h.FLD_plot_Check
            set(h.BD_plot_Check,'Value',0)
            set(h.FBD_plot_Check,'Value',0)
            set(h.FLD_plot_Check,'Value',1)
            set(h.LD_plot_Check,'Value',0)
            set(h.Bragg_Check,'Value',0)
            set(h.Bragg_FBD_Check,'Value',0)
            set(h.Laue_Check,'Value',0)
            set(h.Laue_FBD_Check,'Value',1)    
        elseif source == h.log_Time_Fig_Check 
            
            if get(h.log_Time_Fig_Check,'value') == 1
                set(h.log_Time_Fig_Check,'value',1,'string','on')
            else
                set(h.log_Time_Fig_Check,'value',0,'string','off')
            end
            
        elseif source == h.log_Reflectivity_Fig_Check
            if get(h.log_Reflectivity_Fig_Check,'value') == 1
                set(h.log_Reflectivity_Fig_Check,'value',1,'string','on')
            else
                set(h.log_Reflectivity_Fig_Check,'value',0,'string','off')
            end

        end
    end

    function Bragg_Fit_Check(source,eventdata)
        if source == h.Bragg_Check
            set(h.Bragg_Check,'Value',1)
            set(h.Bragg_FBD_Check,'Value',0)
            set(h.Laue_Check,'Value',0)
            set(h.Laue_FBD_Check,'Value',0)
        elseif source == h.Bragg_FBD_Check
            set(h.Bragg_Check,'Value',0)
            set(h.Bragg_FBD_Check,'Value',1)
            set(h.Laue_Check,'Value',0)
            set(h.Laue_FBD_Check,'Value',0)
        elseif source == h.Laue_Check
            set(h.Bragg_Check,'Value',0)
            set(h.Bragg_FBD_Check,'Value',0)
            set(h.Laue_Check,'Value',1)
            set(h.Laue_FBD_Check,'Value',0)
        elseif source == h.Laue_FBD_Check
            set(h.Bragg_Check,'Value',0)
            set(h.Bragg_FBD_Check,'Value',0)
            set(h.Laue_Check,'Value',0)
            set(h.Laue_FBD_Check,'Value',1)
        elseif source == h.Absorption
            
        elseif source == h.Range_Deg
            set(h.Range_Deg,'Value',1)
            set(h.Range_meV,'Value',0)
        elseif source == h.Range_meV
            set(h.Range_Deg,'Value',0)
            set(h.Range_meV,'Value',1)
            
        elseif source ==  h.f_check_values
            if get(h.f_check_values ,'Value') == 1
                set(h.f_check_values,'Value',1,'string','Manual')
                set(h.f0,'Enable','on')
                set(h.f1,'Enable','on')
                set(h.f2,'Enable','on')
            else
                set(h.f_check_values,'Value',0,'string','Auto')
                set(h.f0,'Enable','off')
                set(h.f1,'Enable','off')
                set(h.f2,'Enable','off')
            end
        elseif source == h.CParameter_Check
            if get(h.CParameter_Check,'Value') == 1
                set(h.CParameter_Check,'Value',1,'String','Manual')
            else
                set(h.CParameter_Check,'Value',0,'String','Auto')                
            end
        elseif source == h.Polarization_s
            if get(h.Polarization_s,'Value') == 1
                set(h.Polarization_s,'Value',1)
                set(h.Polarization_p,'Value',0)
            else
                set(h.Polarization_s,'Value',0)
                set(h.Polarization_p,'Value',1)
            end
        elseif source == h.Polarization_p
            if get(h.Polarization_p,'Value') == 1
                set(h.Polarization_s,'Value',0)
                set(h.Polarization_p,'Value',1)
            else
                set(h.Polarization_s,'Value',1)
                set(h.Polarization_p,'Value',0)
            end
        elseif source == h.crystal_orientation
            if get(h.crystal_orientation,'Value') == 1
                set(h.crystal_orientation,'Value',1,'String','Normal +')
            else
                set(h.crystal_orientation,'Value',0,'String','Normal -')
            end
        elseif source == h.name_info_geometry_crystal_chk
            if get(h.name_info_geometry_crystal_chk,'value') == 1
                set(h.name_info_geometry_crystal_chk,'Value',1,'string','on')
            else
                set(h.name_info_geometry_crystal_chk,'Value',0,'string','off')
            end
        end
        
    end

    function More_Crystal(source,eventdata)
        if source == h.More_Crystal
            
            h.I_Fig_More_Crystal= figure(d+198); 
            
            Position_Fig_Strain = get(h.lp_fit,'Position');
            Position_x = Position_Fig_Strain(1,1);
            Position_y = Position_Fig_Strain(1,2);
            width_x = Position_Fig_Strain(1,3);
            width_y = Position_Fig_Strain(1,4);
            
            set(h.I_Fig_More_Crystal,'Name','More than one crystal',...
                'NumberTitle', 'Off',...
                'Toolbar','none',...
                'visible','on',...
                'Units','normalized',...
                'Position', [Position_x Position_y-0.64 width_x width_y+0.1],...
                'Color',[0.8 0.8 0.8],...
                'Menubar','none',...
                'KeyReleaseFcn',@Press);
            
            h.name_crystal_line = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','text',...
                'Units','normalized',...
                'Position',[0.0 0.9 0.8 0.1],...
                'HorizontalAlignment','left',...
                'String','Pos, Element, [h,k,l], Thickness(um), Geo(L=2 or B=1), Trans(R=0, T=1), Asy(deg), SurfNor(+=1, -=0), Pol(s=1 or p=0), Energy, Beam, [da/a,db/b,dc/c]',...
                'BackgroundColor',[0.4 0.4 0.4],...
                'FontSize',Font_size);

            h.crystal_line_1 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.0 0.8 0.8 0.1],...
                'String','1,  Si, [4, 0, 0], 100, 1, 1, 0, 1, 1, 0 ,1 , [0, 0, 0]',...
                'FontSize',Font_size);
            h.crystal_line_2 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.0 0.7 0.8 0.1],...
                'String','0,  C, [4, 0, 0], 100, 1, 1, 0, 1, 1, 0 ,1 ,[0, 0, 0]',...
                'FontSize',Font_size);
            h.crystal_line_3 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.0 0.6 0.8 0.1],...
                'String','0,  Au, [1, 1, 1], 10, 2, 0, 0, 1, 1, 0 ,1 , [0, 0, 0]',...
                'FontSize',Font_size);
            h.crystal_line_4 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.0 0.5 0.8 0.1],...
                'String','0,  Au, [1, 1, 1], 10, 2, 1, 0, 1, 1, 0 ,1 , [0, 0, 0]',...
                'FontSize',Font_size);
            h.crystal_line_5 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.0 0.4 0.8 0.1],...
                'String','-',...
                'FontSize',Font_size);
            h.crystal_line_6 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.0 0.3 0.8 0.1],...
                'String','-',...
                'FontSize',Font_size);
            h.crystal_line_7 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.0 0.2 0.8 0.1],...
                'String','-',...
                'FontSize',Font_size);
            h.crystal_line_8 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','Edit',...
                'Units','normalized',...
                'Position',[0.0 0.1 0.8 0.1],...
                'String','-',...
                'FontSize',Font_size);
            
            h.name_crystal_line_chk = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','text',...
                'Units','normalized',...
                'Position',[0.8 0.9 0.05 0.1],...
                'BackgroundColor',[0.45 0.45 0.45],...
                'String','Scan motor',...
                'FontSize',Font_size);
           h.name_crystal_range_p = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','text',...
                'Units','normalized',...
                'Position',[0.85 0.9 0.05 0.1],...
                'BackgroundColor',[0.45 0.45 0.45],...
                'String','ranage +',...
                'FontSize',Font_size);
            h.name_crystal_range_n = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','text',...
                'Units','normalized',...
                'Position',[0.9 0.9 0.05 0.1],...
                'BackgroundColor',[0.45 0.45 0.45],...
                'String','ranage -',...
                'FontSize',Font_size);
            h.name_crystal_range_steps = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','text',...
                'Units','normalized',...
                'Position',[0.95 0.9 0.05 0.1],...
                'BackgroundColor',[0.45 0.45 0.45],...
                'String','Steps',...
                'FontSize',Font_size); 
                      
            h.crystal_line_chk_1 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','check',...
                'Units','normalized',...
                'Position',[0.8 0.8 0.05 0.1],...
                'value',0,...
                'String','off',...
                'callback',@More_Crystal,...
                'FontSize',Font_size);
            h.crystal_range_p_1 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.85 0.8 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size);
            h.crystal_range_n_1 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.9 0.8 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size);            
            h.crystal_range_steps_1 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.95 0.8 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size); 
            
            
            
            h.crystal_line_chk_2 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','check',...
                'Units','normalized',...
                'Position',[0.8 0.7 0.05 0.1],...
                'value',0,...
                'String','off',...
                'callback',@More_Crystal,...                
                'FontSize',Font_size);
            h.crystal_range_p_2 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.85 0.7 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size);
            h.crystal_range_n_2 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.9 0.7 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size);            
            h.crystal_range_steps_2 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.95 0.7 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size); 
            
            
            h.crystal_line_chk_3 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','check',...
                'Units','normalized',...
                'Position',[0.8 0.6 0.05 0.1],...
                'value',0,...
                'String','off',...
                'callback',@More_Crystal,...
                'FontSize',Font_size);
            h.crystal_range_p_3 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.85 0.6 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size);
            h.crystal_range_n_3 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.9 0.6 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size);            
            h.crystal_range_steps_3 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.95 0.6 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size); 
            
            
            h.crystal_line_chk_4 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','check',...
                'Units','normalized',...
                'Position',[0.8 0.5 0.05 0.1],...
                'value',0,...
                'String','off',...
                'callback',@More_Crystal,...
                'FontSize',Font_size);
            h.crystal_range_p_4 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.85 0.5 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size);
            h.crystal_range_n_4 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.9 0.5 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size);            
            h.crystal_range_steps_4 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.95 0.5 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size); 
            
            
            h.crystal_line_chk_5 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','check',...
                'Units','normalized',...
                'Position',[0.8 0.4 0.05 0.1],...
                'value',0,...
                'String','off',...
                'callback',@More_Crystal,...
                'FontSize',Font_size);
            h.crystal_range_p_5 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.85 0.4 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size);
           h.crystal_range_n_5 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.9 0.4 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size);            
            h.crystal_range_steps_5 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.95 0.4 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size); 
            
            
            h.crystal_line_chk_6 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','check',...
                'Units','normalized',...
                'Position',[0.8 0.3 0.05 0.1],...
                'value',0,...
                'String','off',...
                'callback',@More_Crystal,...
                'FontSize',Font_size);
            h.crystal_range_p_6 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.85 0.3 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size);
            h.crystal_range_n_6 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.9 0.3 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size);            
            h.crystal_range_steps_6 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.95 0.3 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size); 
            
            
            h.crystal_line_chk_7 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','check',...
                'Units','normalized',...
                'Position',[0.8 0.2 0.05 0.1],...
                'value',0,...
                'String','off',...
                'callback',@More_Crystal,...
                'FontSize',Font_size);
            h.crystal_range_p_7 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.85 0.2 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size);
             h.crystal_range_n_7 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.9 0.2 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size);            
            h.crystal_range_steps_7 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.95 0.2 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size); 
            
            
            h.crystal_line_chk_8 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','check',...
                'Units','normalized',...
                'Position',[0.8 0.1 0.05 0.1],...
                'value',0,...
                'String','off',...
                'callback',@More_Crystal,...
                'FontSize',Font_size);
            h.crystal_range_p_8 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.85 0.1 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size);
            h.crystal_range_n_8 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.9 0.1 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size); 
            h.crystal_range_steps_8 = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.95 0.1 0.05 0.1],...
                'BackgroundColor',[0.8 0.8 0.8],...
                'String','-',...
                'FontSize',Font_size);

            
            h.Calculate_Save_crystal_line = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','push',...
                'Units','normalized',...
                'Position',[0.5  0. 0.5 0.1],...
                'String','Crystal Scan',...
                'BackgroundColor',[0.4 0.4 0],...
                'FontSize',Font_size,...
                'Callback',@More_Crystal_Scan);
            
            h.Save_crystal_line = uicontrol('Parent',h.I_Fig_More_Crystal,...
                'Style','push',...
                'Units','normalized',...
                'Position',[0. 0. 0.5 0.1],...
                'String','Save Crystals',...
                'FontSize',Font_size,...
                'Callback',@More_Crystal);
            
            
            
        elseif source == h.Single_Crystal_Chk
            set( h.Single_Crystal_Chk,'value',1,'string','on')
            set( h.More_Crystal_Chk,'value',0,'string','off')
            set( h.Strain_Crystal_Chk,'value',0,'string','off')
            
        elseif source == h.More_Crystal_Chk
            set( h.More_Crystal_Chk,'value',1,'string','on')
            set( h.Single_Crystal_Chk,'value',0,'string','off')
            set( h.Strain_Crystal_Chk,'value',0,'string','off')
           
        elseif source == h.crystal_line_chk_1
            if get(h.crystal_line_chk_1,'value') == 1
                set(h.crystal_line_chk_1,'value',1,'string','on')
                set(h.crystal_line_chk_2,'value',0,'string','off')
                set(h.crystal_line_chk_3,'value',0,'string','off')
                set(h.crystal_line_chk_4,'value',0,'string','off')
                set(h.crystal_line_chk_5,'value',0,'string','off')
                set(h.crystal_line_chk_6,'value',0,'string','off')
                set(h.crystal_line_chk_7,'value',0,'string','off')
                set(h.crystal_line_chk_8,'value',0,'string','off')
            else
                set(h.crystal_line_chk_1,'value',0,'string','off')
            end
        elseif source == h.crystal_line_chk_2
            if get(h.crystal_line_chk_2,'value') == 1
                set(h.crystal_line_chk_2,'value',1,'string','on')
                set(h.crystal_line_chk_1,'value',0,'string','off')
                set(h.crystal_line_chk_3,'value',0,'string','off')
                set(h.crystal_line_chk_4,'value',0,'string','off')
                set(h.crystal_line_chk_5,'value',0,'string','off')
                set(h.crystal_line_chk_6,'value',0,'string','off')
                set(h.crystal_line_chk_7,'value',0,'string','off')
                set(h.crystal_line_chk_8,'value',0,'string','off')
            else
                set(h.crystal_line_chk_2,'value',0,'string','off')
            end
        elseif source == h.crystal_line_chk_3
            if get(h.crystal_line_chk_3,'value') == 1
                set(h.crystal_line_chk_3,'value',1,'string','on')
                set(h.crystal_line_chk_2,'value',0,'string','off')
                set(h.crystal_line_chk_1,'value',0,'string','off')
                set(h.crystal_line_chk_4,'value',0,'string','off')
                set(h.crystal_line_chk_5,'value',0,'string','off')
                set(h.crystal_line_chk_6,'value',0,'string','off')
                set(h.crystal_line_chk_7,'value',0,'string','off')
                set(h.crystal_line_chk_8,'value',0,'string','off')
            else
                set(h.crystal_line_chk_3,'value',0,'string','off')
            end
        elseif source == h.crystal_line_chk_4
            if get(h.crystal_line_chk_4,'value') == 1
                set(h.crystal_line_chk_4,'value',1,'string','on')
                set(h.crystal_line_chk_2,'value',0,'string','off')
                set(h.crystal_line_chk_3,'value',0,'string','off')
                set(h.crystal_line_chk_1,'value',0,'string','off')
                set(h.crystal_line_chk_5,'value',0,'string','off')
                set(h.crystal_line_chk_6,'value',0,'string','off')
                set(h.crystal_line_chk_7,'value',0,'string','off')
                set(h.crystal_line_chk_8,'value',0,'string','off')
            else
                set(h.crystal_line_chk_4,'value',0,'string','off')
            end
        elseif source == h.crystal_line_chk_5
            if get(h.crystal_line_chk_5,'value') == 1
                set(h.crystal_line_chk_5,'value',1,'string','on')
                set(h.crystal_line_chk_2,'value',0,'string','off')
                set(h.crystal_line_chk_3,'value',0,'string','off')
                set(h.crystal_line_chk_4,'value',0,'string','off')
                set(h.crystal_line_chk_1,'value',0,'string','off')
                set(h.crystal_line_chk_6,'value',0,'string','off')
                set(h.crystal_line_chk_7,'value',0,'string','off')
                set(h.crystal_line_chk_8,'value',0,'string','off')
            else
                set(h.crystal_line_chk_5,'value',0,'string','off')
            end
        elseif source == h.crystal_line_chk_6
            if get(h.crystal_line_chk_6,'value') == 1
                set(h.crystal_line_chk_6,'value',1,'string','on')
                set(h.crystal_line_chk_2,'value',0,'string','off')
                set(h.crystal_line_chk_3,'value',0,'string','off')
                set(h.crystal_line_chk_4,'value',0,'string','off')
                set(h.crystal_line_chk_5,'value',0,'string','off')
                set(h.crystal_line_chk_1,'value',0,'string','off')
                set(h.crystal_line_chk_7,'value',0,'string','off')
                set(h.crystal_line_chk_8,'value',0,'string','off')
            else
                set(h.crystal_line_chk_6,'value',0,'string','off')
            end
        elseif source == h.crystal_line_chk_7
            if get(h.crystal_line_chk_7,'value') == 1
                set(h.crystal_line_chk_7,'value',1,'string','on')
                set(h.crystal_line_chk_2,'value',0,'string','off')
                set(h.crystal_line_chk_3,'value',0,'string','off')
                set(h.crystal_line_chk_4,'value',0,'string','off')
                set(h.crystal_line_chk_5,'value',0,'string','off')
                set(h.crystal_line_chk_6,'value',0,'string','off')
                set(h.crystal_line_chk_1,'value',0,'string','off')
                set(h.crystal_line_chk_8,'value',0,'string','off')
            else
                set(h.crystal_line_chk_7,'value',0,'string','off')
            end
        elseif source == h.crystal_line_chk_8
            if get(h.crystal_line_chk_8,'value') == 1
                set(h.crystal_line_chk_8,'value',1,'string','on')
                set(h.crystal_line_chk_2,'value',0,'string','off')
                set(h.crystal_line_chk_3,'value',0,'string','off')
                set(h.crystal_line_chk_4,'value',0,'string','off')
                set(h.crystal_line_chk_5,'value',0,'string','off')
                set(h.crystal_line_chk_6,'value',0,'string','off')
                set(h.crystal_line_chk_7,'value',0,'string','off')
                set(h.crystal_line_chk_1,'value',0,'string','off')
            else
                set(h.crystal_line_chk_8,'value',0,'string','off')
            end
        elseif source == h.Save_crystal_line
            crystal_line_1 = get(h.crystal_line_1,'String');
            crystal_line_2 = get(h.crystal_line_2,'String');
            crystal_line_3 = get(h.crystal_line_3,'String');
            crystal_line_4 = get(h.crystal_line_4,'String');
            crystal_line_5 = get(h.crystal_line_5,'String');
            crystal_line_6 = get(h.crystal_line_6,'String');
            crystal_line_7 = get(h.crystal_line_7,'String');
            crystal_line_8 = get(h.crystal_line_8,'String'); 
            
            crystal_number = 0;            
            for i_line = 1:8                                
                name_line_crystal = 'crystal_line_';
                name = sprintf('%s%0.1d',name_line_crystal,i_line);
                name_crystal = eval(name);
                
                if name_crystal == '-'
                    
                else    
                    pos =1;
                    name_variable_pos_1 = '';
                    name_variable_pos_2 = '';
                    name_variable_pos_3 = '';
                    name_variable_pos_4 = '';
                    name_variable_pos_5 = '';
                    name_variable_pos_6 = '';
                    name_variable_pos_7 = '';
                    name_variable_pos_8 = '';
                    name_variable_pos_9 = '';
                    name_variable_pos_10 = '';
                    name_variable_pos_11 = '';
                    name_variable_pos_12 = '';
                    name_variable_pos_13 = '';
                    name_variable_pos_14 = '';
                    name_variable_pos_15 = '';
                    name_variable_pos_16 = '';
                    
                    for i_variable = 1:size(name_crystal,2)
                        if name_crystal (1,i_variable) == ','
                           pos = pos +1;
                        else
                           if pos == 1
                               name_variable_pos_1 = strcat(name_variable_pos_1,name_crystal (1,i_variable));
                           elseif pos == 2
                               name_variable_pos_2 = strcat(name_variable_pos_2,name_crystal (1,i_variable));
                           elseif pos == 3
                               if name_crystal (1,i_variable) == '['                                   
                               else
                                   name_variable_pos_3 = strcat(name_variable_pos_3,name_crystal (1,i_variable));
                               end
                           elseif pos == 4
                               name_variable_pos_4 = strcat(name_variable_pos_4,name_crystal (1,i_variable));
                           elseif pos == 5
                               if name_crystal (1,i_variable) == ']'                                   
                               else
                                   name_variable_pos_5 = strcat(name_variable_pos_5,name_crystal (1,i_variable));
                               end
                           elseif pos == 6
                               name_variable_pos_6 = strcat(name_variable_pos_6,name_crystal (1,i_variable));
                           elseif pos == 7   
                               name_variable_pos_7 = strcat(name_variable_pos_7,name_crystal (1,i_variable));
                           elseif pos == 8
                               name_variable_pos_8 = strcat(name_variable_pos_8,name_crystal (1,i_variable));
                           elseif pos ==9
                               name_variable_pos_9 = strcat(name_variable_pos_9,name_crystal (1,i_variable));
                           elseif pos ==10
                               name_variable_pos_10 = strcat(name_variable_pos_10,name_crystal (1,i_variable));
                           elseif pos ==11
                               name_variable_pos_11 = strcat(name_variable_pos_11,name_crystal (1,i_variable))  ;
                           elseif pos ==12
                               name_variable_pos_12 = strcat(name_variable_pos_12,name_crystal (1,i_variable))  ;
                           elseif pos ==13
                               name_variable_pos_13 = strcat(name_variable_pos_13,name_crystal (1,i_variable))  ;
                           elseif pos == 14
                               if name_crystal (1,i_variable) == '['                                   
                               else
                                   name_variable_pos_14 = strcat(name_variable_pos_14,name_crystal (1,i_variable));
                               end
                           elseif pos == 15
                               name_variable_pos_15 = strcat(name_variable_pos_15,name_crystal (1,i_variable));
                           elseif pos == 16
                               if name_crystal (1,i_variable) == ']'                                   
                               else
                                   name_variable_pos_16 = strcat(name_variable_pos_16,name_crystal (1,i_variable));
                               end
                           end                       
                           
                        end
                        
                    end
                    
                    if eval(name_variable_pos_1) == 0 
                        
                    else
                        crystal_number = crystal_number + 1;
                        
                        name_pos(1,crystal_number) = eval(name_variable_pos_1);
                        
                        name_Element(1,crystal_number) = string(name_variable_pos_2);
                        
                        name_h(1,crystal_number) = eval(name_variable_pos_3);
                        
                        name_k(1,crystal_number) = eval(name_variable_pos_4);
                        
                        name_l(1,crystal_number) = eval(name_variable_pos_5);
                        
                        name_Thickness(1,crystal_number) = eval (name_variable_pos_6);
                        
                        name_geometry(1,crystal_number) = eval(name_variable_pos_7);
                        
                        name_Transmission(1,crystal_number) = eval(name_variable_pos_8);
                        
                        name_Asymmetry(1,crystal_number) = eval(name_variable_pos_9);
                        
                        name_Normal(1,crystal_number) = eval(name_variable_pos_10);
                        
                        name_polarization(1,crystal_number) = eval(name_variable_pos_11);
                        
                        name_Energy(1,crystal_number) = eval(name_variable_pos_12);
                        
                        name_Beam(1,crystal_number) = eval(name_variable_pos_13);
                        name_da_MCC(1,crystal_number) = eval(name_variable_pos_14);
                        name_db_MCC(1,crystal_number) = eval(name_variable_pos_15);
                        name_dc_MCC(1,crystal_number) = eval(name_variable_pos_16);
                        
                    end
                end
                
            end
            set(h.info_number_crystal,'String',crystal_number)
            
            
            h.pos_MCC = name_pos;
            h.Element_MCC = name_Element;
            h.h_MCC = name_h;
            h.k_MCC = name_k;
            h.l_MCC = name_l;
            h.Thickness_MCC = name_Thickness;
            h.Geometry_MCC = name_geometry;
            h.Transmission_MCC = name_Transmission;
            h.Asymmetry_MCC = name_Asymmetry;
            h.Normal_MCC = name_Normal;
            h.polarization_MCC = name_polarization;
            h.name_Energy = name_Energy;
            h.name_Beam = name_Beam;
            h.da_MCC = name_da_MCC;
            h.db_MCC = name_db_MCC;
            h.dc_MCC = name_dc_MCC;
        end
        
    end

    function Strain_Crystal(source,eventdata)
        
        if source == h.Strain_Crystal
            
            h.I_Fig_Strain_Crystal= figure(d+199);    
            
            Position_Fig_Strain = get(h.lp_fit,'Position');
            Position_x = Position_Fig_Strain(1,1);
            Position_y = Position_Fig_Strain(1,2);
            width_x = Position_Fig_Strain(1,3);
            width_y = Position_Fig_Strain(1,4);
                
            set(h.I_Fig_Strain_Crystal,'Name','Definition Strain Layers for one crystal',...
                'NumberTitle', 'Off','Menubar','none','Toolbar','figure','visible','on','Units','normalized',...
                'Position', [Position_x+0. Position_y-0.7 width_x width_y+0.1],'Color',[0.8 0.8 0.8],'KeyReleaseFcn',@Press);
                
            h.MCAt = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','text','Enable', 'inactive','FontName','Helvetica',...
                'Value', 0,'FontWeight','bold','String','SURFACE LAYER DEFINITION',...
                'Position', [0 0.9 0.8 0.1],'BackgroundColor',[0.9 0.9 0.9],'FontSize',Font_size+2);
            
            h.Layer_Fig =axes('Parent',h.I_Fig_Strain_Crystal,'Units','normalized',...
                'FontName','Helvetica','FontWeight','bold','LineWidth',0.5,'box','on',...
                'Position', [0.5 0.2 0.49 0.6],'FontSize',Font_size);
            xlabel(h.Layer_Fig,'Crystal Distortion Lenght (A)')
            ylabel(h.Layer_Fig,'Strain (da/a)')
            title('Strain Profile')
            grid(h.Layer_Fig,'on');
            
            h.Calculate_Strain = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','push','Units','normalized','String','Calculate',...
                'Position',[0.04 0.88 0.2 0.1],'BackgroundColor',[0.9 0.9 0.9],'Callback',@Calculate_Strain_call);
            
            
            h.Aproximation_type = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','text','Units','normalized','String','Approximation Type:',...
                'Position',[0.25 0.93 0.2 0.05],'BackgroundColor',[0.8 0.8 0.8],'FontSize', Font_size);
            
            Str_Layer ={};
            Str_Layer{end+1} = 'Simple';
            Str_Layer{end+1} = 'Heaviside';
            Str_Layer{end+1} = 'Heaviside soft';
            Str_Layer{end+1} = 'Inverse Exp';
            Str_Layer{end+1} = 'Atangent asym';
            Str_Layer{end+1} = 'Atangent sym';
            Str_Layer{end+1} = 'Linear sym';
            Str_Layer{end+1} = 'Gaussian';
            Str_Layer{end+1} = 'Bipolar pulse';
            Str_Layer{end+1} = 'Bipolar pulse with surface';
            Str_Layer{end+1} = 'From File';
            
            
            h.Menu_Layer =  uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','popup','Units','Normalized','FontName','Helvetica','String',Str_Layer,...
                'Position', [0.25 -0.55 0.2 1.5],'BackgroundColor',[1 1 1],'FontSize', Font_size,'Callback',@Strain_Crystal);
            
            h.sin_fuction_interphase =  uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','check','Units','Normalized','FontName','Helvetica','String','sin',...
                'value',1,...
                'Position', [0.45 0.87 0.05 0.07],'BackgroundColor',[1 1 1],'FontSize', Font_size,'Callback',@Strain_Crystal);
            
            h.square_fuction_interphase=  uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','check','Units','Normalized','FontName','Helvetica','String','^2',...
                'value',0,...
                'Position', [0.5 0.87 0.05 0.07],'BackgroundColor',[1 1 1],'FontSize', Font_size,'Callback',@Strain_Crystal);
            
            
            
            %From file strain profile
            h.name_directoryname_Strain_file = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style' , 'Push','Enable','on','Value', 0,'String','Folder:',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.65 0.9 0.1 0.1],'BackgroundColor',[0.5 0.5 0.5],'FontSize',Font_size,...
                'Callback',@Strain_Crystal);
            
            h.directoryname_Strain_file = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style' , 'edit','Enable','on','FontName','Helvetica','String','/home/rodrigfa/code/MultiBeam_calculator/Strain/Proposal_MID',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.75 0.9 0.2 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);
                   

            %Values
            h.name_Crystal_Distortion_Length = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','text','Units','normalized','String','Thickness(A), Strain (da/a), Strain (db/b), Strain (dc/c), Thicknes_Inter(A), Strain_Inter(da/a)',...
                'Position',[0.05 0.8 0.38 0.07],'BackgroundColor',[0.7 0.7 0.7],'FontSize', Font_size-3);
            
            %big box to strain all the layers
            text_variable = '100000 0.001 0.001 0.001 10000 0;';
            strin_box_stain = sprintf('[%s%s]',text_variable, text_variable);
            
            h.Crystal_Distortion_box = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style' , 'Edit', 'Max',100,'String',strin_box_stain,...
                'Visible', 'on','FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center', 'Units','Normalized',...
                'Position',[0.05 0.5 0.38 0.3],'FontSize', Font_size-2);
            
            Example_box_stain = sprintf('Example: %s',text_variable);
            h.Example_Crystal_Distortion_box = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','text', 'Max',100,'Units','normalized','HorizontalAlignment','center','String',Example_box_stain,...
                'Position',[0.05 0.45 0.38 0.05],'BackgroundColor',[0.8 0.8 0.8],'FontSize', Font_size-2);
             
            % Step of the layer (A)
            h.name_Crystal_Step_Layer = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','text','Units','normalized','String','Step Strain (A)',...
                'Position',[0.05 0.4 0.15 0.05],'BackgroundColor',[0.8 0.8 0.8],'FontSize', Font_size-2);
            
            h.Crystal_Step_Layer = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','Edit','FontWeight','bold','FontName','Helvetica','Visible', 'on','String','1000',...                
                'Units','Normalized','HorizontalAlignment','center',...
                'Position',[0.2 0.4 0.23 0.05],'FontSize', Font_size-2);
            
            %%% Tangent
            h.name_Tangent_strain_approx = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','text','Units','normalized','String','Function approx Strain',...
                'Position',[0.13 0.35 0.3 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize', Font_size-2);
            h.name_Tangent_strain_approx1 = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','text','Units','normalized','String','Front Surface',...
                'Position',[0.13 0.3 0.15 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize', Font_size-2);
            h.name_Tangent_strain_approx2 = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','text','Units','normalized','String','Rear Surface',...
                'Position',[0.28 0.3 0.15 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize', Font_size-2);

            % Crystal_Distortion depth (A)
            h.name_Distortion_tan = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','text','Units','normalized','String','da/a,db/b,dc/c',...
                'Position',[0.05 0.25 0.08 0.05],'BackgroundColor',[0.8 0.8 0.8],'FontSize', Font_size-2);
            
            h.Crystal_Distortion_tan_da = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','Edit','FontWeight','bold','FontName','Helvetica','Visible', 'on','String','0.0001',...                
                'Units','Normalized','HorizontalAlignment','center',...
                'Position',[0.13 0.25 0.05 0.05],'FontSize', Font_size-2);
            
            h.Crystal_Distortion_tan_db = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','Edit','FontWeight','bold','FontName','Helvetica','Visible', 'on','String','0.00',...                
                'Units','Normalized','HorizontalAlignment','center',...
                'Position',[0.18 0.25 0.05 0.05],'FontSize', Font_size-2);
            
            h.Crystal_Distortion_tan_dc = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','Edit','FontWeight','bold','FontName','Helvetica','Visible', 'on','String','0.00',...                
                'Units','Normalized','HorizontalAlignment','center',...
                'Position',[0.23 0.25 0.05 0.05],'FontSize', Font_size-2);

            h.Crystal_Distortion_tan_da2 = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','Edit','FontWeight','bold','FontName','Helvetica','Visible', 'on','String','0.00',...                
                'Units','Normalized','HorizontalAlignment','center',...
                'Position',[0.28 0.25 0.05 0.05],'FontSize', Font_size-2);
            
            h.Crystal_Distortion_tan_db2 = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','Edit','FontWeight','bold','FontName','Helvetica','Visible', 'on','String','0.00',...                
                'Units','Normalized','HorizontalAlignment','center',...
                'Position',[0.33 0.25 0.05 0.05],'FontSize', Font_size-2);
            
            h.Crystal_Distortion_tan_dc2 = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','Edit','FontWeight','bold','FontName','Helvetica','Visible', 'on','String','0.00',...                
                'Units','Normalized','HorizontalAlignment','center',...
                'Position',[0.38 0.25 0.05 0.05],'FontSize', Font_size-2);

            
            % Width strain (A)
            h.name_width_strain = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','text','Units','normalized','String',' Width (A)',...
                'Position',[0.05 0.2 0.08 0.05],'BackgroundColor',[0.8 0.8 0.8],'FontSize', Font_size-4);
            
            h.width_strain_a = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style' , 'Edit','Visible', 'on', 'FontName','Helvetica','String',' 100000',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.13 0.2 0.05 0.05],'FontSize', Font_size-4);

            h.width_strain_b = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style' , 'Edit','Visible', 'on', 'FontName','Helvetica','String',' 100000',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.18 0.2 0.05 0.05],'FontSize', Font_size-4);

            h.width_strain_c = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style' , 'Edit','Visible', 'on', 'FontName','Helvetica','String',' 100000',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.23 0.2 0.05 0.05],'FontSize', Font_size-4);

            h.width_strain_a2 = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style' , 'Edit','Visible', 'on', 'FontName','Helvetica','String',' 100000',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.28 0.2 0.05 0.05],'FontSize', Font_size-4);

            h.width_strain_b2 = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style' , 'Edit','Visible', 'on', 'FontName','Helvetica','String',' 100000',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.33 0.2 0.05 0.05],'FontSize', Font_size-4);

            h.width_strain_c2 = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style' , 'Edit','Visible', 'on', 'FontName','Helvetica','String',' 100000',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.38 0.2 0.05 0.05],'FontSize', Font_size-4);

            
            % Crystal_Center strain depth (A)
            h.name_Crystal_Distortion_depth = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','text','Units','normalized','String','Center Depth(A)',...
                'Position',[0.05 0.15 0.08 0.05],'BackgroundColor',[0.8 0.8 0.8],'FontSize', Font_size-4);
          
            h.Crystal_Distortion_depth_a = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','Edit','FontWeight','bold','FontName','Helvetica','Visible', 'on','String','500',...
                'Units','Normalized','HorizontalAlignment','center',...
                'Position',[0.13 0.15 0.05 0.05],'FontSize', Font_size-4);
            h.Crystal_Distortion_depth_b = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','Edit','FontWeight','bold','FontName','Helvetica','Visible', 'on','String','500',...
                'Units','Normalized','HorizontalAlignment','center',...
                'Position',[0.18 0.15 0.05 0.05],'FontSize', Font_size-4);
            h.Crystal_Distortion_depth_c = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','Edit','FontWeight','bold','FontName','Helvetica','Visible', 'on','String','500',...
                'Units','Normalized','HorizontalAlignment','center',...
                'Position',[0.23 0.15 0.05 0.05],'FontSize', Font_size-4);
             h.Crystal_Distortion_depth_a2 = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','Edit','FontWeight','bold','FontName','Helvetica','Visible', 'on','String','500',...
                'Units','Normalized','HorizontalAlignment','center',...
                'Position',[0.28 0.15 0.05 0.05],'FontSize', Font_size-4);
            h.Crystal_Distortion_depth_b2 = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','Edit','FontWeight','bold','FontName','Helvetica','Visible', 'on','String','500',...
                'Units','Normalized','HorizontalAlignment','center',...
                'Position',[0.33 0.15 0.05 0.05],'FontSize', Font_size-4);
            h.Crystal_Distortion_depth_c2 = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','Edit','FontWeight','bold','FontName','Helvetica','Visible', 'on','String','500',...
                'Units','Normalized','HorizontalAlignment','center',...
                'Position',[0.38 0.15 0.05 0.05],'FontSize', Font_size-4);

            h.Compressed_strain =  uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','check','Units','Normalized','FontName','Helvetica','String','1 Expansive',...
                'value',0,...
                'Position', [0.13 0.1 0.1 0.05],'BackgroundColor',[1 1 1],'FontSize', Font_size-4,'Callback',@Strain_Crystal);
            h.Compressed_strain2 =  uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','check','Units','Normalized','FontName','Helvetica','String','2 Expansive',...
                'value',0,...
                'Position', [0.28 0.1 0.1 0.05],'BackgroundColor',[1 1 1],'FontSize', Font_size-4,'Callback',@Strain_Crystal);
            
           % 2D Xtal
           h.name_Crystal_Distortion_depth = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style','text','Units','normalized','String','2D Map strain',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.005 0.0 0.05 0.1],'BackgroundColor',[0.5 0.5 0.5],'FontSize', Font_size-2);
            
           %Folder with the information of the strain
           h.name_directoryname_Strain_file_2D= uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style' , 'Push','Enable','on','Value', 0,'String','Folder 2D:',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.05 0.0 0.05 0.1],'BackgroundColor',[0.5 0.5 0.5],'FontSize',Font_size-2,...
                'Callback',@Strain_Crystal);
            
            h.directoryname_Strain_file_2D = uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style' , 'edit','Enable','on','FontName','Helvetica','String','/home/rodrigfa/code/MultiBeam_calculator//Strain_2D_model_test.mat',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.1 0.0 0.15 0.1],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size-2);
           
           %Plots in a figure the strain map for the calculation
           h.plot_strain_2D= uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style' , 'Push','Enable','on','Value', 0,'String','Plot',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.25 0.0 0.05 0.1],'BackgroundColor',[0.5 0. 0.5],'FontSize',Font_size-2,...
                'Callback',@Strain_Crystal);

           %Starts the calculation and calls Refelctivity function for each step
           h.calculate_strain_from_file_2D= uicontrol('Parent',h.I_Fig_Strain_Crystal,...
                'Style' , 'Push','Enable','on','Value', 0,'String','Calculate',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.3 0.0 0.07 0.1],'BackgroundColor',[0. 0.5 0.5],'FontSize',Font_size-2,...
                'Callback',@Strain_Crystal);

           

            
            
        %Check type of model
        elseif source == h.name_directoryname_Strain_file
            %get expected location
            directoryname_Strain_file = get(h.directoryname_Strain_file,'string');
            [name,Filepath] = uigetfile(directoryname_Strain_file);      
            name_file = sprintf('%s/%s',Filepath,name);
            Strain_file = load(name_file);          
            set (h.Crystal_Distortion_box,'string',Strain_file.depth_strain_string)

        elseif source == h.name_directoryname_Strain_file_2D
            directoryname_Strain_file = get(h.directoryname_Strain_file_2D,'string');
            [name,Filepath] = uigetfile(directoryname_Strain_file);      
            name_file = sprintf('%s/%s',Filepath,name);
            set (h.directoryname_Strain_file_2D,'string',name_file)
        
        %plots the choosen file
        elseif source == h.plot_strain_2D
            name_file = get(h.directoryname_Strain_file_2D,'string');
            strain_file = load(name_file); 

            size_strain_file = size(strain_file.Da_a_2D);
            x_strain_plot = linspace(1,size_strain_file(2),size_strain_file(2));
            y_strain_plot = linspace(1,size_strain_file(1),size_strain_file(1));
            
            Plot_2D_strain_figure_generator
            
            strain_file.Da_a_2D
            pcolor(x_strain_plot,y_strain_plot, strain_file.Da_a_2D,'Parent',h.I_Fig_Strain_2D_Prewiev)
            

        %For each step of the choosend file calculates the strain and the
        %Reflectivity
        elseif source == h.calculate_strain_from_file_2D
            %load the strain file
            name_file = get(h.directoryname_Strain_file_2D,'string');
            strain_file = load(name_file); 

            %check the size of the step file
            size_strain_file = size (strain_file.Da_a_2D);
            x_strain_plot = linspace(1,size_strain_file(2),size_strain_file(2));
            y_strain_plot = linspace(1,size_strain_file(1),size_strain_file(1));


            %Initiallize the figure for the plt
            Plot_2D_strain_figure_generator
            
            
            child = get(h.I_Fig_Strain_2D_Prewiev,'Children');
            for i=1:length(child)
                delete(child(i));
            end

            axes(h.I_Fig_Strain_2D_Prewiev)  
            pcolor(x_strain_plot,y_strain_plot, strain_file.Da_a_2D,'Parent',h.I_Fig_Strain_2D_Prewiev)
            hold on
            title('Strain map 2D')
            xlabel('Sample x (mm)')
            ylabel('Sample y (mm)')   

            %view(2)

            Results_strain_2D = zeros(size_strain_file(1),size_strain_file(2));   %Zero the initial result matrix for the 2D
            
            set(h.Save_strain_2D,'value',1)

            h.Gaussian_R_plot_profile_sum = zeros(1,eval(get(h.Nstep_x_Beam,'string'))); %Initial the of profiles
            count_steps_2d_map = 0;

            i_count = 15;
            for ii = 1:size_strain_file(1)
                
                for jj = 1:size_strain_file(2)
                    i_count = i_count + 1;
                    count_strain_2D = (ii-1)*size_strain_file(2) + jj;
                    set(h.Step_2D_strain,'string',count_strain_2D)

                    h.step_2D_iteration = count_strain_2D;
                    child = get(h.I_Fig_Strain_2D_Prewiev,'Children');
                    for i=1:length(child)
                        delete(child(i));
                    end

                    axes(h.I_Fig_Strain_2D_Prewiev)
                    pcolor(x_strain_plot,y_strain_plot, strain_file.Da_a_2D,'Parent',h.I_Fig_Strain_2D_Prewiev)
                    hold on
                    title('Strain map 2D')
                    xlabel('Sample x (mm)')
                    ylabel('Sample y (mm)')
                    scatter(x_strain_plot(jj),y_strain_plot(ii),i_count,"red","filled",'parent',h.I_Fig_Strain_2D_Prewiev)

                    pause(.1)

                    da_a_step = strain_file.Da_a_2D(ii,jj);
                    db_b_step = strain_file.Db_b_2D(ii,jj);
                    dc_c_step = strain_file.Dc_c_2D(ii,jj);

                    width_strain_a = strain_file.width_strain_a_2D(ii,jj) * 10000;
                    width_strain_b = strain_file.width_strain_b_2D(ii,jj) * 10000;
                    width_strain_c = strain_file.width_strain_c_2D(ii,jj) * 10000;

                    Crystal_Distortion_depth_a = strain_file.depth_a_2D(ii,jj) * 10000;
                    Crystal_Distortion_depth_b = strain_file.depth_b_2D(ii,jj) * 10000;
                    Crystal_Distortion_depth_c = strain_file.depth_c_2D(ii,jj) * 10000;

                    set(h.Crystal_Distortion_tan_da,'string',da_a_step)
                    set(h.Crystal_Distortion_tan_db,'string',db_b_step)
                    set(h.Crystal_Distortion_tan_dc,'string',dc_c_step)

                    set(h.width_strain_a,'string',width_strain_a)
                    set(h.width_strain_b,'string',width_strain_b)
                    set(h.width_strain_c,'string',width_strain_c)

                    set(h.Crystal_Distortion_depth_a,'string',Crystal_Distortion_depth_a)
                    set(h.Crystal_Distortion_depth_b,'string',Crystal_Distortion_depth_b)
                    set(h.Crystal_Distortion_depth_c,'string',Crystal_Distortion_depth_c)
                    
                    Calculate_Strain_call  %Calls the calculation of strain for each step of the matrix
            
                    Beam_3D_Reflectivity %We call the main function for the calculation of the dynamical refraction for each point.

                    
                    
                    %%  Save the parameters
                    %Integration
                    Results_strain_2D(ii,jj) = sum(sum(h.Gaussian_R_plot,2),1);

                    child = get(h.I_Fig_Strain_2D_step,'Children');
                    for i=1:length(child)
                        delete(child(i));
                    end

                    %child = get(h.I_Fig_Strain_2D_step_profile,'Children');
                    %for i=1:length(child)
                    %    delete(child(i));
                    %end
                    
                    %plot 1D along x direction
                    Gaussian_R_plot_profile = sum(h.Gaussian_R_plot,1);

                    [Max_Gaus, Max_pos] = findpeaks(Gaussian_R_plot_profile,h.x_array_center);
                    
                    x_array_center = h.x_array_center-Max_pos(1);
                    [Max_Gaus, Max_pos] = findpeaks(Gaussian_R_plot_profile,x_array_center);

                    %plot 2D detector
                    axes(h.I_Fig_Strain_2D_step)
                    imagesc(x_array_center,h.y_array_center,h.Gaussian_R_plot,'Parent',h.I_Fig_Strain_2D_step)                    
                    colormap hot
                    xlabel('X detector (\mum)')
                    ylabel('Y detector (\mum)')
                    str = sprintf('Detector Inensity  step: %d', count_strain_2D);
                    title(str)

                    axes(h.I_Fig_Strain_2D_step_profile)
                    hold on
                    plot(x_array_center,Gaussian_R_plot_profile,'Parent',h.I_Fig_Strain_2D_step_profile, 'LineWidth',1,'Marker','s','MarkerSize',1 )
                    xlabel('X detector (\mum)')
                    ylabel('Intensity  (arb. units)')
                    str = sprintf('Profile step: %d', count_strain_2D);
                    title(str)
                    xlim([-1 Max_pos(size(Max_pos,2))+5])
                    
                    h.Gaussian_R_plot_profile_sum = h.Gaussian_R_plot_profile_sum + Gaussian_R_plot_profile;

                    h.Gaussian_R_plot = []; %release memory
                    count_steps_2d_map = count_steps_2d_map +1;
                end

            end

            %plot 1D along x direction from all positions
            axes(h.I_Fig_Strain_2D_step_profile)
            hold on
            plot(x_array_center,h.Gaussian_R_plot_profile_sum/count_steps_2d_map,'Parent',h.I_Fig_Strain_2D_step_profile, 'Color','b','LineWidth',2,'Marker','diamond','MarkerSize',1 )
            xlabel('X detector (\mum)')
            ylabel('Intensity  (arb. units)')
            
            child = get(h.I_Fig_Strain_2D_Result,'Children');
            for i=1:length(child)
                delete(child(i));
            end


            %plot amplitud
            pcolor(x_strain_plot,y_strain_plot, Results_strain_2D,'Parent',h.I_Fig_Strain_2D_Result)  
            axes(h.I_Fig_Strain_2D_Result)  
            title('Integreated intensity strain 2D')
            xlabel('Sample x (mm)')
            ylabel('Sample y (mm)')   

            set(h.Save_strain_2D,'value',0)
        
        elseif source == h.sin_fuction_interphase
            set(h.square_fuction_interphase,'value',0)

        elseif source == h.square_fuction_interphase            
            set(h.sin_fuction_interphase,'value',0)

        elseif source == h.Compressed_strain  
            if get(h.Compressed_strain,'value') == 1
                set(h.Compressed_strain,'string','1 Compressive')
            else
                set(h.Compressed_strain,'string','1 Expansive')
            end
        
        elseif source == h.Compressed_strain2  
            if get(h.Compressed_strain2,'value') == 1
                set(h.Compressed_strain2,'string','2 Compressive')
            else
                set(h.Compressed_strain2,'string','2 Expansive')
            end
            

        elseif source == h.Strain_Crystal_Chk
            set( h.Single_Crystal_Chk,'value',0,'string','off')
            set( h.More_Crystal_Chk,'value',0,'string','off')
            set( h.Strain_Crystal_Chk,'value',1,'string','on')
            
        % Check if temoral strain model from Thomsen
        elseif source == h.Strain_Thomsen_Chk
            if get(h.Strain_Thomsen_Chk,'value') == 1
                set( h.Strain_Thomsen_Chk,'value',1,'string','on') 
            else
                set( h.Strain_Thomsen_Chk,'value',0,'string','off')
            end
        
        
        elseif source == h.Menu_Layer

        elseif source == h.Save_strain_2D
            
            
        elseif source == h.Save_crystal_line
            crystal_line_1 = get(h.crystal_line_1,'String');
            crystal_line_2 = get(h.crystal_line_2,'String');
            crystal_line_3 = get(h.crystal_line_3,'String');
            crystal_line_4 = get(h.crystal_line_4,'String');
            crystal_line_5 = get(h.crystal_line_5,'String');
            crystal_line_6 = get(h.crystal_line_6,'String');
            crystal_line_7 = get(h.crystal_line_7,'String');
            crystal_line_8 = get(h.crystal_line_8,'String'); 
            
            crystal_number = 0;            
            for i_line = 1:8                                
                name_line_crystal = 'crystal_line_';
                name = sprintf('%s%0.1d',name_line_crystal,i_line);
                name_crystal = eval(name);
                
                if name_crystal == '-'
                    
                else    
                    pos =1;
                    name_variable_pos_1 = '';
                    name_variable_pos_2 = '';
                    name_variable_pos_3 = '';
                    name_variable_pos_4 = '';
                    name_variable_pos_5 = '';
                    name_variable_pos_6 = '';
                    name_variable_pos_7 = '';
                    name_variable_pos_8 = '';
                    name_variable_pos_9 = '';
                    name_variable_pos_10 = '';
                    name_variable_pos_11 = '';
                    name_variable_pos_12 = '';
                    name_variable_pos_13 = '';
                    for i_variable = 1:size(name_crystal,2)
                        if name_crystal (1,i_variable) == ','
                           pos = pos +1;
                        else
                           if pos == 1
                               name_variable_pos_1 = strcat(name_variable_pos_1,name_crystal (1,i_variable));
                           elseif pos == 2
                               name_variable_pos_2 = strcat(name_variable_pos_2,name_crystal (1,i_variable));
                           elseif pos == 3
                               if name_crystal (1,i_variable) == '['                                   
                               else
                                   name_variable_pos_3 = strcat(name_variable_pos_3,name_crystal (1,i_variable));
                               end
                           elseif pos == 4
                               name_variable_pos_4 = strcat(name_variable_pos_4,name_crystal (1,i_variable));
                           elseif pos == 5
                               if name_crystal (1,i_variable) == ']'                                   
                               else
                                   name_variable_pos_5 = strcat(name_variable_pos_5,name_crystal (1,i_variable));
                               end
                           elseif pos == 6
                               name_variable_pos_6 = strcat(name_variable_pos_6,name_crystal (1,i_variable));
                           elseif pos == 7   
                               name_variable_pos_7 = strcat(name_variable_pos_7,name_crystal (1,i_variable));
                           elseif pos == 8
                               name_variable_pos_8 = strcat(name_variable_pos_8,name_crystal (1,i_variable));
                           elseif pos ==9
                               name_variable_pos_9 = strcat(name_variable_pos_9,name_crystal (1,i_variable));
                           elseif pos ==10
                               name_variable_pos_10 = strcat(name_variable_pos_10,name_crystal (1,i_variable));
                           elseif pos ==11
                               name_variable_pos_11 = strcat(name_variable_pos_11,name_crystal (1,i_variable))  ;
                           elseif pos ==12
                               name_variable_pos_12 = strcat(name_variable_pos_12,name_crystal (1,i_variable))  ;
                           elseif pos ==13
                               name_variable_pos_13 = strcat(name_variable_pos_13,name_crystal (1,i_variable))  ;
                           end                       
                           
                        end
                        
                    end
                    
                    if eval(name_variable_pos_1) == 0 
                        
                    else
                        crystal_number = crystal_number + 1;
                        
                        name_pos(1,crystal_number) = eval(name_variable_pos_1);
                        
                        name_Element(1,crystal_number) = eval(name_variable_pos_2);
                        
                        name_h(1,crystal_number) = eval(name_variable_pos_3);
                        
                        name_k(1,crystal_number) = eval(name_variable_pos_4);
                        
                        name_l(1,crystal_number) = eval(name_variable_pos_5);
                        
                        name_Thickness(1,crystal_number) = eval (name_variable_pos_6);
                        
                        name_geometry(1,crystal_number) = eval(name_variable_pos_7);
                        
                        name_Transmission(1,crystal_number) = eval(name_variable_pos_8);
                        
                        name_Asymmetry(1,crystal_number) = eval(name_variable_pos_9);
                        
                        name_Normal(1,crystal_number) = eval(name_variable_pos_10);
                        
                        name_polarization(1,crystal_number) = eval(name_variable_pos_11);
                        
                        name_Energy(1,crystal_number) = eval(name_variable_pos_12);
                        
                        name_Beam(1,crystal_number) = eval(name_variable_pos_13);
                    end
                end
                
            end
            set(h.info_number_crystal,'String',crystal_number)
            
            
            h.pos_MCC = name_pos;
            h.Element_MCC = name_Element;
            h.h_MCC = name_h;
            h.k_MCC = name_k;
            h.l_MCC = name_l;
            h.Thickness_MCC = name_Thickness;
            h.Geometry_MCC = name_geometry;
            h.Transmission_MCC = name_Transmission;
            h.Asymmetry_MCC = name_Asymmetry;
            h.Normal_MCC = name_Normal;
            h.polarization_MCC = name_polarization;
            h.name_Energy = name_Energy;
            h.name_Beam = name_Beam;
         end
        
    end

    function Plot_2D_strain_figure_generator (source,eventdata)
        
        %Initiallize the figure for the plot:
        h.I_Fig_2D_Reflectivity_Dynamical_strain_2D = figure(d+421);
        set(h.I_Fig_2D_Reflectivity_Dynamical_strain_2D,'Name','Strain_2D_Result',...
            'NumberTitle', 'Off','Toolbar','figure','visible','on',...
            'Units','normalized','Menubar','figure',...
            'Position', [0.55 0.05 0.45 0.3],'Color',[1 1 1],...
            'KeyReleaseFcn',@Press);
        
        if ishandle(h.I_Fig_2D_Reflectivity_Dynamical_strain_2D) 
            close(h.I_Fig_2D_Reflectivity_Dynamical_strain_2D)
        else

        end

        %Initiallize the figure for the plot:
        h.I_Fig_2D_Reflectivity_Dynamical_strain_2D = figure(d+421);
        set(h.I_Fig_2D_Reflectivity_Dynamical_strain_2D,'Name','Strain_2D_Result',...
            'NumberTitle', 'Off','Toolbar','figure','visible','on',...
            'Units','normalized','Menubar','figure',...
            'Position', [0.55 0.05 0.45 0.3],'Color',[1 1 1],...
            'KeyReleaseFcn',@Press);

            
            % Definition of the Symmetries, Element and cell parameters
            h.name_Step_2D_strain = uicontrol('Parent',h.I_Fig_2D_Reflectivity_Dynamical_strain_2D,...
                'Style','text','Units','normalized','String','Step 2D',...
                'Position',[0. 0.95 0.06 0.05],'BackgroundColor',[0.4 0.4 0.4],'FontSize',Font_size);

            h.Step_2D_strain  = uicontrol('Parent',h.I_Fig_2D_Reflectivity_Dynamical_strain_2D,...
                'Style','Edit','Units','normalized','String','-',...
                'Position',[0.06 0.95 0.03 0.05],'FontSize',Font_size);
            

            h.I_Fig_Strain_2D_Result = axes('Parent',h.I_Fig_2D_Reflectivity_Dynamical_strain_2D,...
                'Units','normalized','box','on',...
                'LineWidth',0.5,'FontName','Helvetica','FontWeight','bold',...
                'Position',[0.69 0.1 0.25 0.8],'Color',[1 1 1],'FontSize',Font_size-2,'Xlim',[-1 1]);
            grid('on');

            h.I_Fig_Strain_2D_step = axes('Parent',h.I_Fig_2D_Reflectivity_Dynamical_strain_2D,...
                'Units','normalized','box','on',...                
                'Position',[0.36 0.55 0.25 0.35],'Color',[1 1 1],'FontSize',Font_size-2,'Xlim',[-1 1]);
            grid('on');

            h.I_Fig_Strain_2D_step_profile = axes('Parent',h.I_Fig_2D_Reflectivity_Dynamical_strain_2D,...
                'Units','normalized','box','on',...                
                'Position',[0.36 0.1 0.25 0.35],'Color',[1 1 1],'FontSize',Font_size-2,'Xlim',[-1 1]);
            grid('on');

            h.I_Fig_Strain_2D_Prewiev = axes('Parent',h.I_Fig_2D_Reflectivity_Dynamical_strain_2D,...
                'Units','normalized','box','on',...
                'LineWidth',0.5,'FontName','Helvetica','FontWeight','bold',...
                'Position',[0.03 0.1 0.25 0.8],'Color',[1 1 1],'FontSize',Font_size-2,'Xlim',[-1 1]);
            grid('on');

    end

    function Calculate_Strain_call(source,eventdata)
        %Calculate strain
            
            Child = get(h.Layer_Fig,'Children');
            for i=1:length(Child)
                delete(Child(i));
            end
            
            %Propsertes crystal
            %Geometry of the crystal
            if (get(h.Bragg_Check,'value') == 1) || (get(h.Laue_Check,'value') == 1)
                name_Transmission_value = 0;
            else
                name_Transmission_value = 1;
            end
            
            if (get(h.Bragg_Check,'value') == 1) || (get(h.Bragg_FBD_Check,'value') == 1)
                name_geometry_value = 1;
            else
                name_geometry_value = 2;
            end
            
            Element = get(h.Element,'string');
            
            h_miller = eval(get(h.h_miller,'string'));
            k_miller = eval(get(h.k_miller,'string'));
            l_miller = eval(get(h.l_miller,'string'));

            Asymmetry = eval(get(h.Asymmetry ,'string'));
            if get(h.crystal_orientation,'value') == 1
                normal = 1;
            else
                normal = 0;
            end
            
            if get(h.Polarization_s,'value') == 1
                polarization = 1;
            else
                polarization = 0;
            end
            Energy = eval(get(h.Energy_input,'string'));
            
            %Variable with strain information    
            Crystal_String_Strain = get(h.Crystal_Distortion_box,'String');

            %% Model implementation
            %Strain definition
            Type_Layer = get(h.Menu_Layer,'Value');
            
            %Read strain form box:
            name_Thickness_Strain_affected = 0;
            Layer_number = 1;
            size_crystal_true = true;
            i_variable = 0; 
            %manual imputs of strain
            if (Type_Layer ==1) || (Type_Layer ==2) ||(Type_Layer ==3) ||( Type_Layer ==9 )
                
                while size_crystal_true %i_line = 1 : size(Crystal_String_Strain,1)
                    name_crystal = Crystal_String_Strain;
                    
                    name_variable_pos_1 = '';
                    name_variable_pos_2 = '';
                    name_variable_pos_3 = '';
                    name_variable_pos_4 = '';
                    name_variable_pos_5 = '';
                    name_variable_pos_6 = '';
                    
                    pos =1;
                    strain_condition = true;
                    while strain_condition
                        i_variable = i_variable+1;
                        if name_crystal (1,i_variable) == ' '
                            pos = pos +1;
                        elseif name_crystal (1,i_variable) == '['
                        elseif name_crystal (1,i_variable) == ']'
                            size_crystal_true = false;
                            strain_condition = false;
                        elseif name_crystal (1,i_variable) == ';'
                            strain_condition = false;
                            if name_crystal (1,i_variable+1) == ']'
                                size_crystal_true = false; 
                            end
                        else
                            if pos == 1
                                name_variable_pos_1 = strcat(name_variable_pos_1,name_crystal (1,i_variable));
                                
                            elseif pos == 2
                                name_variable_pos_2 = strcat(name_variable_pos_2,name_crystal (1,i_variable));
                                
                            elseif pos == 3
                                name_variable_pos_3 = strcat(name_variable_pos_3,name_crystal (1,i_variable));
                                
                            elseif pos == 4
                                name_variable_pos_4 = strcat(name_variable_pos_4,name_crystal (1,i_variable));
                                
                            elseif pos == 5
                                name_variable_pos_5 = strcat(name_variable_pos_5,name_crystal (1,i_variable));
                                
                            elseif pos == 6
                                name_variable_pos_6 = strcat(name_variable_pos_6,name_crystal (1,i_variable));
                                
                            end
                        end
                    end
                    
                    
                    %%Layer strain (A)
                    name_Layer_Strain(1,Layer_number) = Layer_number;
                    %%Thickness strain (A)
                    name_Thickness_Strain(1,Layer_number) = eval(name_variable_pos_1);
                    
                    name_Thickness_Strain_affected = name_Thickness_Strain_affected + name_Thickness_Strain(1,Layer_number);
                    %Stain da/a
                    name_da(1,Layer_number) = eval(name_variable_pos_2);
                    %Stain db/b
                    name_db(1,Layer_number) = eval(name_variable_pos_3);
                    %Stain dc/c
                    name_dc(1,Layer_number) = eval(name_variable_pos_4);
                    %Interface
                    name_interface_Thickeness(1,Layer_number) = eval(name_variable_pos_5);
                    %Interface
                    name_interface_Strain(1,Layer_number) = eval(name_variable_pos_6);
                    
                    %No model
                    name_Element(1,Layer_number) =  cellstr(Element);
                    name_h(1,Layer_number) = h_miller;
                    name_k(1,Layer_number) = k_miller;
                    name_l(1,Layer_number) = l_miller;
                    
                    name_geometry(1,Layer_number) = name_geometry_value;
                    name_Transmission(1,Layer_number) = name_Transmission_value;
                    name_Asymmetry(1,Layer_number) = Asymmetry;
                    name_Normal(1,Layer_number) = normal;
                    name_polarization(1,Layer_number) = polarization;
                    name_Energy(1,Layer_number) =  0;
                    name_Beam(1,Layer_number) =  0;
                    
                    Layer_number = Layer_number + 1;
                end
            end
            
            %Non distoted crystal
            Crystal_depth_total = eval(get(h.Thickness,'String'))*1e4;  %Thickness crystal            
            name_Layer_Strain(1,Layer_number) = Layer_number;           %Layer strain (A)
            
            
            %%Thickness strain (A)
            if Crystal_depth_total > name_Thickness_Strain_affected
                name_Thickness_Strain(1,Layer_number) = Crystal_depth_total - name_Thickness_Strain_affected;
            else
                name_Thickness_Strain(1,Layer_number) = 0;
            end
            name_Element(1,Layer_number) = cellstr(Element);               %Element layer
            name_h(1,Layer_number) = h_miller;   name_k(1,Layer_number) = k_miller;   name_l(1,Layer_number) = l_miller; %Reflection Layer
            
            name_geometry(1,Layer_number) = name_geometry_value;            % Geometry reflection
            name_Transmission(1,Layer_number) = name_Transmission_value;    %Geometry transmission
            name_Asymmetry(1,Layer_number) = Asymmetry;         %Asymmetry of the layer
            name_Normal(1,Layer_number) = normal;               %Diffraction normal crystal
            name_polarization(1,Layer_number) = polarization;   %Polarization
            name_Energy(1,Layer_number) =  0;                   %Energy out off
            name_Beam(1,Layer_number) =  0;            
            name_da(1,Layer_number) = 0; 
            name_db(1,Layer_number) = 0;  
            name_dc(1,Layer_number) = 0;         %Stain da/a, db/b, dc/c            
            name_interface_Thickeness(1,Layer_number) = 0;      %Interface Thickness
            name_interface_Strain(1,Layer_number) = 0;          %Interface Strain
            
            %% Model implementation
            %Strain definition
           
            cc =hsv(12);
            type_line = [45 58 4545 4546];
            

            if Type_Layer ==1                                           %Simple profile
                               
                Crystal_Step_Layer = eval(get(h.Crystal_Step_Layer,'string'));
                Thickenes_Layer = eval(get(h.Thickness,'String'))*1e4; %% maybe not correct
                ISD(1,:) = linspace(0,Crystal_depth_total,Crystal_depth_total/Crystal_Step_Layer);
                ISD(2,:) = zeros(1,size(ISD,2)); %Strain
                ISD(3,:) = zeros(1,size(ISD,2)); %Strain
                ISD(4,:) = zeros(1,size(ISD,2)); %Strain
                ISD(5,:) = Crystal_Step_Layer * ones(1,size(ISD,2));            %thickness by layer
                
                %Built strain
                i_strain_layer = 1;
                total_thickness_crystal = name_Thickness_Strain(i_strain_layer);

                for i_strain = 1 : size(ISD,2)                    
                    actual_thickness = i_strain * Crystal_Step_Layer;             %Count the thickness                    
                    if actual_thickness <= total_thickness_crystal %Check if is in new layer
                        ISD(2,i_strain) = name_da(i_strain_layer);               %Save strain layer to ISD
                        ISD(3,i_strain) = name_db(i_strain_layer);               %Save strain layer to ISD
                        ISD(4,i_strain) = name_dc(i_strain_layer);               %Save strain layer to ISD
                        
                    else % if new layer
                        i_strain_layer = i_strain_layer+1;                      %layer +1
                        ISD(2,i_strain) = name_da(i_strain_layer);              %Save new strain layer to ISD
                        ISD(3,i_strain) = name_db(i_strain_layer);              %Save new strain layer to ISD
                        ISD(4,i_strain) = name_dc(i_strain_layer);              %Save new strain layer to ISD
                        total_thickness_crystal = total_thickness_crystal + name_Thickness_Strain(i_strain_layer); %new thickness of strain
                        
                    end
                    name_Element(1,i_strain) = cellstr(Element);               %Element layer
                    name_h(1,i_strain) = h_miller;   name_k(1,i_strain) = k_miller;   name_l(1,i_strain) = l_miller; %Reflection Layer                    
                    name_h(1,i_strain) = h_miller;   name_k(1,i_strain) = k_miller;   name_l(1,i_strain) = l_miller; %Reflection Layer                    
                    name_geometry(1,i_strain) = name_geometry_value;            % Geometry reflection
                    name_Transmission(1,i_strain) = name_Transmission_value;    %Geometry transmission
                    name_Asymmetry(1,i_strain) = Asymmetry;         %Asymmetry of the layer
                    name_Normal(1,i_strain) = normal;               %Diffraction normal crystal
                    name_polarization(1,i_strain) = polarization;   %Polarization
                    name_Energy(1,i_strain) =  0;                   %Energy out off
                    name_Beam(1,i_strain) =  0;
                end
                
                line(ISD(1,:),ISD(2,:), 'Parent', h.Layer_Fig,'LineWidth',2,'Marker','s','MarkerSize',2)

                h.number_layers = i_strain_layer-2;          %number layers
                 %shape normal parameters
                 
                 
            elseif Type_Layer == 2                                      % Heaviside profile with small steps
                Crystal_Step_Layer = eval(get(h.Crystal_Step_Layer,'string'));
                Thickenes_Layer = eval(get(h.Thickness,'String'))*1e4; %%Maybe not corect
                ISD(1,:) = linspace(0,Crystal_depth_total,Crystal_depth_total/Crystal_Step_Layer); % Step profile of Thickness along crystal
                ISD(2,:) = zeros(1,size(ISD,2));                                %Strain a
                ISD(3,:) = zeros(1,size(ISD,2));                                %Strain b
                ISD(4,:) = zeros(1,size(ISD,2));                                %Strain c
                ISD(5,:) = Crystal_Step_Layer * ones(1,size(ISD,2));            %thickness by layer
                
                %Built strain
                i_strain_layer = 1;
                total_thickness_crystal = name_Thickness_Strain(i_strain_layer);
                
                %Interface definition layer
                Interface_small_layer = total_thickness_crystal - name_interface_Thickeness(i_strain_layer)/2;
                Interface_big_layer = total_thickness_crystal + name_interface_Thickeness(i_strain_layer)/2;
                
                new_layer = 0;
                for i_strain = 1 : size(ISD,2)
                    
                    actual_thickness = i_strain * Crystal_Step_Layer;             %Count the thickness
                    
                    if actual_thickness <= Interface_small_layer %Check if is in new layer
                        ISD(2,i_strain) = name_da(i_strain_layer);               %Save strain layer to ISD
                        ISD(3,i_strain) = name_db(i_strain_layer);               %Save strain layer to ISD
                        ISD(4,i_strain) = name_dc(i_strain_layer);               %Save strain layer to ISD
                        
                    elseif (actual_thickness > Interface_small_layer) && (actual_thickness <= Interface_big_layer)
                        if new_layer ==0
                            number_steps_interface = name_interface_Thickeness(i_strain_layer) /Crystal_Step_Layer;
                            name_interface_Strain_Heavi = (name_da(i_strain_layer + 1) -name_da(i_strain_layer)) / number_steps_interface;
                            i_strain_layer = i_strain_layer + 1;                       %layer +1
                            new_layer = 1;
                            i_number_steps_interface = 0;
                        end
                        ISD(2,i_strain) = name_da(i_strain_layer) - (number_steps_interface-i_number_steps_interface) * name_interface_Strain_Heavi;               %Save strain layer to ISD
                        ISD(3,i_strain) = name_db(i_strain_layer) - (number_steps_interface-i_number_steps_interface) * name_interface_Strain_Heavi;                    %Save strain layer to ISD
                        ISD(4,i_strain) = name_dc(i_strain_layer) - (number_steps_interface-i_number_steps_interface) * name_interface_Strain_Heavi;               %Save strain layer to ISD
                        i_number_steps_interface = i_number_steps_interface +1;
                        
                    elseif actual_thickness >= Interface_big_layer
                        ISD(2,i_strain) = name_da(i_strain_layer);              %Save new strain layer to ISD
                        ISD(3,i_strain) = name_db(i_strain_layer);              %Save new strain layer to ISD
                        ISD(4,i_strain) = name_dc(i_strain_layer);              %Save new strain layer to ISD
                        total_thickness_crystal = total_thickness_crystal + name_Thickness_Strain(i_strain_layer); %new thickness of strain
                        
                        %Interface definition newlayer
                        new_layer = 0;
                        Interface_small_layer = total_thickness_crystal - name_interface_Thickeness(i_strain_layer)/2;
                        Interface_big_layer = total_thickness_crystal + name_interface_Thickeness(i_strain_layer)/2;
                    end
                    
                    %shape normal parameters
                    name_Element(1,i_strain) = cellstr(Element);               %Element layer
                    name_h(1,i_strain) = h_miller;   name_k(1,i_strain) = k_miller;   name_l(1,i_strain) = l_miller; %Reflection Layer                    
                    name_geometry(1,i_strain) = name_geometry_value;            % Geometry reflection
                    name_Transmission(1,i_strain) = name_Transmission_value;    %Geometry transmission
                    name_Asymmetry(1,i_strain) = Asymmetry;         %Asymmetry of the layer
                    name_Normal(1,i_strain) = normal;               %Diffraction normal crystal
                    name_polarization(1,i_strain) = polarization;   %Polarization
                    name_Energy(1,i_strain) =  0;                   %Energy out off
                    name_Beam(1,i_strain) =  0;
                end
                
                line(ISD(1,:),ISD(2,:), 'Parent', h.Layer_Fig, 'Color',rand(1,3),'LineWidth',2,'Marker','s','MarkerSize',2)
                
                h.number_layers = i_strain_layer-2;          %number layers
            
            elseif Type_Layer == 3                                      % Heaviside with soft
                
                Crystal_Step_Layer = eval(get(h.Crystal_Step_Layer,'string'));
                Thickenes_Layer = eval(get(h.Thickness,'String'))*1e4; %%Maybe not corect
                ISD(1,:) = linspace(0,Crystal_depth_total,Crystal_depth_total/Crystal_Step_Layer); % Step profile of Thickness along crystal
                ISD(2,:) = zeros(1,size(ISD,2));                                %Strain a
                ISD(3,:) = zeros(1,size(ISD,2));                                %Strain b
                ISD(4,:) = zeros(1,size(ISD,2));                                %Strain c
                ISD(5,:) = Crystal_Step_Layer * ones(1,size(ISD,2));            %thickness by layer
                
                %Built strain
                i_strain_layer = 1;
                total_thickness_crystal = 0;
                
                new_layer = 0;
                new_crystal = 0;
                total_thickness_crystal = name_Thickness_Strain(i_strain_layer);
                for i_strain = 1 : size(ISD,2)
                    % Start the sum
                    actual_thickness = i_strain * Crystal_Step_Layer;             %Count the thickness
                    % Interface definition layer for each layer
                    % definition of the interface layer
                    if new_crystal == 0
                        %Init new crystal                        
                        ISD(2,i_strain) = name_da(i_strain_layer);               %Save strain layer to ISD
                        ISD(3,i_strain) = name_db(i_strain_layer);               %Save strain layer to ISD
                        ISD(4,i_strain) = name_dc(i_strain_layer);               %Save strain layer to ISD
                        if actual_thickness == total_thickness_crystal
                            new_crystal = 1; %No new crystal
                            %i_strain_layer = i_strain_layer + 1;            %Next layer                            
                        end
                        
                    elseif i_strain_layer ==size(name_da,2)
                        ISD(2,i_strain) = name_da(i_strain_layer);               %Save strain layer to ISD
                        ISD(3,i_strain) = name_db(i_strain_layer);               %Save strain layer to ISD
                        ISD(4,i_strain) = name_dc(i_strain_layer);               %Save strain layer to ISD
                        
                    else %No new crystal but new layer
                        if new_layer == 0
                            %Interphase with all layer
                            Interface_small_layer = total_thickness_crystal + name_interface_Thickeness(i_strain_layer+1);
                            %Total with new layer
                            total_thickness_crystal = total_thickness_crystal + name_Thickness_Strain(i_strain_layer+1);
                            %Limit new layer                            
                            Interface_big_layer = total_thickness_crystal;
                            
                            if get(h.square_fuction_interphase,'value') == 1
                                %definition number of steps in layer
                                number_steps_interface = name_interface_Thickeness(i_strain_layer) /Crystal_Step_Layer;
                                %definition vector in interpahse
                                inter_S_H_soft = linspace(0,number_steps_interface,number_steps_interface);
                                
                                %definition strain  in interphase from previous
                                %layer to new layer
                                
                                name_da_interphase = -name_da(i_strain_layer) + name_da(i_strain_layer+1);
                                name_interface_Strain_Heavi = (inter_S_H_soft(size(inter_S_H_soft,2)) - flip(inter_S_H_soft)) / inter_S_H_soft(size(inter_S_H_soft,2));
                                
                                name_interface_Strain_Heavi = name_da(i_strain_layer) + (name_interface_Strain_Heavi).^2 * name_da_interphase; %Definition strain
                            
                            elseif get(h.sin_fuction_interphase,'value') == 1
                                %definition number of steps in layer
                                number_steps_interface = name_interface_Thickeness(i_strain_layer) /Crystal_Step_Layer;
                                %definition vector in interpahse
                                inter_S_H_soft = linspace(0,number_steps_interface,number_steps_interface);
                                inter_S_H_soft = inter_S_H_soft/ inter_S_H_soft(size(inter_S_H_soft,2));
                                %definition strain  in interphase from previous
                                %layer to new layer                                
                                name_da_interphase = -name_da(i_strain_layer) + name_da(i_strain_layer+1);
                                %sin(x(1:100)/x(size(x,2))*pi-pi/2)
                                name_interface_Strain_Heavi= cos(inter_S_H_soft *pi/2-pi/2);
                                
                                name_interface_Strain_Heavi = name_da(i_strain_layer) + (name_interface_Strain_Heavi).^2 * name_da_interphase; %Definition strain
                            
                            end
                            %Define that we are in new layer
                            i_number_steps_interface = 1;                   % Init count of number in the interface
                            
                            new_layer = 1;                                  % Not new layer, new layer =0
                        end
                        
                        %Interface definition layer for each layer

                        if actual_thickness <= Interface_small_layer %Check if is in new layer
                            %Strain in interphase
                            ISD(2,i_strain) = name_interface_Strain_Heavi(i_number_steps_interface);               %Save strain layer to ISD
                            ISD(3,i_strain) = name_interface_Strain_Heavi(i_number_steps_interface);               %Save strain layer to ISD
                            ISD(4,i_strain) = name_interface_Strain_Heavi(i_number_steps_interface);               %Save strain layer to ISD
                            i_number_steps_interface = i_number_steps_interface + 1;
                            
                            
                        elseif (actual_thickness > Interface_small_layer) && (actual_thickness <= Interface_big_layer)
                            ISD(2,i_strain) = name_da(i_strain_layer+1);               %Save strain layer to ISD
                            ISD(3,i_strain) = name_db(i_strain_layer+1);               %Save strain layer to ISD
                            ISD(4,i_strain) = name_dc(i_strain_layer+1);               %Save strain layer to ISD
                            
                        end
                        
                        %Interface definition newlayer
                        if actual_thickness == Interface_big_layer
                            i_strain_layer = i_strain_layer + 1;            %Next layer
                            new_layer = 0;
                        end
                    end
                    %shape normal parameters
                    name_Element(1,i_strain) = cellstr(Element);               %Element layer
                    name_h(1,i_strain) = h_miller;   name_k(1,i_strain) = k_miller;   name_l(1,i_strain) = l_miller; %Reflection Layer                    
                    name_geometry(1,i_strain) = name_geometry_value;            % Geometry reflection
                    name_Transmission(1,i_strain) = name_Transmission_value;    %Geometry transmission
                    name_Asymmetry(1,i_strain) = Asymmetry;         %Asymmetry of the layer
                    name_Normal(1,i_strain) = normal;               %Diffraction normal crystal
                    name_polarization(1,i_strain) = polarization;   %Polarization
                    name_Energy(1,i_strain) =  0;                   %Energy out off
                    name_Beam(1,i_strain) =  0;
                    
                end
                %plot Strain
                line(ISD(1,:),ISD(2,:), 'Parent', h.Layer_Fig, 'Color',rand(1,3),'LineWidth',2,'Marker','s','MarkerSize',2)
                
                h.number_layers = i_strain_layer-2;          %number layers
                
                
            elseif Type_Layer == 4   % Inverse exponential           

                Thickenes_Layer = eval(get(h.Thickness,'String'))*1e4;
                %incident surface
                Strain_Val_a = eval(get(h.Crystal_Distortion_tan_da,'String')); %Strain in the surface
                Strain_Val_b = eval(get(h.Crystal_Distortion_tan_db,'String')); %Strain in the surface
                Strain_Val_c = eval(get(h.Crystal_Distortion_tan_dc,'String')); %Strain in the surface
                Interfase_Val_a = eval(get(h.width_strain_a,'String'));  %Interdace
                Interfase_Val_b = eval(get(h.width_strain_b,'String'));  %Interdace
                Interfase_Val_c = eval(get(h.width_strain_c,'String'));  %Interdace
                %Rear surface
                Strain_Val_a2 = eval(get(h.Crystal_Distortion_tan_da2,'String')); %Strain in the surface
                Strain_Val_b2 = eval(get(h.Crystal_Distortion_tan_db2,'String')); %Strain in the surface
                Strain_Val_c2 = eval(get(h.Crystal_Distortion_tan_dc2,'String')); %Strain in the surface
                Interfase_Val_a2 = eval(get(h.width_strain_a2,'String'));  %Interdace
                Interfase_Val_b2 = eval(get(h.width_strain_b2,'String'));  %Interdace
                Interfase_Val_c2 = eval(get(h.width_strain_c2,'String'));  %Interdace

                Step_Layer = eval(get(h.Crystal_Step_Layer,'String'));
                steps_layers = Thickenes_Layer / Step_Layer;
                
                ISD(1,:) = linspace(0,Thickenes_Layer,steps_layers);
     
                %Front Surface
                R_coefficient_a = 1/Interfase_Val_a;
                R_coefficient_b = 1/Interfase_Val_b;
                R_coefficient_c = 1/Interfase_Val_c;
                %Rear surface
                R_coefficient_a2 = 1/Interfase_Val_a2;
                R_coefficient_b2 = 1/Interfase_Val_b2;
                R_coefficient_c2 = 1/Interfase_Val_c2;
                
                if get(h.Compressed_strain,'value') == 1 %compressed
                    ISD(2,:) = - Strain_Val_a * exp(-R_coefficient_a * ISD(1,:));
                    ISD(3,:) = - Strain_Val_b * exp(-R_coefficient_b * ISD(1,:));
                    ISD(4,:) = - Strain_Val_c * exp(-R_coefficient_c * ISD(1,:));                    
                else %expansive strain
                    ISD(2,:) = Strain_Val_a * exp(-R_coefficient_a * ISD(1,:));
                    ISD(3,:) = Strain_Val_b * exp(-R_coefficient_b * ISD(1,:));
                    ISD(4,:) = Strain_Val_c * exp(-R_coefficient_c * ISD(1,:));
                end
    
                %back surface
                if get(h.Compressed_strain2,'value') == 1 %compressed
                    ISD(2,:) = ISD(2,:) - Strain_Val_a2 * exp(-R_coefficient_a2 * flip(ISD(1,:)));
                    ISD(3,:) = ISD(3,:) - Strain_Val_b2 * exp(-R_coefficient_b2 * flip(ISD(1,:)));
                    ISD(4,:) = ISD(4,:) - Strain_Val_c2 * exp(-R_coefficient_c2 * flip(ISD(1,:)));                    
                else %expansive strain
                    ISD(2,:) = ISD(2,:) + Strain_Val_a2 * exp(-R_coefficient_a2 * flip(ISD(1,:)));
                    ISD(3,:) = ISD(3,:) + Strain_Val_b2 * exp(-R_coefficient_b2 * flip(ISD(1,:)));
                    ISD(4,:) = ISD(4,:) + Strain_Val_c2 * exp(-R_coefficient_c2 * flip(ISD(1,:)));
                end

                ISD(5,:) = Step_Layer * ones(1,steps_layers);                
                
                hold off
                line(ISD(1,:),ISD(2,:), 'Parent', h.Layer_Fig, 'Color', rand(1,3),'LineWidth',1,'Marker','s','MarkerSize',2)
                hold on
                line(ISD(1,:),ISD(3,:), 'Parent', h.Layer_Fig, 'Color', rand(1,3),'LineWidth',1,'Marker','d','MarkerSize',2)
                line(ISD(1,:),ISD(4,:), 'Parent', h.Layer_Fig, 'Color', rand(1,3),'LineWidth',1,'Marker','o','MarkerSize',2)
                legend('da/a','db/b', 'dc/c')
                
                %No model change to the steps of strain
                for i_strain =1 : size(ISD,2)
                    name_Element(1,i_strain) = cellstr(Element);               %Element layer
                    name_h(1,i_strain) = h_miller;   name_k(1,i_strain) = k_miller;   name_l(1,i_strain) = l_miller; %Reflection Layer                    
                    name_geometry(1,i_strain) = name_geometry_value;            % Geometry reflection
                    name_Transmission(1,i_strain) = name_Transmission_value;    %Geometry transmission
                    name_Asymmetry(1,i_strain) = Asymmetry;         %Asymmetry of the layer
                    name_Normal(1,i_strain) = normal;               %Diffraction normal crystal
                    name_polarization(1,i_strain) = polarization;   %Polarization
                    name_Energy(1,i_strain) =  0;                   %Energy out off
                    name_Beam(1,i_strain) =  0;
                end

%                
                
            elseif Type_Layer == 5   % atangent approx non-symetric
               
                %Front surface
                Thickenes_Layer = eval(get(h.Thickness,'String'))*1e4;
                Strain_Val_a = eval(get(h.Crystal_Distortion_tan_da,'String')); %Strain in the surface
                Strain_Val_b = eval(get(h.Crystal_Distortion_tan_db,'String')); %Strain in the surface
                Strain_Val_c = eval(get(h.Crystal_Distortion_tan_dc,'String')); %Strain in the surface                
                Interfase_Val_a = eval(get(h.width_strain_a,'String'));  %Interdace
                Interfase_Val_b = eval(get(h.width_strain_b,'String'));  %Interdace
                Interfase_Val_c = eval(get(h.width_strain_c,'String'));  %Interdace

                %Rear surface
                Strain_Val_a2 = eval(get(h.Crystal_Distortion_tan_da2,'String')); %Strain in the surface
                Strain_Val_c2 = eval(get(h.Crystal_Distortion_tan_db2,'String')); %Strain in the surface
                Strain_Val_b2 = eval(get(h.Crystal_Distortion_tan_dc2,'String')); %Strain in the surface
                Interfase_Val_a2 = eval(get(h.width_strain_a2,'String'));  %Interdace
                Interfase_Val_b2 = eval(get(h.width_strain_b2,'String'));  %Interdace
                Interfase_Val_c2 = eval(get(h.width_strain_c2,'String'));  %Interdace

                Step_Layer = eval(get(h.Crystal_Step_Layer,'String'));
                steps_layers = Thickenes_Layer / Step_Layer;                %Number of steps calculation
                

                ISD(1,:) = linspace(0,Thickenes_Layer,steps_layers); %depth profile                
                
                %Front Surface
                cot_plot_a = atan(ISD(1,:)/Interfase_Val_a); % atan profile
                atan_plot_normalized_a = -cot_plot_a /cot_plot_a(1,size(cot_plot_a,2))+1; %normalized by first value in the serie
                cot_plot_b = atan(ISD(1,:)/Interfase_Val_b); % atan profile
                atan_plot_normalized_b = -cot_plot_b /cot_plot_b(1,size(cot_plot_b,2))+1; %normalized by first value in the serie
                cot_plot_c = atan(ISD(1,:)/Interfase_Val_c); % atan profile
                atan_plot_normalized_c = -cot_plot_c /cot_plot_c(1,size(cot_plot_c,2))+1; %normalized by first value in the serie

                %Rear Surface
                cot_plot_a2 = atan(ISD(1,:)/Interfase_Val_a2); % atan profile
                atan_plot_normalized_a2 = -cot_plot_a2 /cot_plot_a2(1,size(cot_plot_a2,2))+1; %normalized by first value in the serie
                cot_plot_b2 = atan(ISD(1,:)/Interfase_Val_b2); % atan profile
                atan_plot_normalized_b2 = -cot_plot_b2 /cot_plot_b2(1,size(cot_plot_b2,2))+1; %normalized by first value in the serie
                cot_plot_c2 = atan(ISD(1,:)/Interfase_Val_c2); % atan profile
                atan_plot_normalized_c2 = -cot_plot_c2 /cot_plot_c2(1,size(cot_plot_c2,2))+1; %normalized by first value in the serie
                
                %The sum of the approximation for each layer
                if get(h.Compressed_strain,'value') == 1 %compressed
                    ISD(2,:) = - Strain_Val_a * atan_plot_normalized_a;
                    ISD(3,:) = - Strain_Val_b * atan_plot_normalized_b;
                    ISD(4,:) = - Strain_Val_c * atan_plot_normalized_c;                    
                else %expansive strain
                    ISD(2,:) = Strain_Val_a * atan_plot_normalized_a;
                    ISD(3,:) = Strain_Val_b * atan_plot_normalized_b;
                    ISD(4,:) = Strain_Val_c * atan_plot_normalized_c;
                end
    
                %second Gaussian
                if get(h.Compressed_strain2,'value') == 1 %compressed
                    ISD(2,:) = ISD(2,:) - Strain_Val_a2 * flip(atan_plot_normalized_a2);
                    ISD(3,:) = ISD(3,:) - Strain_Val_b2 * flip(atan_plot_normalized_b2);
                    ISD(4,:) = ISD(4,:) - Strain_Val_c2 * flip(atan_plot_normalized_c2);                    
                else %expansive strain
                    ISD(2,:) = ISD(2,:) + Strain_Val_a2 * flip(atan_plot_normalized_a2);
                    ISD(3,:) = ISD(3,:) + Strain_Val_b2 * flip(atan_plot_normalized_b2);
                    ISD(4,:) = ISD(4,:) + Strain_Val_c2 * flip(atan_plot_normalized_c2);
                end


                ISD(5,:) = Step_Layer * ones(1,steps_layers);                
                
                hold off
                line(ISD(1,:),ISD(2,:), 'Parent', h.Layer_Fig, 'Color', rand(1,3),'LineWidth',1,'Marker','s','MarkerSize',2)
                hold on
                line(ISD(1,:),ISD(3,:), 'Parent', h.Layer_Fig, 'Color', rand(1,3),'LineWidth',1,'Marker','d','MarkerSize',2)
                line(ISD(1,:),ISD(4,:), 'Parent', h.Layer_Fig, 'Color', rand(1,3),'LineWidth',1,'Marker','o','MarkerSize',2)
                legend('da/a','db/b', 'dc/c')
                
                %No model change to the steps of strain
                for i_strain =1 : size(ISD,2)
                    name_Element(1,i_strain) = cellstr(Element);               %Element layer
                    name_h(1,i_strain) = h_miller;   name_k(1,i_strain) = k_miller;   name_l(1,i_strain) = l_miller; %Reflection Layer                    
                    name_geometry(1,i_strain) = name_geometry_value;            % Geometry reflection
                    name_Transmission(1,i_strain) = name_Transmission_value;    %Geometry transmission
                    name_Asymmetry(1,i_strain) = Asymmetry;         %Asymmetry of the layer
                    name_Normal(1,i_strain) = normal;               %Diffraction normal crystal
                    name_polarization(1,i_strain) = polarization;   %Polarization
                    name_Energy(1,i_strain) =  0;                   %Energy out off
                    name_Beam(1,i_strain) =  0;
                end         
                
            elseif Type_Layer == 6   % atangent approx symmetric
               
                %Front Surface
                Thickenes_Layer = eval(get(h.Thickness,'String'))*1e4;
                Strain_Val_a = eval(get(h.Crystal_Distortion_tan_da,'String')); %Strain in the surface
                Strain_Val_b = eval(get(h.Crystal_Distortion_tan_db,'String')); %Strain in the surface
                Strain_Val_c = eval(get(h.Crystal_Distortion_tan_dc,'String')); %Strain in the surface
                Interfase_Val_a = eval(get(h.width_strain_a,'String'));  %Interdace
                Interfase_Val_b = eval(get(h.width_strain_b,'String'));  %Interdace
                Interfase_Val_c = eval(get(h.width_strain_c,'String'));  %Interdace
                %Rear surface
                Strain_Val_a2 = eval(get(h.Crystal_Distortion_tan_da2,'String')); %Strain in the surface
                Strain_Val_b2 = eval(get(h.Crystal_Distortion_tan_db2,'String')); %Strain in the surface
                Strain_Val_c2 = eval(get(h.Crystal_Distortion_tan_dc2,'String')); %Strain in the surface
                Interfase_Val_a2 = eval(get(h.width_strain_a2,'String'));  %Interdace
                Interfase_Val_b2 = eval(get(h.width_strain_b2,'String'));  %Interdace
                Interfase_Val_c2 = eval(get(h.width_strain_c2,'String'));  %Interdace
                
                Step_Layer = eval(get(h.Crystal_Step_Layer,'String'));                
                steps_layers = Thickenes_Layer / Step_Layer;                
                
                ISD(1,:) = linspace(0,Thickenes_Layer,steps_layers);
                
                %Front surface
                x_axis = linspace(-Thickenes_Layer/2,Thickenes_Layer/2,steps_layers); %depth profile
                cot_plot_a = atan(x_axis/Interfase_Val_a); % atan profile
                atan_plot_normalized_a = cot_plot_a /cot_plot_a(1,1); %normalized by first value in the serie
                y_axis = linspace(-Thickenes_Layer/2,Thickenes_Layer/2,steps_layers); %depth profile
                cot_plot_b = atan(y_axis/Interfase_Val_b); % atan profile
                atan_plot_normalized_b = cot_plot_b /cot_plot_b(1,1); %normalized by first value in the serie                
                z_axis = linspace(-Thickenes_Layer/2,Thickenes_Layer/2,steps_layers); %depth profile
                cot_plot_c = atan(z_axis/Interfase_Val_c); % atan profile
                atan_plot_normalized_c = cot_plot_c /cot_plot_c(1,1); %normalized by first value in the serie
                %Rear surface
                x_axis2 = linspace(-Thickenes_Layer/2,Thickenes_Layer/2,steps_layers); %depth profile
                cot_plot_a2 = atan(x_axis2/Interfase_Val_a2); % atan profile
                atan_plot_normalized_a2 = cot_plot_a2 /cot_plot_a2(1,1); %normalized by first value in the serie
                y_axis2 = linspace(-Thickenes_Layer/2,Thickenes_Layer/2,steps_layers); %depth profile
                cot_plot_b2 = atan(y_axis2/Interfase_Val_b2); % atan profile
                atan_plot_normalized_b2 = cot_plot_b2 /cot_plot_b2(1,1); %normalized by first value in the serie                
                z_axis2 = linspace(-Thickenes_Layer/2,Thickenes_Layer/2,steps_layers); %depth profile
                cot_plot_c2 = atan(z_axis2/Interfase_Val_c2); % atan profile
                atan_plot_normalized_c2 = cot_plot_c2 /cot_plot_c2(1,1); %normalized by first value in the serie

               
                if get(h.Compressed_strain,'value') == 1 %compressed
                    ISD(2,:) = - Strain_Val_a * atan_plot_normalized_a;
                    ISD(3,:) = - Strain_Val_b * atan_plot_normalized_b;
                    ISD(4,:) = - Strain_Val_c * atan_plot_normalized_c;                    
                else %expansive strain
                    ISD(2,:) = Strain_Val_a * atan_plot_normalized_a;
                    ISD(3,:) = Strain_Val_b * atan_plot_normalized_b;
                    ISD(4,:) = Strain_Val_c * atan_plot_normalized_c;
                end
    
                %second Gaussian
                if get(h.Compressed_strain2,'value') == 1 %compressed
                    ISD(2,:) = ISD(2,:) - Strain_Val_a2 * atan_plot_normalized_a2;
                    ISD(3,:) = ISD(3,:) - Strain_Val_b2 * atan_plot_normalized_b2;
                    ISD(4,:) = ISD(4,:) - Strain_Val_c2 * atan_plot_normalized_c2;                    
                else %expansive strain
                    ISD(2,:) = ISD(2,:) + Strain_Val_a2 * atan_plot_normalized_a2;
                    ISD(3,:) = ISD(3,:) + Strain_Val_b2 * atan_plot_normalized_b2;
                    ISD(4,:) = ISD(4,:) + Strain_Val_c2 * atan_plot_normalized_c2;
                end

               
                ISD(5,:) = Step_Layer * ones(1,steps_layers);             
                
                hold off
                line(ISD(1,:),ISD(2,:), 'Parent', h.Layer_Fig, 'Color', rand(1,3),'LineWidth',1,'Marker','s','MarkerSize',2)
                hold on
                line(ISD(1,:),ISD(3,:), 'Parent', h.Layer_Fig, 'Color', rand(1,3),'LineWidth',1,'Marker','d','MarkerSize',2)
                line(ISD(1,:),ISD(4,:), 'Parent', h.Layer_Fig, 'Color', rand(1,3),'LineWidth',1,'Marker','o','MarkerSize',2)
                legend('da/a','db/b', 'dc/c')
                                
                %No model change to the steps of strain
                for i_strain =1 : size(ISD,2)
                    name_Element(1,i_strain) = cellstr(Element);               %Element layer
                    name_h(1,i_strain) = h_miller;   name_k(1,i_strain) = k_miller;   name_l(1,i_strain) = l_miller; %Reflection Layer                    
                    name_geometry(1,i_strain) = name_geometry_value;            % Geometry reflection
                    name_Transmission(1,i_strain) = name_Transmission_value;    %Geometry transmission
                    name_Asymmetry(1,i_strain) = Asymmetry;         %Asymmetry of the layer
                    name_Normal(1,i_strain) = normal;               %Diffraction normal crystal
                    name_polarization(1,i_strain) = polarization;   %Polarization
                    name_Energy(1,i_strain) =  0;                   %Energy out off
                    name_Beam(1,i_strain) =  0;
                end
                
            elseif Type_Layer == 7   % Lineal approximation symmetric
               
                Thickenes_Layer = eval(get(h.Thickness,'String'))*1e4;
                Strain_Val_a = eval(get(h.Crystal_Distortion_tan_da,'String')); %Strain in the surface
                Strain_Val_b = eval(get(h.Crystal_Distortion_tan_db,'String')); %Strain in the surface
                Strain_Val_c = eval(get(h.Crystal_Distortion_tan_dc,'String')); %Strain in the surface
%                Interfase_Val = eval(get(h.width_strain,'String'));  %Interdace
                Step_Layer = eval(get(h.Crystal_Step_Layer,'String'));
                
                steps_layers = Thickenes_Layer / Step_Layer;                
                
                ISD(1,:) = linspace(0,Thickenes_Layer,steps_layers);
                
                x_axis = linspace(-Thickenes_Layer/2,Thickenes_Layer/2,steps_layers); %depth profile
                y_axis = linspace(-1,1,steps_layers); %depth profile
                
                ISD(2,:) = -y_axis * Strain_Val_a; %linear a multiply for the strain in the surface
                ISD(3,:) = -y_axis * Strain_Val_b; %linear b multiply for the strain in the surface
                ISD(4,:) = -y_axis * Strain_Val_c; %linear c multiply for the strain in the surface
                
                ISD(5,:) = Step_Layer * ones(1,steps_layers);             
                
                hold off
                line(ISD(1,:),ISD(2,:), 'Parent', h.Layer_Fig, 'Color', rand(1,3),'LineWidth',1,'Marker','s','MarkerSize',2)
                hold on
                line(ISD(1,:),ISD(3,:), 'Parent', h.Layer_Fig, 'Color', rand(1,3),'LineWidth',1,'Marker','d','MarkerSize',2)
                line(ISD(1,:),ISD(4,:), 'Parent', h.Layer_Fig, 'Color', rand(1,3),'LineWidth',1,'Marker','o','MarkerSize',2)
                legend('da/a','db/b', 'dc/c')
                                
                %No model change to the steps of strain
                for i_strain =1 : size(ISD,2)
                    name_Element(1,i_strain) = cellstr(Element);               %Element layer
                    name_h(1,i_strain) = h_miller;   name_k(1,i_strain) = k_miller;   name_l(1,i_strain) = l_miller; %Reflection Layer                    
                    name_geometry(1,i_strain) = name_geometry_value;            % Geometry reflection
                    name_Transmission(1,i_strain) = name_Transmission_value;    %Geometry transmission
                    name_Asymmetry(1,i_strain) = Asymmetry;         %Asymmetry of the layer
                    name_Normal(1,i_strain) = normal;               %Diffraction normal crystal
                    name_polarization(1,i_strain) = polarization;   %Polarization
                    name_Energy(1,i_strain) =  0;                   %Energy out off
                    name_Beam(1,i_strain) =  0;
                end
            
            elseif Type_Layer == 8  %Gaussian profile strain inside the crystal

                Thickenes_Layer = eval(get(h.Thickness,'String'))*1e4;

                %First Gaussian
                Strain_Val_a = eval(get(h.Crystal_Distortion_tan_da,'String')); %Strain in the surface
                Strain_Val_b = eval(get(h.Crystal_Distortion_tan_db,'String')); %Strain in the surface
                Strain_Val_c = eval(get(h.Crystal_Distortion_tan_dc,'String')); %Strain in the surface
                Interfase_Val_a = eval(get(h.width_strain_a,'String'));  %Interdace
                Interfase_Val_b = eval(get(h.width_strain_b,'String'));  %Interdace
                Interfase_Val_c = eval(get(h.width_strain_c,'String'));  %Interdace                
                cdepth_a = eval(get(h.Crystal_Distortion_depth_a,'String')); %Center of the Gaussian in a
                cdepth_b = eval(get(h.Crystal_Distortion_depth_b,'String')); %Center of the Gaussian in b
                cdepth_c = eval(get(h.Crystal_Distortion_depth_c,'String')); %Center of the Gaussian in c

                %Second Gaussian
                Strain_Val_a2 = eval(get(h.Crystal_Distortion_tan_da2,'String')); %Strain in the surface
                Strain_Val_b2 = eval(get(h.Crystal_Distortion_tan_db2,'String')); %Strain in the surface
                Strain_Val_c2 = eval(get(h.Crystal_Distortion_tan_dc2,'String')); %Strain in the surface
                Interfase_Val_a2 = eval(get(h.width_strain_a2,'String'));  %Interdace
                Interfase_Val_b2 = eval(get(h.width_strain_b2,'String'));  %Interdace
                Interfase_Val_c2 = eval(get(h.width_strain_c2,'String'));  %Interdace
                cdepth_a2 = eval(get(h.Crystal_Distortion_depth_a2,'String')); %Center of the Gaussian in a
                cdepth_b2 = eval(get(h.Crystal_Distortion_depth_b2,'String')); %Center of the Gaussian in b
                cdepth_c2 = eval(get(h.Crystal_Distortion_depth_c2,'String')); %Center of the Gaussian in c


                Step_Layer = eval(get(h.Crystal_Step_Layer,'String'));                
                steps_layers = Thickenes_Layer / Step_Layer;
                
                ISD(1,:) = linspace(0,Thickenes_Layer,steps_layers);
     
                %First Gaussian
                R_coefficient_a = Interfase_Val_a/2;
                R_coefficient_b = Interfase_Val_b/2;
                R_coefficient_c = Interfase_Val_c/2;
                %Second Gaussian
                R_coefficient_a2 = Interfase_Val_a2/2;
                R_coefficient_b2 = Interfase_Val_b2/2;
                R_coefficient_c2 = Interfase_Val_c2/2;

                %Frist Gaussian
                if get(h.Compressed_strain,'value') == 1 %compressed
                    ISD(2,:) = -Strain_Val_a * exp(- (ISD(1,:) - cdepth_a).^2 / (2 * R_coefficient_c ^2));
                    ISD(3,:) = -Strain_Val_b * exp(- (ISD(1,:) - cdepth_b).^2 / (2 * R_coefficient_b ^2));
                    ISD(4,:) = -Strain_Val_c * exp(- (ISD(1,:) - cdepth_c).^2 / (2 * R_coefficient_c ^2));                    
                else %expansive strain
                    ISD(2,:) = Strain_Val_a * exp(- (ISD(1,:) - cdepth_a).^2 / (2 * R_coefficient_c ^2));
                    ISD(3,:) = Strain_Val_b * exp(- (ISD(1,:) - cdepth_b).^2 / (2 * R_coefficient_b ^2));
                    ISD(4,:) = Strain_Val_c * exp(- (ISD(1,:) - cdepth_c).^2 / (2 * R_coefficient_c ^2));
                end
    
                %second Gaussian
                if get(h.Compressed_strain2,'value') == 1 %compressed
                    ISD(2,:) = ISD(2,:) -Strain_Val_a2 * exp(- (ISD(1,:) - cdepth_a2).^2 / (2 * R_coefficient_c2 ^2));
                    ISD(3,:) = ISD(3,:) -Strain_Val_b2 * exp(- (ISD(1,:) - cdepth_b2).^2 / (2 * R_coefficient_b2 ^2));
                    ISD(4,:) = ISD(4,:) -Strain_Val_c2 * exp(- (ISD(1,:) - cdepth_c2).^2 / (2 * R_coefficient_c2 ^2));                    
                else %expansive strain
                    ISD(2,:) = ISD(2,:) + Strain_Val_a2 * exp(- (ISD(1,:) - cdepth_a2).^2 / (2 * R_coefficient_c2 ^2));
                    ISD(3,:) = ISD(3,:) + Strain_Val_b2 * exp(- (ISD(1,:) - cdepth_b2).^2 / (2 * R_coefficient_b2 ^2));
                    ISD(4,:) = ISD(4,:) + Strain_Val_c2 * exp(- (ISD(1,:) - cdepth_c2).^2 / (2 * R_coefficient_c2 ^2));
                end

                
                ISD(5,:) = Step_Layer * ones(1,steps_layers);                
                
                hold off
                line(ISD(1,:),ISD(2,:), 'Parent', h.Layer_Fig, 'Color', rand(1,3),'LineWidth',1,'Marker','s','MarkerSize',2)
                hold on
                line(ISD(1,:),ISD(3,:), 'Parent', h.Layer_Fig, 'Color', rand(1,3),'LineWidth',1,'Marker','d','MarkerSize',2)
                line(ISD(1,:),ISD(4,:), 'Parent', h.Layer_Fig, 'Color', rand(1,3),'LineWidth',1,'Marker','o','MarkerSize',2)
                legend('da/a','db/b', 'dc/c')
                
                %No model change to the steps of strain
                for i_strain =1 : size(ISD,2)
                    name_Element(1,i_strain) = cellstr(Element);               %Element layer
                    name_h(1,i_strain) = h_miller;   name_k(1,i_strain) = k_miller;   name_l(1,i_strain) = l_miller; %Reflection Layer                    
                    name_geometry(1,i_strain) = name_geometry_value;            % Geometry reflection
                    name_Transmission(1,i_strain) = name_Transmission_value;    %Geometry transmission
                    name_Asymmetry(1,i_strain) = Asymmetry;         %Asymmetry of the layer
                    name_Normal(1,i_strain) = normal;               %Diffraction normal crystal
                    name_polarization(1,i_strain) = polarization;   %Polarization
                    name_Energy(1,i_strain) =  0;                   %Energy out off
                    name_Beam(1,i_strain) =  0;
                end

                
            elseif Type_Layer == 9  %Bipolar profile strain inside the crystal

                Thickenes_Layer = eval(get(h.Thickness,'String'))*1e4;

                %First wave
                Strain_Val_a = eval(get(h.Crystal_Distortion_tan_da,'String')); %Strain in the surface
                Strain_Val_b = eval(get(h.Crystal_Distortion_tan_db,'String')); %Strain in the surface
                Strain_Val_c = eval(get(h.Crystal_Distortion_tan_dc,'String')); %Strain in the surface
                Interfase_Val_a = eval(get(h.width_strain_a,'String'));  %Interdace
                Interfase_Val_b = eval(get(h.width_strain_b,'String'));  %Interdace
                Interfase_Val_c = eval(get(h.width_strain_c,'String'));  %Interdace                
                cdepth_a = eval(get(h.Crystal_Distortion_depth_a,'String')); %Center of the Gaussian in a
                cdepth_b = eval(get(h.Crystal_Distortion_depth_b,'String')); %Center of the Gaussian in b
                cdepth_c = eval(get(h.Crystal_Distortion_depth_c,'String')); %Center of the Gaussian in c

                %Second Wave
                Strain_Val_a2 = eval(get(h.Crystal_Distortion_tan_da2,'String')); %Strain in the surface
                Strain_Val_b2 = eval(get(h.Crystal_Distortion_tan_db2,'String')); %Strain in the surface
                Strain_Val_c2 = eval(get(h.Crystal_Distortion_tan_dc2,'String')); %Strain in the surface
                Interfase_Val_a2 = eval(get(h.width_strain_a2,'String'));  %Interdace
                Interfase_Val_b2 = eval(get(h.width_strain_b2,'String'));  %Interdace
                Interfase_Val_c2 = eval(get(h.width_strain_c2,'String'));  %Interdace
                cdepth_a2 = eval(get(h.Crystal_Distortion_depth_a2,'String')); %Center of the Gaussian in a
                cdepth_b2 = eval(get(h.Crystal_Distortion_depth_b2,'String')); %Center of the Gaussian in b
                cdepth_c2 = eval(get(h.Crystal_Distortion_depth_c2,'String')); %Center of the Gaussian in c

                Step_Layer = eval(get(h.Crystal_Step_Layer,'String'));                
                steps_layers = Thickenes_Layer / Step_Layer;
                
                ISD(1,:) = linspace(0,Thickenes_Layer,steps_layers);
     
                %First wave
                R_coefficient_a = Interfase_Val_a/2;
                R_coefficient_b = Interfase_Val_b/2;
                R_coefficient_c = Interfase_Val_c/2;

                %second wave
                R_coefficient_a2 = Interfase_Val_a2/2;
                R_coefficient_b2 = Interfase_Val_b2/2;
                R_coefficient_c2 = Interfase_Val_c2/2;


                if get(h.Compressed_strain,'value') == 1 %compressed
                    ISD(2,:) = - Strain_Val_a * exp(- (ISD(1,:) - cdepth_a + Interfase_Val_a/2).^2 / (2 * R_coefficient_a ^2));
                    ISD(2,:) = ISD(2,:) + Strain_Val_a * exp(- (ISD(1,:) - cdepth_a - Interfase_Val_a/2).^2 / (2 * R_coefficient_a ^2));
                    ISD(3,:) = - Strain_Val_b * exp(- (ISD(1,:) - cdepth_b + Interfase_Val_b/2).^2 / (2 * R_coefficient_b ^2));
                    ISD(3,:) = ISD(3,:) + Strain_Val_b * exp(- (ISD(1,:) - cdepth_b - Interfase_Val_b/2).^2 / (2 * R_coefficient_b ^2));
                    ISD(4,:) = - Strain_Val_c * exp(- (ISD(1,:) - cdepth_c + Interfase_Val_c/2).^2 / (2 * R_coefficient_c ^2));
                    ISD(4,:) = ISD(4,:) + Strain_Val_c * exp(- (ISD(1,:) - cdepth_c - Interfase_Val_c/2).^2 / (2 * R_coefficient_c ^2));
                else %expansive strain
                    ISD(2,:) = Strain_Val_a * exp(- (ISD(1,:) - cdepth_a + Interfase_Val_a/2).^2 / (2 * R_coefficient_a ^2));
                    ISD(2,:) = ISD(2,:) - Strain_Val_a * exp(- (ISD(1,:) - cdepth_a - Interfase_Val_a/2).^2 / (2 * R_coefficient_a ^2));
                    ISD(3,:) = Strain_Val_b * exp(- (ISD(1,:) - cdepth_b + Interfase_Val_b/2).^2 / (2 * R_coefficient_b ^2));
                    ISD(3,:) = ISD(3,:) - Strain_Val_b * exp(- (ISD(1,:) - cdepth_b - Interfase_Val_b/2).^2 / (2 * R_coefficient_b ^2));
                    ISD(4,:) = Strain_Val_c * exp(- (ISD(1,:) - cdepth_c + Interfase_Val_c/2).^2 / (2 * R_coefficient_c ^2));
                    ISD(4,:) = ISD(4,:) - Strain_Val_c * exp(- (ISD(1,:) - cdepth_c - Interfase_Val_c/2).^2 / (2 * R_coefficient_c ^2));
                end
    
                %second wave
                if get(h.Compressed_strain2,'value') == 1 %compressed
                    ISD(2,:) = ISD(2,:) - Strain_Val_a2 * exp(- (ISD(1,:) - cdepth_a2 + Interfase_Val_a2/2).^2 / (2 * R_coefficient_a2 ^2));
                    ISD(3,:) = ISD(3,:) - Strain_Val_b2 * exp(- (ISD(1,:) - cdepth_b2 + Interfase_Val_b2/2).^2 / (2 * R_coefficient_b2 ^2));
                    ISD(4,:) = ISD(4,:) - Strain_Val_c2 * exp(- (ISD(1,:) - cdepth_c2 + Interfase_Val_c2/2).^2 / (2 * R_coefficient_c2 ^2));
                    ISD(2,:) = ISD(2,:) + Strain_Val_a2 * exp(- (ISD(1,:) - cdepth_a2 - Interfase_Val_a2/2).^2 / (2 * R_coefficient_a2 ^2));
                    ISD(3,:) = ISD(3,:) + Strain_Val_b2 * exp(- (ISD(1,:) - cdepth_b2 - Interfase_Val_b2/2).^2 / (2 * R_coefficient_b2 ^2));
                    ISD(4,:) = ISD(4,:) + Strain_Val_c2 * exp(- (ISD(1,:) - cdepth_c2 - Interfase_Val_c2/2).^2 / (2 * R_coefficient_c2 ^2));
                else %expansive strain
                    ISD(2,:) = ISD(2,:) + Strain_Val_a2 * exp(- (ISD(1,:) - cdepth_a2 + Interfase_Val_a2/2).^2 / (2 * R_coefficient_a2 ^2));
                    ISD(3,:) = ISD(3,:) + Strain_Val_b2 * exp(- (ISD(1,:) - cdepth_b2 + Interfase_Val_b2/2).^2 / (2 * R_coefficient_b2 ^2));
                    ISD(4,:) = ISD(4,:) + Strain_Val_c2 * exp(- (ISD(1,:) - cdepth_c2 + Interfase_Val_c2/2).^2 / (2 * R_coefficient_c2 ^2));
                    ISD(2,:) = ISD(2,:) - Strain_Val_a2 * exp(- (ISD(1,:) - cdepth_a2 - Interfase_Val_a2/2).^2 / (2 * R_coefficient_a2 ^2));
                    ISD(3,:) = ISD(3,:) - Strain_Val_b2 * exp(- (ISD(1,:) - cdepth_b2 - Interfase_Val_b2/2).^2 / (2 * R_coefficient_b2 ^2));
                    ISD(4,:) = ISD(4,:) - Strain_Val_c2 * exp(- (ISD(1,:) - cdepth_c2 - Interfase_Val_c2/2).^2 / (2 * R_coefficient_c2 ^2));
                end
                
                ISD(5,:) = Step_Layer * ones(1,steps_layers);                
                
                hold off
                line(ISD(1,:),ISD(2,:), 'Parent', h.Layer_Fig, 'Color', rand(1,3),'LineWidth',1,'Marker','s','MarkerSize',2)
                hold on
                line(ISD(1,:),ISD(3,:), 'Parent', h.Layer_Fig, 'Color', rand(1,3),'LineWidth',1,'Marker','d','MarkerSize',2)
                line(ISD(1,:),ISD(4,:), 'Parent', h.Layer_Fig, 'Color', rand(1,3),'LineWidth',1,'Marker','o','MarkerSize',2)
                legend('da/a','db/b', 'dc/c')
                
                %No model change to the steps of strain
                for i_strain =1 : size(ISD,2)
                    name_Element(1,i_strain) = cellstr(Element);               %Element layer
                    name_h(1,i_strain) = h_miller;   name_k(1,i_strain) = k_miller;   name_l(1,i_strain) = l_miller; %Reflection Layer                    
                    name_geometry(1,i_strain) = name_geometry_value;            % Geometry reflection
                    name_Transmission(1,i_strain) = name_Transmission_value;    %Geometry transmission
                    name_Asymmetry(1,i_strain) = Asymmetry;         %Asymmetry of the layer
                    name_Normal(1,i_strain) = normal;               %Diffraction normal crystal
                    name_polarization(1,i_strain) = polarization;   %Polarization
                    name_Energy(1,i_strain) =  0;                   %Energy out off
                    name_Beam(1,i_strain) =  0;
                end
            
            elseif Type_Layer == 10  %Bipolar profile strain inside the crystal with surface thermal effect

                Thickenes_Layer = eval(get(h.Thickness,'String'))*1e4;

                %First wave
                Strain_Val_a = eval(get(h.Crystal_Distortion_tan_da,'String')); %Strain in the surface
                Strain_Val_b = eval(get(h.Crystal_Distortion_tan_db,'String')); %Strain in the surface
                Strain_Val_c = eval(get(h.Crystal_Distortion_tan_dc,'String')); %Strain in the surface
                Interfase_Val_a = eval(get(h.width_strain_a,'String'));  %Interdace
                Interfase_Val_b = eval(get(h.width_strain_b,'String'));  %Interdace
                Interfase_Val_c = eval(get(h.width_strain_c,'String'));  %Interdace                
                cdepth_a = eval(get(h.Crystal_Distortion_depth_a,'String')); %Center of the Gaussian in a
                cdepth_b = eval(get(h.Crystal_Distortion_depth_b,'String')); %Center of the Gaussian in b
                cdepth_c = eval(get(h.Crystal_Distortion_depth_c,'String')); %Center of the Gaussian in c

                %Second Wave
                Strain_Val_a2 = eval(get(h.Crystal_Distortion_tan_da2,'String')); %Strain in the surface
                Strain_Val_b2 = eval(get(h.Crystal_Distortion_tan_db2,'String')); %Strain in the surface
                Strain_Val_c2 = eval(get(h.Crystal_Distortion_tan_dc2,'String')); %Strain in the surface
                Interfase_Val_a2 = eval(get(h.width_strain_a2,'String'));  %Interdace
                Interfase_Val_b2 = eval(get(h.width_strain_b2,'String'));  %Interdace
                Interfase_Val_c2 = eval(get(h.width_strain_c2,'String'));  %Interdace
                cdepth_a2 = eval(get(h.Crystal_Distortion_depth_a2,'String')); %Center of the Gaussian in a
                cdepth_b2 = eval(get(h.Crystal_Distortion_depth_b2,'String')); %Center of the Gaussian in b
                cdepth_c2 = eval(get(h.Crystal_Distortion_depth_c2,'String')); %Center of the Gaussian in c

                Step_Layer = eval(get(h.Crystal_Step_Layer,'String'));                
                steps_layers = Thickenes_Layer / Step_Layer;
                
                ISD(1,:) = linspace(0,Thickenes_Layer,steps_layers);
     

                %Front Surface #Force 1 um of interaction depth
                R_coefficient_exp_a = 1/(10000);
                R_coefficient_exp_b = 1/(10000);
                R_coefficient_exp_c = 1/(10000);
                %Rear surface
                R_coefficient_exp_a2 = 1/(1000);
                R_coefficient_exp_b2 = 1/(1000);
                R_coefficient_exp_c2 = 1/(1000);
                
                %surface strain thermal
                if get(h.Compressed_strain,'value') == 1 %compressed
                    ISD(2,:) = - Strain_Val_a * exp(-R_coefficient_exp_a * ISD(1,:));
                    ISD(3,:) = - Strain_Val_b * exp(-R_coefficient_exp_b * ISD(1,:));
                    ISD(4,:) = - Strain_Val_c * exp(-R_coefficient_exp_c * ISD(1,:));                    
                else %expansive strain
                    ISD(2,:) = Strain_Val_a * exp(-R_coefficient_exp_a * ISD(1,:));
                    ISD(3,:) = Strain_Val_b * exp(-R_coefficient_exp_b * ISD(1,:));
                    ISD(4,:) = Strain_Val_c * exp(-R_coefficient_exp_c * ISD(1,:));
                end
    
                %surface strain thermal
                if get(h.Compressed_strain2,'value') == 1 %compressed
                    ISD(2,:) = ISD(2,:) - Strain_Val_a2 * exp(-R_coefficient_exp_a2 * flip(ISD(1,:)));
                    ISD(3,:) = ISD(3,:) - Strain_Val_b2 * exp(-R_coefficient_exp_b2 * flip(ISD(1,:)));
                    ISD(4,:) = ISD(4,:) - Strain_Val_c2 * exp(-R_coefficient_exp_c2 * flip(ISD(1,:)));                    
                else %expansive strain
                    ISD(2,:) = ISD(2,:) + Strain_Val_a2 * exp(-R_coefficient_exp_a2 * flip(ISD(1,:)));
                    ISD(3,:) = ISD(3,:) + Strain_Val_b2 * exp(-R_coefficient_exp_b2 * flip(ISD(1,:)));
                    ISD(4,:) = ISD(4,:) + Strain_Val_c2 * exp(-R_coefficient_exp_c2 * flip(ISD(1,:)));
                end

                %First wave
                R_coefficient_a = Interfase_Val_a/2;
                R_coefficient_b = Interfase_Val_b/2;
                R_coefficient_c = Interfase_Val_c/2;

                %second wave
                R_coefficient_a2 = Interfase_Val_a2/2;
                R_coefficient_b2 = Interfase_Val_b2/2;
                R_coefficient_c2 = Interfase_Val_c2/2;

                % Bipolar wave:                   
                if get(h.Compressed_strain,'value') == 1 %compressed
                    ISD(2,:) = ISD(2,:) - Strain_Val_a * exp(- (ISD(1,:) - cdepth_a + Interfase_Val_a/2).^2 / (2 * R_coefficient_a ^2));
                    ISD(2,:) = ISD(2,:) + Strain_Val_a * exp(- (ISD(1,:) - cdepth_a - Interfase_Val_a/2).^2 / (2 * R_coefficient_a ^2));
                    ISD(3,:) = ISD(3,:) - Strain_Val_b * exp(- (ISD(1,:) - cdepth_b + Interfase_Val_b/2).^2 / (2 * R_coefficient_b ^2));
                    ISD(3,:) = ISD(3,:) + Strain_Val_b * exp(- (ISD(1,:) - cdepth_b - Interfase_Val_b/2).^2 / (2 * R_coefficient_b ^2));
                    ISD(4,:) = ISD(4,:) - Strain_Val_c * exp(- (ISD(1,:) - cdepth_c + Interfase_Val_c/2).^2 / (2 * R_coefficient_c ^2));
                    ISD(4,:) = ISD(4,:) + Strain_Val_c * exp(- (ISD(1,:) - cdepth_c - Interfase_Val_c/2).^2 / (2 * R_coefficient_c ^2));
                else %expansive strain
                    ISD(2,:) = ISD(2,:) + Strain_Val_a * exp(- (ISD(1,:) - cdepth_a + Interfase_Val_a/2).^2 / (2 * R_coefficient_a ^2));
                    ISD(2,:) = ISD(2,:) - Strain_Val_a * exp(- (ISD(1,:) - cdepth_a - Interfase_Val_a/2).^2 / (2 * R_coefficient_a ^2));
                    ISD(3,:) = ISD(3,:) + Strain_Val_b * exp(- (ISD(1,:) - cdepth_b + Interfase_Val_b/2).^2 / (2 * R_coefficient_b ^2));
                    ISD(3,:) = ISD(3,:) - Strain_Val_b * exp(- (ISD(1,:) - cdepth_b - Interfase_Val_b/2).^2 / (2 * R_coefficient_b ^2));
                    ISD(4,:) = ISD(4,:) + Strain_Val_c * exp(- (ISD(1,:) - cdepth_c + Interfase_Val_c/2).^2 / (2 * R_coefficient_c ^2));
                    ISD(4,:) = ISD(4,:) - Strain_Val_c * exp(- (ISD(1,:) - cdepth_c - Interfase_Val_c/2).^2 / (2 * R_coefficient_c ^2));
                end
    
                %second wave
                if get(h.Compressed_strain2,'value') == 1 %compressed
                    ISD(2,:) = ISD(2,:) - Strain_Val_a2 * exp(- (ISD(1,:) - cdepth_a2 + Interfase_Val_a2/2).^2 / (2 * R_coefficient_a2 ^2));
                    ISD(3,:) = ISD(3,:) - Strain_Val_b2 * exp(- (ISD(1,:) - cdepth_b2 + Interfase_Val_b2/2).^2 / (2 * R_coefficient_b2 ^2));
                    ISD(4,:) = ISD(4,:) - Strain_Val_c2 * exp(- (ISD(1,:) - cdepth_c2 + Interfase_Val_c2/2).^2 / (2 * R_coefficient_c2 ^2));
                    ISD(2,:) = ISD(2,:) + Strain_Val_a2 * exp(- (ISD(1,:) - cdepth_a2 - Interfase_Val_a2/2).^2 / (2 * R_coefficient_a2 ^2));
                    ISD(3,:) = ISD(3,:) + Strain_Val_b2 * exp(- (ISD(1,:) - cdepth_b2 - Interfase_Val_b2/2).^2 / (2 * R_coefficient_b2 ^2));
                    ISD(4,:) = ISD(4,:) + Strain_Val_c2 * exp(- (ISD(1,:) - cdepth_c2 - Interfase_Val_c2/2).^2 / (2 * R_coefficient_c2 ^2));
                else %expansive strain
                    ISD(2,:) = ISD(2,:) + Strain_Val_a2 * exp(- (ISD(1,:) - cdepth_a2 + Interfase_Val_a2/2).^2 / (2 * R_coefficient_a2 ^2));
                    ISD(3,:) = ISD(3,:) + Strain_Val_b2 * exp(- (ISD(1,:) - cdepth_b2 + Interfase_Val_b2/2).^2 / (2 * R_coefficient_b2 ^2));
                    ISD(4,:) = ISD(4,:) + Strain_Val_c2 * exp(- (ISD(1,:) - cdepth_c2 + Interfase_Val_c2/2).^2 / (2 * R_coefficient_c2 ^2));
                    ISD(2,:) = ISD(2,:) - Strain_Val_a2 * exp(- (ISD(1,:) - cdepth_a2 - Interfase_Val_a2/2).^2 / (2 * R_coefficient_a2 ^2));
                    ISD(3,:) = ISD(3,:) - Strain_Val_b2 * exp(- (ISD(1,:) - cdepth_b2 - Interfase_Val_b2/2).^2 / (2 * R_coefficient_b2 ^2));
                    ISD(4,:) = ISD(4,:) - Strain_Val_c2 * exp(- (ISD(1,:) - cdepth_c2 - Interfase_Val_c2/2).^2 / (2 * R_coefficient_c2 ^2));
                end
                
                ISD(5,:) = Step_Layer * ones(1,steps_layers);                
                
                hold off
                line(ISD(1,:),ISD(2,:), 'Parent', h.Layer_Fig, 'Color', rand(1,3),'LineWidth',1,'Marker','s','MarkerSize',2)
                hold on
                line(ISD(1,:),ISD(3,:), 'Parent', h.Layer_Fig, 'Color', rand(1,3),'LineWidth',1,'Marker','d','MarkerSize',2)
                line(ISD(1,:),ISD(4,:), 'Parent', h.Layer_Fig, 'Color', rand(1,3),'LineWidth',1,'Marker','o','MarkerSize',2)
                legend('da/a','db/b', 'dc/c')
                
                %No model change to the steps of strain
                for i_strain =1 : size(ISD,2)
                    name_Element(1,i_strain) = cellstr(Element);               %Element layer
                    name_h(1,i_strain) = h_miller;   name_k(1,i_strain) = k_miller;   name_l(1,i_strain) = l_miller; %Reflection Layer                    
                    name_geometry(1,i_strain) = name_geometry_value;            % Geometry reflection
                    name_Transmission(1,i_strain) = name_Transmission_value;    %Geometry transmission
                    name_Asymmetry(1,i_strain) = Asymmetry;         %Asymmetry of the layer
                    name_Normal(1,i_strain) = normal;               %Diffraction normal crystal
                    name_polarization(1,i_strain) = polarization;   %Polarization
                    name_Energy(1,i_strain) =  0;                   %Energy out off
                    name_Beam(1,i_strain) =  0;
                end

            elseif Type_Layer == 11  %From File
               
                Crystal_Step_Layer = eval(get(h.Crystal_Step_Layer,'string'));
                Thickenes_Layer = eval(get(h.Thickness,'String'))*1e4;
                
                ISD(1,:) = zeros(1,size(name_Thickness_Strain,2));
                ISD(2,:) = zeros(1,size(ISD,2)); %Strain
                ISD(3,:) = zeros(1,size(ISD,2)); %Strain
                ISD(4,:) = zeros(1,size(ISD,2)); %Strain
                ISD(5,:) = Crystal_Step_Layer * ones(1,size(ISD,2));            %thickness by layer
                %Built strain
                i_strain_layer = 1;
                total_thickness_crystal = name_Thickness_Strain(i_strain_layer);
                suma_thicknes =0;
                for i_strain = 1 : Layer_number                   
                    actual_thickness = i_strain * Crystal_Step_Layer;             %Count the thickness
                    suma_thicknes = suma_thicknes +name_Thickness_Strain(1,i_strain);
                    ISD(1,i_strain) = suma_thicknes;
                    ISD(2,i_strain) = name_da(i_strain_layer);               %Save strain layer to ISD
                    ISD(3,i_strain) = name_db(i_strain_layer);               %Save strain layer to ISD
                    ISD(4,i_strain) = name_dc(i_strain_layer);               %Save strain layer to ISD
                    i_strain_layer = i_strain_layer+1;  
                    
                end
                
                line(ISD(1,:),ISD(2,:), 'Parent', h.Layer_Fig,'LineWidth',2,'Marker','s','MarkerSize',2)

                h.number_layers = i_strain_layer-2;          %number layers
                
                %No model change to the steps of strain
                for i_strain =1 : size(ISD,2)
                    name_Element(1,i_strain) = cellstr(Element);               %Element layer
                    name_h(1,i_strain) = h_miller;   name_k(1,i_strain) = k_miller;   name_l(1,i_strain) = l_miller; %Reflection Layer                    
                    name_geometry(1,i_strain) = name_geometry_value;            % Geometry reflection
                    name_Transmission(1,i_strain) = name_Transmission_value;    %Geometry transmission
                    name_Asymmetry(1,i_strain) = Asymmetry;         %Asymmetry of the layer
                    name_Normal(1,i_strain) = normal;               %Diffraction normal crystal
                    name_polarization(1,i_strain) = polarization;   %Polarization
                    name_Energy(1,i_strain) =  0;                   %Energy out off
                    name_Beam(1,i_strain) =  0;
                end
            else
                %Not define
                
            end
            


            %Save values for the calculation
            h.pos_MCC = linspace(1,size(ISD,2),size(ISD,2));
            Thickness_MCC(1,:) = ISD(5,:)*1e-4;
            da_MCC(1,:) =  ISD(2,:);
            db_MCC(1,:) =  ISD(3,:);
            dc_MCC(1,:) =  ISD(4,:);
            h.Thickness_MCC =Thickness_MCC;
            h.da_MCC = da_MCC;
            h.db_MCC = db_MCC;
            h.dc_MCC = dc_MCC;
            
            h.Interface_MCC = name_interface_Thickeness;
            h.Element_MCC = name_Element;
            h.h_MCC = name_h;
            h.k_MCC = name_k;
            h.l_MCC = name_l;
            h.Geometry_MCC = name_geometry;
            h.Transmission_MCC = name_Transmission;
            h.Asymmetry_MCC = name_Asymmetry;
            h.Normal_MCC = name_Normal;
            h.polarization_MCC = name_polarization;
            h.name_Energy = name_Energy;
            h.name_Beam = name_Beam;
            
            h.max_da_strain_layer = ISD(2,1);          %strain in surface
            h.strain_depth =  Thickenes_Layer;         %depth thickness in crystal
                

    end

    function Beam_3D_plot_AutoSave (source,eventata)
                
        
        h.I_Fig_3D_Reflectivity_Dynamical_s2 = figure(d+392);
        
        set(h.I_Fig_3D_Reflectivity_Dynamical_s2,'Name','Auto_Save_2D',...
            'NumberTitle', 'Off','Toolbar','figure','visible','on',...
            'Units','normalized','Menubar','figure',...
            'Color',[1 1 1],...
            'KeyReleaseFcn',@Press);
        
        h.I_Fig_Beam_3D_GK_F4_s2 = axes('Parent',h.I_Fig_3D_Reflectivity_Dynamical_s2,...
            'Units','normalized','box','on',...
            'LineWidth',0.5,'FontName','Helvetica','FontWeight','bold',...
            'Position',[0.07 0.1 0.8 0.7],'Color',[1 1 1],'FontSize',Font_size-2,'Xlim',[-1 1]);
        title('Auto save XY')
        xlabel('X detector (m)')        
        ylabel('Y detector (m)')
        grid('on');
          
    end

    function Beam_3D_plot (source,eventata)
        
        if source == h.Plot_on_Check
            if get(h.Plot_on_Check,'value')
                h.Plot_on = true;
            else
                h.Plot_on = false;
            end
        elseif source == h.cluster_Check
            if get(h.cluster_Check,'value')
                
                h.cluster = true;
            else
                h.cluster = false;
            end
            
        elseif source == h.Beam_simulation_Plots
           
            
            h.I_Fig_3D_Reflectivity_Dynamical = figure(d+192);
            
            Position_Fig_Strain = get(h.lp_fit,'Position');
            Position_x = Position_Fig_Strain(1,1);
            Position_y = Position_Fig_Strain(1,2);
            width_x = Position_Fig_Strain(1,3);
            width_y = Position_Fig_Strain(1,4);
            
            channel_calculation  = get(h.Repetition_channel,'string');
            name_figure_plot = sprintf('Dynamical Reflectivity 3D Beam Channel %s',channel_calculation);
            set(h.I_Fig_3D_Reflectivity_Dynamical,'Name',name_figure_plot,...
                'NumberTitle', 'Off','Toolbar','figure','visible','on',...
                'Units','normalized','Menubar','figure',...
                'Position', [Position_x+0.5 0.3 width_x 0.6],'Color',[1 1 1],...                
                'KeyReleaseFcn',@Press);
            
            h.I_Fig_Beam_3D_F1 = axes('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Units','normalized','box','on',...
                'LineWidth',0.5,'FontName','Helvetica','FontWeight','bold',...
                'Position',[0.07 0.73 0.4 0.18],'Color',[1 1 1],'FontSize',Font_size-2,'Xlim',[-1 1]);                
            title('F1: Reciprocal Space')
            xlabel('time (s)')
            ylabel('Intensity (arb. unit)')
            grid('on');
            
            %Relates to image F3
            h.Log_I_Fig_Beam_3D_F1_Check =  uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 0,'String','Log',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.01 0.91 0.06 0.02],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size-2,...
                'Callback',@Beam_3D_plot);
                        
            h.I_Fig_Beam_3D_Section_F2 = axes('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Units','normalized','box','on',...
                'LineWidth',0.5,'FontName','Helvetica','FontWeight','bold',...
                'Position',[0.57 0.73 0.4 0.18],'Color',[1 1 1],'FontSize',Font_size-2,'Xlim',[-1 1]);
            title('F2: Real Space')
            xlabel('Energy (eV)')
            ylabel('Intensity (arb. unit)')
            grid('on');
            h.Log_I_Fig_Beam_3D_section_F2_Check =  uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 0,'String','Log',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.5 0.91 0.06 0.02],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size-2,...
                'Callback',@Beam_3D_plot);
     
            h.I_Fig_Beam_3D_Section_T_F3= axes('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Units','normalized','box','on',...
                'LineWidth',0.5,'FontName','Helvetica','FontWeight','bold',...
                'Position',[0.07 0.5 0.4 0.18],'Color',[1 1 1],'FontSize',Font_size-2,'Xlim',[-1 1]);
            title('F1_R: Reciprocal Space')
            xlabel('time (s)')
            ylabel('Intensity (arb. unit)')
            grid('on');
            %Relates to fig 5
            h.Log_I_Fig_Beam_3D_T_F3_Check =  uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 0,'String','Log',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.0 0.68 0.06 0.02],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size-2,...
                'Callback',@Beam_3D_plot);
                        
            h.I_Fig_Beam_3D_GK_F4 = axes('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Units','normalized','box','on',...
                'LineWidth',0.5,'FontName','Helvetica','FontWeight','bold',...
                'Position',[0.57 0.5 0.4 0.18],'Color',[1 1 1],'FontSize',Font_size-2,'Xlim',[-1 1]);            
            title('F1_T: Real Space')
            xlabel('Energy (eV)')
            ylabel('Intensity (arb. unit)')
            grid('on');
            
            h.Log_I_Fig_Beam_3D_GK_F4_Check =  uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 0,'String','Log',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.5 0.68 0.06 0.02],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size-2,...
                'Callback',@Beam_3D_plot);
            
            h.I_Fig_Beam_3D_mono_F5= axes('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Units','normalized','box','on',...
                'LineWidth',0.5,'FontName','Helvetica','FontWeight','bold',...
                'Position',[0.07 0.27 0.4 0.18],'Color',[1 1 1],'FontSize',Font_size-2,'Xlim',[-1 1]);
            title('F3: Reciprocal Space')
            xlabel('time (s)')
            ylabel('Intensity (arb. unit)')
            grid('on');
            %relates to fig 7
            h.Log_I_Fig_Beam_3D_mono_F5_Check =  uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 0,'String','Log',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.01 0.45 0.06 0.02],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size-2,...
                'Callback',@Beam_3D_plot);            
            
            h.I_Fig_Beam_3D_profile_F6= axes('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Units','normalized','box','on',...
                'LineWidth',0.5,'FontName','Helvetica','FontWeight','bold',...
                'Position',[0.57 0.27 0.4 0.18],'Color',[1 1 1],'FontSize',Font_size-2,'Xlim',[-1 1]);            
            title('F4: Real Space')
            xlabel('Energy (eV)')
            ylabel('Intensity (arb. unit)')
            grid('on');
            
            h.Log_I_Fig_Beam_3D_profile_F6_Check =  uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 0,'String','Log',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.5 0.45 0.06 0.02],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size-2,...
                'Callback',@Beam_3D_plot); 
           
            h.I_Fig_Beam_3D_reflectivity_F7 = axes('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Units','normalized','box','on',...
                'LineWidth',0.5,'FontName','Helvetica','FontWeight','bold',...
                'Position',[0.07 0.03 0.4 0.18],'Color',[1 1 1],'FontSize',Font_size-2,'Xlim',[-1 1]);
            title('Scan Reciprocal Space')
            xlabel('Energy (eV)')
            ylabel('Intensity (arb. unit)')
            grid('on');
            %relates to fig 1
            h.Log_I_Fig_Beam_3D_reflectivity_F7_Check =  uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 0,'String','Log',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.01 0.21 0.06 0.02],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size-2,...
                'Callback',@Beam_3D_plot); 
            
            h.I_Fig_Beam_3D_convolution_F8 = axes('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Units','normalized','box','on',...
                'LineWidth',0.5,'FontName','Helvetica','FontWeight','bold',...
                'Position',[0.57 0.03 0.4 0.18],'Color',[1 1 1],'FontSize',Font_size-2,'Xlim',[-1 1]);
            title('Scan Plot')
            xlabel('Energy (eV)')
            ylabel('Intensity (arb. unit)')
            grid('on');
            
            h.Log_I_Fig_Beam_3D_convolution_F8_Check =  uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 0,'String','Log',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.5 0.21 0.06 0.02],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size-2,...
                'Callback',@Beam_3D_plot); 
            
            
 %% Control panel           
            h.Panel_name_Dynamical_3D =  uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'text','FontName','Helvetica','String','Dynamical Plot Panel',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.0 0.97 0.1 0.03],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size);
            
            h.TX_plain_3D_Check =  uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 0,...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized','String','TX',...
                'Position',[0.1 0.97 0.05 0.03],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size,...
                'Callback',@Beam_3D_plot);
            
            h.XY_plain_3D_Check =  uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 1,...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized','String','XY',...
                'Position',[0.15 0.97 0.05 0.03],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size,...
                'Callback',@Beam_3D_plot);
            
            h.TY_plain_3D_Check =  uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 0,...
                'FontName','Helvetica','String','TY','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.2 0.97 0.05 0.03],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size,...
                'Callback',@Beam_3D_plot);

            
            %Saave fit to echoes intable
            h.Save_FIT_during_simulation_3D_Check =  uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Units','Normalized','Value', 0,...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','String','Fit on',...
                'Position',[0.3 0.97 0.04 0.03],'BackgroundColor',[0.9 0.9 0.9],'FontSize',Font_size-2,...
                'Callback',@Beam_3D_plot);
            
            %save video of simulation figure
            h.Save_video_3D_Check =  uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Units','Normalized','Value', 0,...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','String','Video on',...
                'Position',[0.34 0.97 0.06 0.03],'BackgroundColor',[0.9 0.9 0.9],'FontSize',Font_size-2,...
                'Callback',@Beam_3D_plot);
            
            h.name_TY_plain_3D_Check =  uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'text','Enable','on',...
                'FontName','Helvetica','String','F4 variable:','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.0 0.94 0.1 0.03],'BackgroundColor',[0.5 0.5 0.5],'FontSize',Font_size);
            
            h.Time_um_F4_Check =  uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 0,...
                'FontName','Helvetica','String','T(s)','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...                
                'Position',[0.1 0.94 0.05 0.03],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size,...
                'Callback',@Beam_3D_plot);
            
            h.Transverse_um_F4_Check =  uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 1,...
                'FontName','Helvetica','String','X(m)','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.15 0.94 0.05 0.03],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size,...
                'Callback',@Beam_3D_plot);
            
            h.Transversey_um_F4_Check =  uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 0,...
                'FontName','Helvetica','String','Y(m)','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.2 0.94 0.05 0.03],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size,...
                'Callback',@Beam_3D_plot);

            %range for the igure F6
            h.Name_range_F6 =  uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'text','string', 'Range F6',...
                'FontName','Helvetica','String','Y(m)','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.25 0.97 0.05 0.03],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size);
            
            h.F6_x1_value =  uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'edit','Enable','on','string', 0,...
                'FontName','Helvetica','String','Y(m)','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.25 0.94 0.025 0.03],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size);

            h.F6_x2_value =  uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'edit','Enable','on','string', 0,...
                'FontName','Helvetica','String','Y(m)','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.275 0.94 0.025 0.03],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size);
            set(h.F6_x1_value,'string',h.F6_x1)
            set(h.F6_x2_value,'string',h.F6_x2)
            
            h.name_Energy_point = uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'text','FontName','Helvetica','String','Energy Scan(eV)',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.4 0.97 0.05 0.03],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size);
            
            h.Energy_point = uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'edit','Enable','off','String','0',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.45 0.97 0.1 0.03],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size);
            
            h.name_Image_point = uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'text','FontName','Helvetica','String','Scan Image',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.55 0.97 0.05 0.03],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size);
            
            h.Image_point= uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'edit','Enable','on','String','0',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.60 0.97 0.05 0.03],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size);
            
            h.Load_Energy_point = uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'push','Enable','on','String','Load Energy',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.65 0.97 0.1 0.03],'BackgroundColor',[0.5 0.5 0.],'FontSize',Font_size,...
                'Callback',@Beam_3D_plot_Fig);
            
            Str ={};
            Str{end+1} = 'F1: Incident Beam propagating in K Space';
            Str{end+1} = 'F2: Crystal and Incident Beam Reflectivity';            
            Str{end+1} = 'F3: Phase 2D';
            Str{end+1} = 'F4: Amplitud 2D';
            Str{end+1} = 'F5: Profile phase';
            Str{end+1} = 'F6: Profile amplitud';
            Str{end+1} = 'F7: ';
            Str{end+1} = 'F8: Intensity Integrated';
            
            h.Number_MultiGauss_3D_Beam = uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style','popup','Units','normalized','String',Str,...
                'Position',[0.75 0.97 0.1 0.03],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size+1,...
                'Callback',@Beam_3D_plot);
            
            h.Save_Energy_point = uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'push','Enable','on','String','Save Scan',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.85 0.97 0.1 0.03],'BackgroundColor',[0.5 0.5 0.],'FontSize',Font_size,...
                'Callback',@Beam_3D_plot_Save);
            
            h.Save_Energy_plus = uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'push','Enable','on','Value',0,'String','+',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.95 0.97 0.025 0.03],'BackgroundColor',[0.5 0.5 0.],'FontSize',Font_size,...
                'Callback',@Beam_3D_plot);
            
            h.Save_Energy_minus = uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'push','Enable','on','Value',0,'String','-',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.975 0.97 0.025 0.03],'BackgroundColor',[0.5 0.5 0.],'FontSize',Font_size,...
                'Callback',@Beam_3D_plot);

            h.Fig_Beam_3D_F3_check = uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 1,'String','3D',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.30 0.94 0.05 0.03],'BackgroundColor',[0.5 0.5 0.],'FontSize',Font_size,...
                'Callback',@Beam_3D_plot); 
            
            h.Status_Dynamical_3D = uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'text','Enable','on','Value', 0,'String','Status: Ready',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.35 0.94 0.1 0.03],'BackgroundColor',[0.8 0 0.8],'FontSize',Font_size,...
                'Callback',@Beam_3D_plot);
            
            h.Pause_Dynamical_3D = uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 0,'String','Pause',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.45 0.94 0.05 0.03],'BackgroundColor',[0.5 0.5 0.],'FontSize',Font_size,... 
                'Callback',@Beam_3D_plot);
            
            h.Stop_Dynamical_3D = uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'togglebutton','Enable','on','Value', 1,'String','Stop',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...                
                'Position',[0.5 0.94 0.05 0.03],'BackgroundColor',[0.9 0.0 0.],'FontSize',Font_size,...
                'Callback',@Beam_3D_plot);
            
            h.name_Repetition_num = uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'text','FontName','Helvetica','String','Average Image',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.55 0.94 0.05 0.03],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size);
            
            h.Repetition_num = uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'edit','Enable','on','String','0',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.60 0.94 0.05 0.03],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size);
            
            h.name_directoryname_Images= uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'Push','Enable','on','Value', 0,'String','Folder:',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.65 0.94 0.1 0.03],'BackgroundColor',[0.5 0.5 0.5],'FontSize',Font_size,...
                'Callback',@Beam_3D_plot);
            
            h.directoryname_Images= uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'edit','Enable','on','FontName','Helvetica','String','/gpfs/exfel/data/user/rodrigfa/Results/',...
                'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.75 0.94 0.2 0.03],'BackgroundColor',[0.45 0.45 0.45],'FontSize',Font_size);
            
            h.Save_all =  uicontrol('Parent',h.I_Fig_3D_Reflectivity_Dynamical,...
                'Style' , 'Check','Enable','on','Value', 1,'String','All',...
                'FontName','Helvetica','FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                'Position',[0.95 0.94 0.05 0.03],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size,...
                'Callback',@Beam_3D_plot);
            
        elseif source == h.Temporal_SASE_Check
            if get(h.Temporal_SASE_Check,'value') == 1
                %temporal SASE as a Gaussian center in 0 (time)
                set(h.Temporal_SASE_Check,'Value',1,'string','Gauss')
            else
                %temporal SASE as a Heaviside
                set(h.Temporal_SASE_Check,'Value',0,'string','Heav')
            end
            
        elseif source == h.Save_FIT_during_simulation_3D_Check
            if get(h.Save_FIT_during_simulation_3D_Check,'value') == 1
                set(h.Save_FIT_during_simulation_3D_Check,'Value',1,'string','Fit on')
            else
                set(h.Save_FIT_during_simulation_3D_Check,'Value',0,'string','Fit off')
            end
            
        elseif source == h.Save_video_3D_Check
            if get(h.Save_video_3D_Check,'value') == 1
                set(h.Save_video_3D_Check,'Value',1,'string','Video on')
            else
                set(h.Save_video_3D_Check,'Value',0,'string','Video off')
            end
        elseif source == h.Mono_Scan_Check
            if get(h.Mono_Scan_Check,'value') == 1
                set(h.Mono_Scan_Check,'Value',1)
            else
                set(h.Mono_Scan_Check,'Value',0)
            end
        elseif source == h.Channel_Save_All_Check
            if get(h.Channel_Save_All_Check,'value') == 1
                set(h.Channel_Save_All_Check,'Value',1)
            else
                set(h.Channel_Save_All_Check,'Value',0)
            end
        elseif source == h.Channel_Save_average_Check
            if get(h.Channel_Save_average_Check,'value') == 1
                set(h.Channel_Save_average_Check,'Value',1)
            else
                set(h.Channel_Save_average_Check,'Value',0)
            end
            
       % Save planes     
        elseif source == h.Channel_Save_XY_Check
            if get(h.Channel_Save_XY_Check,'value') == 1
                set(h.Channel_Save_XY_Check,'Value',1)
            else
                set(h.Channel_Save_XY_Check,'Value',0)
            end
            
        elseif source == h.Channel_Save_XT_Check
            if get(h.Channel_Save_XT_Check,'value') == 1
                set(h.Channel_Save_XT_Check,'Value',1)
            else
                set(h.Channel_Save_XT_Check,'Value',0)
            end
            
        elseif source == h.Channel_Save_YT_Check
            if get(h.Channel_Save_YT_Check,'value') == 1
                set(h.Channel_Save_YT_Check,'Value',1)
            else
                set(h.Channel_Save_YT_Check,'Value',0)
            end

        elseif source ==h.Gaussian_Distribution
            set(h.Gaussian_Distribution,'Value',1)
            set(h.Lorenztian_Distribution,'Value',0)
            
        elseif source ==h.Lorenztian_Distribution
            set(h.Gaussian_Distribution,'Value',0)
            set(h.Lorenztian_Distribution,'Value',1)
            
        elseif source ==h.Gaussian_Beam_SASE_Check
            if get(h.Gaussian_Beam_SASE_Check,'Value')
                set(h.Gaussian_Beam_SASE_Check,'Value',1)
            else
                set(h.Gaussian_Beam_SASE_Check,'Value',0)
            end
         elseif source ==  h.Polarization_s_Mono
            set(h.Polarization_s_Mono,'Value',1)
            set(h.Polarization_p_Mono,'Value',0)
        elseif source ==  h.Polarization_p_Mono
            set(h.Polarization_s_Mono,'Value',0)
            set(h.Polarization_p_Mono,'Value',1)
            
        elseif source == h.crystal_orientation_Mono
            if get(h.crystal_orientation_Mono,'Value') == 1
                set(h.crystal_orientation_Mono,'Value',1,'String','Normal +')
            else
                set(h.crystal_orientation_Mono,'Value',0,'String','Normal -')
            end
            
        elseif source == h.Shift_t
            if get(h.Shift_t,'value') == 1
                set(h.Shift_t,'value', 1);
            else
                set(h.Shift_t,'value', 0);
            end
        elseif source == h.Shift_t2
            if get(h.Shift_t2,'value') == 1
                set(h.Shift_t2,'value', 1);
            else
                set(h.Shift_t2,'value', 0);
            end
        elseif source == h.Shift_x
            if get(h.Shift_x,'value') == 1
                set(h.Shift_x,'value', 1);
            else
                set(h.Shift_x,'value', 0);
            end
        elseif source == h.Shift_y
            if get(h.Shift_y,'value') == 1
                set(h.Shift_y,'value', 1);
            else
                set(h.Shift_y,'value', 0);
            end
          
      
        elseif source == h.Gaussian_Beam_1D_Check
            set(h.Gaussian_Beam_1D_Check,'Value',1)
            set(h.Gaussian_Beam_2D_Check,'Value',0)
            set(h.Gaussian_Beam_3D_Check,'Value',0)
            set(h.Nstep_x_Beam,'Enable','off')
            set(h.Nstep_y_Beam,'Enable','off')
            set(h.size_X_Beam,'Enable','off')
            set(h.size_Y_Beam,'Enable','off')
            
            
        elseif source == h.Gaussian_Beam_2D_Check
            set(h.Gaussian_Beam_1D_Check,'Value',0)
            set(h.Gaussian_Beam_2D_Check,'Value',1)
            set(h.Gaussian_Beam_3D_Check,'Value',0)
            set(h.size_X_Beam,'Enable','on')
            set(h.size_Y_Beam,'Enable','off')
            set(h.Nstep_x_Beam,'Enable','on')
            set(h.Nstep_y_Beam,'Enable','off')
            
        elseif source == h.Gaussian_Beam_3D_Check
            set(h.Gaussian_Beam_1D_Check,'Value',0)
            set(h.Gaussian_Beam_2D_Check,'Value',0)
            set(h.Gaussian_Beam_3D_Check,'Value',1)
            set(h.size_X_Beam,'Enable','on')
            set(h.size_Y_Beam,'Enable','on')
            set(h.Nstep_x_Beam,'Enable','on')
            set(h.Nstep_y_Beam,'Enable','on')
            
            
        elseif source  == h.Mono_Beam_Check
            if get(h.Mono_Beam_Check,'Value') == 1
                set(h.Mono_Beam_Check,'Value',1,'string','on')
            else
                set(h.Mono_Beam_Check,'Value',0,'string','off')
            end
        elseif source == h.Flux_Beam_Check
            if get(h.Flux_Beam_Check,'Value') == 1
                set(h.Flux_Beam_Check,'Value',1,'string','on')
            else
                set(h.Flux_Beam_Check,'Value',0,'string','off')
            end
        elseif source ==  h.Stop_Dynamical_3D
            if get(h.Stop_Dynamical_3D,'value') == 0
                set(h.Stop_Dynamical_3D,'Value',0,'ForegroundColor',[0.9 0 0])
            else
                set(h.Stop_Dynamical_3D,'Value',1,'ForegroundColor',[0 0 0])
            end

         elseif source == h.Log_I_Fig_Beam_3D_section_F2_Check
            if get(h.Log_I_Fig_Beam_3D_section_F2_Check,'Value') == 1  
                set(h.Log_I_Fig_Beam_3D_section_F2_Check,'Value',1)
                set(h.I_Fig_Beam_3D_Section_F2, 'Yscale','log')
            else
                set(h.Log_I_Fig_Beam_3D_section_F2_Check,'Value',0)
                set(h.I_Fig_Beam_3D_Section_F2, 'Yscale','linear')
            end
            
        elseif source ==h.Log_I_Fig_Beam_3D_profile_F6_Check
            if get(h.Log_I_Fig_Beam_3D_profile_F6_Check,'Value') == 1  
                set(h.Log_I_Fig_Beam_3D_profile_F6_Check,'Value',1)
                set(h.I_Fig_Beam_3D_profile_F6, 'Yscale','log')
            else
                set(h.Log_I_Fig_Beam_3D_profile_F6_Check,'Value',0)
                set(h.I_Fig_Beam_3D_profile_F6, 'Yscale','linear')
            end
            
        elseif source ==h.Log_I_Fig_Beam_3D_GK_F4_Check
             if get(h.Log_I_Fig_Beam_3D_GK_F4_Check,'Value') == 1  
                set(h.Log_I_Fig_Beam_3D_GK_F4_Check,'Value',1)
                %set(h.I_Fig_Beam_3D_GK_F4, 'Yscale','log')
                set(h.I_Fig_Beam_3D_GK_F4, 'ColorScale','log')
            else
                set(h.Log_I_Fig_Beam_3D_GK_F4_Check,'Value',0)
                set(h.I_Fig_Beam_3D_GK_F4, 'ColorScale' ,'linear')
             end

        elseif source ==h.Log_I_Fig_Beam_3D_F1_Check
            if get(h.Log_I_Fig_Beam_3D_F1_Check,'Value') == 1  
                set(h.Log_I_Fig_Beam_3D_F1_Check,'Value',1)
                set(h.I_Fig_Beam_3D_F1, 'ColorScale','log')
            else
                set(h.Log_I_Fig_Beam_3D_F1_Check,'Value',0)
                set(h.I_Fig_Beam_3D_F1, 'ColorScale','linear')
            end
            
        elseif source == h.Log_I_Fig_Beam_3D_reflectivity_F7_Check
            if get(h.Log_I_Fig_Beam_3D_reflectivity_F7_Check,'Value') == 1  
                set(h.Log_I_Fig_Beam_3D_reflectivity_F7_Check,'Value',1)
                set(h.I_Fig_Beam_3D_reflectivity_F7, 'ColorScale','log')
            else
                set(h.Log_I_Fig_Beam_3D_reflectivity_F7_Check,'Value',0)
                set(h.I_Fig_Beam_3D_reflectivity_F7, 'ColorScale','linear')
            end
            
        elseif source == h.Log_I_Fig_Beam_3D_mono_F5_Check
            if get(h.Log_I_Fig_Beam_3D_mono_F5_Check,'Value') == 1  
                set(h.Log_I_Fig_Beam_3D_mono_F5_Check,'Value',1)
                set(h.I_Fig_Beam_3D_mono_F5, 'Yscale','log')
            else
                set(h.Log_I_Fig_Beam_3D_mono_F5_Check,'Value',0)
                set(h.I_Fig_Beam_3D_mono_F5, 'Yscale','linear')
            end
            
        elseif source == h.Log_I_Fig_Beam_3D_T_F3_Check
            if get(h.Log_I_Fig_Beam_3D_T_F3_Check,'Value') == 1  
                set(h.Log_I_Fig_Beam_3D_T_F3_Check,'Value',1)
                %set(h.I_Fig_Beam_3D_Section_T_F3, 'Yscale','log')
                set(h.I_Fig_Beam_3D_Section_T_F3, 'ColorScale','log')
            else
                set(h.Log_I_Fig_Beam_3D_T_F3_Check,'Value',0)
                set(h.I_Fig_Beam_3D_Section_T_F3, 'ColorScale','linear')

            end
            
        elseif source == h.Log_I_Fig_Beam_3D_convolution_F8_Check
            if get(h.Log_I_Fig_Beam_3D_convolution_F8_Check,'Value') == 1  
                set(h.Log_I_Fig_Beam_3D_convolution_F8_Check,'Value',1)
                set(h.I_Fig_Beam_3D_convolution_F8, 'Yscale','log')
            else
                set(h.Log_I_Fig_Beam_3D_convolution_F8_Check,'Value',0)
                set(h.I_Fig_Beam_3D_convolution_F8, 'Yscale','linear')
            end
            
        elseif source ==h.Fig_Beam_3D_F3_check
            if get(h.Fig_Beam_3D_F3_check,'Value') == 1              
                set(h.Fig_Beam_3D_F3_check,'Value',1)
            else
                set(h.Fig_Beam_3D_F3_check,'Value',0)
            end
            
        elseif source  == h.Save_all
            if get(h.Save_all,'Value') == 1
                set(h.Save_all,'Value',1)
            else
                set(h.Save_all,'Value',0)
            end
            
        elseif source == h.Save_Energy_plus
            if get(h.Save_Energy_plus,'Value') == 1
                Image_point = eval(get(h.Image_point,'String'))+1;
                set(h.Image_point,'String',num2str(Image_point))
                set(h.Save_Energy_plus,'Value',0)
            end
            
        elseif source == h.Save_Energy_minus
            if get(h.Save_Energy_minus,'Value') == 1
                Image_point = eval(get(h.Image_point,'String'))-1;
                set(h.Image_point,'String',num2str(Image_point))
                set(h.Save_Energy_minus,'Value',0)
            end
            
         % Plot  profile 
         elseif source == h.Time_um_F4_Check            
            set(h.Time_um_F4_Check,'Value',1)
            set(h.Transverse_um_F4_Check,'Value',0)
            set(h.Transversey_um_F4_Check,'Value',0)
        
        elseif source == h.Transverse_um_F4_Check            
            set(h.Time_um_F4_Check,'Value',0)
            set(h.Transverse_um_F4_Check,'Value',1)
            set(h.Transversey_um_F4_Check,'Value',0)
            
        elseif source == h.Transversey_um_F4_Check            
            set(h.Time_um_F4_Check,'Value',0)
            set(h.Transverse_um_F4_Check,'Value',0)
            set(h.Transversey_um_F4_Check,'Value',1)
            
          elseif source == h.Number_MultiGauss_3D_Beam
            if get(h.Number_MultiGauss_3D_Beam,'Value') == 1
                h.BX =1;
            elseif get(h.Number_MultiGauss_3D_Beam,'Value') == 2
                h.BX =2;
            elseif get(h.Number_MultiGauss_3D_Beam,'Value') == 3
                h.BX =3;
            elseif get(h.Number_MultiGauss_3D_Beam,'Value') == 4
                h.BX =4;
            elseif get(h.Number_MultiGauss_3D_Beam,'Value') == 5
                h.BX =5;
            elseif get(h.Number_MultiGauss_3D_Beam,'Value') == 6
                h.BX =6;
            elseif get(h.Number_MultiGauss_3D_Beam,'Value') == 7
                h.BX =7;
            elseif get(h.Number_MultiGauss_3D_Beam,'Value') == 8
                h.BX =8;
            end
            
         % Plot  planes 2D     
        elseif source == h.TX_plain_3D_Check
            if get(h.TX_plain_3D_Check,'Value') ==1
                set(h.TX_plain_3D_Check,'Value',1,'enable','off')
                set(h.XY_plain_3D_Check,'Value',0,'enable','on')
                set(h.TY_plain_3D_Check,'Value',0,'enable','on')
                set(h.Time_um_F4_Check,'Value',0,'enable','on')
                set(h.Transverse_um_F4_Check,'Value',1,'enable','on')
                set(h.Transversey_um_F4_Check,'Value',0,'enable','off')        
            end
            
        elseif source == h.XY_plain_3D_Check
            if get(h.XY_plain_3D_Check,'Value') ==1
                set(h.TX_plain_3D_Check,'Value',0,'enable','on')
                set(h.XY_plain_3D_Check,'Value',1,'enable','off')
                set(h.TY_plain_3D_Check,'Value',0,'enable','on')                
                set(h.Time_um_F4_Check,'Value',0,'enable','off')
                set(h.Transverse_um_F4_Check,'Value',1,'enable','on')
                set(h.Transversey_um_F4_Check,'Value',0,'enable','on') 
            end
            
        elseif source == h.TY_plain_3D_Check
            if get(h.TY_plain_3D_Check,'Value') ==1
                set(h.TX_plain_3D_Check,'Value',0,'enable','on')
                set(h.XY_plain_3D_Check,'Value',0,'enable','on')
                set(h.TY_plain_3D_Check,'Value',1,'enable','off')                
                set(h.Time_um_F4_Check,'Value',1,'enable','on')
                set(h.Transverse_um_F4_Check,'Value',0,'enable','off')
                set(h.Transversey_um_F4_Check,'Value',0,'enable','on') 
            end
               
        elseif source == h.name_directoryname_Images
            folder_intical = get(h.directoryname_Images,'String');
            name_dir = uigetdir(folder_intical);
            for i_name = 1:size(name_dir,2)
                if name_dir(1,i_name) == '\'
                    name_dir_2(1,i_name) = '/';
                else
                    name_dir_2(1,i_name) = name_dir(1,i_name);
                end
            end
            set(h.directoryname_Images,'String', name_dir_2)

        end
    end

    function Beam_3D_plot_Fig(source,eventdata)
        
        if source == h.Load_Energy_point
            
            h.I_Fig_3D_Reflectivity2_Dynamical = figure(d+193);
            channel_calculation  = get(h.Repetition_channel,'string');
            name_figure_plot = sprintf('Dynamical Reflectivity 3D Beam Channel %s',channel_calculation);
            
            set(h.I_Fig_3D_Reflectivity2_Dynamical,'Name',name_figure_plot,...
                'NumberTitle', 'Off',...
                'Toolbar','figure',...
                'visible','off',...
                'Units','normalized',...
                'Position', [0.1 0.25 0.40 0.30],...
                'Color',[0.8 0.8 0.8],...
                'Menubar','figure',...
                'KeyReleaseFcn',@Press);
            
            h.I_Fig_Beam_3D_Print = axes('Parent',h.I_Fig_3D_Reflectivity2_Dynamical, 'Units','normalized',...
                'Position',[0.15 0.15 0.8 0.7],...
                'box','on',...
                'LineWidth',0.5,...
                'FontSize',Font_size,...
                'box','on',...
                'Color',[1 1 1],...
                'FontName','Helvetica',...
                'FontWeight','bold',...
                'Xlim',[-1 1]);
            title(' Real Space')
            xlabel('Energy (eV)')
            ylabel('Intensity (arb. unit)')
            grid('on');
            set(h.Image_point,'Enable','on')
            
            Energy_array = h.Energy_array;
            Image_point = eval(get(h.Image_point,'String'));
            Energy_point =Energy_array(1,Image_point);
            
            set(h.Image_point,'String',Image_point)
            set(h.Energy_point,'string',Energy_point);
            
            if get(h.Gaussian_Beam_1D_Check,'value') == 1
                TX_plot =get(h.TX_plain_3D_Check,'Value');
                XY_plot =get(h.XY_plain_3D_Check,'Value');
                
                
            elseif get(h.Gaussian_Beam_2D_Check,'value') == 1
                
                x_array = h.x_array;
                t_array = h.t_array;
                
                Gaussian_R_all = h.Gaussian_R_all;
                Intensityx_array = h.Intensityx_array;
                E_Scan_plot = h.E_Scan_plot;
                kx_transvers_array = h.kx_transvers_array;
                R_S_G_all = h.R_S_G_all;
                R_S_all = h.R_S_all;
                
                R_S_2D = R_S_all(:,:,Image_point);
                
                R_S_G = R_S_G_all(:,:,Image_point);
                Gaussian_R = Gaussian_R_all(:,:,Image_point);
                
                set(h.I_Fig_3D_Reflectivity2_Dynamical,'Visible','on')
                axes(h.I_Fig_Beam_3D_Print)
                
                
                if h.BX == 1
                    imagesc(E_Scan_plot,kx_transvers_array,abs(R_S_G).^2,'Parent',h.I_Fig_Beam_3D_Print)
                    xlabel('Energy(eV)')
                    ylabel('kx (1/m)')
                    zlabel('Intensity (arb.units)')
                    
                elseif h.BX == 2
                    imagesc(x_array,Energy_array,Intensityx_array,'Parent',h.I_Fig_Beam_3D_Print)
                    zlabel('Intensity (arb. unit)')
                    xlabel('Transverse displecement (m)')
                    ylabel('Energy (eV)')
                    
                    
                elseif h.BX == 3
                    imagesc(E_Scan_plot,kx_transvers_array,abs(R_S_2D).^2,'Parent',h.I_Fig_Beam_3D_Print)
                    xlabel('Energy(eV)')
                    ylabel('kx (1/m)')
                    zlabel('Intensity (arb.units)')
                    
                    
                elseif h.BX ==4
                    imagesc(t_array,x_array,abs(Gaussian_R).^2,'Parent',h.I_Fig_Beam_3D_Print)
                    xlabel('Time(s)')
                    ylabel('Reflectivity (arb. unit)')
                    
                    
                elseif h.BX ==5
                    R_0H_S = h.R_0H_S;
                    R_00_S = h.R_00_S;
                    R_0H_S_Mono_all = h.R_0H_S_Mono_all;
                    if h.FBD ==1
                        plot(E_Scan_plot,abs(R_00_S).^2,'Parent',h.I_Fig_Beam_3D_Print,'Color','r')
                    else
                        plot(E_Scan_plot,abs(R_0H_S).^2,'Parent',h.I_Fig_Beam_3D_Print,'Color','r')
                    end
                    hold on
                    size(R_0H_S_Mono_all,2)
                    for i_mono = 1 :size(R_0H_S_Mono_all,1)
                        plot(E_Scan_plot,abs(R_0H_S_Mono_all(i_mono,:)).^2,'Parent',h.I_Fig_Beam_3D_Print)
                    end
                    
                    xlabel('Energy(eV)')
                    ylabel('Intensity (arb.units)')
                    hold off
                    
                elseif h.BX ==6
                    plot(Energy_array,sum(Intensityx_array,2),'Parent',h.I_Fig_Beam_3D_Print,'LineStyle','-','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r');
                    xlabel('Energy(eV)')
                    ylabel('Intensity (arb.units)')
                end
                
            elseif get(h.Gaussian_Beam_3D_Check,'value') == 1
                x_array = h.x_array;
                y_array = h.y_array;
                t_array = h.t_array;
                Energy_array = h.Energy_array;
                Gaussian_R_all = h.Gaussian_R_all;
                Intensityx_array = h.Intensityx_array;
                E_Scan_plot = h.E_Scan_plot;
                kx_transvers_array = h.kx_transvers_array;
                ky_transvers_array = h.ky_transvers_array;
                R_S_G_all = h.R_S_G_all;
                FBD = h.FBD;
                LaueD = h.LaueD;
                R_S_all = h.R_S_all;
                
                Intensity_array = sum(Intensityx_array,2);
                
%                R_S_2D = R_S_all(:,:,:);
%                R_S_G = R_S_G_all(:,:,:,Image_point);
%                Gaussian_R = Gaussian_R_all(:,:,:,Image_point);
                
                TY_plot = get(h.TY_plain_3D_Check,'Value');
                TX_plot =get(h.TX_plain_3D_Check,'Value');
                XY_plot =get(h.XY_plain_3D_Check,'Value');
                
                if h.BX == 1
                    axes(h.I_Fig_Beam_3D_Print)
                    if TX_plot == 1
                        R_S_G_sum(:,:) = sum(abs(R_S_G).^2,2);
                        surf(E_Scan_plot,kx_transvers_array,R_S_G_sum,'Parent',h.I_Fig_Beam_3D_Print,'edgecolor','none')
                        xlabel('Energy(eV)')
                        ylabel('kx (1/m)')
                    elseif TY_plot == 1
                        R_S_G_sum(:,:) = sum(abs(R_S_G).^2,1);
                        surf(E_Scan_plot,ky_transvers_array,R_S_G_sum,'Parent',h.I_Fig_Beam_3D_Print,'edgecolor','none')
                        xlabel('Energy(eV)')
                        ylabel('ky (1/m)')
                    elseif XY_plot == 1
                        R_S_G_sum(:,:) = sum(abs(R_S_G).^2,3);
                        surf(kx_transvers_array,ky_transvers_array,R_S_G_sum,'Parent',h.I_Fig_Beam_3D_Print,'edgecolor','none')
                        xlabel('kx (1/m)')
                        ylabel('ky (1/m)')
                    end
                    view([20 20]);
                    zlabel('Intensity (arb.units)')
                    
                elseif h.BX == 2
                    axes(h.I_Fig_Beam_3D_Print)
                    if TX_plot == 1
                        Gaussian_R_sum(:,:) = sum(abs(Gaussian_R).^2,1);
                        surf(t_array,x_array,Gaussian_R_sum,'Parent',h.I_Fig_Beam_3D_Print,'edgecolor','none')
                        xlabel('Time(s)')
                        ylabel('x (m)')
                    elseif TY_plot == 1
                        Gaussian_R_sum(:,:) = sum(abs(Gaussian_R).^2,2);
                        surf(t_array,y_array,Gaussian_R_sum,'Parent',h.I_Fig_Beam_3D_Print,'edgecolor','none')
                        xlabel('Time(s)')
                        ylabel('y (m)')
                    elseif XY_plot == 1
                        Gaussian_R_sum(:,:) = sum(abs(Gaussian_R).^2,3);
                        surf(x_array,y_array,Gaussian_R_sum,'Parent',h.I_Fig_Beam_3D_Print,'edgecolor','none')
                        xlabel('x (m)')
                        ylabel('y (m)')
                    end
                    zlabel('Intensity (arb. unit)')
                    
                elseif h.BX == 3
                    axes(h.I_Fig_Beam_3D_Print)
                    if TX_plot == 1
                        R_S_2D_sum(:,:) = sum(abs(R_S_2D).^2,1);
                        surf(E_Scan_plot,kx_transvers_array,R_S_2D_sum,'Parent',h.I_Fig_Beam_3D_Print,'edgecolor','none')
                        xlabel('Energy(eV)')
                        ylabel('kx (1/m)')
                    elseif TY_plot == 1
                        R_S_2D_sum(:,:) = sum(abs(R_S_2D).^2,2);
                        surf(E_Scan_plot,ky_transvers_array,R_S_2D_sum,'Parent',h.I_Fig_Beam_3D_Print,'edgecolor','none')
                        xlabel('Energy(eV)')
                        ylabel('ky (1/m)')
                    elseif XY_plot == 1
                        R_S_2D_sum(:,:) = sum(abs(R_S_2D).^2,3);
                        surf(kx_transvers_array,ky_transvers_array,R_S_2D_sum,'Parent',h.I_Fig_Beam_3D_Print,'edgecolor','none')
                        xlabel('kx (1/m)')
                        ylabel('ky (1/m)')
                    end
                    view([90 0]);
                    zlabel('Intensity (arb.units)')
                    
                elseif h.BX ==4
                    surf(x_array,Energy_array,Intensityx_array,'Parent',h.I_Fig_Beam_3D_Print,'edgecolor','none')
                    view([90 0]);
                    zlabel('Intensity (arb. unit)')
                    xlabel('Transverse displecement (m)')
                    ylabel('Energy (eV)')
                    
                    set(h.I_Fig_3D_Reflectivity2_Dynamical,'Visible','on')
                    axes(h.I_Fig_Beam_3D_Print)
                    
                elseif h.BX ==5
                    R_0H_S = h.R_0H_S;
                    R_00_S = h.R_00_S;
                    R_0H_S_Mono_all = h.R_0H_S_Mono_all;
                    FBD = h.FBD;
                    axes(h.I_Fig_Beam_3D_Print)
                    if h.FBD ==1
                        plot(E_Scan_plot,abs(R_00_S).^2,'Parent',h.I_Fig_Beam_3D_Print,'Color','r')
                    else
                        plot(E_Scan_plot,abs(R_0H_S).^2,'Parent',h.I_Fig_Beam_3D_Print,'Color','r')
                    end
                    hold on
                    for i_mono = 1 :size(R_0H_S_Mono_all,1)
                        plot(E_Scan_plot,abs(R_0H_S_Mono_all(i_mono,:)).^2,'Parent',h.I_Fig_Beam_3D_Print)
                    end
                    xlabel('Energy(eV)')
                    ylabel('Intensity (arb.units)')
                    hold off
                    set(h.I_Fig_Beam_3D_Print,'Visible','on')
                    
                elseif h.BX ==6
                    axes(h.I_Fig_Beam_3D_Print)
                    plot(Energy_array,sum(Intensity_array,2),'Parent',h.I_Fig_Beam_3D_Print,'LineStyle','-','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r');
                    ylabel('Intensity (arb. unit)')
                    xlabel('Energy (eV)')
                    
                end
                
                
            end
        end
    end

    function Beam_3D_plot_Save(source,eventdata)
        
        if source == h.Save_Energy_point            
            
            Energy_array = h.Energy_array;
            if get(h.Save_all,'Value') == 0
                Image_point_array = eval(get(h.Image_point,'String'));
            else
                Image_point_array = linspace(1,eval(get(h.Image_point,'String')),eval(get(h.Image_point,'String')));
                
            end            
            
            directoryname_Images = get(h.directoryname_Images,'String');
            if get(h.Mono_Beam_Check,'Value') == 1
                h_Miller_Mono = eval(get(h.H_Mono ,'String'));
                k_Miller_Mono = eval(get(h.K_Mono ,'String'));
                l_Miller_Mono = eval(get(h.L_Mono ,'String'));
                Mono = sprintf('Si%0.1d%0.1d%0.1d',h_Miller_Mono,k_Miller_Mono,l_Miller_Mono);
            else
                tsize = eval(get(h.size_T_Beam,'String'));
                rho= eval(get(h.rhoparameter,'String'));
                if get(h.Gaussian_Beam_SASE_Check,'value') == 1
                    Mono = sprintf('SASE_rho%0.1d_T%0.1dfs',rho,tsize);
                else
                    Mono = sprintf('_rho%0.1d_T%0.1dfs',rho,tsize);
                end
                
            end
            
            if h.FBD == 1
                FBD = 'F';
            else
                FBD = '';
            end
            
            if h.LaueD == 1
                Bragg = 'LD';
            else
                Bragg ='BD';
            end
            
            Thickness = eval(get(h.Thickness,'String'));

            Element = get(h.Element,'String');

            Energy_center =   sprintf('%0.1d',eval(get(h.Energy_input,'String')));
            
            h_Miller = eval(get(h.h_miller,'String'));
            k_Miller = eval(get(h.k_miller,'String'));
            l_Miller = eval(get(h.l_miller,'String'));
            Miller = sprintf('%0.1d%0.1d%0.1d',h_Miller,k_Miller,l_Miller);
            
            if get(h.More_Crystal_Chk,'value') == 1
                
                pos_MCC = h.pos_MCC;
                Element_MCC = h.Element_MCC;
                h_MCC = h.h_MCC;
                k_MCC = h.k_MCC;
                l_MCC = h.l_MCC;
                Thickness_MCC = h.Thickness_MCC;
                Geometry_MCC = h.Geometry_MCC;
                Transmission_MCC = h.Transmission_MCC;
                Asy_MCC = h.Asymmetry_MCC;
                Normal_MCC = h.Normal_MCC;
                Polarization_MCC = h.polarization_MCC;
                
                if eval(get(h.info_number_crystal,'string'))== 1
                    
                    if Transmission_MCC(1,1) == 1
                        FBD1 = 'F';
                    else
                        FBD1 = '';
                    end
                    
                    if Geometry_MCC(1,1) == 0
                        Bragg1 = 'LD';
                    else
                        Bragg1 ='BD';
                    end
                    
                    if Normal_MCC(1,1)== 1
                    Normal1 = '+';
                    else
                    Normal1 = '-';
                    end
                    
                    if Polarization_MCC(1,1) ==1 
                        Pola1 = 's';
                    else
                        Pola1= 'p';
                    end
                        
                    
                    anp1 = sprintf('asy_%0.1ddeg_nor%s_pol_%s',Asy_MCC(1,1),Normal1,Pola1);
                    
                    Thickness1 = sprintf('%0.1d',Thickness_MCC(1,1));
                    
                    if Element_MCC(1,1) == 6
                        Element1 = 'C';
                    else
                        Element1 = 'Si';
                    end
                    Miller1 = sprintf('%0.1d%0.1d%0.1d',h_MCC(1,1),k_MCC(1,1),l_MCC(1,1));
                    
                    Name_common = sprintf('Xtal%0.1d_%s%s_%s%s_%sum_%s_%seV_%s',pos_MCC(1,1),Element1,Miller1,FBD1,Bragg1,Thickness1,anp1,Energy_center,Mono);
                    
                elseif eval(get(h.info_number_crystal,'string'))== 2
                    if Transmission_MCC(1,1) == 1
                        FBD1 = 'F';                        
                    else
                        FBD1 = '';
                    end
                    
                    if Transmission_MCC(1,2) == 1
                        FBD2 = 'F';                        
                    else
                        FBD2 = '';
                    end
                    
                    if Geometry_MCC(1,1) == 0
                        Bragg1 = 'LD';
                    else
                        Bragg1 ='BD';
                    end
                    
                    if Geometry_MCC(1,2) == 0
                        Bragg2 = 'LD';
                    else
                        Bragg2 ='BD';
                    end
                    
                    if Normal_MCC(1,1)== 1
                    Normal1 = '+';
                    else
                    Normal1 = '-';
                    end
                    
                    if Normal_MCC(1,2)== 1
                    Normal2 = '+';
                    else
                    Normal2 = '-';
                    end
                    
                    if Polarization_MCC(1,1) ==1 
                        Pola1 = 's';
                    else
                        Pola1= 'p';
                    end
                        
                    if Polarization_MCC(1,2) ==1 
                        Pola2 = 's';
                    else
                        Pola2= 'p';
                    end
                    
                    anp1 = sprintf('asy_%0.1ddeg_nor%s_pol_%s',Asy_MCC(1,1),Normal1,Pola1);
                    anp2 = sprintf('asy_%0.1ddeg_nor%s_pol_%s',Asy_MCC(1,2),Normal2,Pola2);
                    
                    Thickness1 = sprintf('%0.1d',Thickness_MCC(1,1));
                    Thickness2 = sprintf('%0.1d',Thickness_MCC(1,2));
                    
                    if Element_MCC(1,1) == 6
                        Element1 = 'C';
                    else
                        Element1 = 'Si';
                    end
                    
                    if Element_MCC(1,2) == 6
                        Element2 = 'C';
                    else
                        Element2 = 'Si';
                    end
                    Miller1 = sprintf('%0.1d%0.1d%0.1d',h_MCC(1,1),k_MCC(1,1),l_MCC(1,1));
                    Miller2 = sprintf('%0.1d%0.1d%0.1d',h_MCC(1,2),k_MCC(1,2),l_MCC(1,2));
                    
                    Name_common = sprintf('Xtal%0.1d_%s%s_%s%s_%sum_%s_Xtal%0.1d_%s%s_%s%s_%sum_%s_%seV_%s',pos_MCC(1,1),Element1,Miller1,FBD1,Bragg1,Thickness1,anp1,pos_MCC(1,2),Element2,Miller2,FBD2,Bragg2,Thickness2,anp2,Energy_center,Mono);
                    
                elseif eval(get(h.info_number_crystal,'string'))== 3
                    if Transmission_MCC(1,1) == 1
                        FBD1 = 'F';                        
                    else
                        FBD1 = '';
                    end
                    
                    if Transmission_MCC(1,2) == 1
                        FBD2 = 'F';                        
                    else
                        FBD2 = '';
                    end
                    
                    if Transmission_MCC(1,3) == 1
                        FBD3 = 'F';                        
                    else
                        FBD3 = '';
                    end
                    
                    if Geometry_MCC(1,1) == 0
                        Bragg1 = 'LD';
                    else
                        Bragg1 ='BD';
                    end
                    
                    if Geometry_MCC(1,2) == 0
                        Bragg2 = 'LD';
                    else
                        Bragg2 ='BD';
                    end
                    
                    if Geometry_MCC(1,3) == 0
                        Bragg3 = 'LD';
                    else
                        Bragg3 ='BD';
                    end
                    
                    if Normal_MCC(1,1)== 1
                    Normal1 = '+';
                    else
                    Normal1 = '-';
                    end
                    
                    if Normal_MCC(1,2)== 1
                    Normal2 = '+';
                    else
                    Normal2 = '-';
                    end
                    
                    if Normal_MCC(1,3)== 1
                    Normal3 = '+';
                    else
                    Normal3 = '-';
                    end
                    
                    if Polarization_MCC(1,1) ==1 
                        Pola1 = 's';
                    else
                        Pola1= 'p';
                    end
                        
                    if Polarization_MCC(1,2) ==1 
                        Pola2 = 's';
                    else
                        Pola2= 'p';
                    end
                    
                    if Polarization_MCC(1,3) ==1 
                        Pola3 = 's';
                    else
                        Pola3 = 'p';
                    end
                    
                    anp1 = sprintf('asy_%0.1ddeg_nor%s_pol_%s',Asy_MCC(1,1),Normal1,Pola1);
                    anp2 = sprintf('asy_%0.1ddeg_nor%s_pol_%s',Asy_MCC(1,2),Normal2,Pola2);
                    anp3 = sprintf('asy_%0.1ddeg_nor%s_pol_%s',Asy_MCC(1,3),Normal3,Pola3);
                    
                    Thickness1 = sprintf('%0.1d',Thickness_MCC(1,1));
                    Thickness2 = sprintf('%0.1d',Thickness_MCC(1,2));                    
                    Thickness3 = sprintf('%0.1d',Thickness_MCC(1,3));
                    
                    if Element_MCC(1,1) == 6
                        Element1 = 'C';
                    else
                        Element1 = 'Si';
                    end
                    
                    if Element_MCC(1,2) == 6
                        Element2 = 'C';
                    else
                        Element2 = 'Si';
                    end
                    if Element_MCC(1,3) == 6
                        Element3 = 'C';
                    else
                        Element3 = 'Si';
                    end
                    
                    Miller1 = sprintf('%0.1d%0.1d%0.1d',h_MCC(1,1),k_MCC(1,1),l_MCC(1,1));
                    Miller2 = sprintf('%0.1d%0.1d%0.1d',h_MCC(1,2),k_MCC(1,2),l_MCC(1,2));
                    Miller3 = sprintf('%0.1d%0.1d%0.1d',h_MCC(1,3),k_MCC(1,3),l_MCC(1,3));
                    
                    Name_common = sprintf('Xtal%0.1d_%s%s_%s%s_%sum_%s_Xtal%0.1d_%s%s_%s%s_%sum_%s_Xtal%0.1d_%s%s_%s%s_%sum_%s_%seV_%s',pos_MCC(1,1),Element1,Miller1,FBD1,Bragg1,Thickness1,anp1,pos_MCC(1,2),Element2,Miller2,FBD2,Bragg2,Thickness2,anp2,pos_MCC(1,3),Element3,Miller3,FBD3,Bragg3,Thickness3,anp3,Energy_center,Mono);
                    
                elseif eval(get(h.info_number_crystal,'string'))== 4
                    
                    if Transmission_MCC(1,1) == 1
                        FBD1 = 'F';                        
                    else
                        FBD1 = '';
                    end
                    
                    if Transmission_MCC(1,2) == 1
                        FBD2 = 'F';                        
                    else
                        FBD2 = '';
                    end
                    
                    if Transmission_MCC(1,3) == 1
                        FBD3 = 'F';                        
                    else
                        FBD3 = '';
                    end
                    
                    if Transmission_MCC(1,4) == 1
                        FBD4 = 'F';                        
                    else
                        FBD4 = '';
                    end
                    
                    if Geometry_MCC(1,1) == 0
                        Bragg1 = 'LD';
                    else
                        Bragg1 ='BD';
                    end
                    
                    if Geometry_MCC(1,2) == 0
                        Bragg2 = 'LD';
                    else
                        Bragg2 ='BD';
                    end
                    
                    if Geometry_MCC(1,3) == 0
                        Bragg3 = 'LD';
                    else
                        Bragg3 ='BD';
                    end
                    
                    if Geometry_MCC(1,4) == 0
                        Bragg4 = 'LD';
                    else
                        Bragg4 ='BD';
                    end
                    
                    if Normal_MCC(1,1)== 1
                    Normal1 = '+';
                    else
                    Normal1 = '-';
                    end
                    
                    if Normal_MCC(1,2)== 1
                    Normal2 = '+';
                    else
                    Normal2 = '-';
                    end
                    
                    if Normal_MCC(1,3)== 1
                    Normal3 = '+';
                    else
                    Normal3 = '-';
                    end
                    
                    if Normal_MCC(1,4)== 1
                    Normal4 = '+';
                    else
                    Normal4 = '-';
                    end
                    
                    if Polarization_MCC(1,1) ==1 
                        Pola1 = 's';
                    else
                        Pola1= 'p';
                    end
                        
                    if Polarization_MCC(1,2) ==1 
                        Pola2 = 's';
                    else
                        Pola2= 'p';
                    end
                    
                    if Polarization_MCC(1,3) ==1 
                        Pola3 = 's';
                    else
                        Pola3 = 'p';
                    end
                    
                    if Polarization_MCC(1,4) ==1 
                        Pola4 = 's';
                    else
                        Pola4 = 'p';
                    end
                    
                    anp1 = sprintf('asy_%0.1ddeg_nor%s_pol_%s',Asy_MCC(1,1),Normal1,Pola1);
                    anp2 = sprintf('asy_%0.1ddeg_nor%s_pol_%s',Asy_MCC(1,2),Normal2,Pola2);
                    anp3 = sprintf('asy_%0.1ddeg_nor%s_pol_%s',Asy_MCC(1,3),Normal3,Pola3);
                    anp4 = sprintf('asy_%0.1ddeg_nor%s_pol_%s',Asy_MCC(1,4),Normal4,Pola4);
                    
                    
                    Thickness1 = sprintf('%0.1d',Thickness_MCC(1,1));
                    Thickness2 = sprintf('%0.1d',Thickness_MCC(1,2));                    
                    Thickness3 = sprintf('%0.1d',Thickness_MCC(1,3));
                    Thickness4 = sprintf('%0.1d',Thickness_MCC(1,4));
                    
                    if Element_MCC(1,1) == 6
                        Element1 = 'C';
                    else
                        Element1 = 'Si';
                    end
                    
                    if Element_MCC(1,2) == 6
                        Element2 = 'C';
                    else
                        Element2 = 'Si';
                    end
                    
                    if Element_MCC(1,3) == 6
                        Element3 = 'C';
                    else
                        Element3 = 'Si';
                    end
                    
                    if Element_MCC(1,4) == 6
                        Element4 = 'C';
                    else
                        Element4 = 'Si';
                    end
                    
                    Miller1 = sprintf('%0.1d%0.1d%0.1d',h_MCC(1,1),k_MCC(1,1),l_MCC(1,1));
                    Miller2 = sprintf('%0.1d%0.1d%0.1d',h_MCC(1,2),k_MCC(1,2),l_MCC(1,2));
                    Miller3 = sprintf('%0.1d%0.1d%0.1d',h_MCC(1,3),k_MCC(1,3),l_MCC(1,3));
                    Miller4 = sprintf('%0.1d%0.1d%0.1d',h_MCC(1,4),k_MCC(1,4),l_MCC(1,4));
                    
                    Name_common = sprintf('Xtal%0.1d_%s%s_%s%s_%sum_%s_Xtal%0.1d_%s%s_%s%s_%sum_%s_Xtal%0.1d_%s%s_%s%s_%sum_%s_Xtal%0.1d_%s%s_%s%s_%sum_%s_%seV_%s',pos_MCC(1,1),Element1,Miller1,FBD1,Bragg1,Thickness1,anp1,pos_MCC(1,2),Element2,Miller2,FBD2,Bragg2,Thickness2,anp2,pos_MCC(1,3),Element3,Miller3,FBD3,Bragg3,Thickness3,anp3,pos_MCC(1,4),Element4,Miller4,FBD4,Bragg4,Thickness4,anp4,Energy_center,Mono);
                    
                elseif eval(get(h.info_number_crystal,'string'))== 5
                    Name_common = sprintf('To write');
                    
                elseif eval(get(h.info_number_crystal,'string'))== 6
                    Name_common = sprintf('To write');
                    
                elseif eval(get(h.info_number_crystal,'string'))== 7
                    Name_common = sprintf('To write');
                    
                elseif eval(get(h.info_number_crystal,'string'))== 8
                    Name_common = sprintf('To write');
                    
                end                                   
                
                
            else
                Name_common = sprintf('%s%s%s%s_%seV_%0.1dum_%s',Element,Miller,FBD,Bragg,Energy_center,Thickness,Mono);
            end
            
            
            if get(h.Gaussian_Beam_1D_Check,'value') == 1
                TX_plot =get(h.TX_plain_3D_Check,'Value');
                XY_plot =get(h.XY_plain_3D_Check,'Value');
                
                
            elseif get(h.Gaussian_Beam_2D_Check,'value') == 1
                
                xsize_I = eval(get(h.size_X_Beam,'String'));
                if xsize_I - floor(xsize_I) == 0
                    Name_File = sprintf('%s_%0.1dum',Name_common,xsize_I);
                else
                    xsize = xsize_I;
                    xsize1 = num2str (xsize_I);
                    for i_xsize = 1:size(xsize1,2)
                        if xsize1(1,i_xsize) == '.'
                            xsize1(1,i_xsize) = 'd';
                        else
                            xsize1(1,i_xsize) = xsize1(1,i_xsize);
                        end
                    end
                    
                    Name_File = sprintf('%s_%sum',Name_common,xsize1);
                end
                
                x_array = h.x_array;
                t_array = h.t_array;
                
                Gaussian_R_all = h.Gaussian_R_all;
                Intensityx_array = h.Intensityx_array;
                E_Scan_plot = h.E_Scan_plot;
                kx_transvers_array = h.kx_transvers_array;
                R_S_G_all = h.R_S_G_all;
                R_S_all = h.R_S_all;
                
                %what is BX?
                if h.BX == 1 ||h.BX == 4 ||h.BX == 3
                
                    for i_Image_point = 1:size(Image_point_array,2)
                        Image_point = Image_point_array(1,i_Image_point);
                        
                        Energy_point =Energy_array(1,Image_point);
                        
                        set(h.Image_point,'String',Image_point)
                        set(h.Energy_point,'string',Energy_point);
                        R_S_2D = R_S_all(:,:,Image_point);
                        
                        R_S_G = R_S_G_all(:,:,Image_point);
                        Gaussian_R = Gaussian_R_all(:,:,Image_point);
                        
                        if h.BX == 1
                            Name_Filep = sprintf('%s_f1_Incident_xt_I%0.4d.mat',Name_File,Image_point);
                            filename_Output = sprintf('%s/%s',directoryname_Images,Name_Filep);
                            
                            save(filename_Output,'E_Scan_plot','kx_transvers_array','R_S_G');
                            
                        elseif h.BX == 4
                            
                            Name_Filep = sprintf('%s_f4_amplitud_xt_I%0.4d.mat',Name_File,Image_point);
                            filename_Output = sprintf('%s/%s',directoryname_Images,Name_Filep);
                            
                            save(filename_Output,'t_array','x_array','Gaussian_R');
                            
                        elseif h.BX == 3
                            Name_Filep = sprintf('%s_f3_phase_xt_I%0.4d.mat',Name_File,Image_point);
                            filename_Output = sprintf('%s/%s',directoryname_Images,Name_Filep);
                            
                            save(filename_Output,'E_Scan_plot','kx_transvers_array','R_S_2D');
                        end
                    end
                else
                    if h.BX ==5
                        Name_File = sprintf('%s_f5.mat',Name_File);
                        filename_Output = sprintf('%s/%s',directoryname_Images,Name_File);
                        
                        save(filename_Output,'x_array','Energy_array','Intensityx_array');
                        
                        
                    elseif h.BX ==2
                        Name_File = sprintf('%s_f2.mat',Name_File);
                        filename_Output = sprintf('%s/%s',directoryname_Images,Name_File);
                        R_0H_S = h.R_0H_S;
                        R_00_S = h.R_00_S;
                        R_0H_S_Mono_all = h.R_0H_S_Mono_all;
                        save(filename_Output,'E_Scan_plot','R_00_S','R_0H_S','R_0H_S_Mono_all');
       
                        
                    elseif h.BX ==6
                        Name_File = sprintf('%s_f6.mat',Name_File);
                        filename_Output = sprintf('%s/%s',directoryname_Images,Name_File);
                        Intensityx_sum_array = sum(Intensityx_array,2);
                        save(filename_Output,'Energy_array','Intensityx_sum_array');
                        
                    end
            end
                
            elseif get(h.Gaussian_Beam_3D_Check,'value') == 1
                
                xsize_I = eval(get(h.size_X_Beam,'String'));
                
                if xsize_I - floor(xsize_I) == 0
                    Name_Filex = sprintf('%s_%0.1d',Name_common,xsize_I);
                else
                    xsize1 = num2str (xsize_I);
                    for i_xsize = 1:size(xsize1,2)
                        if xsize1(1,i_xsize) == '.'
                            xsize1(1,i_xsize) = 'd';
                        else
                            xsize1(1,i_xsize) = xsize1(1,i_xsize);
                        end
                    end
                    
                    Name_Filex = sprintf('%s_%s',Name_common,xsize1);
                end
                
                ysize = eval(get(h.size_Y_Beam,'String'));
                if ysize - floor(ysize) == 0
                    Name_File = sprintf('%sx%0.1dum',Name_Filex,ysize);
                else
                    ysize1 = num2str (ysize);
                    for i_xsize = 1:size(ysize1,2)
                        if ysize1(1,i_xsize) == '.'
                            ysize1(1,i_xsize) = 'd';
                        else
                            ysize1(1,i_xsize) = ysize1(1,i_xsize);
                        end
                    end
                    
                    Name_File = sprintf('%sx%sum',Name_common,ysize1);
                end
                

                plot_array =h.plot_array;
                x_array = h.x_array;
                y_array = h.y_array;
                t_array = h.t_array;
                Energy_array = h.Energy_array;                
                Intensityx_array = h.Intensityx_array;
                E_Scan_plot = h.E_Scan_plot;
                kx_transvers_array = h.kx_transvers_array;
                ky_transvers_array = h.ky_transvers_array;                
                FBD = h.FBD;
                LaueD = h.LaueD;                
                
                Intensity_array = sum(Intensityx_array,2);
                save_folder_intermediate = h.save_folder_intermediate;

                TY_plot = get(h.TY_plain_3D_Check,'Value');
                TX_plot =get(h.TX_plain_3D_Check,'Value');
                XY_plot =get(h.XY_plain_3D_Check,'Value');
                
                if h.BX == 1 || h.BX ==4 || h.BX ==3
                    
                    for i_Image_point = 1:size(Image_point_array,2)
                        if get(h.More_Crystal_Chk,'value')== 0
                            Image_point = Image_point_array(1,i_Image_point);                            
                            
                            Energy_point = Energy_array(1,Image_point);
                        else
                            Image_point = 1;% Image_point_array(1,i_Image_point);
                            
                            Energy_point = 9830;%Energy_array(1,Image_point);
                        end
                        
                        set(h.Image_point,'String',Image_point)
                        set(h.Energy_point,'string',Energy_point);
                        
                        
                        if h.BX == 1
                            if TX_plot == 1
                                if get(h.Channel_Save_XT_Check,'value')
                                    Channel_rep = eval(get(h.Repetition_channel,'String'));
                                    Name_Filep = sprintf('Gaussian_R_XT_Energy_%0.1d_channel_%0.1d_average.mat',i_Image_point,Channel_rep);
                                    filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                                    Save_file = load(filename_input);
                                    R_S_G_sum = Save_file.R_S_G_XT_ave;
                                    
                                    Name_Filep = sprintf('%s_f1_Incidentbeam_xt_I%0.4d.mat',Name_File,Image_point);
                                    filename_Output = sprintf('%s/%s',directoryname_Images,Name_Filep);
                                    save(filename_Output,'E_Scan_plot','kx_transvers_array','R_S_G_sum');
                                    
                                end
                                
                            elseif TY_plot == 1
                                if get(h.Channel_Save_YT_Check,'value')
                                    Channel_rep = eval(get(h.Repetition_channel,'String'));
                                    Name_Filep = sprintf('Gaussian_R_YT_Energy_%0.1d_channel_%0.1d_average.mat',i_Image_point,Channel_rep);
                                    filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                                    Save_file = load(filename_input);
                                    
                                    R_S_G_sum = Save_file.R_S_G_YT_ave;
                                    Name_Filep = sprintf('%s_f1_Incidentbeam_yt_I%0.4d.mat',Name_File,Image_point);
                                    filename_Output = sprintf('%s/%s',directoryname_Images,Name_Filep);
                                    
                                    save(filename_Output,'E_Scan_plot','ky_transvers_array','R_S_G_sum');
                                end
                                
                            elseif XY_plot == 1
                                if get(h.Channel_Save_XY_Check,'value')
                                    Channel_rep = eval(get(h.Repetition_channel,'String'));
                                    Name_Filep = sprintf('Gaussian_R_XY_Energy_%0.1d_channel_%0.1d_average.mat',i_Image_point,Channel_rep);
                                    filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                                    Save_file = load(filename_input);
                                    
                                    R_S_G_sum = Save_file.R_S_G_XY_ave;
                                    Name_Filep = sprintf('%s_f1_Incidentbeam_xy_I%0.4d.mat',Name_File,Image_point);
                                    filename_Output = sprintf('%s/%s',directoryname_Images,Name_Filep);
                                    
                                    save(filename_Output,'kx_transvers_array','ky_transvers_array','R_S_G_sum');
                                end
                            end
                            
                        elseif h.BX == 4
                            if TX_plot == 1
                                if get(h.Channel_Save_XT_Check,'value')
                                    Channel_rep = eval(get(h.Repetition_channel,'String'));
                                    Name_Filep = sprintf('Gaussian_R_XT_Energy_%0.1d_channel_%0.1d_average.mat',i_Image_point,Channel_rep);
                                    filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                                    
                                    Save_file = load(filename_input);
                                    Gaussian_R_sum = Save_file.Gaussian_R_XT_ave;
                                    Name_Filep = sprintf('%s_f4_amplitud_xt_I%0.4d.mat',Name_File,Image_point);
                                    filename_Output = sprintf('%s/%s',directoryname_Images,Name_Filep);
                                    save(filename_Output,'t_array','x_array','Gaussian_R_sum');
                                    
                                    if get(h.Channel_Save_average_Check,'value') == 1
                                        for i_repetition =1:eval(get(h.Repetition_ave,'String'))
                                            Name_Filep = sprintf('Gaussian_R_XT_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_Image_point,Channel_rep,i_repetition);
                                            filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                                            Save_file = load(filename_input);
                                            
                                            Gaussian_R_sum = Save_file.Gaussian_R_XT;
                                            Name_Filep = sprintf('%s_f4_amplitud_xt_Apoint_%0.1d_I%0.4d.mat',Name_File,i_repetition,Image_point);
                                            filename_Output = sprintf('%s/%s',directoryname_Images,Name_Filep);
                                            save(filename_Output,'t_array','x_array','Gaussian_R_sum');
                                        end
                                    end
                                end
                            elseif TY_plot == 1
                                if get(h.Channel_Save_YT_Check,'value')
                                    Channel_rep = eval(get(h.Repetition_channel,'String'));
                                    Name_Filep = sprintf('Gaussian_R_YT_Energy_%0.1d_channel_%0.1d_average.mat',i_Image_point,Channel_rep);
                                    filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                                    Save_file = load(filename_input);
                                    
                                    Gaussian_R_sum = Save_file.Gaussian_R_YT_ave;
                                    Name_Filep = sprintf('%s_f4_amplitud_yt_I%0.4d.mat',Name_File,Image_point);
                                    filename_Output = sprintf('%s/%s',directoryname_Images,Name_Filep);                                    
                                    save(filename_Output,'t_array','y_array','Gaussian_R_sum');
                                    if get(h.Channel_Save_average_Check,'value') == 1
                                        for i_repetition =1:eval(get(h.Repetition_ave,'String'))
                                            Name_Filep = sprintf('Gaussian_R_YT_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_Image_point,Channel_rep,i_repetition);
                                            filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                                            Save_file = load(filename_input);
                                            
                                            Gaussian_R_sum = Save_file.Gaussian_R_YT;
                                            Name_Filep = sprintf('%s_f4_amplitud_yt_Apoint_%0.1d_I%0.4d.mat',Name_File,i_repetition,Image_point);
                                            filename_Output = sprintf('%s/%s',directoryname_Images,Name_Filep);
                                            save(filename_Output,'t_array','x_array','Gaussian_R_sum');
                                        end
                                    end
                                end
                                
                            elseif XY_plot == 1
                                if get(h.Channel_Save_XY_Check,'value')
                                    Channel_rep = eval(get(h.Repetition_channel,'String'));
                                    Name_Filep = sprintf('Gaussian_R_XY_Energy_%0.1d_channel_%0.1d_average.mat',i_Image_point,Channel_rep);
                                    filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                                    Save_file = load(filename_input);
                                    
                                    Gaussian_R_sum = Save_file.Gaussian_R_XY_ave;
                                    Name_Filep = sprintf('%s_f4_amplitud_xy_I%0.4d.mat',Name_File,Image_point);
                                    filename_Output = sprintf('%s/%s',directoryname_Images,Name_Filep);                                    
                                    save(filename_Output,'x_array','y_array','Gaussian_R_sum');
                                    if get(h.Channel_Save_average_Check,'value') == 1
                                        for i_repetition =1:eval(get(h.Repetition_ave,'String'))
                                            Name_Filep = sprintf('Gaussian_R_XY_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_Image_point,Channel_rep,i_repetition);
                                            filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                                            Save_file = load(filename_input);
                                            
                                            Gaussian_R_sum = Save_file.Gaussian_R_XY;
                                            Name_Filep = sprintf('%s_f4_amplitud_xy_Apoint_%0.1d_I%0.4d.mat',Name_File,i_repetition,Image_point);
                                            filename_Output = sprintf('%s/%s',directoryname_Images,Name_Filep);
                                            save(filename_Output,'t_array','x_array','Gaussian_R_sum');
                                        end
                                    end
                                end                                
                            end
                            
                        elseif h.BX == 3
                            if TX_plot == 1
                                if get(h.Channel_Save_XT_Check,'value')
                                    Channel_rep = eval(get(h.Repetition_channel,'String'));
                                    Name_Filep = sprintf('Gaussian_R_XT_Energy_%0.1d_channel_%0.1d_average.mat',i_Image_point,Channel_rep);
                                    filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                                    
                                    Save_file = load(filename_input);                                    
                                    Gaussian_R_sum = Save_file.Phase_R_XT_ave;
                                    Name_Filep = sprintf('%s_f3_phase_xt_I%0.4d.mat',Name_File,Image_point);
                                    filename_Output = sprintf('%s/%s',directoryname_Images,Name_Filep);
                                    save(filename_Output,'t_array','x_array','Gaussian_R_sum');
                                    
                                    if get(h.Channel_Save_average_Check,'value') == 1
                                        for i_repetition =1:eval(get(h.Repetition_ave,'String'))
                                            Name_Filep = sprintf('Gaussian_R_XT_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_Image_point,Channel_rep,i_repetition);
                                            filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                                            Save_file = load(filename_input);
                                            %G_monoR_S_G_XTGaussian_R_XT
                                            Gaussian_R_sum = Save_file.Phase_R_XT;
                                            Name_Filep = sprintf('%s_f3_phase_xt_Apoint_%0.1d_I%0.4d.mat',Name_File,i_repetition,Image_point);
                                            filename_Output = sprintf('%s/%s',directoryname_Images,Name_Filep);
                                            save(filename_Output,'t_array','x_array','Gaussian_R_sum');
                                        end
                                    end
                                end
                            elseif TY_plot == 1
                                if get(h.Channel_Save_YT_Check,'value')
                                    Channel_rep = eval(get(h.Repetition_channel,'String'));
                                    Name_Filep = sprintf('Gaussian_R_YT_Energy_%0.1d_channel_%0.1d_average.mat',i_Image_point,Channel_rep);
                                    filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                                    Save_file = load(filename_input);
                                    
                                    Gaussian_R_sum = Save_file.Phase_R_YT_ave;
                                    Name_Filep = sprintf('%s_f3_phase_yt_I%0.4d.mat',Name_File,Image_point);
                                    filename_Output = sprintf('%s/%s',directoryname_Images,Name_Filep);
                                    
                                    save(filename_Output,'t_array','y_array','Gaussian_R_sum');
                                    if get(h.Channel_Save_average_Check,'value') == 1
                                        for i_repetition =1:eval(get(h.Repetition_ave,'String'))
                                            Name_Filep = sprintf('Gaussian_R_YT_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_Image_point,Channel_rep,i_repetition);
                                            filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                                            Save_file = load(filename_input);
                                            
                                            Gaussian_R_sum = Save_file.Phase_R_YT;
                                            Name_Filep = sprintf('%s_f3_phase_yt_Apoint_%0.1d_I%0.4d.mat',Name_File,i_repetition,Image_point);
                                            filename_Output = sprintf('%s/%s',directoryname_Images,Name_Filep);
                                            save(filename_Output,'t_array','x_array','Gaussian_R_sum');
                                        end
                                    end
                                end
                                
                            elseif XY_plot == 1
                                if get(h.Channel_Save_XY_Check,'value')
                                    Channel_rep = eval(get(h.Repetition_channel,'String'));
                                    Name_Filep = sprintf('Gaussian_R_XY_Energy_%0.1d_channel_%0.1d_average.mat',i_Image_point,Channel_rep);
                                    filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                                    Save_file = load(filename_input)
                                    
                                    Gaussian_R_sum = Save_file.Phase_R_XY_ave;
                                    Name_Filep = sprintf('%s_f3_phase_xy_I%0.4d.mat',Name_File,Image_point);
                                    filename_Output = sprintf('%s/%s',directoryname_Images,Name_Filep);
                                    
                                    save(filename_Output,'x_array','y_array','Gaussian_R_sum');
                                    if get(h.Channel_Save_average_Check,'value') == 1
                                        for i_repetition =1:eval(get(h.Repetition_ave,'String'))
                                            Name_Filep = sprintf('Gaussian_R_XY_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_Image_point,Channel_rep,i_repetition);
                                            filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                                            Save_file = load(filename_input);
                                            
                                            Gaussian_R_sum = Save_file.Phase_R_XY;
                                            Name_Filep = sprintf('%s_f3_phase_xy_Apoint_%0.1d_I%0.4d.mat',Name_File,i_repetition,Image_point);
                                            filename_Output = sprintf('%s/%s',directoryname_Images,Name_Filep);
                                            save(filename_Output,'t_array','x_array','Gaussian_R_sum');
                                        end
                                    end
                                end                                
                            end
                        elseif h.BX == 5
                            
                            Channel_rep = eval(get(h.Repetition_channel,'String'));
                            Name_Filep = sprintf('Gaussian_R_XT_Energy_%0.1d_channel_%0.1d_average.mat',i_Image_point,Channel_rep);
                            filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                            Save_file = load(filename_input);
                            G_mono = Save_file.G_mono_ave;
                            
                            % figure
                            % hold on
                            
                            if get(h.Channel_Save_average_Check,'value') == 1
                                
                                for i_repetition =1:eval(get(h.Repetition_ave,'String'))
                                    Name_Filep = sprintf('Gaussian_R_XY_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_Image_point,Channel_rep,i_repetition);
                                    filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                                    Save_file = load(filename_input);
                                    %G_monoR_S_G_XTGaussian_R_XT
                                    G_mono = Save_file.G_mono;
                                    
                                    %  plot(E_Scan_plot,abs(G_mono).^2)
                                    
                                    Name_Filep = sprintf('%s_f5_RE_Apoint_%0.1d_I%0.4d.mat',Name_File,i_repetition,Image_point);
                                    filename_Output = sprintf('%s/%s',directoryname_Images,Name_Filep);
                                    save(filename_Output,'E_Scan_plot','G_mono');
                                end
                            end
                            
                            %plot(E_Scan_plot,abs(G_mono).^2,'color','k')
                            
                            Name_Filep = sprintf('%s_f5_RE_I%0.4d.mat',Name_File,Image_point);
                            filename_Output = sprintf('%s/%s',directoryname_Images,Name_Filep);
                            save(filename_Output,'E_Scan_plot','G_mono');
                            
                        end
                    end
                else
                    
                    if h.BX ==5
                        Name_File = sprintf('%s_f5.mat',Name_File);
                        filename_Output = sprintf('%s/%s',directoryname_Images,Name_File);
                        
                        save(filename_Output,'plot_array','Energy_array','Intensityx_array');
                        
                    elseif h.BX == 2
                        R_0H_S = h.R_0H_S;
                        R_00_S = h.R_00_S;
                        R_0H_S_Mono_all = h.R_0H_S_Mono_all;
                        
                        Name_File = sprintf('%s_f2.mat',Name_File);
                        filename_Output = sprintf('%s/%s',directoryname_Images,Name_File);
                        
                        save(filename_Output,'E_Scan_plot','R_00_S','R_0H_S','R_0H_S_Mono_all');
                        
                        
                    elseif h.BX ==6
                        Name_File = sprintf('%s_f6.mat',Name_File);
                        filename_Output = sprintf('%s/%s',directoryname_Images,Name_File);
                        Intensity_array_save = sum(Intensity_array,2);
                        save(filename_Output,'Energy_array','Intensity_array_save');
                        
                    end
                end
            end
            
        end
    end

    function Energy_Scan(source,eventdata)
        
       %scan 1D 
       if get(h.Gaussian_Beam_1D_Check,'Value') == 1
        
        %Call the 1D simulation function
        Dynamical_Refletivity_1D_call
        
        %Clean figures
        child = get(h.I_Fig_Beam_3D_Section_F2,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.I_Fig_Beam_3D_reflectivity_F7,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_convolution_F8,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.I_Fig_Beam_3D_F1,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_mono_F5,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_profile_F6,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_GK_F4,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_Section_T_F3,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        %Retrive the values for the paremeters introduced.
        t_array = h.t_array;
        R_0H_S = h.R_0H_S;
        G_0H = h.G_0H;
        E_Scan = h.E_Scan;
        
        element =h.element;
        geometry_fecho = h.geometry_fecho;
        Energy_center = h.Energy_center;
        h_Miller = h.h_Miller;
        k_Miller = h.k_Miller;
        l_Miller = h.l_Miller;
        Thickness = h.Thickness_name;
        Polarization = h.Polarization;
        Strain_string = h.Strain_string;
        
        geometry_scan = h.geometry_scan;
        if geometry_scan == 1
           t_array = -t_array;
        else
            t_array = t_array;
        end
        
        
        Ang_asy_Deg = h.Ang_asy_Deg;
        Theta_Bragg = h.Theta_Bragg;
        
        %If flux of X-ray introduced
        if get(h.Flux_Beam_Check,'value') == 1
            Flux_Beam = eval(get(h.Flux_Beam,'string'));
        else
            Flux_Beam = 1;
        end        
        
        R_0H_S_Mono_all  = [];
        h.R_0H_S_Mono_all = [];
        
        if get(h.Mono_Scan_Check,'value') == 0
            number_Steps = 0;
            Step_Range = 0;
            Range_Mono_neg = 0;
        else
            number_Steps = eval(get(h.Steps_Mono,'String'));
            
            Range_Mono_pos = eval(get(h.Range_pos_Mono,'String'));
            Range_Mono_neg = -eval(get(h.Range_neg_Mono,'String'));
            Step_Range = (Range_Mono_pos+Range_Mono_neg)/number_Steps;
            if number_Steps == 1
                number_Steps = 0;
            end            
        end
        
        Energy_array= [];
        Intensity_array = [];
        
        %Plot reflectivity curve
        axes(h.I_Fig_Beam_3D_Section_F2)
        plot(E_Scan,abs(R_0H_S).^2,'Parent',h.I_Fig_Beam_3D_Section_F2,'Color','r')
        hold on
        
        for i_steps = 1: number_Steps + 1
            
            for i_average = 1: eval(get(h.Repetition_ave,'String'))
                set(h.Repetition_num ,'string',i_average)
                
                if get(h.Stop_Dynamical_3D,'Value') == 0
                    break
                    
                end
                
                if get(h.Pause_Dynamical_3D,'Value') == 1
                    pause(0.1)
                    for i_pause =1:1000
                        if get(h.Pause_Dynamical_3D,'Value') == 1
                            set (h.Status_Dynamical_3D,'String','Status: Paused','BackgroundColor',[0 0.8 0.8])
                            pause(0.1)
                        else
                            set (h.Status_Dynamical_3D,'String','Status: working','BackgroundColor',[0.5 0.5 0.5])
                        end
                    end
                else
                    %pause(0.1)
                end
                
                Energy_Bragg = Energy_center - Range_Mono_neg + Step_Range * (i_steps-1);
                set(h.Energy_point,'String',Energy_Bragg)
                Energy_array(1,i_steps) = Energy_Bragg;
                set(h.Image_point,'String',i_steps)
                
                if get(h.Mono_Beam_Check,'Value') == 1
                    
                    Thickness_Mono = eval(get(h.Thickness_Mono,'string'));
                    element_Mono = get(h.Element_Mono,'String');
                    crystal_orientation_Mono = get(h.crystal_orientation_Mono,'value');
                    
                    % Perfect crystal
                    Ang_asy_Deg_Mono = eval(get(h.Asymmetry_Mono,'String'));
                    
                    %Polarization Mono
                    if get(h.Polarization_s_Mono,'Value') == 1
                        Polarization_Mono = 's';
                    elseif get(h.Polarization_p_Mono,'Value') == 1
                        Polarization_Mono = 'p';
                    end
                    
                    h_Miller_Mono = eval(get(h.H_Mono,'String'));
                    k_Miller_Mono = eval(get(h.K_Mono,'String'));
                    l_Miller_Mono = eval(get(h.L_Mono,'String'));
                    
                    vector_Miller_Mono = [h_Miller_Mono k_Miller_Mono l_Miller_Mono];
                    
                    [Z_Mono,F0_Mono,FH_Mono,F_H_Mono,a_Par_Mono,b_Par_Mono,c_Par_Mono,alpha_Par_Mono,beta_Par_Mono,gamma_Par_Mono]=Element_Bragg_temp_Gui...
                        (element_Mono,h_Miller_Mono,k_Miller_Mono,l_Miller_Mono,Energy_Bragg);
                    
                    set(h.f0_Mono,'String',F0_Mono)
                    set(h.f1_Mono,'String',FH_Mono)
                    set(h.f2_Mono,'String',F_H_Mono)
                    
                    if get(h.f_check_values,'Value') == 1
                        f_0 = eval(get(h.f0_Mono,'String'));
                        f_1 = eval(get(h.f1_Mono,'String'));
                        f_2 = eval(get(h.f2_Mono,'String'));
                    end                    
                    
                    DWF = eval(get(h.DWF,'String'));
                    absor = get(h.Absorption,'Value');
                    Range_E_neg = (-1)*eval(get(h.Range_Left,'String'));
                    Range_E_pos = eval(get(h.Range_Right,'String'));
                    N_Step = eval(get(h.Nstep_t_Beam,'String'));
                    
                    %Calculate monochromator reflectivity
                    [Theta_Bragg_Mono,Chi_0_Cx_Mono,Chi_h_Cx_Mono,R_0H_S_Mono,E_Scan_mono,G_S,t_array_mono,k_array_mono,Dwidth] = Bragg_temp_Gui_test...
                        (a_Par_Mono,b_Par_Mono,c_Par_Mono,Energy_Bragg,Energy_center,...
                        h_Miller_Mono,k_Miller_Mono,l_Miller_Mono,DWF,F0_Mono,FH_Mono,F_H_Mono,absor,...
                        Range_E_neg,Range_E_pos,Polarization_Mono,Ang_asy_Deg_Mono,Thickness_Mono,N_Step,...
                        0,crystal_orientation_Mono);
                                        
                    R_0H_S_Mono_array(i_steps,:) = R_0H_S_Mono(1,:);
                    
                    if get(h.Plot_on_Check,'value') == 1
                        axes(h.I_Fig_Beam_3D_Section_F2)
                        hold off
                        plot(E_Scan,abs(R_0H_S_Mono).^2,'Parent',h.I_Fig_Beam_3D_Section_F2)
                        hold on
                        plot(E_Scan,abs(R_0H_S).^2,'Parent',h.I_Fig_Beam_3D_Section_F2,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','b')
                        title_Mono = strcat('Monochromator:(',get(h.H_Mono,'String'),',',get(h.K_Mono,'String'),',',get(h.L_Mono,'String'),')');
                        title(title_Mono)
                        ylabel('Intensity (arb. unit)')
                        xlabel('Energy (eV)')
                        axis auto
                        hold on
                    end
                    
                    %Rename the variable
                    Gaussian_K = R_0H_S_Mono ;
                    
                    Gaussian_K_all(i_steps,:) = Gaussian_K;                    
                end                
                
                if get(h.Mono_Beam_Check,'Value') == 0                    
                    
                    WaveL_Bragg = h.h_planck*h.c_light/Energy_Bragg    ; %m
                    k0=2*pi/WaveL_Bragg;
                    rho = eval(get(h.rhoparameter,'String'));
                    %rho=5e-4; %related to number of periodes undulator 5e-4
                    sigk=rho*k0;
                    
                    Gaussian_k=exp(-0.5*(k_array-k0).*(k_array-k0)/sigk/sigk);
                    
                    if get(h.Plot_on_Check,'value') == 1
                        axes(h.I_Fig_Beam_3D_GK_F4)
                        % k space gaussian define by machine porperties
                        plot(E_Scan,abs(Gaussian_k).^2,'Parent',h.I_Fig_Beam_3D_GK_F4)
                        ylabel('Intensity (arb. unit)')
                        xlabel('Energy (eV)')
                        axis auto
                        hold on
                    end
                    
                    if get(h.Gaussian_Beam_SASE_Check,'Value') == 1
                        phase = exp(1i*2*pi*random('unif',0,1,1,N_Step));
                        
                        % k space gaussian define by machine porperties
                        Gaussian_k= Gaussian_k.*phase;
                        
                        % To time space
                        Gaussian_T = ifft(fftshift(Gaussian_k));
                        
                        %Definition time window
                        lt = eval(get(h.size_T_Beam,'String'))*1e-15; %seg
                        dt = t_array(1,2)- t_array(1,1);
                        Nsam=floor(lt/dt);
                        Gaussian_T(Nsam:end)=0;
                        
                        %Back to k space
                        Gaussian_K=fftshift(fft(Gaussian_T));
                        
                        if get(h.Plot_on_Check,'value') == 1
                            plot(E_Scan_plot,abs(Gaussian_k).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)
                            plot(t_array,abs(Gaussian_T).^2,'Parent',h.I_Fig_Beam_3D_Section_F2)
                            plot(E_Scan_plot,abs(Gaussian_K).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)
                            %pause(0.1)
                        end
                        
                        Gaussian_K_all(i_steps,:) = Gaussian_K;
                        R_S_G = R_0H_S .* Gaussian_K;
                    else
                        
                        R_S_G = R_0H_S .* Gaussian_k;
                    end
                    
                else
                    R_S_G = R_0H_S .* Gaussian_K;
                    
                end                
                
                %sum of the amplitud to plot intensity
                Intensity_calcu(1,:) = abs(R_S_G).^2;
                Intensity_array(1,i_steps) = sum(Intensity_calcu,2);
                
                if get(h.Plot_on_Check,'value') == 1
                    axes(h.I_Fig_Beam_3D_F1)
                    plot(E_Scan,abs(R_S_G).^2,'Parent',h.I_Fig_Beam_3D_F1)
                    view([0 90])
                    
                    set(h.I_Fig_Beam_3D_F1,'yscale','linear');
                    title_Convolution = strcat('Monochromator(',get(h.H_Mono,'String'),',',get(h.K_Mono,'String'),',',...
                        get(h.L_Mono,'String'),') Convoluted with (',h_Miller,',',k_Miller,',',l_Miller,')');
                    title(title_Convolution)
                    axis auto
                    ylabel('Intensity (arb. unit)')
                    xlabel('Energy (eV)')
                    % pause(0.1)
                end
                
                %Amplitud
                Gaussian_R(i_steps,:) = (ifft(R_S_G));
                Gaussian_C(i_steps,:) = (ifft(R_0H_S));
                
                Intensity_plot = abs(Gaussian_R(i_steps,:)).^2;
                [peaks,locs,width,promi] = findpeaks(Intensity_plot,'minpeakprominence',1e-8);
                [Max_peaks,number_max] = max(peaks);
                
                if size(Gaussian_R,2)-locs(number_max) > size(Gaussian_R,2)/2
                    Gaussian_R(i_steps,:) = fftshift(Gaussian_R(i_steps,:));
                    Gaussian_C(i_steps,:) = fftshift(Gaussian_C(i_steps,:));
                end
                
                %save_folder_intermediate = '/das/work/p15/p15366/RN84/SwissFEL Simulations/Calculation_Support';
                if h.cluster == true
                    save_folder_intermediate_Fit = '/gpfs/exfel/data/user/rodrigfa/Results/Fit/Strain';
                else
                    save_folder_intermediate_Fit = '/Users/rodrigfa/Desktop/MultiBeam_calculator/Temporal_Data/Fit/Strain';
                end
                
                %chose if we want to see the location of maxima following
                %shydv'ko formula.
                if get(h.Transverse_um_Check,'value') == 0
                    Plot_axis = t_array *1e15;
                    
                else %Transverse displacement
                    
                    %The Bragg angle calculated in together with asymmetry, in not Bragg angle but incident angle
                    Ang_asy = Ang_asy_Deg *pi/180;
                    % we Substract the asymetry to the incident angle
                    Theta_Bragg_Shvyd = Theta_Bragg-Ang_asy;
                    %Print the Bragg angle to see that fits the correct value
                    %in theotry
                    Theta_Bragg_deg = Theta_Bragg_Shvyd *180 / pi;
                    %Shvyd'ko factor spatiotemporal coupling
                    Factor = cot(Theta_Bragg_Shvyd);
                    %%%%%%%%%%%%%%%%%%%%
                    
                    %Transverse displacment time equation shvyd'ko
                    Plot_axis = h.c_light.*t_array *1e6 * Factor; %position in microns                    
                end
                
                Intensity_plot = abs(Gaussian_R(i_steps,:)).^2;
                [peaks,locs,width,promi] = findpeaks(flip(Intensity_plot),flip(Plot_axis),'minpeakprominence',1e-10);
                [Max_peaks,number_max] = max(peaks);
                
                locs_max = locs(number_max);
                for i_peaks =1:size(peaks)
                    if peaks(i_peaks)* 10 > Max_peaks
                        locs_max = locs(i_peaks);
                    end
                end
                
                Plot_axis = (Plot_axis -locs_max);
                
                %Phase
                Phase_R(i_steps,:) = atan2(imag(Gaussian_R(i_steps,:)),real(Gaussian_R(i_steps,:)));
                %phase crystal
                Phase_C(i_steps,:) = atan2(imag(Gaussian_C(i_steps,:)),real(Gaussian_C(i_steps,:)));
                
                
                %plot results
                if get(h.Plot_on_Check,'value') == 1
                    axes(h.I_Fig_Beam_3D_GK_F4)
                    plot(Plot_axis,abs(Gaussian_R(i_steps,:)).^2,'Parent',h.I_Fig_Beam_3D_GK_F4)
                    set(h.I_Fig_Beam_3D_GK_F4,'yscale','log');
                    xlabel('Time (s)')
                    ylabel('Intensity (arb. unit)')
                    title_Convolution = strcat('Intensity');
                    title(title_Convolution)          
                                        
                    axes(h.I_Fig_Beam_3D_Section_T_F3)
                    plot(Plot_axis,Phase_R(i_steps,:),'Parent',h.I_Fig_Beam_3D_Section_T_F3)
                    xlabel('Time (s)')
                    ylabel('Intensity (arb. unit)')
                    title_Convolution = strcat('Phase');
                    title(title_Convolution)
                    
                    axes(h.I_Fig_Beam_3D_mono_F5)
                    plot(Plot_axis,Phase_C(i_steps,:),'Parent',h.I_Fig_Beam_3D_mono_F5)
                    xlabel('Time (s)')
                    ylabel('Intensity (arb. unit)')
                    title_Convolution = strcat('Phase sec');
                    title(title_Convolution)
                    
                    axes(h.I_Fig_Beam_3D_profile_F6)
                    plot(Plot_axis,abs(Gaussian_C(i_steps,:)).^2,'Parent',h.I_Fig_Beam_3D_profile_F6)
                    set(h.I_Fig_Beam_3D_profile_F6,'yscale','log');
                    xlabel('Time (s)')
                    ylabel('Intensity (arb. unit)')
                    title_Convolution = strcat('Intensig sec');
                    title(title_Convolution)   
                    
                    axes(h.I_Fig_Beam_3D_convolution_F8)
                    hold off
                    plot(Energy_array,Intensity_array/Intensity_array(1,1),'Parent',h.I_Fig_Beam_3D_convolution_F8,'LineStyle','none',...
                        'Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r');
                    hold on
                    title_Convolution = strcat('Monochromator(',get(h.H_Mono,'String'),',',get(h.K_Mono,'String'),',',...
                        get(h.L_Mono,'String'),') Convoluted with (',h_Miller,',',k_Miller,',',l_Miller,')');
                    title(title_Convolution)
                    ylabel('Intensity (arb. unit)')
                    xlabel('Energy (eV)')                    
                    axis auto
                    
                end
            end
            
            %stop by user
            if get(h.Stop_Dynamical_3D,'Value') == 0
                set(h.Status_Dynamical_3D,'String','Status: Stop by user','BackgroundColor',[0.9 0 0.9])
                break
                
            end
            Gaussian_R_sum = Gaussian_R.*0;
            R_S_G_sum = R_S_G.*0;
            
            Gaussian_R = [];
            R_S_G = [];
        end
        
        %plotting
        if get(h.Stop_Dynamical_3D,'Value') == 0
        else
            Gaussian_KXY = [];
            
            if number_Steps == 0
            else
                if get(h.Mono_Scan_Check,'value') == 1                    
                    axes(h.I_Fig_Beam_3D_convolution_F8)
                    plot(Energy_array,Intensity_array/Intensity_array(1,1),'Parent',h.I_Fig_Beam_3D_convolution_F8,'LineStyle','-','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r');
                    title_Convolution = strcat('Monochromator(',get(h.H_Mono,'String'),',',get(h.K_Mono,'String'),',',get(h.L_Mono,'String'),') Convoluted with (',num2str(h_Miller),',',num2str(k_Miller),',',num2str(l_Miller),')');
                    title(title_Convolution)
                    ylabel('Intensity (arb. unit)')
                    xlabel('Energy (eV)')
                    hold on
                    xlim([E_Scan(1,1),E_Scan(1,size(E_Scan,2))])
                    
                end
            end
            
        end
        
       %scan 3D call the historical function           
       elseif get(h.Gaussian_Beam_3D_Check,'Value') == 1
           Beam_3D_Reflectivity
           
       end
    end

   

%%Reflectivity calculations
    function Beam_3D_Reflectivity(source,eventdata)
        datetime_init = datetime;
        
        %Intit variables or empty variables
        h.x_array  = [];         x_array = [];
        h.y_array  = [];         y_array = [];
        h.t_array  = [];         t_array = [];
        
        h.Energy_array  = [];         Energy_array = [];
        h.Gaussian_R_all  = [];         Gaussian_R_all = [];
        h.Intensityx_array  = [];         Intensityx_array = [];
        h.E_Scan_plot  = [];         E_Scan_plot = [];
        h.kx_transvers_array  = [];         kx_transvers_array = [];
        h.ky_transvers_array  = [];         ky_transvers_array = [];
        h.R_S_G_all  = [];         R_S_G_all = [];
        h.FBD  = [];
        
        h.LaueD  = [];         LaueD = [];
        h.R_S_all  = [];         R_S_all = [];
        
        R_0H_S_Mono_all  = [];         h.R_0H_S_Mono_all = [];
        
        % It is possible to assume a certan number of photons arriving
        if get(h.Flux_Beam_Check,'value') == 1
            Flux_Beam = eval(get(h.Flux_Beam,'string'));
        else
            Flux_Beam = 1; %percentege
        end        
        
        %Cleans the figures
        child = get(h.I_Fig_Beam_3D_Section_F2,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.I_Fig_Beam_3D_reflectivity_F7,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_convolution_F8,'Children');
        for i=1:length(child)
            delete(child(i));
        end        
        child = get(h.I_Fig_Beam_3D_F1,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_mono_F5,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_profile_F6,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_GK_F4,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_Section_T_F3,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        Beam_3D_plot_AutoSave

        % Gets some information to user that the simulations is starting
        set(h.Pause_Dynamical_3D,'Value',0)
        set(h.Stop_Dynamical_3D,'Value',1,'ForegroundColor',[0 0 0])
        
        % Certain values or constants
        c_light= 299792458; %Light Speed m/s
        h_planck = 4.13566733*10^(-15);% eV
        
        %Reads the information in the gui
        element = (get(h.Element,'String'));
        crystal_orientation = get(h.crystal_orientation,'value');
       
        Energy_center = eval(get(h.Energy_input,'String'));
        
        h_Miller = eval(get(h.h_miller,'String'));
        k_Miller = eval(get(h.k_miller,'String'));
        l_Miller = eval(get(h.l_miller,'String'));
        vector_Miller = [h_Miller k_Miller l_Miller];
        
        DWF = eval(get(h.DWF,'String'));
        
        Range_E_neg = (-1)*eval(get(h.Range_Left,'String'));
        Range_E_pos = eval(get(h.Range_Right,'String'));
        
        Ang_asy_Deg = eval(get(h.Asymmetry,'String'));
        
        N_Step = eval(get(h.Nstep_t_Beam,'String'));
        
        if get(h.Polarization_s ,'value') == 1
            Polarization = 's';
        else
            Polarization = 'p';
        end
        absor = get(h.Absorption,'Value');
        
        Thickness = eval(get(h.Thickness,'String'));
        
        if get(h.More_Crystal_Chk,'value') == 1
            pos_MCC = h.pos_MCC;
            Element_MCC = h.Element_MCC;
            h_MCC = h.h_MCC;
            k_MCC = h.k_MCC;
            l_MCC = h.l_MCC;
            Thickness_MCC = h.Thickness_MCC;
            Geometry_MCC = h.Geometry_MCC;
            Transmission_MCC = h.Transmission_MCC;
            Asymmetry_MCC =h.Asymmetry_MCC;
            Normal_MCC = h.Normal_MCC;
            polarization_MCC = h.polarization_MCC ;
            Energy_MCC = h.name_Energy;
            Beam_MCC = h.name_Beam;
            da_MCC = h.da_MCC;
            db_MCC = h.db_MCC;
            dc_MCC = h.dc_MCC;
            
            %Which crystal or layer to show
            i_cryst_show = eval(get(h.crystal_show,'string'));            
            
            for i_cryst = 1:size(pos_MCC,2)
                element = char(Element_MCC(1,i_cryst));
                vector_Miller = [h_MCC(1,i_cryst), k_MCC(1,i_cryst),l_MCC(1,i_cryst)];
                [Z_i, F0_i, FH_i, F_H_i, a_Par_i, b_Par_i, c_Par_i,alpha_Par_i,beta_Par_i,gamma_Par_i] = Element_Bragg_temp_Gui...
                    (element,h_MCC(1,i_cryst),k_MCC(1,i_cryst),l_MCC(1,i_cryst),Energy_center);
                
                F0(1,i_cryst) = F0_i;
                FH(1,i_cryst) = FH_i;
                F_H(1,i_cryst) = F_H_i;
                a_Par(1,i_cryst) = a_Par_i + da_MCC(1,i_cryst) * a_Par_i;
                b_Par(1,i_cryst) = b_Par_i + db_MCC(1,i_cryst) * b_Par_i;
                c_Par(1,i_cryst) = c_Par_i + dc_MCC(1,i_cryst) * c_Par_i;
            end
            
        else
            [Z,F0,FH,F_H,a_Par,b_Par,c_Par,alpha_Par,beta_Par,gamma_Par] = Element_Bragg_temp_Gui(element,h_Miller,k_Miller,l_Miller,Energy_center);
            
            i_cryst = 1;
        end
        set(h.f0,'String',F0(1,i_cryst))
        set(h.f1,'String',FH(1,i_cryst))
        set(h.f2,'String',F_H(1,i_cryst))
        
        if get(h.CParameter_Check,'Value') == 1
            a_Par = eval(get(h.a_parameter,'String'));
            b_Par = eval(get(h.b_parameter,'String'));
            c_Par = eval(get(h.c_parameter,'String'));
        end
        set(h.a_parameter,'String',a_Par(1,i_cryst))
        set(h.b_parameter,'String',b_Par(1,i_cryst))
        set(h.c_parameter,'String',c_Par(1,i_cryst))
        
        if get(h.More_Crystal_Chk,'value') == 1
            if Geometry_MCC(1,i_cryst_show) ==1
                [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_S,E_Scan,G_S,t_array,k_array,Dwidth] = Bragg_temp_Gui_test...
                    (a_Par(1,i_cryst_show),b_Par(1,i_cryst_show),c_Par(1,i_cryst_show),Energy_center,Energy_center,...
                    h_MCC(1,i_cryst_show),k_MCC(1,i_cryst_show),l_MCC(1,i_cryst_show),DWF,F0(1,i_cryst_show),FH(1,i_cryst_show),F_H(1,i_cryst_show),absor,...
                    Range_E_neg,Range_E_pos,polarization_MCC(1,i_cryst_show),Asymmetry_MCC(1,i_cryst_show),Thickness_MCC(1,i_cryst_show),N_Step,...
                    Transmission_MCC(1,i_cryst_show),Normal_MCC(1,i_cryst_show));
                
                FBD = get(h.Bragg_FBD_Check,'Value');
            else
                [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_S,E_Scan,t_array,k_array,Dwidth] =...
                    Laue_temp_Gui_test(a_Par(1,i_cryst_show),b_Par(1,i_cryst_show),c_Par(1,i_cryst_show),Energy_center,Energy_center,...
                    h_MCC(1,i_cryst_show),k_MCC(1,i_cryst_show),l_MCC(1,i_cryst_show),DWF,F0(1,i_cryst_show),FH(1,i_cryst_show),F_H(1,i_cryst_show),absor,...
                    Range_E_neg,Range_E_pos,polarization_MCC(1,i_cryst_show),Asymmetry_MCC(1,i_cryst_show),Thickness_MCC(1,i_cryst_show),N_Step,...
                    Transmission_MCC(1,i_cryst_show),Normal_MCC(1,i_cryst_show));
                
                FBD = get(h.Laue_FBD_Check,'Value');
            end            
            
        else            
            if get(h.Bragg_Check,'Value') ==1 ||  get(h.Bragg_FBD_Check,'Value') == 1
                [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_S,E_Scan,G_S,t_array,k_array,Dwidth] = Bragg_temp_Gui_test...
                    (a_Par(1,1),b_Par(1,1),c_Par(1,1),Energy_center,Energy_center,...
                    h_Miller(1,1),k_Miller(1,1),l_Miller(1,1),DWF,F0(1,1),FH(1,1),F_H(1,1),absor,...
                    Range_E_neg,Range_E_pos,Polarization,Ang_asy_Deg,Thickness,N_Step,...
                    get(h.Bragg_FBD_Check,'Value'),crystal_orientation);
                
                FBD = get(h.Bragg_FBD_Check,'Value');
                
            elseif get(h.Laue_FBD_Check,'Value')  == 1 || get(h.Laue_Check,'Value') == 1
                [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_S,E_Scan,G_0H,t_array,Dwidth] = Laue_temp_Gui_1D_test(a_Par...
                    (1,1),b_Par(1,1),c_Par(1,1),Energy_center,Energy_center,...
                    h_Miller(1,1),k_Miller(1,1),l_Miller(1,1),DWF,F0(1,1),FH(1,1),F_H(1,1),absor,...
                    Range_E_neg,Range_E_pos,Polarization,Ang_asy_Deg,Thickness,N_Step,...
                    get(h.Laue_FBD_Check,'Value'),crystal_orientation);
                
                FBD = get(h.Laue_FBD_Check,'Value');
            end
        end
        
        set(h.Chi_0,'String',Chi_0_Cx)
        set(h.Chi_h,'String',Chi_h_Cx)
        set(h.Theta_view,'String',Theta_Bragg*180/pi)
        set(h.DarwinWidth,'string',Dwidth)
        %E_Scan
        E_Scan_plot = E_Scan - Energy_center;
        
        xlabel_name = 'Energy (eV)';
          
        h.R_S = R_S;
        
        %%Definition Beam        
        set (h.Status_Dynamical_3D,'String','Status: working','BackgroundColor',[0.5 0.5 0.5])
        
        if get(h.Mono_Scan_Check,'value') == 0
            number_Steps = 0;
            Step_Range = 0;
            Range_Mono_neg = 0;
        else
            number_Steps = eval(get(h.Steps_Mono,'String'));
            
            Range_Mono_pos = eval(get(h.Range_pos_Mono,'String'));
            Range_Mono_neg = -eval(get(h.Range_neg_Mono,'String'));
            Step_Range = (Range_Mono_pos+Range_Mono_neg)/number_Steps;
            if number_Steps == 1
                number_Steps = 0;
            end            
        end
        
        Energy_array= zeros(1,number_Steps);
        Intensity_array = zeros(1,number_Steps);
        
        if get(h.Gaussian_Beam_3D_Check,'Value') == 1
            
            N_Step_x = eval(get(h.Nstep_x_Beam,'String'));
            N_Step_y = eval(get(h.Nstep_y_Beam,'String'));
            
            initial_range_x = eval(get(h.initial_range_x,'String'));
            initial_range_y = eval(get(h.initial_range_y,'String'));
                        
            x0_array = 0;
            y0_array = 0;
            
            %Definition of x
            sigma_x_FWHM = eval(get(h.size_X_Beam,'String'))*1e-6; %um
            x_array = linspace(-initial_range_x/2,initial_range_x/2,N_Step_x)*1e-6;
            
            if get(h.Lorenztian_Distribution,'Value') == 1
                sigma_x = sigma_x_FWHM/2;
                Gaussian_x = 1e-3/(pi*sigma_x)./(1+((x_array-x0_array)/sigma_x).^2)/100;
            else
                sigma_x = sigma_x_FWHM/2.355;
                Gaussian_x = 1*exp(-((x_array-x0_array)/sigma_x).^2./2);
            end
                        
            %Definition of y
            sigma_y_FWHM = eval(get(h.size_Y_Beam,'String'))*1e-6; %um
            y_array = linspace(-initial_range_y/2,initial_range_y/2,N_Step_y)*1e-6;
            if get(h.Lorenztian_Distribution,'Value') == 1
                sigma_y = sigma_y_FWHM/2;
                Gaussian_y = 1e-3/(pi*sigma_y)./(1+((y_array-y0_array)/sigma_y).^2)/100;
            else
                sigma_y = sigma_y_FWHM/2.355;
                Gaussian_y = 1*exp(-((y_array-y0_array)/sigma_y).^2./2);
            end
            
            %Flat filed
            if get(h.flat_field,'value') == 1 
                Gaussian_x = zeros(1,N_Step_x);
                Gaussian_y = zeros(1,N_Step_y);
                
                size_step_x = initial_range_x/N_Step_x;
                window_beam_x = int16(eval(get(h.size_X_Beam,'String'))/size_step_x);
                
                
                size_step_y = initial_range_y/N_Step_y;
                window_beam_y = int16(eval(get(h.size_Y_Beam,'String')) / size_step_y);              
                
                Gaussian_x(N_Step_x/2-window_beam_x:N_Step_x/2+window_beam_x) = 1;
                Gaussian_y(N_Step_y/2-window_beam_y:N_Step_y/2+window_beam_y) = 1;
                
            end
%             
%             figure
%             plot(x_array,Gaussian_x)
%             hold on
%             plot(y_array,Gaussian_y)
%             
            
            % What is the realtion kx x?
            dx = x_array(1,1)-x_array(1,2);
            dkx = 2*pi/(N_Step_x*dx);
            kx_transvers_array = dkx *linspace(-N_Step_x/2,N_Step_x/2,N_Step_x);
            
            Gaussian_kx = fftshift(fft(Gaussian_x));
                        
            % What is the realtion ky y?
            dy = y_array(1,1)-y_array(1,2);
            dky = 2*pi/(N_Step_y*dy);
            ky_transvers_array = dky *linspace(-N_Step_y/2,N_Step_y/2,N_Step_y) ;
            
            Gaussian_ky = fftshift(fft(Gaussian_y));

            
            for i_y = 1:size(ky_transvers_array,2)
                Gaussian_KXY (:,i_y)= Gaussian_kx'.* Gaussian_ky(1,i_y);
                Gaussian_XY (:,i_y)= Gaussian_x'.* Gaussian_y(1,i_y);
            end
            
            if get(h.Plot_on_Check,'value') == 1
                axes(h.I_Fig_Beam_3D_F1)
                imagesc(ky_transvers_array,kx_transvers_array,abs(Gaussian_KXY).^2,'Parent',h.I_Fig_Beam_3D_F1)
            end
            %inital_beam_2D_XY = ifft(Gaussian_KXY);
            %figure
            %imagesc(y_array,x_array,abs(inital_beam_2D_XY).^2)
            
            
            %
            Gaussian_ky =[];
            Gaussian_kx =[];
            Gaussian_y =[];
            Gaussian_x =[];
            R_S_3D = [];
            
            %In the case of strain calculations
            if get(h.Strain_Crystal_Chk,'value') == 1
                
                pos_MCC = h.pos_MCC;                                        %Layer position
                Element_MCC = h.Element_MCC;                                %element
                h_MCC = h.h_MCC;    k_MCC = h.k_MCC;   l_MCC = h.l_MCC;     %hkl
                Thickness_MCC = h.Thickness_MCC;                            %Thickness of each layer
                Geometry_MCC = h.Geometry_MCC;                              %Geometry of each layer
                Transmission_MCC = h.Transmission_MCC;                      %Transmission of reflexion for each layer
                Asymmetry_MCC =h.Asymmetry_MCC;                             % Asymetry reflection fo each layer
                Normal_MCC = h.Normal_MCC;                                  %Normal for each layer
                polarization_MCC = h.polarization_MCC;                      %Polarization for each layer
                Energy_MCC = h.name_Energy;                                 %Energy for each layer
                Beam_MCC = h.name_Beam;                                     %Correction of energy for each layer
                da_MCC = h.da_MCC;  db_MCC = h.db_MCC; dc_MCC = h.dc_MCC;   %Variation of lattice parameter for each layer
                
                i_cryst_show = eval(get(h.crystal_show,'string'));          %Which layer should be shown
                
                %size(Element_MCC)
                for i_cryst = 1:size(pos_MCC,2)                    
                    element = char(Element_MCC(1,i_cryst));                                     % Element in char
                    vector_Miller = [h_MCC(1,i_cryst), k_MCC(1,i_cryst),l_MCC(1,i_cryst)];      % Miller index [h k l]
                    %call frunction Element_Bragg_temp_Gui
                    [Z_i, F0_i, FH_i, F_H_i, a_Par_i, b_Par_i, c_Par_i,alpha_Par_i,beta_Par_i,gamma_Par_i] =...
                        Element_Bragg_temp_Gui(element,h_MCC(1,i_cryst),k_MCC(1,i_cryst),l_MCC(1,i_cryst),Energy_center);
                    
                    %Structure factor for each layer
                    F0(1,i_cryst) = F0_i;  FH(1,i_cryst) = FH_i;   F_H(1,i_cryst) = F_H_i;
                    
                    %calculationof real d-spacing for each layer
                    a_Par(1,i_cryst) = a_Par_i + da_MCC(1,i_cryst)*a_Par_i;   b_Par(1,i_cryst) = b_Par_i + db_MCC(1,i_cryst)*b_Par_i;   c_Par(1,i_cryst) = c_Par_i + dc_MCC(1,i_cryst)*c_Par_i;
                    
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    % Perpendicular strain
                    strain_per = da_MCC; % need understanding of strain
                    % parallel strain
                    strain_par = db_MCC + dc_MCC; % need understanding of strain
                end                
                
                if polarization_MCC == 1
                    polarization = 's';
                else
                    polarization = 'p';
                end
                                
                Z = Element_MCC(1,1);                
                if Geometry_MCC(1,1) ==1          %LaueD = 0;
                    [R_S_3D] = Bragg_temp_Gui_3D_test_strain...
                        (a_Par,b_Par,c_Par,Energy_center,Energy_center+Energy_MCC,...
                        h_MCC,k_MCC,l_MCC,DWF,F0,FH,F_H,absor,Range_E_neg,Range_E_pos,Polarization,...
                        Asymmetry_MCC,Thickness_MCC,N_Step,Transmission_MCC,kx_transvers_array,ky_transvers_array,...
                        Normal_MCC,strain_per,strain_par,h.cluster);
                    if Transmission_MCC(1,1) == 1
                        geometry_fecho = 'FBD';
                    else
                        geometry_fecho = 'BD';
                    end
                else                                    %LaueD = 1;
                    [R_S_3D] = Laue_temp_Gui_3D_test_strain...
                        (a_Par,b_Par,c_Par,Energy_center,Energy_center+Energy_MCC,...
                        h_MCC,k_MCC,l_MCC,DWF,F0,FH,F_H,absor,Range_E_neg,Range_E_pos,Polarization,...
                        Asymmetry_MCC,Thickness_MCC,N_Step,Transmission_MCC,kx_transvers_array,ky_transvers_array,...
                        Normal_MCC,strain_per,strain_par,h.cluster);
                    Transmission_MCC(1,1)
                    if Transmission_MCC(1,1) == 1
                        geometry_fecho = 'FLD';
                    else
                        geometry_fecho = 'LD';
                    end
                end
                
                axes(h.I_Fig_Beam_3D_Section_F2)
                hold on
                size(R_S_3D)
                R_S_3D_plot(1,:) =R_S_3D(round(N_Step_y/2),round(N_Step_x/2),:);
                plot(E_Scan_plot,abs(R_S_3D_plot).^2,'Parent',h.I_Fig_Beam_3D_Section_F2,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','b')
                axis auto
                
            elseif get(h.More_Crystal_Chk,'value') == 1
                
                for i_cryst = 1:size(pos_MCC,2)
                    if polarization_MCC(1,i_cryst) == 1
                        polarization = 's';
                    else
                        polarization = 'p';
                    end
                    
                    Z = Element_MCC(1,i_cryst);
                    
                    if Geometry_MCC(1,i_cryst) ==1          %LaueD = 0;
                        [R_S_3D_SMCC] = Bragg_temp_Gui_3D_test...
                            (a_Par(1,i_cryst),b_Par(1,i_cryst),c_Par(1,i_cryst),Energy_center,Energy_center+Energy_MCC(1,i_cryst),...
                            h_MCC(1,i_cryst),k_MCC(1,i_cryst),l_MCC(1,i_cryst),DWF,F0(1,i_cryst),FH(1,i_cryst),F_H(1,i_cryst),absor,...
                            Range_E_neg,Range_E_pos,polarization,Asymmetry_MCC(1,i_cryst),Thickness_MCC(1,i_cryst),N_Step,...
                            Transmission_MCC(1,i_cryst),kx_transvers_array,ky_transvers_array,Normal_MCC(1,i_cryst),h.cluster);
                    else                                    %LaueD = 1;
                        [R_S_3D_SMCC] = Laue_temp_Gui_3D_test...
                            (a_Par(1,i_cryst),b_Par(1,i_cryst),c_Par(1,i_cryst),Energy_center,Energy_center+Energy_MCC(1,i_cryst),...
                            h_MCC(1,i_cryst),k_MCC(1,i_cryst),l_MCC(1,i_cryst),DWF,F0(1,i_cryst),FH(1,i_cryst),F_H(1,i_cryst),absor,...
                            Range_E_neg,Range_E_pos,polarization,Asymmetry_MCC(1,i_cryst),Thickness_MCC(1,i_cryst),N_Step,...
                            Transmission_MCC(1,i_cryst),kx_transvers_array,ky_transvers_array,Normal_MCC(1,i_cryst),h.cluster);
                    end
                    
                    if pos_MCC(1,i_cryst) == 1
                        R_S_3D_plot(1,:) = R_S_3D_SMCC(N_Step_y/2,N_Step_x/2,:);
                        R_S_3D_MCC(1,:,:,:) = R_S_3D_SMCC(:,:,:);
                        
                    elseif pos_MCC(1,i_cryst) == 2
                        R_S_3D_plot(2,:) = R_S_3D_SMCC(N_Step_y/2,N_Step_x/2,:);
                        R_S_3D_MCC(2,:,:,:) = R_S_3D_SMCC(:,:,:);
                        
                    elseif pos_MCC(1,i_cryst) == 3
                        R_S_3D_plot(3,:) = R_S_3D_SMCC(N_Step_y/2,N_Step_x/2,:);
                        R_S_3D_MCC(3,:,:,:) = R_S_3D_SMCC(:,:,:);
                        
                    elseif pos_MCC(1,i_cryst) == 4
                        R_S_3D_plot(4,:) = R_S_3D_SMCC(N_Step_y/2,N_Step_x/2,:);
                        R_S_3D_MCC(4,:,:,:) = R_S_3D_SMCC(:,:,:);
                        
                    elseif pos_MCC(1,i_cryst) == 5
                        R_S_3D_plot(5,:) = R_S_3D_SMCC(N_Step_y/2,N_Step_x/2,:);
                        R_S_3D_MCC(5,:,:,:) = R_S_3D_SMCC(:,:,:);
                        
                    elseif pos_MCC(1,i_cryst) == 6
                        R_S_3D_plot(6,:) = R_S_3D_SMCC(N_Step_y/2,N_Step_x/2,:);
                        R_S_3D_MCC(6,:,:,:) = R_S_3D_SMCC(:,:,:);
                        
                    elseif pos_MCC(1,i_cryst) == 7
                        R_S_3D_plot(7,:) = R_S_3D_SMCC(N_Step_y/2,N_Step_x/2,:);
                        R_S_3D_MCC(7,:,:,:) = R_S_3D_SMCC(:,:,:);
                        
                    elseif pos_MCC(1,i_cryst) == 8
                        R_S_3D_plot(8,:) = R_S_3D_SMCC(N_Step_y/2,N_Step_x/2,:);
                        R_S_3D_MCC(8,:,:,:) = R_S_3D_SMCC(:,:,:);
                        
                    end
                end                

                axes(h.I_Fig_Beam_3D_Section_F2)
                hold on
                
                for i_cryst = 1:size(pos_MCC,2)
                    plot(E_Scan_plot,abs(R_S_3D_plot(i_cryst,:)).^2,'Parent',h.I_Fig_Beam_3D_Section_F2)
                end
                
                R_S_3D_plot(1,:) =R_S_3D_MCC(i_cryst,N_Step_y/2,N_Step_x/2,:);
                plot(E_Scan_plot,abs(R_S_3D_plot).^2,'Parent',h.I_Fig_Beam_3D_Section_F2,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','b')
                axis auto
                
            else
                %Calculate the Green function using Kx and K
                if get(h.Bragg_Check,'Value') ==1 || get(h.Bragg_FBD_Check,'Value') == 1
                    [R_S_3D] = Bragg_temp_Gui_3D_test...
                        (a_Par,b_Par,c_Par,Energy_center,Energy_center,...
                        h_Miller,k_Miller,l_Miller,DWF,F0,FH,F_H,absor,...
                        Range_E_neg,Range_E_pos,Polarization,Ang_asy_Deg,Thickness,N_Step,...
                        FBD,kx_transvers_array,ky_transvers_array,crystal_orientation,h.cluster);
                    LaueD = 0;
                    if FBD == 1
                        geometry_fecho = 'FBD';
                    else
                        geometry_fecho = 'BD';
                    end
                    
                elseif get(h.Laue_Check,'Value') ==1 || get(h.Laue_FBD_Check,'Value') == 1
                    [R_S_3D] = Laue_temp_Gui_3D_test...
                        (a_Par,b_Par,c_Par,Energy_center,Energy_center,...
                        h_Miller,k_Miller,l_Miller,DWF,F0,FH,F_H,absor,...
                        Range_E_neg,Range_E_pos,Polarization,Ang_asy_Deg,Thickness,N_Step,...
                        FBD,kx_transvers_array,ky_transvers_array,crystal_orientation,h.cluster);
                    LaueD = 1;
                   if FBD == 1
                        geometry_fecho = 'FLD';
                    else
                        geometry_fecho = 'LD';
                    end
                end
                
                axes(h.I_Fig_Beam_3D_Section_F2)
                hold on
                R_S_3D_plot(1,:) = R_S_3D(N_Step_y/2,N_Step_x/2,:);
                plot(E_Scan_plot,abs(R_S_3D_plot).^2,'Parent',h.I_Fig_Beam_3D_Section_F2,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','b')
                axis auto
                
            end
            
        end
        
        %R_S_3D_plot = [];
        
        %Init table echoes fit
        Table_echoes_manual = zeros(number_Steps + 1,5,30);
        
        %init color echoes
        for i_echoes = 1:20
            color_echo(i_echoes,:) = rand(1,3);
        end
        
        %save_folder_intermediate = '/das/work/p15/p15366/RN84/SwissFEL Simulations/Calculation_Support';
        if h.cluster == true
            save_folder_intermediate = '/gpfs/exfel/data/user/rodrigfa/Temporal_data_Multi';
            save_folder_intermediate_Fit = '/gpfs/exfel/data/user/rodrigfa/Results/Fit/3D';
        else
            save_folder_intermediate = '/Users/rodrigfa/Desktop/MultiBeam_calculator/Temporal_Data';
            save_folder_intermediate_Fit = '/Users/rodrigfa/Desktop/MultiBeam_calculator/Temporal_Data/Fits';
        end
                
        h.save_folder_intermediate = save_folder_intermediate;
        
        Channel_rep = eval(get(h.Repetition_channel,'String'));
        if get(h.Save_FIT_during_simulation_3D_Check,'value') ==1
            beam_name = sprintf('beam_Sx%.1d_Sy%.1d',sigma_x_FWHM,sigma_y_FWHM);
            
            if get(h.Mono_Beam_Check,'Value') == 1
                h_Miller_Mono = eval(get(h.H_Mono,'String'));
                k_Miller_Mono = eval(get(h.K_Mono,'String'));
                l_Miller_Mono = eval(get(h.L_Mono,'String'));
                element_Mono = get(h.Element_Mono,'String');
                beam_name = sprintf('%s_Mono_%s_%d%d%d',beam_name,element_Mono,h_Miller_Mono,k_Miller_Mono,l_Miller_Mono);
            end
            
            %Only working for single case
            Name_File_echoes = sprintf('Energy_Scan_Fit_%s_%s_E%.3deV_%d%d%d_t%dum_As%.2d_polar_%s_%s_date%s.txt',geometry_fecho,element,Energy_center,h_Miller,k_Miller,l_Miller,Thickness,Ang_asy_Deg,Polarization,beam_name,datetime);
            Name_path_echoes = fullfile(save_folder_intermediate_Fit, Name_File_echoes);
%             %dlmwrite(Name_path_echoes,'','delimiter','\t','-append', 'roffset', 1);
        end
                
        for i_steps = 1: number_Steps + 1
            
            for i_average = 1: eval(get(h.Repetition_ave,'String'))
                set(h.Repetition_num ,'string',i_average)
                
                if get(h.Stop_Dynamical_3D,'Value') == 0
                    break
                    
                end
                
                if get(h.Pause_Dynamical_3D,'Value') == 1
                    pause(0.1)
                    for i_pause =1:1000
                        if get(h.Pause_Dynamical_3D,'Value') == 1
                            set (h.Status_Dynamical_3D,'String','Status: Paused','BackgroundColor',[0 0.8 0.8])
                            pause(0.1)
                        else
                            set (h.Status_Dynamical_3D,'String','Status: working','BackgroundColor',[0.5 0.5 0.5])
                        end
                    end
                else
                    %pause(0.1)
                end
                
                Energy_Bragg = Energy_center - Range_Mono_neg + Step_Range * (i_steps-1);
                set(h.Energy_point,'String',Energy_Bragg)
                
                if get(h.Range_Deg, 'Value') == 1

                    lambda_point = h.c_light * h.h_planck ./ Energy_Bragg;
                    
                    d_spacing = 1/sqrt((h_Miller/a_Par)^2 + (k_Miller/b_Par)^2+ (l_Miller/c_Par)^2);
                    d_spacing = d_spacing *1e-10;
                    
                    theta_point_rad = asin(lambda_point / (2*d_spacing));
                    %Data_Nanomax
                    theta_point = theta_point_rad * 180/pi  + Ang_asy_Deg;% + 1.587;
                    
                    Energy_array(1,i_steps) = theta_point;
                    xlabel_name = '\theta (deg)';
                else
                    Energy_array(1,i_steps) = Energy_Bragg;
                    xlabel_name = 'Energy (eV)';
                end
                
                set(h.Image_point,'String',i_steps)
                
%                 if get(h.Mono_Beam_Check,'Value') == 1
                    
                    Thickness_Mono = eval(get(h.Thickness_Mono,'string'));
                    element_Mono = get(h.Element_Mono,'String');
                    crystal_orientation_Mono = get(h.crystal_orientation_Mono,'value');
                    
                    % Perfect crystal
                    Ang_asy_Deg_Mono = eval(get(h.Asymmetry_Mono,'String'));
                    
                    %Polarization Mono
                    if get(h.Polarization_s_Mono,'Value') == 1
                        Polarization_Mono = 's';
                    elseif get(h.Polarization_p_Mono,'Value') == 1
                        Polarization_Mono = 'p';
                    end                    
                    
                    h_Miller_Mono = eval(get(h.H_Mono,'String'));
                    k_Miller_Mono = eval(get(h.K_Mono,'String'));
                    l_Miller_Mono = eval(get(h.L_Mono,'String'));
                    
                    vector_Miller_Mono = [h_Miller_Mono k_Miller_Mono l_Miller_Mono];
                    
                    [Z_Mono,F0_Mono,FH_Mono,F_H_Mono,a_Par_Mono,b_Par_Mono,c_Par_Mono,alpha_Par_Mono,beta_Par_Mono,gamma_Par_Mono]=Element_Bragg_temp_Gui...
                        (element_Mono,h_Miller_Mono,k_Miller_Mono,l_Miller_Mono,Energy_Bragg);
                    
                    set(h.f0_Mono,'String',F0_Mono)
                    set(h.f1_Mono,'String',FH_Mono)
                    set(h.f2_Mono,'String',F_H_Mono)
                    
                    if get(h.f_check_values,'Value') == 1
                        f_0 = eval(get(h.f0_Mono,'String'));
                        f_1 = eval(get(h.f1_Mono,'String'));
                        f_2 = eval(get(h.f2_Mono,'String'));
                    end
                    
                    
                    [Theta_Bragg_Mono,Chi_0_Cx_Mono,Chi_h_Cx_Mono,R_0H_S_Mono,E_Scan,G_S,t_array,k_array,Dwidth] = Bragg_temp_Gui_test...
                        (a_Par_Mono,b_Par_Mono,c_Par_Mono,Energy_Bragg,Energy_center,...
                        h_Miller_Mono,k_Miller_Mono,l_Miller_Mono,DWF,F0_Mono,FH_Mono,F_H_Mono,absor,...
                        Range_E_neg,Range_E_pos,Polarization_Mono,Ang_asy_Deg_Mono,Thickness_Mono,N_Step,...
                        0,crystal_orientation_Mono);
                    
                    R_0H_S_Mono_array(i_steps,:) = R_0H_S_Mono(1,:);
 
                    Gaussian_K = R_0H_S_Mono ;

                    
%                 end
                
                if get(h.Gaussian_Beam_3D_Check,'Value') == 1
                    
                    if get(h.Mono_Beam_Check,'Value') == 0
                        
                        WaveL_Bragg = h_planck*c_light/Energy_Bragg    ; %m
                        k0=2*pi/WaveL_Bragg;
                        rho = eval(get(h.rhoparameter,'String'));
                        %rho=5e-4; %related to number of periodes undulator 5e-4
                        sigk=rho*k0;
                        
                        % build a gaussian peak
                        Gaussian_K = exp(-0.5*(k_array-k0).*(k_array-k0)/sigk/sigk);%*2;
                        
                        %Plot the beam
                        if (get(h.Plot_on_Check,'value') == 1) && (i_average == 1)
                            axes(h.I_Fig_Beam_3D_Section_F2)
                            % k space gaussian define by machine porperties
                            plot(E_Scan_plot,Gaussian_K,'Parent',h.I_Fig_Beam_3D_Section_F2)
                            ylabel('Intensity (arb. unit)')
                            xlabel(xlabel_name)
                            axis auto
                            hold on
                            % pause(0.1)
                            
                        end
                        
                        %Check if SASE, generate sase beam
                        if get(h.Gaussian_Beam_SASE_Check,'Value') == 1
                            
                            phase = exp(1i*2*pi*random('unif',0,1,1,N_Step));
                            Gaussian_K_SASE= Gaussian_K.*phase;
                            % k space gaussian define by machine porperties
                            
                            % To time space
                            Gaussian_T = ifft(fftshift(Gaussian_K_SASE));
                            
                            %Definition time window
                            lt = eval(get(h.size_T_Beam,'String'))*1e-15; %seg
                            dt = t_array(1,2)- t_array(1,1);
                            Nsam=floor(lt/dt);
                            if get(h.Temporal_SASE_Check,'value') ==0
                            %Heaviside function
                                Gaussian_T(Nsam:end)=0;
                            else
                                %Gaussian decay
                                temporal_shape_gaussian = exp(-0.5*(t_array).*(t_array)/lt/lt);
                                Gaussian_T = Gaussian_T .* temporal_shape_gaussian;
                            end
                            
                            %Back to k space
                            Gaussian_K_SASE = fftshift(fft(Gaussian_T));
                            
                            %Plot sase beam
                            if get(h.Plot_on_Check,'value') == 1
                                axes(h.I_Fig_Beam_3D_Section_F2)
                                %plot(E_Scan_plot,abs(Gaussian_k).^2,'Parent',h.I_Fig_Beam_3D_Section_F2)
                                hold on
                                %plot(E_Scan_plot,abs(Gaussian_K).^2,'Parent',h.I_Fig_Beam_3D_Section_F2)
                                plot(E_Scan_plot,abs(Gaussian_K_SASE).^2,'Parent',h.I_Fig_Beam_3D_Section_F2,'color',[218 218 218]/255)
                                
                                axes(h.I_Fig_Beam_3D_convolution_F8)
                                plot(t_array,Gaussian_T,'Parent',h.I_Fig_Beam_3D_convolution_F8)
                                plot(t_array,abs(Gaussian_T).^2,'Parent',h.I_Fig_Beam_3D_convolution_F8,'color',[218 218 218]/255)
                                %  pause(.1)
                            end
                            
                            Gaussian_K_all(i_steps,:) = Gaussian_K_SASE;
                            Gaussian_K_all_save(i_average,:) = abs(Gaussian_K_SASE).^2;
                            %G_mono = R_S.*Gaussian_K;
                            G_mono = Gaussian_K_SASE;
                            
                        else %No sase
                            
                            Gaussian_K_all(i_steps,:) = Gaussian_K;
                            Gaussian_K_all_save(i_average,:) = Gaussian_K;
                            %G_mono = R_S.*Gaussian_K;
                            G_mono = Gaussian_k;
                            
                        end
                    else %Mono Beam, not gaussian or sase
                        if get(h.Plot_on_Check,'value') == 1
                            axes(h.I_Fig_Beam_3D_Section_F2)
                            hold off
                            plot(E_Scan_plot,abs(R_0H_S_Mono).^2,'Parent',h.I_Fig_Beam_3D_Section_F2)
                            hold on
                            plot(E_Scan_plot,abs(R_S_3D_plot).^2,'Parent',h.I_Fig_Beam_3D_Section_F2,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','b')
                            title_Mono = strcat('Monochromator:(',get(h.H_Mono,'String'),',',get(h.K_Mono,'String'),',',get(h.L_Mono,'String'),')');
                            title(title_Mono)
                            ylabel('Intensity (arb. unit)')
                            xlabel(xlabel_name)
                            axis auto
                            hold on
                        end
                                            
                        axes(h.I_Fig_Beam_3D_Section_F2)
                        hold on
                        plot(E_Scan_plot,abs(Gaussian_K).^2,'Parent',h.I_Fig_Beam_3D_Section_F2)
                        %  pause(0.1)
                    
                    
                        Gaussian_K_all(i_steps,:) = Gaussian_K;
                        Gaussian_K_all_save(i_average,:) = Gaussian_K;
                        G_mono =  Gaussian_K;
                        
                    end
                    
                    %Once calculated the incoming beam we build the 3D
                    %matrix
                    %size(Gaussian_KXY)
                    %size(G_mono)
                    for i_x = 1 :size(E_Scan_plot,2) 
                        Gaussian_K_3D (:,:,i_x)= Gaussian_KXY'.*G_mono(1,i_x);
                    end
                    
                    %Gaussian_RXY = ifft(Gaussian_KXY);
                    %figure(1)
                    %imagesc(x_array,y_array,abs(Gaussian_RXY).^2)
                    
                    %size(Gaussian_K_3D)
                    
                    if get(h.Plot_on_Check,'value') == 1
                        axes(h.I_Fig_Beam_3D_F1)
                        imagesc(kx_transvers_array,ky_transvers_array,sum(abs(Gaussian_K_3D).^2,3),'Parent',h.I_Fig_Beam_3D_F1)
                        
                        Gaussian_R0_3D = (ifftn(Gaussian_K_3D));
                        
                        Gaussian_K_plot_t(:,:) = sum(abs(Gaussian_R0_3D).^2,1);
                        
                        %                         figure
                        %                         %time shape of the beam k0
                        %                         Gaussian_K_plot_t(:,:) = sum(abs(Gaussian_R0_3D).^2,3);
                        %                         subplot(2,1,1)
                        %                         imagesc(x_array,y_array,Gaussian_K_plot_t)
                        %                         Gaussian_K_plot_t = [];
                        %                         colormap hot
                        %
                        %                         %time shape of the beam k0
                        %                         Gaussian_K_plot_t(:,:) = sum(abs(Gaussian_R0_3D).^2,1);
                        %                         subplot(2,1,2)
                        %                         imagesc(t_array,x_array,Gaussian_K_plot_t)
                        
                        if get(h.Gaussian_Beam_SASE_Check,'Value') == 1
                            %time shape of the beam k0
                            axes(h.I_Fig_Beam_3D_reflectivity_F7)
                            hold off
                            imagesc(t_array *1e15,x_array * 1e6,Gaussian_K_plot_t,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)
                            xlabel('time(fs)')
                            ylabel('um')
                            
                            Gaussian_K_plot_t1D(1,:) = sum(Gaussian_K_plot_t,1);
                            axes(h.I_Fig_Beam_3D_convolution_F8)
                            plot(t_array *1e15,Gaussian_K_plot_t1D,'Parent',h.I_Fig_Beam_3D_convolution_F8,'color',[218 218 218]/255)
                            xlabel('time(fs)')
                            Gaussian_K_plot_t1D_array(i_average,:) = Gaussian_K_plot_t1D(1,:);
                            hold on
                            Gaussian_K_plot_t = [];
                            Gaussian_K_plot_t1D = [];
                        end
                    end
                    
                    if get(h.Pause_Dynamical_3D,'Value') == 1
                        pause(0.1)
                        for i_pause =1:1000
                            if get(h.Pause_Dynamical_3D,'Value') == 1
                                pause(0.1)
                            else
                            end
                        end
                    else
                        pause(0.01)
                    end
                    
                    if get(h.More_Crystal_Chk,'value') == 1
                        
                        for i_cryst = 1:size(pos_MCC,2)
                            R_S_3D(:,:,:) = R_S_3D_MCC(i_cryst,:,:,:);
                            
                            % Convolute both signals R MONO and R crystal in 2D                            
                            R_S_G = R_S_3D .* Gaussian_K_3D;
                            
                            
                            % Gaussian_K_3D = R_S_G;
                            %   Gaussian_K_3D = [];
                            
                            if get(h.Plot_on_Check,'value') == 1
                                axes(h.I_Fig_Beam_3D_F1)
                                imagesc(x_array,y_array,sum(abs(R_S_G).^2,3),'Parent',h.I_Fig_Beam_3D_F1)
                            end
                            
                            if get(h.Shift_x,'Value') == 1
                                R_S_G = fftshift(R_S_G,1);
                            end
                            if get(h.Shift_y,'Value') == 1
                                R_S_G = fftshift(R_S_G,2);
                            end
                            if get(h.Shift_t2,'Value') == 1
                                R_S_G = fftshift(R_S_G,3);
                            end
                            Gaussian_R = (ifftn(R_S_G));
                            
                            
                            
                            %Check of position of first maxima and center the p
                            Gaussian_R_t_plot(1,:) = sum(sum(abs(Gaussian_R).^2,1),2);  
                            [pks,locs,w,p] = findpeaks(Gaussian_R_t_plot,'minpeakprominence',1e-32);
                            
                            [pksmax,indexmax] = max(pks);
                            
%(locs(indexmax) < size(t_array,2)/4)
%(locs(indexmax) > 3 * size(t_array,2)/4)
                        %    if (locs(indexmax) < size(t_array,2)/4) ||(locs(indexmax) > 3 * size(t_array,2)/4)
                                Gaussian_R = fftshift(Gaussian_R,3);
                      %      end

                            
                            %Check of position of first maxima and center the p
                            Gaussian_R_x_plot = sum(sum(abs(Gaussian_R).^2,1),3);                            
                            [pks,locs,w,p] = findpeaks(Gaussian_R_x_plot,'minpeakprominence',1e-32);
                            
                            [pksmax,indexmax] = max(pks);
                            
                            if (get(h.Laue_Check,'value') == 1) %Laue is different case as it is symmetric
                            else
                                %if locs(indexmax) > locs(indexmin)
                                if locs(indexmax) > size(x_array,2)/2
                                    Gaussian_R = fftshift(Gaussian_R,2);
                                end
                            end
                                
                                                        
                            if get(h.Plot_on_Check,'value') == 1
                                %Plot time x
                                axes(h.I_Fig_Beam_3D_Section_T_F3)
                                Gaussian_R_plot(:,:) = sum(abs(Gaussian_R).^2,1);
                                imagesc(t_array * 1e15,x_array * 1e6,Gaussian_R_plot,'Parent',h.I_Fig_Beam_3D_Section_T_F3)
                                Gaussian_R_plot = [];
                                xlabel('fs')
                                ylabel('um')
                                
                                %plot detector plane
                                axes(h.I_Fig_Beam_3D_GK_F4)
                                Gaussian_R_plot(:,:) = sum(abs(Gaussian_R).^2,3);
                                imagesc(x_array * 1e6,y_array * 1e6,Gaussian_R_plot,'Parent',h.I_Fig_Beam_3D_GK_F4)
                                Gaussian_R_plot = [];
                                xlabel('um')
                                ylabel('um')
                                
                                %plot Autosave detector plane
                                axes(h.I_Fig_Beam_3D_GK_F4_s2)
                                Gaussian_R_plot(:,:) = sum(abs(Gaussian_R).^2,3);
                                imagesc(x_array * 1e6,y_array * 1e6,Gaussian_R_plot,'Parent',h.I_Fig_Beam_3D_GK_F4_s2)
                                Gaussian_R_plot = [];
                                xlabel('um')
                                ylabel('um')

                            end
                            
                            Gaussian_K_3D = fftshift(fftn(Gaussian_R));
                            
                        end
                        Gaussian_K_3D = [];
                        
                        Intensity_array(1,i_steps) = sum(sum(sum(abs(Gaussian_R).^2,1),2),3);
                        
                        if get(h.Plot_on_Check,'value') == 1
                            axes(h.I_Fig_Beam_3D_mono_F5)
                            Intensityplot_array(i_steps,:) = sum(sum(abs(Gaussian_R).^2,1),2);
                            plot_array = t_array * 1e15;
                            plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_mono_F5,'color',[218 218 218]/255)
                            hold on
                            Intensityplot_array_save_t(i_average,:) = Intensityplot_array(i_steps,:);
                            Intensityplot_array = [];
                            plot_array = [];
                            xlabel('fs')
                            
                            axes(h.I_Fig_Beam_3D_profile_F6)
                            Intensityplot_array(i_steps,:) = sum(sum(abs(Gaussian_R).^2,1),3);
                            plot_array = x_array * 1e6;
                            plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_profile_F6,'color',[218 218 218]/255)
                            Intensityplot_array_save_x(i_average,:) = Intensityplot_array(i_steps,:);
                            hold on
                            Intensityplot_array = [];
                            plot_array = [];
                            xlabel('um') 

                        end
                        
                    else
                        
                        % Convolute both signals R MONO and R crystal in 2D
                        R_S_G = R_S_3D .* Gaussian_K_3D;
                                                
                        Gaussian_K_3D = [];
                        
                        if get(h.Plot_on_Check,'value') == 1
                            axes(h.I_Fig_Beam_3D_F1)
                            imagesc(x_array,y_array,sum(abs(R_S_G).^2,3),'Parent',h.I_Fig_Beam_3D_F1)
                        end
                        
                        
                        if get(h.Shift_x,'Value') == 1
                            R_S_G = fftshift(R_S_G,1);
                        end
                        if get(h.Shift_y,'Value') == 1
                            R_S_G = fftshift(R_S_G,2);
                        end
                        if get(h.Shift_t2,'Value') == 1
                            R_S_G = fftshift(R_S_G,3);
                        end
                        
                        Gaussian_R = fftshift(ifftn(R_S_G),3);
                        
                        Gaussian_R = Gaussian_R * sqrt(Flux_Beam);
                        
                        if get(h.XY_plain_3D_Check,'Value') == 1
                            %Check of position of first maxima and center the p
                            Gaussian_R_x_plot = sum(sum(abs(Gaussian_R).^2,1),3);
                            
                            [pks,locs,w,p] = findpeaks(Gaussian_R_x_plot,'minpeakprominence',1e-8);
                            
                            [pksmax,indexmax] = max(pks);
                            [pksmin,indexmin] = min(pks);
                            
                            if (get(h.Laue_Check,'value') == 1) %Laue is different case as it is symmetric
                            else
                                if locs(indexmax) > size(x_array,2)/2
                                    Gaussian_R = fftshift(Gaussian_R,2);
                                end
                            end
                            
                        elseif get(h.TX_plain_3D_Check,'Value')
                            
                            %Check of position of first maxima and center the p
                            Gaussian_R_x_plot = sum(sum(abs(Gaussian_R).^2,1),3);
                            
                            [pks,locs,w,p] = findpeaks(Gaussian_R_x_plot,'minpeakprominence',1e-8);
                            
                            [pksmax,indexmax] = max(pks);
                            [pksmin,indexmin] = min(pks);
                            
                            if (get(h.Laue_Check,'value') == 1) %Laue is different case as it is symmetric
                            else
                                %if locs(indexmax) > locs(indexmin)
                                if locs(indexmax) > size(x_array,2)/2
                                    Gaussian_R = fftshift(Gaussian_R,2);
                                end
                            end
                            
                        elseif get(h.TY_plain_3D_Check,'Value') == 1 
                            %Check of position of first maxima and center the p
                            Gaussian_R_y_plot = sum(sum(abs(Gaussian_R).^2,1),2);
                            
                            [pks,locs,w,p] = findpeaks(Gaussian_R_y_plot,'minpeakprominence',1e-8);
                            
                            [pksmax,indexmax] = max(pks);
                            [pksmin,indexmin] = min(pks);
                            
                            if (get(h.Laue_Check,'value') == 1) %Laue is different case as it is symmetric
                            else
                                %if locs(indexmax) > locs(indexmin)
                                if locs(indexmax) > size(y_array,2)/2
                                    Gaussian_R = fftshift(Gaussian_R,2);
                                end
                            end                            
                        end
                        
%% Plot                 
                        if get(h.Plot_on_Check,'value') == 1
                            TY_plot = get(h.TY_plain_3D_Check,'Value');
                            TX_plot = get(h.TX_plain_3D_Check,'Value');
                            XY_plot = get(h.XY_plain_3D_Check,'Value');
                            
                            
                            if get(h.TX_plain_3D_Check,'Value') == 1 %Time and Transverse coordinates
                                %Sum in th third variable, y
                                Gaussian_R_plot(:,:) = sum(abs(Gaussian_R).^2,1);
                                %phase plot
                                Gaussian_R_2D(:,:) = sum(Gaussian_R,1);
                                %calculating phase
                                %phase_R_plot = atan2(imag(Gaussian_R_2D),real(Gaussian_R_2D));
                                
                                %% Try to plot both ampl and Phase combined
                                modeGaus = abs(Gaussian_R_2D);
                                phaseGaus = angle(Gaussian_R_2D);
                                
                                nmodeGaus = modeGaus./max(modeGaus,[],'all');
                                
                                mp_hsv = zeros([size(Gaussian_R_2D) 3]);
                                
                                mp_hsv(:,:,1) = mod(phaseGaus,2*pi)/(2*pi);
                                mp_hsv(:,:,2) = 1;
                                mp_hsv(:,:,3) = nmodeGaus;
                                phase_R_plot= hsv2rgb(mp_hsv);                                

                                
                                plot_array1 = t_array * 1e15; % change to fs
                                plot_array2 = x_array * 1e6; % change to um
                                
                                %plot amplitude and phase together
                                %figure
                                %imagesc(plot_array1,plot_array2,AP_plot)
                                
                                %plot Intensity
                                axes(h.I_Fig_Beam_3D_GK_F4)
                                imagesc(plot_array1,plot_array2,Gaussian_R_plot,'Parent',h.I_Fig_Beam_3D_GK_F4)                                
                                xlabel('Time(fs)')
                                ylabel('Transverse displacement (\mum)')
                                title('Intensity')
                                %set(h.I_Fig_Beam_3D_GK_F4,'colorscale','log')

                                %plot Autosave detector plane
                                axes(h.I_Fig_Beam_3D_GK_F4_s2)
                                imagesc(plot_array1,plot_array2,Gaussian_R_plot,'Parent',h.I_Fig_Beam_3D_GK_F4_s2)                                
                                xlabel('Time(fs)')
                                ylabel('Transverse displacement (\mum)')
                                title('Intensity')
                                %set(h.I_Fig_Beam_3D_GK_F4_s2,'colorscale','log')
                                
                                %plot phase
                                axes(h.I_Fig_Beam_3D_Section_T_F3)
                                hold off
                                imagesc(plot_array2,plot_array1,phase_R_plot,'Parent',h.I_Fig_Beam_3D_Section_T_F3)
                                xlabel('Time(fs)')
                                ylabel('Transverse displacement (\mum)')
                                
%                                 %Center time
%                                 Intensityplot_array1(1,:) = sum(sum(abs(Gaussian_R).^2,1),2);
%                                 
%                                 [pks,locs,w,p] = findpeaks(Intensityplot_array1(1,:),plot_array1,'minpeakprominence',1e-32);
%                                 [pksmax1,indexmax] = max(pks);
%                                 if i_steps == 1
%                                     Initial_pksmax1 = pksmax1;
%                                     Inital_locs1 = locs1(1,indexmax);
%                                 end
%                                 t_array_center = plot_array1 - Inital_locs1;
%                                 
%                                 %Center Transverse
%                                 Intensityplot_array2(1,:) = sum(sum(abs(Gaussian_R).^2,1),3);
%                                 
%                                 [pks2,locs2,w,p] = findpeaks(Intensityplot_array2(1,:),plot_array2,'minpeakprominence',1e-32);
%                                 [pksmax2,indexmax] = max(pks2);
%                                 if i_steps == 1
%                                     Initial_pksmax2 = pksmax2;
%                                     Inital_locs2 = locs2(1,indexmax);
%                                 end
%                                 x_array_center = plot_array2 - Inital_locs2;
%                                 %plot amplitud
%                                 imagesc(x_array_center,t_array_center,Gaussian_R_plot','Parent',h.I_Fig_Beam_3D_GK_F4)
%                                 
%                                 %plot phase
%                                 imagesc(x_array_center,t_array_center,phase_R_plot,'Parent',h.I_Fig_Beam_3D_Section_T_F3)
%                                 
                            elseif get(h.TY_plain_3D_Check,'Value') == 1 %Time and perpendicular coordinates
                                
                                axes(h.I_Fig_Beam_3D_GK_F4)
                                %Sum in th third variable, x
                                Gaussian_R_plot(:,:) = sum(abs(Gaussian_R).^2,2);
                                %phase plot
                                Gaussian_R_2D(:,:) = sum(Gaussian_R,2);
                                %calculating phase
                                %phase_R_plot = atan2(imag(Gaussian_R_2D),real(Gaussian_R_2D));
                                
                                 %% Try to plot both ampl and Phase combined
                                modeGaus = abs(Gaussian_R_2D);
                                phaseGaus = angle(Gaussian_R_2D);
                                
                                nmodeGaus = modeGaus./max(max(modeGaus,1),2);
                                
                                mp_hsv = zeros([size(Gaussian_R_2D) 3]);
                                
                                mp_hsv(:,:,1) = mod(phaseGaus,2*pi)/(2*pi);
                                mp_hsv(:,:,2) = 1;
                                mp_hsv(:,:,3) = nmodeGaus;
                                phase_R_plot= hsv2rgb(mp_hsv);
                                
                                plot_array1 = t_array * 1e15; % change to fs
                                plot_array2 = y_array * 1e6; % change to um
                                
                                %plot amplitude and phase togethers
                                %figure
                                %imagesc(plot_array1,plot_array2,AP_plot)
                                
                                %Center time
                                Intensityplot_array1(1,:) = sum(sum(abs(Gaussian_R).^2,1),2);
                                
                                [pks1,locs1,w,p] = findpeaks(Intensityplot_array1(1,:),plot_array1,'minpeakprominence',1e-18);
                                [pksmax1,indexmax] = max(pks1);
                                 if i_steps == 1
                                    Initial_pksmax1 = pksmax1;
                                    Inital_locs1 = locs1(1,indexmax);
                                end
                                t_array_center = plot_array1 - Inital_locs1;
                                
                                %Center Perpendicular
                                Intensityplot_array2(1,:) = sum(sum(abs(Gaussian_R).^2,2),3);
                                [pks2,locs2,w,p] = findpeaks(Intensityplot_array2(1,:),plot_array2,'minpeakprominence',1e-18);
                                [pksmax2,indexmax] = max(pks2);
                                if i_steps == 1
                                    Initial_pksmax2 = pksmax2;
                                    Inital_locs2 = locs2(1,indexmax);
                                end
                                y_array_center = plot_array2 - Inital_locs2;
                                %plot Intensity
                                imagesc(t_array_center,y_array_center,Gaussian_R_plot,'Parent',h.I_Fig_Beam_3D_GK_F4)
                                xlabel('Time(fs)')
                                ylabel('Transverse displacement (\mum)')
                                title('Intensity')
                                
                                %plot phase
                                axes(h.I_Fig_Beam_3D_Section_T_F3)
                                hold off
                                imagesc(t_array_center,y_array_center,phase_R_plot,'Parent',h.I_Fig_Beam_3D_Section_T_F3)
                                xlabel('Time(fs)')
                                ylabel('Transverse displacement (\mum)')
                                
                                
                            elseif get(h.XY_plain_3D_Check,'Value') == 1 %Transvese and perpendicular coordinates
                                axes(h.I_Fig_Beam_3D_GK_F4)
                                %Sum in th third variable, t
                                Gaussian_R_plot(:,:) = abs(sum(Gaussian_R,3)).^2;
                                
                                %phase plot
                                Gaussian_R_2D(:,:) = sum(Gaussian_R,3);
                                %calculating phase
                                %phase_R_plot = atan2(imag(Gaussian_R_2D),real(Gaussian_R_2D));
                                %phase_R_plot = angle(Gaussian_R_2D);
                                
                                                                %% Try to plot both ampl and Phase combined
                                modeGaus = abs(Gaussian_R_2D);
                                phaseGaus = angle(Gaussian_R_2D);
                                
                                nmodeGaus = modeGaus./max(modeGaus,[],'all');
                                
                                mp_hsv = zeros([size(Gaussian_R_2D) 3]);
                                
                                mp_hsv(:,:,1) = mod(phaseGaus,2*pi)/(2*pi);
                                mp_hsv(:,:,2) = 1;
                                mp_hsv(:,:,3) = nmodeGaus;
                                
                                phase_R_plot= hsv2rgb(mp_hsv);
                                
                                %figure
                                %imagesc(x_array_center,y_array_center,imphaseandamp)
                                
                                %Center Transverse
                                Intensityplot_array1(1,:) = sum(sum(abs(Gaussian_R).^2,1),3);
                                plot_array1 = x_array * 1e6; % change to um
                                [pks1,locs1,w,p] = findpeaks(Intensityplot_array1(1,:),plot_array1,'minpeakprominence',1e-30);
                                [pksmax1,indexmax] = max(pks1);
                                if i_steps == 1
                                    Initial_pksmax1 = pksmax1;
                                    Inital_locs1 = locs1(1,indexmax);
                                end
                                x_array_center = plot_array1 - Inital_locs1;
                                
                                %Center Perpendicular
                                Intensityplot_array2(1,:) = sum(sum(abs(Gaussian_R).^2,2),3);
                                plot_array2 = y_array * 1e6; % change to um
                                [pks2,locs2,w,p] = findpeaks(Intensityplot_array2(1,:),plot_array2,'minpeakprominence',1e-30);
                                [pksmax2,indexmax] = max(pks2);
                                if i_steps == 1
                                    Initial_pksmax2 = pksmax2;
                                    Inital_locs2 = locs2(1,indexmax);
                                end
                                y_array_center = plot_array2 - Inital_locs2;
                                %plot amplitud
                                imagesc(x_array_center,y_array_center,Gaussian_R_plot,'Parent',h.I_Fig_Beam_3D_GK_F4)  
                                colormap hot
                                xlabel('X detector (\mum)')
                                ylabel('Y detector (\mum)')
                                title('Intensity')
                                
                                %plot amplitud
                                imagesc(x_array_center,y_array_center,Gaussian_R_plot,'Parent',h.I_Fig_Beam_3D_GK_F4_s2)  
                                colormap hot
                                xlabel('X detector (\mum)')
                                ylabel('Y detector (\mum)')
                                title('Intensity')
                                
                                
                                %plot phase
                                axes(h.I_Fig_Beam_3D_Section_T_F3)
                                hold off
                                imagesc(x_array_center,y_array_center,phase_R_plot,'Parent',h.I_Fig_Beam_3D_Section_T_F3)
                                xlabel('X detector (\mum)')
                                ylabel('Y detector (\mum)')
                                
                                %Try to plot colorbar for coplex plot
                                %complex_number_plot = load('complex_number_plot.mat')
                                %imagesc(ax2,complex_number_plot.axis_x_complex,flip(complex_number_plot.axis_y_complex),complex_number_plot.rect_colorbar_complex_short3)

                            end

                            
                            %Plot the sections
                            if (get(h.Time_um_F4_Check,'Value') == 1)% time                                
                                
                                %Sume amplitud in the other 2 directions x and y
                                Intensityplot_array(i_steps,:) = sum(sum(abs(Gaussian_R).^2,1),2);                                
                                %sume phase in other two directions
                                %sume phase in other two directions
                                Gaussian_R_1D = sum(sum(Gaussian_R,1),2);
                                Phase_R_array(i_steps,:) = atan2(imag(Gaussian_R_1D),real(Gaussian_R_1D));
                                
                                %select array to plot
                                plot_array = t_array * 1e15; % change to fs
                                
                                %Center
%                                 figure
%                                 findpeaks(Intensityplot_array(i_steps,:),plot_array,'minpeakprominence',1e-8)                                
                                [pks,locs,w,p] = findpeaks(Intensityplot_array(i_steps,:),plot_array,'minpeakprominence',1e-8);
                                [pksmax,indexmax] = max(pks);
                                if i_steps == 1
                                    Initial_pksmax = pksmax;
                                    Inital_locs = locs(1,indexmax);
                                end
                                %plot_array = plot_array-Inital_locs; 
                                %Intensityplot_array(i_steps,:) = Intensityplot_array(i_steps,:) / Initial_pksmax;   
                                
                                %find peaks for fitting
%                                 figure
%                                 findpeaks(Intensityplot_array(i_steps,:),plot_array,'minpeakprominence',5e-8)
                                [pks,locs,w,p] = findpeaks(Intensityplot_array(i_steps,:),plot_array,'minpeakprominence',5e-8);
%                                 
                                %plot one section
                                axes(h.I_Fig_Beam_3D_profile_F6)
                                hold off
                                plot(plot_array',Intensityplot_array(i_steps,:) ,'Parent',h.I_Fig_Beam_3D_profile_F6)
%                                 hold on 
%                                 findpeaks(Intensityplot_array(i_steps,:),plot_array,'minpeakprominence',5e-5)
                                set(h.I_Fig_Beam_3D_profile_F6,'Yscale','log')
                                axis auto
                                
                                axes(h.I_Fig_Beam_3D_mono_F5)
                                hold off
                                %plot one section
                                plot(plot_array',Phase_R_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_mono_F5)
                                hold on
                                %findpeaks(Phase_R_array(i_steps,Init_range_fit:End_range_fit),plot_array(1,(Init_range_fit:End_range_fit)),'minpeakprominence',1e-18)
                                %set(h.I_Fig_Beam_3D_mono_F5,'Yscale','log')
                                xlim auto%([-5 25])
                                ylim auto
                                ylabel('Intensity (arb. unit)')
                                xlabel('Transverse displacement (\mum)')
                                
%                                 video_phase_onebyone(i_steps) = getframe(h.I_Fig_Beam_3D_mono_F5);
                                                                
                            elseif get(h.Transverse_um_F4_Check,'Value') == 1%Transvese direction                                
                                                              
                                %Sume in the other 2 directions y and t
                                Intensityplot_array(i_steps,:) = sum(sum(abs(Gaussian_R).^2,1),3);
                                %sume phase in other two directions
                                Gaussian_R_1D = sum(sum(Gaussian_R,1),3);
                                Phase_R_array(i_steps,:) = atan2(imag(Gaussian_R_1D),real(Gaussian_R_1D));
                                plot_array = x_array * 1e6; % change to um
                                
                                %Center
                                [pks,locs,w,p] = findpeaks(Intensityplot_array(i_steps,:),plot_array,'minpeakprominence',1e-32);
                                [pksmax,indexmax] = max(pks);
                                                                                                
                                pks_true =  true;
                                for i_pks = 1: size(pks,2)
                                    if pks_true 
                                        if 10 * pks(i_pks) > pksmax
                                            indexmax = i_pks;                                       
                                            pks_true = false;
                                        end
                                   end
                                end
                                
                                if i_steps == 1
                                    Initial_pksmax = pksmax;
                                    Inital_locs = locs(1,indexmax);
                                end
                                
                                plot_array = plot_array - Inital_locs;
                                range_plot_fit(1,:) = find(plot_array>-2);
                                Init_range_fit = range_plot_fit(1,1);
                                End_range_fit = range_plot_fit(1,size(range_plot_fit,2));
                                
                                Intensityplot_array(i_steps,:) = Intensityplot_array(i_steps,:);
                                
                                %find peaks for fitting
                                [pks,locs,w,p] = findpeaks(Intensityplot_array(i_steps,Init_range_fit:End_range_fit),plot_array(1,(Init_range_fit:End_range_fit)),'minpeakprominence',1e-8);

%                                 %plot all section
%                                 axes(h.I_Fig_Beam_3D_profile_F6)                                
%                                 Intensityplot_array1(1,:) = Intensityplot_array(i_steps,:) + (i_steps) /10;
%                                 plot(plot_array',Intensityplot_array1,'Parent',h.I_Fig_Beam_3D_profile_F6)
%                                 hold on
%                                 ylabel('Intensity (arb. unit)')
%                                 xlabel('Transverse displacement (\mum)')
%                                 xlim ([-5 50])
%                                 ylim auto
%                                 video_all(i_steps) = getframe(h.I_Fig_Beam_3D_profile_F6);
                                
                                axes(h.I_Fig_Beam_3D_profile_F6)
                                hold off
                                %plot one section
                                plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_profile_F6)
                                hold on
                                findpeaks(Intensityplot_array(i_steps,Init_range_fit:End_range_fit),plot_array(1,(Init_range_fit:End_range_fit)),'minpeakprominence',1e-8)
                                set(h.I_Fig_Beam_3D_profile_F6,'Yscale','linear')
                                xlim ([eval(get(h.F6_x1_value,'string')) eval(get(h.F6_x2_value,'string'))])
                                ylim auto
                                ylabel('Intensity (arb. unit)')
                                xlabel('Transverse displacement (\mum)')
                                
%                                 video_onebyone(i_steps) = getframe(h.I_Fig_Beam_3D_profile_F6);
                                
                                axes(h.I_Fig_Beam_3D_mono_F5)
                                hold off
                                %plot one section
                                plot(plot_array',Phase_R_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_mono_F5)
%                                 hold on
%                                 findpeaks(Phase_R_array(i_steps,Init_range_fit:End_range_fit),plot_array(1,(Init_range_fit:End_range_fit)),'minpeakprominence',1e-8)
                                %set(h.I_Fig_Beam_3D_mono_F5,'Yscale','log')
                                xlim auto%([-5 25])
                                ylim auto
                                ylabel('Intensity (arb. unit)')
                                xlabel('Transverse displacement (\mum)')
                                
%                                 video_phase_onebyone(i_steps) = getframe(h.I_Fig_Beam_3D_mono_F5);
                               
                            elseif (get(h.Transversey_um_F4_Check,'Value') == 1) %Other direction
                                
                                %Sume in the other 2 directions x and t
                                Intensityplot_array(i_steps,:) = sum(sum(abs(Gaussian_R).^2,2),3);
                                
                                %sume phase in other two directions
                                %sume phase in other two directions
                                Gaussian_R_1D = sum(sum(Gaussian_R,2),3);
                                Phase_R_array(i_steps,:) = atan2(imag(Gaussian_R_1D),real(Gaussian_R_1D));
                                
                                
                                plot_array = y_array * 1e6;% change to um
                                
                               %Center
                                [pks,locs,w,p] = findpeaks(Intensityplot_array(i_steps,:),plot_array,'minpeakprominence',1e-6);
                                [pksmax,indexmax] = max(pks);
                                 if i_steps == 1
                                    Initial_pksmax = pksmax;
                                    Inital_locs = locs(1,indexmax);
                                end
                                plot_array = plot_array-Inital_locs;                                 
                                Intensityplot_array(i_steps,:) = Intensityplot_array(i_steps,:) / Initial_pksmax;
                                
                                %find peaks for fitting
                                [pks,locs,w,p] = findpeaks(Intensityplot_array(i_steps,:),plot_array,'minpeakprominence',5e-5);
                                
%                                 %all Scan sections
%                                 axes(h.I_Fig_Beam_3D_profile_F6)
%                                 Intensityplot_array1(1,:) = Intensityplot_array(i_steps,:) + (i_steps)/10;
%                                 plot(plot_array'+i_steps,Intensityplot_array1,'Parent',h.I_Fig_Beam_3D_profile_F6)
%                                 hold on
                                
                                axes(h.I_Fig_Beam_3D_profile_F6)
                                hold off
                                %plot one section
                                plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_profile_F6)
                                hold on 
                                findpeaks(Intensityplot_array(i_steps,:),plot_array,'minpeakprominence',5e-5)                               
                                xlim ([-5 80])
                                ylim auto
                                
                                axes(h.I_Fig_Beam_3D_mono_F5)
                                hold off
                                %plot one section
                                plot(plot_array',Phase_R_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_mono_F5)
                                hold on
                                findpeaks(Phase_R_array(i_steps,Init_range_fit:End_range_fit),plot_array(1,(Init_range_fit:End_range_fit)),'minpeakprominence',1e-8)
                                %set(h.I_Fig_Beam_3D_mono_F5,'Yscale','log')
                                xlim ([-5 80])
                                ylim auto
                                ylabel('Intensity (arb. unit)')
                                xlabel('Transverse displacement (\mum)')
                                
%                                 video_phase_onebyone(i_steps) = getframe(h.I_Fig_Beam_3D_mono_F5);
                            end
                            
                            %if get(h.Transverse_um_F4_Check,'Value') == 1%Transvese direction
                                %number of echoes save
                                if size(locs,2) > 10
                                    length_table = 10;
                                else
                                    length_table = size(locs,2) ;
                                end
                                
                                axes(h.I_Fig_Beam_3D_profile_F6)
                                hold on
                                %Calculate area below fitting for each echoe
                                for i_echoes = 1:length_table
                                    Intensity_area(i_echoes,:) = pks(1,i_echoes) .* exp(-((plot_array - locs(1,i_echoes))./(w(1,i_echoes)/2)).^2);
                                    Intensity_area_plot(1,:) = Intensity_area(i_echoes,:);
                                    
                                    plot(plot_array,Intensity_area_plot,'k')
                                end
                                
                                %able constructions
                                Number_echo = linspace(1,size(locs,2), size(locs,2))';
                                Position_echo = locs'-locs(1,1);
                                Intensity_echo = pks';
                                Width_echo = w';
                                
                                for i_echoes = 1:length_table
                                    Table_echoes_manual(i_steps,1,i_echoes) = Number_echo (i_echoes,1);
                                    Table_echoes_manual(i_steps,2,i_echoes) = Position_echo (i_echoes,1);
                                    Table_echoes_manual(i_steps,3,i_echoes) = Intensity_echo (i_echoes,1);
                                    Table_echoes_manual(i_steps,4,i_echoes) = Width_echo (i_echoes,1);
                                    %Gussian
                                    Table_echoes_manual(i_steps,5,i_echoes) = sum(Intensity_area(i_echoes,:));
                                end
                                Table_echoes_manual_actual (:,:) = Table_echoes_manual(i_steps,:,:);
                                
                                %print table
                                % Table_echoes_manual(i_steps,:,:)
                                %open figure
                                h.I_Fig_Reflectivity_Dynamical_3D_Res = figure(d+196);
                                %close to errase previous
                                close(d+196)
                                %re open figure
                                h.I_Fig_Reflectivity_Dynamical_3D_Res = figure(d+196);
                                
                                set(h.I_Fig_Reflectivity_Dynamical_3D_Res,'Name','Dynamical reflectivity results fit',...
                                    'NumberTitle', 'on','Toolbar','figure','visible','on','Units','normalized','Menubar','figure',...
                                    'Position', [0.5 0.1 0.5 0.2],'Color',[1 1 1],...
                                    'KeyReleaseFcn',@Press);
                                
                                h.name_Result_Fit_3D =  uicontrol('Parent',h.I_Fig_Reflectivity_Dynamical_3D_Res,...
                                    'Style' , 'text','Enable','on','FontName','Helvetica','String','Result Fit',...
                                    'FontWeight','bold','HorizontalAlignment','center','Units','Normalized',...
                                    'Position',[0.01 0.85 0.25 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size);
                                
                                names_table = ["Number", "Position(\mum)", "Intensity","Width"];
                                h.uit = uitable(h.I_Fig_Reflectivity_Dynamical_3D_Res);
                                h.uit.Data = Table_echoes_manual_actual';
                                h.uit.ColumnEditable = true;
                                h.uit.Position = [5 5 400 180];
                                h.uit.ColumnName = names_table;
                                %       h.uit.DisplayDataChangedFcn = @updatePlot;
                            %end
                        end
                        %release memory
                        h.Gaussian_R_plot = Gaussian_R_plot;
                        h.x_array_center = x_array_center;
                        h.y_array_center = y_array_center;
                        Gaussian_R_plot = [];
                        phase_R_plot = [];
                        
                        %sum of the simulation to plot intensity
                        Intensity_array(1,i_steps) = sum(sum(sum(abs(Gaussian_R).^2,1),2),3);
                        
                        if get(h.Plot_on_Check,'value') == 1
                            
                            axes(h.I_Fig_Beam_3D_convolution_F8)                            
                            hold off
                            sum_echoes_int1(1,i_steps) = 0;
                            for i_echoes = 1:length_table 
                                %SUm of all echoes for each step
                                sum_echoes_int1(1,i_steps) = sum_echoes_int1(1,i_steps) + Table_echoes_manual(i_steps,5,i_echoes);
                                
                                if get(h.Laue_FBD_Check,'Value') ==1 || get(h.Bragg_FBD_Check,'Value') == 1
                                    if (i_echoes ==1) && (i_steps == 1)
                                        normalize_echoes = sum_echoes_int1(i_steps);
                                        normalize_Intensity = Intensity_array(1,i_steps);                                
                                    end
                                elseif get(h.Laue_Check,'Value') ==1 || get(h.Bragg_Check,'Value') == 1
                                    normalize_echoes = max(sum_echoes_int1);                                    
                                    normalize_Intensity = max(Intensity_array);
                                end
                                
                                Table_echoes_manual_plot(i_echoes,:) = Table_echoes_manual(:,5,i_echoes)/normalize_echoes; %normalize matrix of echoes                                
                                %Plot the normalized signal for each echoe
                                plot(Energy_array(1:i_steps),Table_echoes_manual_plot(i_echoes,1:i_steps),'Parent',h.I_Fig_Beam_3D_convolution_F8,'LineStyle',':','Marker','o','MarkerFaceColor',color_echo(i_echoes,:),'MarkerEdgeColor',color_echo(i_echoes,:));
                                hold on
                            end
                            %Normalization sum of echoes
                            sum_echoes_int1n = sum_echoes_int1/normalize_echoes;
                            
                            %Sum all echoes
                            plot(Energy_array(1:i_steps),sum_echoes_int1n(1:i_steps),'Parent',h.I_Fig_Beam_3D_convolution_F8,'LineStyle','-','Marker','o','MarkerFaceColor','b','MarkerEdgeColor','b');
                            
                            %sum all image
                            plot(Energy_array(1:i_steps),Intensity_array(1:i_steps)/normalize_Intensity,'Parent',h.I_Fig_Beam_3D_convolution_F8,'LineStyle','--','Marker','s','MarkerFaceColor','r','MarkerEdgeColor','r');
                            
                            title_Convolution = strcat('Monochromator(',get(h.H_Mono,'String'),',',get(h.K_Mono,'String'),',',get(h.L_Mono,'String'),') Convoluted with (',num2str(h_Miller),',',num2str(k_Miller),',',num2str(l_Miller),')');
                            title(title_Convolution)
                            
                            ylabel('Intensity (arb. unit)')
                            xlabel(xlabel_name)
                            xlim auto
                            %ylim([0 2])
%                             video_Escan_area(i_steps) = getframe(h.I_Fig_Beam_3D_convolution_F8);                            
                           
                        end                        
                        %pause(0.1)
                    end
%                     video_Escan_all(i_steps) = getframe(h.I_Fig_3D_Reflectivity_Dynamical);                    
                end
                
               % Save data in function of the user definition XY, YT, XT
               % planes or 3D
                %Plane XY
                if get(h.Channel_Save_XY_Check,'value')
                    Gaussian_R_XY(:,:) = sum(abs(Gaussian_R).^2,3);
                    Phase_R_XY(:,:) = sum(atan2(imag(Gaussian_R),real(Gaussian_R)),3);
                    R_S_G_XY(:,:) = sum(abs(R_S_G).^2,3);
                    Gaussian_k0_XY(:,:) = sum(abs(Gaussian_R0_3D).^2,3);
                                        
                    Name_Filep = sprintf('Gaussian_R_XY_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
                    filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                    save(filename_Output,'Gaussian_R_XY','Phase_R_XY','R_S_G_XY','Gaussian_k0_XY','G_mono');
                    
                    %save the fit uring simulations
                    if get(h.Plot_on_Check,'value') == 1 && get(h.Save_FIT_during_simulation_3D_Check,'value') ==1                       
                        header_echoes = sprintf('Energy_%0.4dkeV_point_%0.1d',Energy_Bragg/1000,i_average);
                    end
                end
                
                %Plane XT
                if get(h.Channel_Save_XT_Check,'value')
                    Gaussian_R_XT(:,:) = sum(abs(Gaussian_R).^2,1);
                    Phase_R_XT(:,:) = sum(atan2(imag(Gaussian_R),real(Gaussian_R)),1);
                    R_S_G_XT(:,:) = sum(abs(R_S_G).^2,2);
                    Gaussian_k0_XT(:,:) = sum(abs(Gaussian_R0_3D).^2,2); 
                    
                    Channel_rep = eval(get(h.Repetition_channel,'String'));
                    Name_Filep = sprintf('Gaussian_R_XT_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
                    filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                    save(filename_Output,'Gaussian_R_XT','Phase_R_XT','R_S_G_XT','Gaussian_k0_XT','G_mono');
                    
                    %save the fit uring simulations
                    if get(h.Plot_on_Check,'value') == 1 && get(h.Save_FIT_during_simulation_3D_Check,'value') ==1 
                        header_echoes = sprintf('Energy_%0.4dkeV_point_%0.1d',Energy_Bragg/1000,i_average);                        
                    end
                end
                
                %Plane YT
                if get(h.Channel_Save_YT_Check,'value')
                    Gaussian_R_YT(:,:) = sum(abs(Gaussian_R).^2,2);
                    Phase_R_YT(:,:) = sum(atan2(imag(Gaussian_R),real(Gaussian_R)),2);
                    R_S_G_YT(:,:) = sum(abs(R_S_G).^2,1);
                    Gaussian_k0_YT(:,:) = sum(abs(Gaussian_R0_3D).^2,1); 
                    
                    Channel_rep = eval(get(h.Repetition_channel,'String'));
                    Name_Filep = sprintf('Gaussian_R_YT_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
                    filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                    save(filename_Output,'Gaussian_R_YT','Phase_R_YT','R_S_G_YT','Gaussian_k0_YT','G_mono');
%                     
                    %save the fit uring simulations
                    if get(h.Plot_on_Check,'value') == 1 && get(h.Save_FIT_during_simulation_3D_Check,'value') ==1 
                        header_echoes = sprintf('Energy_%0.4dkeV_point_%0.1d',Energy_Bragg/1000,i_average);
                    end
                end
                
                %3D
                if get(h.Channel_Save_All_Check,'value')
                    Channel_rep = eval(get(h.Repetition_channel,'String'));
                    Name_Filep = sprintf('Gaussian_R_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
                    filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                    
                    Gaussian_R_re = real(Gaussian_R);
                    Gaussian_R_im = imag(Gaussian_R);
                    
                    R_S_G_re = real(R_S_G);
                    R_S_G_im = imag(R_S_G);
                    
                    %Incoming beam
                    Gaussian_k0_re = real(Gaussian_R0_3D);
                    Gaussian_k0_im = imag(Gaussian_R0_3D);   
                    
                    save(filename_Output,'Gaussian_R_re','Gaussian_R_im','R_S_G_re','R_S_G_im','G_mono','Gaussian_k0_re','Gaussian_k0_im');
                    
                    R_S_G_im =[];
                    R_S_G_re =[];
                    Gaussian_R_re =[];
                    Gaussian_R_im =[];
                    Gaussian_k0_re = [];
                    Gaussian_k0_im = [];
                    
                end
                
            end
            %End of calculations
            
            
           %stop by user
            if get(h.Stop_Dynamical_3D,'Value') == 0
                set(h.Status_Dynamical_3D,'String','Status: Stop by user','BackgroundColor',[0.9 0 0.9])
                break                
            end
            
            
            %Init varialbes to save final,  all important values in file saved
            Gaussian_R_sum = Gaussian_R.*0;
            R_S_G_sum = R_S_G.*0;
            G_mono_sum = G_mono.*0;
            Gaussian_R0_3D_sum = Gaussian_R0_3D .*0;
            
            Gaussian_R = [];
            R_S_G = [];
            Gaussian_R0_3D_sum = [];
            
            % If importatnt information is on the xy plane
            if get(h.Channel_Save_XY_Check,'value')
                Gaussian_R_XY_sum = Gaussian_R_XY.*0;     % Init a variable for the R
                Gaussian_k0_XY_sum = Gaussian_k0_XY.*0;     % Init a variable for the k0
                Phase_R_XY_sum = Phase_R_XY.*0;     % Init a variable for the phase
                R_S_G_XY_sum = R_S_G_XY.*0;     % Init a variable for the Reciprocal space sample
                G_mono_XY_sum = G_mono.*0;     % Init a variable for the Mono beam 1D beam only energy
                Gaussian_R_XY = [];
                R_S_G_XY = [];
                Gaussian_k0_XY = [];
            end
            % If importatnt information is on the xt plane
            if get(h.Channel_Save_XT_Check,'value')
                Gaussian_R_XT_sum = Gaussian_R_XT.*0;
                Gaussian_k0_XT_sum = Gaussian_k0_XT.*0;     % Init a variable for the k0
                Phase_R_XT_sum = Phase_R_XT.*0;
                R_S_G_XT_sum = R_S_G_XT.*0;
                G_mono_XT_sum = G_mono.*0;
                Gaussian_R_XT = [];
                R_S_G_XT = [];
                Gaussian_k0_XT = [];
            end
            % If importatnt information is on the yt plane
            if get(h.Channel_Save_YT_Check,'value')
                Gaussian_R_YT_sum = Gaussian_R_YT.*0;
                Gaussian_k0_YT_sum = Gaussian_k0_YT.*0;     % Init a variable for the k0
                Phase_R_YT_sum = Phase_R_YT.*0;
                R_S_G_YT_sum = R_S_G_YT.*0;
                G_mono_YT_sum = G_mono.*0;
                Gaussian_R_YT = [];
                R_S_G_YT = [];
                Gaussian_k0_YT = [];
            end            
            
            %Init variables
            G_mono = [];
            Gaussian_R = [];
            R_S_G = [];
            G_mono = [];
            Gaussian_R_XY_ave = [];
            Phase_R_XY_ave = [];
            R_S_G_XY_ave = [];
            Gaussian_R_XT_ave = [];
            Phase_R_XT_ave = [];
            R_S_G_XT_ave = [];
            Gaussian_R_YT_ave = [];
            Phase_R_YT_ave = [];
            R_S_G_YT_ave = [];
            Gaussian_R_ave = [];
            Gaussian_R0_3D_ave = [];
            R_S_G_ave = [];
            Gaussian_k0_YT_ave = [];
            Gaussian_k0_XT_ave = [];
            Gaussian_k0_XY_ave = [];
            
            for i_average = 1: eval(get(h.Repetition_ave,'String'))
                if get(h.Channel_Save_XY_Check,'value')
                    Name_Filep = sprintf('Gaussian_R_XY_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
                    filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                    load(filename_input)
                    
                    Gaussian_R_XY_sum = Gaussian_R_XY_sum + Gaussian_R_XY;
                    Gaussian_k0_XY_sum = Gaussian_k0_XY_sum + Gaussian_k0_XY;
                    Phase_R_XY_sum = Phase_R_XY_sum +Phase_R_XY;
                    R_S_G_XY_sum = R_S_G_XY_sum + R_S_G_XY;
                    G_mono_XY_sum = G_mono_XY_sum +G_mono;
                    if get(h.Channel_Save_average_Check,'value') == 0
                        delete(filename_input)
                    end
                end
                
                if get(h.Channel_Save_XT_Check,'value')
                    Name_Filep = sprintf('Gaussian_R_XT_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
                    filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                    load(filename_input)
                    
                    Gaussian_R_XT_sum = Gaussian_R_XT_sum + Gaussian_R_XT;
                    Gaussian_k0_XT_sum = Gaussian_k0_XT_sum + Gaussian_k0_XT;
                    Phase_R_XT_sum = Phase_R_XT_sum +Phase_R_XT;
                    R_S_G_XT_sum = R_S_G_XT_sum + R_S_G_XT;
                    G_mono_XT_sum = G_mono_XT_sum +G_mono;
                    if get(h.Channel_Save_average_Check,'value') == 0
                        delete(filename_input)
                    end
                end
                
                if get(h.Channel_Save_YT_Check,'value')
                    Name_Filep = sprintf('Gaussian_R_YT_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
                    filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                    load(filename_input)
                    
                    Gaussian_R_YT_sum = Gaussian_R_YT_sum + Gaussian_R_YT;
                    Gaussian_k0_YT_sum = Gaussian_k0_YT_sum + Gaussian_k0_YT;
                    Phase_R_YT_sum = Phase_R_YT_sum +Phase_R_YT;
                    R_S_G_YT_sum = R_S_G_YT_sum + R_S_G_YT;
                    G_mono_YT_sum = G_mono_YT_sum +G_mono;
                    if get(h.Channel_Save_average_Check,'value') == 0
                        delete(filename_input)
                    end
                end
                
                if get(h.Channel_Save_All_Check,'value')
                    Name_Filep = sprintf('Gaussian_R_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
                    filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                    Save_file = load(filename_input);
                    
                    Gaussian_R = Save_file.Gaussian_R_re +1i * Save_file.Gaussian_R_im;
                    R_S_G = Save_file.R_S_G_re + 1i* Save_file.R_S_G_im;
                    Gaussian_R0_3D = Gaussian_k0_re + 1i *Gaussian_k0_im;   
                    
                    Gaussian_R_sum = Gaussian_R_sum + Gaussian_R;
                    R_S_G_sum = R_S_G_sum + Gaussian_R;
                    Gaussian_R0_3D_sum = Gaussian_R0_3D_sum + Gaussian_R0_3D;
                    
                    G_mono_sum = G_mono_sum + G_mono;
                    
                    if get(h.Channel_Save_average_Check,'value') == 0
                        delete(filename_input)
                    end
                end
                
            end
            
            if get(h.Channel_Save_XY_Check,'value')  
                Gaussian_R_XY_ave = Gaussian_R_XY_sum ./ eval(get(h.Repetition_ave,'String'));
                Gaussian_k0_XY_ave = Gaussian_k0_XY_sum ./ eval(get(h.Repetition_ave,'String'));
                Phase_R_XY_ave = Phase_R_XY_sum ./ eval(get(h.Repetition_ave,'String'));
                R_S_G_XY_ave = R_S_G_XY_sum ./ eval(get(h.Repetition_ave,'String'));
                G_mono_ave = G_mono_XY_sum ./ eval(get(h.Repetition_ave,'String'));
                
                Name_Filep = sprintf('Gaussian_R_XY_Energy_%0.1d_channel_%0.1d_average.mat',i_steps,Channel_rep);
                filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                save(filename_Output,'Gaussian_R_XY_ave','Phase_R_XY_ave','R_S_G_XY_ave','G_mono_ave','Gaussian_k0_XY_ave');
                
                Gaussian_R_XY=[];
                G_mono=[];
                R_S_G_XY=[];
                Gaussian_R_XY_sum = [];
                R_S_G_XY_sum=[];
                G_mono_XY_sum =[];
                G_mono_ave= [];
                R_S_G_XY_ave = [];
                Gaussian_k0_XY_ave =[];
                Gaussian_k0_XY_sum = [];
            end
            
            if get(h.Channel_Save_XT_Check,'value')
                Gaussian_R_XT_ave = Gaussian_R_XT_sum ./ eval(get(h.Repetition_ave,'String'));
                Gaussian_k0_XT_ave = Gaussian_k0_XT_sum ./ eval(get(h.Repetition_ave,'String'));
                Phase_R_XT_ave = Phase_R_XT_sum ./ eval(get(h.Repetition_ave,'String'));
                R_S_G_XT_ave = R_S_G_XT_sum ./ eval(get(h.Repetition_ave,'String'));
                G_mono_ave = G_mono_XT_sum ./ eval(get(h.Repetition_ave,'String'));
                
                Name_Filep = sprintf('Gaussian_R_XT_Energy_%0.1d_channel_%0.1d_average.mat',i_steps,Channel_rep);
                filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                save(filename_Output,'Gaussian_R_XT_ave','Phase_R_XT_ave','R_S_G_XT_ave','G_mono_ave','Gaussian_k0_XT_ave');
                
                Gaussian_R_XT=[];
                G_mono=[];
                R_S_G_XT=[];
                Gaussian_R_XT_sum = [];
                R_S_G_XT_sum=[];
                G_mono_XT_sum =[];
                G_mono_ave= [];
                R_S_G_XT_ave = [];
                Gaussian_k0_XT_sum = [];
            end
            
            if get(h.Channel_Save_YT_Check,'value')
                Gaussian_R_YT_ave = Gaussian_R_YT_sum ./ eval(get(h.Repetition_ave,'String'));
                Gaussian_k0_YT_ave = Gaussian_k0_YT_sum ./ eval(get(h.Repetition_ave,'String'));
                Phase_R_YT_ave = Phase_R_YT_sum ./ eval(get(h.Repetition_ave,'String'));
                R_S_G_YT_ave = R_S_G_YT_sum ./ eval(get(h.Repetition_ave,'String'));
                G_mono_ave = G_mono_YT_sum ./ eval(get(h.Repetition_ave,'String'));
                
                Name_Filep = sprintf('Gaussian_R_YT_Energy_%0.1d_channel_%0.1d_average.mat',i_steps,Channel_rep);
                filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                save(filename_Output,'Gaussian_R_YT_ave','Phase_R_YT_ave','R_S_G_YT_ave','G_mono_ave','Gaussian_k0_YT_ave');
                
                Gaussian_R_YT=[];
                G_mono=[];
                R_S_G_YT=[];
                Gaussian_R_YT_sum = [];
                R_S_G_YT_sum=[];
                G_mono_YT_sum =[];
                G_mono_ave= [];
                Gaussian_R_YT_ave = [];
                R_S_G_YT_ave = [];
                Gaussian_k0_YT_ave = [];
                Gaussian_k0_YT_sum = [];
            end
            
            if get(h.Channel_Save_All_Check,'value')
                Gaussian_R_ave = Gaussian_R_sum ./ eval(get(h.Repetition_ave,'String'));
                Gaussian_R0_3D_ave = Gaussian_R0_3D_sum ./ eval(get(h.Repetition_ave,'String'));
                R_S_G_ave = R_S_G_sum ./ eval(get(h.Repetition_ave,'String'));
                G_mono_ave = G_mono_sum ./ eval(get(h.Repetition_ave,'String'));
                
                Name_Filep = sprintf('Gaussian_R_Energy_%0.1d_channel_%0.1d_average.mat',i_steps,Channel_rep);
                filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                save(filename_Output,'Gaussian_R_ave','R_S_G_ave','G_mono_ave','Gaussian_R0_3D_ave');
                
                Guassian_R = Gaussian_R_re + 1i*Gaussian_R_im;
                
                axes(h.I_Fig_Beam_3D_profile_F6)
                if get(h.Time_um_F4_Check,'Value') == 1
                    Intensityplot_array(i_steps,:) = sum(sum(abs(Gaussian_R_ave).^2,1),2);
                    plot_array = t_array * 1e15;
                    [pks,locs,w,p] = findpeaks(Intensityplot_array(i_steps,:),plot_array);
                    plot_array = plot_array-locs(1,1);
                    plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_profile_F6,'Color','k','Marker','x')
                    
                elseif get(h.Transverse_um_F4_Check,'Value') == 1
                    Intensityplot_array(i_steps,:) = sum(sum(abs(Gaussian_R_ave).^2,1),3);
                    plot_array = x_array * 1e6;
                    [pks,locs,w,p] = findpeaks(Intensityplot_array(i_steps,:),plot_array);
                    plot_array = plot_array-locs(1,1);
                    plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_profile_F6,'Color','k','Marker','x')
                    
                elseif get(h.Transversey_um_F4_Check,'Value') == 1
                    Intensityplot_array(i_steps,:) = sum(sum(abs(Gaussian_R_ave).^2,2),3);
                    plot_array = y_array * 1e6;
                    [pks,locs,w,p] = findpeaks(Intensityplot_array(i_steps,:),plot_array);
                    plot_array = plot_array-locs(1,1);
                    plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_profile_F6,'Color','k','Marker','x')
                end
                
                hold on
                
                Gaussian_R=[];
                G_mono=[];
                R_S_G=[];
                Gaussian_R_sum = [];
                R_S_G_sum=[];
                G_mono_sum =[];
                G_mono_ave= [];
                Gaussian_R_ave = [];
                R_S_G_ave = [];
                Gaussian_R0_3D_ave = [];
                Gaussian_R0_3D_sum = [];
            end
           
        end
        
        
        %Final plots of the scan or shot
        if get(h.Stop_Dynamical_3D,'Value') == 0
            
        else            
            Gaussian_KXY = [];            
            
            if number_Steps == 0
                if get(h.More_Crystal_Chk,'value') == 1
                    
                    %Plot the Average of the section plots in the case of
                    %several shots.
                    Gaussian_K_plot_t1D_ave(1,:) = Gaussian_K_plot_t1D_array(1,:);
                    Intensityplot_array_t_ave(1,:) = Intensityplot_array_save_t(1,:);
                    Intensityplot_array_x_ave(1,:) = Intensityplot_array_save_x(1,:);
                    Gaussian_K_ave(1,:) = Gaussian_K_all_save(1,:);
                    for ii_average =2:i_average
                        Gaussian_K_plot_t1D_ave(1,:) = Gaussian_K_plot_t1D_ave(1,:) + Gaussian_K_plot_t1D_array(ii_average,:);
                        Intensityplot_array_t_ave(1,:) = Intensityplot_array_t_ave(1,:) + Intensityplot_array_save_t(ii_average,:);
                        Intensityplot_array_x_ave(1,:) = Intensityplot_array_x_ave(1,:) + Intensityplot_array_save_x(ii_average,:);
                        Gaussian_K_ave(1,:) = Gaussian_K_ave(1,:) + Gaussian_K_all_save(ii_average,:);
                    end
                    Gaussian_K_plot_t1D_ave = Gaussian_K_plot_t1D_ave./i_average;
                    Intensityplot_array_t_ave = Intensityplot_array_t_ave./i_average;
                    Intensityplot_array_x_ave = Intensityplot_array_x_ave./i_average;
                    Gaussian_K_ave = Gaussian_K_ave./i_average;
                    
                    axes(h.I_Fig_Beam_3D_convolution_F8)
                    plot(t_array *1e15,Gaussian_K_plot_t1D_ave,'Parent',h.I_Fig_Beam_3D_convolution_F8,'color','k')
                    xlabel('time(fs)')                    
                    hold on
                    
                    axes(h.I_Fig_Beam_3D_mono_F5)
                    %plot(t_array *1e15,fftshift(Intensityplot_array_t_ave),'Parent',h.I_Fig_Beam_3D_mono_F5,'color','k')
                    plot(t_array *1e15,Intensityplot_array_t_ave,'Parent',h.I_Fig_Beam_3D_mono_F5,'color','k')
                    hold on
                    xlabel('fs')
                    
                    axes(h.I_Fig_Beam_3D_profile_F6)
                    plot(x_array * 1e6,Intensityplot_array_x_ave,'Parent',h.I_Fig_Beam_3D_profile_F6,'color','k')
                    hold on
                    xlabel('um') 
                    
                    axes(h.I_Fig_Beam_3D_Section_F2)
                    hold on
                    plot(E_Scan_plot,Gaussian_K_ave,'Parent',h.I_Fig_Beam_3D_Section_F2,'color','k')
                    %  pause(0.1)
                    
                    %Average 2D                    
                    %Plot time x
                    axes(h.I_Fig_Beam_3D_Section_T_F3)
                    %Gaussian_R_plot(:,:) =(fftshift(Gaussian_R_XT_ave,2));                    %%%For plot of the Laue case 2 crystals
                    Gaussian_R_plot(:,:) =Gaussian_R_XT_ave;
                    imagesc(t_array * 1e15, x_array * 1e6,Gaussian_R_plot,'Parent',  h.I_Fig_Beam_3D_Section_T_F3)
                    Gaussian_R_plot = [];
                    xlabel('fs')
                    ylabel('um')
                    
                    %Plot time x Incoming beam
                    axes(h.I_Fig_Beam_3D_reflectivity_F7)
                    Gaussian_R_plot(:,:) = Gaussian_k0_XT_ave;
                    size(Gaussian_R_plot)
                    imagesc(t_array * 1e15, x_array * 1e6,Gaussian_R_plot,'Parent', h.I_Fig_Beam_3D_reflectivity_F7)
                    Gaussian_R_plot = [];
                    xlabel('fs')
                    ylabel('um')
                    
                    %plot detector plane
                    axes(h.I_Fig_Beam_3D_GK_F4)
                    Gaussian_R_plot(:,:) = Gaussian_R_XY_ave;
                    imagesc(x_array * 1e6,y_array * 1e6,Gaussian_R_plot,'Parent', h.I_Fig_Beam_3D_GK_F4)
                    Gaussian_R_plot = [];h.I_Fig_Beam_3D_reflectivity_F7
                    xlabel('um')
                    ylabel('um')                   
                    
                    Gaussian_k0_XT_ave=[];
                    Gaussian_R_XT_ave = [];
                    Gaussian_R_XY_ave = [];
                    
                else
                    %Not final prints   for the moment in the normal case
                    
                end
            else
                if get(h.More_Crystal_Chk,'value') == 1
                    Gaussian_K_plot_t1D_ave(1,:) = Gaussian_K_plot_t1D_array(1,:);
                    for ii_average =2:i_average
                        Gaussian_K_plot_t1D_ave(1,:) = Gaussian_K_plot_t1D_ave(1,:) + Gaussian_K_plot_t1D_array(i_average,:);
                        
                    end
                    Gaussian_K_plot_t1D_ave = Gaussian_K_plot_t1D_ave./i_average;
                    
                    axes(h.I_Fig_Beam_3D_convolution_F8)                   
                    plot(t_array *1e15,Gaussian_K_plot_t1D_ave,'Parent',h.I_Fig_Beam_3D_convolution_F8)
                    xlabel('time(fs)')                    
                    hold on
                    
                    
                else
                    if get(h.Mono_Scan_Check,'value') == 1
                        if get(h.Gaussian_Beam_1D_Check,'Value') == 1
                            axes(h.I_Fig_Beam_3D_convolution_F8)
                            plot(Energy_array,Intensity_array/normalize_Intensity,'Parent',h.I_Fig_Beam_3D_convolution_F8,'LineStyle','-','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r');
                            title_Convolution = strcat('Monochromator(',get(h.H_Mono,'String'),',',get(h.K_Mono,'String'),',',get(h.L_Mono,'String'),') Convoluted with (',num2str(h_Miller),',',num2str(k_Miller),',',num2str(l_Miller),')');
                            title(title_Convolution)
                            ylabel('Intensity (arb. unit)')
                            xlabel('Energy (eV)')
                            hold on
                            xlim([E_Scan(1,1),E_Scan(1,size(E_Scan,2))])
                            
                        elseif get(h.Gaussian_Beam_3D_Check,'Value') == 1
                            axes(h.I_Fig_Beam_3D_convolution_F8)
                            plot(Energy_array,Intensity_array/normalize_Intensity,'Parent',h.I_Fig_Beam_3D_convolution_F8,'LineStyle','-','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r');
                            title_Convolution = strcat('Monochromator(',get(h.H_Mono,'String'),',',get(h.K_Mono,'String'),',',get(h.L_Mono,'String'),') Convoluted with (',num2str(h_Miller),',',num2str(k_Miller),',',num2str(l_Miller),')');
                            title(title_Convolution)
                            ylabel('Intensity (arb. unit)')
                            xlabel('Energy (eV)')
                            hold on
                            
                            if get(h.Fig_Beam_3D_F3_check,'Value') == 1
                                
                                axes(h.I_Fig_Beam_3D_profile_F6)
                                hold off
                                imagesc(plot_array,Energy_array,Intensityplot_array,'Parent',h.I_Fig_Beam_3D_profile_F6)
                                zlabel('Intensity (arb. unit)')
                                xlabel('Transverse displecement (m)')
                                ylabel('Energy (eV)')
                                %set(h.I_Fig_Beam_3D_profile_F6,'colorscale','log')
                                axis auto
                                
                                axes(h.I_Fig_Beam_3D_mono_F5)
                                hold off
                                imagesc(plot_array,Energy_array,Phase_R_array,'Parent',h.I_Fig_Beam_3D_mono_F5)
                                zlabel('Intensity (arb. unit)')
                                xlabel('Transverse displecement (m)')
                                ylabel('Energy (eV)')
                                %set(h.I_Fig_Beam_3D_mono_F5,'colorscale','log')
                                axis auto
                                
                                if get(h.Plot_on_Check,'value') == 1
                                    axes(h.I_Fig_Beam_3D_Section_F2)
                                    hold off
                                    
                                    for i_steps = 1:size(R_0H_S_Mono_array,1)
                                        plot(E_Scan_plot,abs(R_0H_S_Mono_array(i_steps,:)).^2,'Parent',h.I_Fig_Beam_3D_Section_F2)
                                        hold on
                                    end
                                    plot(E_Scan_plot,abs(R_S_3D_plot).^2,'Parent',h.I_Fig_Beam_3D_Section_F2,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','b')
                                    
                                    title_Mono = strcat('Monochromator:(',get(h.H_Mono,'String'),',',get(h.K_Mono,'String'),',',get(h.L_Mono,'String'),')');
                                    title(title_Mono)
                                    ylabel('Intensity (arb. unit)')
                                    xlabel('Energy (eV)')
                                    axis auto
                                    hold on
                                end
                                
                            end
                            
                            h.x_array = x_array;
                            h.y_array = y_array;
                            h.t_array = t_array;
                            h.Energy_array = Energy_array;
                            %                     h.Gaussian_R_all = Gaussian_R_all;
                            h.plot_array = plot_array;
                            h.Intensityx_array = Intensityplot_array;
                            h.E_Scan_plot = E_Scan_plot;
                            h.kx_transvers_array = kx_transvers_array;
                            h.ky_transvers_array = ky_transvers_array;
                            %                     h.R_S_G_all = R_S_G_all;
                            h.FBD = FBD;
                            h.LaueD = LaueD;
                            h.R_S_all = R_S_3D;
                            if get(h.Mono_Beam_Check,'Value') == 1
                                h.R_0H_S_Mono_all = R_0H_S_Mono_all;
                            else
                                h.R_0H_S_Mono_all = Gaussian_K_all;
                            end
                        end
                        
                    end
                end
            end
            
            video_Escan_all(i_steps+1) = getframe(h.I_Fig_3D_Reflectivity_Dynamical); 
            
            if get(h.Gaussian_Beam_1D_Check,'Value') == 1
                
            elseif get(h.Gaussian_Beam_3D_Check,'Value') == 1
                
                h.x_array = x_array;
                h.y_array = y_array;
                h.t_array = t_array;
                h.Energy_array = Energy_array;
                h.plot_array = plot_array;
                h.Intensityx_array = Intensityplot_array;
                h.E_Scan_plot = E_Scan_plot;
                h.kx_transvers_array = kx_transvers_array;
                h.ky_transvers_array = ky_transvers_array;
                h.FBD = FBD;
                h.LaueD = LaueD;
                h.R_S_all = R_S_3D;
                if get(h.Mono_Beam_Check,'Value') == 1
                    h.R_0H_S_Mono_all = R_0H_S_Mono_all;
                else
                    h.R_0H_S_Mono_all = Gaussian_K_all;
                end
            end
            
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%% Video
            if get(h.Save_video_3D_Check,'value') == 1
                %Generate if for the case
                
                %folder and file name for videos
                Name_File_video_all_echoes = sprintf('Energy_Scan_Fit_%s_%s_E%.3dkeV_%d%d%d_t%dum_As%.2d_polar_%s_%s_date%s.avi',geometry_fecho,element,Energy_center/1000,h_Miller,k_Miller,l_Miller,Thickness,Ang_asy_Deg,Polarization,beam_name,datetime);
                
                Name_path_video_ESCAN_all_echoes = fullfile(save_folder_intermediate_Fit, Name_File_video_all_echoes);
                
                %First Area
                % create the video writer with 1 fps
                writerObj = VideoWriter(Name_path_video_ESCAN_all_echoes);
                writerObj.FrameRate = 5;
                % set the seconds per image
                % open the video writer
                open(writerObj);
                % write the frames to the video
                for i=1:length(video_Escan_all)
                    % convert the image to a frame
                    frame = video_Escan_all(i) ;
                    writeVideo(writerObj, frame);
                end
                % close the writer object
                close(writerObj);
                
            end
            set (h.Status_Dynamical_3D,'String','Status: Finnish','BackgroundColor',[0 0 0.9])
        end

        % Save the autosave plot
        if get(h.More_Crystal_Chk,'value') == 0
            folder_autosave = '/home/rodrigfa/code/MultiBeam_calculator/Output/Auto';
        
        
            if get(h.Save_strain_2D,'value')  %For the strain 2D plots
                Name_File_echoes = sprintf('%s_%s_E%.3deV_%d%d%d_t%dum_As%.2d_polar_%s_channel%d_model 2D_strain_step%d',geometry_fecho,element,Energy_center,h_Miller,k_Miller,l_Miller,Thickness,Ang_asy_Deg,Polarization,Channel_rep,h.step_2D_iteration)
            else
                Name_File_echoes = sprintf('%s_%s_E%.3deV_%d%d%d_t%dum_As%.2d_polar_%s_channel%d_date%s',geometry_fecho,element,Energy_center,h_Miller,k_Miller,l_Miller,Thickness,Ang_asy_Deg,Polarization,Channel_rep,datetime_init)
            end
        

            file_autosave = sprintf('%s/XY_%s.fig',folder_autosave,Name_File_echoes);
            axes(h.I_Fig_Beam_3D_GK_F4_s2)
            title(Name_File_echoes)
        
            saveas(h.I_Fig_3D_Reflectivity_Dynamical_s2,file_autosave)
        
            %close the figure auto save 2
                close(h.I_Fig_3D_Reflectivity_Dynamical_s2)
        end 
    end

    function Beam_3D_Reflectivity_call(source,eventdata)
            
        Chi_h_Cx = h.Chi_h_Cx;         Chi_0_Cx = h.Chi_0_Cx;
        Theta_Bragg = h.Theta_Bragg;        
        R_S = h.R_S; 
        E_Scan = h.E_Scan;
        Energy_center = h.Energy_center;         Range_E_neg = h.Range_E_neg;         Range_E_pos = h.Range_E_pos;
        N_Step = h.N_Step;
        k_array = h.k_array;
        
        %Crystal properties
        FBD = h.FBD;
        a_Par = h.a_Par;         b_Par = h.b_Par;         c_Par = h.c_Par;
        Thickness = h.Thickness_val;
        h_Miller = h.h_Miller_val;         k_Miller = h.k_Miller_val;       l_Miller = h.l_Miller_val;
        crystal_orientation = h.crystal_orientation_val;
        DWF = h.DWF_val;
        F0 = h.F0;         FH = h.FH;         F_H = h.F_H;
        absor = h.absor;
        Ang_asy_Deg= h.Ang_asy_Deg;
        Polarization = h.Polarization;
        Flux_Beam = h.Flux_Beam_val;
        
        %Beam Incoming
        G_mono = h.G_mono;
        Gaussian_K_3D = h.Gaussian_K_3D;
        kx_transvers_array = h.kx_transvers_array;         ky_transvers_array = h.ky_transvers_array;
        x_array = h.x_array;         y_array = h.y_array;
        N_Step_x = size(x_array,2);         N_Step_y = size(y_array,2);
        i_steps = h.i_steps_energy_2D_Xtal;
        i_average = h.i_average_energy_2D_Xtal;
        
        %E_Scan
        E_Scan_plot = E_Scan - Energy_center;
        
        %%Definition Beam        
        set (h.Status_Dynamical_3D,'String','Status: working','BackgroundColor',[0.5 0.5 0.5])
        
        if get(h.Mono_Scan_Check,'value') == 0
            number_Steps = 0;
            Step_Range = 0;
            Range_Mono_neg = 0;
        else
            number_Steps = eval(get(h.Steps_Mono,'String'));
            
            Range_Mono_pos = eval(get(h.Range_pos_Mono,'String'));
            Range_Mono_neg = -eval(get(h.Range_neg_Mono,'String'));
            Step_Range = (Range_Mono_pos+Range_Mono_neg)/number_Steps;
            
        end
        
        Energy_array(1,i_steps) = Energy_center;
        Intensity_array = zeros(1,number_Steps);
               
        R_S_3D = [];
                
        %More than one crytal
        if get(h.More_Crystal_Chk,'value') == 1
            if get(h.Plot_on_Check,'value')
                axes(h.I_Fig_Beam_3D_reflectivity_F7)
                hold on
            end
            
            %Caluculates for each cystal and saves in to a matrix to after
            %add all of them together
            for i_cryst = 1:size(pos_MCC,2)
                if polarization_MCC(1,i_cryst) == 1
                    polarization = 's';
                else
                    polarization = 'p';
                end
                
                Z = Element_MCC(1,i_cryst);
                
                if Geometry_MCC(1,i_cryst) ==1 %LaueD = 0;
                    [R_S_3D_SMCC] = Bragg_temp_Gui_3D_test...
                        (a_Par(1,i_cryst),b_Par(1,i_cryst),c_Par(1,i_cryst),Energy_center,Energy_center+Energy_MCC(1,i_cryst),...
                        h_MCC(1,i_cryst),k_MCC(1,i_cryst),l_MCC(1,i_cryst),DWF,F0(1,i_cryst),FH(1,i_cryst),F_H(1,i_cryst),absor,...
                        Range_E_neg,Range_E_pos,polarization,Asymmetry_MCC(1,i_cryst),Thickness_MCC(1,i_cryst),N_Step,...
                        Transmission_MCC(1,i_cryst),kx_transvers_array,ky_transvers_array,Normal_MCC(1,i_cryst),h.cluster);
                else%LaueD = 1;
                    [R_S_3D_SMCC] = Laue_temp_Gui_3D_test...
                        (a_Par(1,i_cryst),b_Par(1,i_cryst),c_Par(1,i_cryst),Energy_center,Energy_center+Energy_MCC(1,i_cryst),...
                        h_MCC(1,i_cryst),k_MCC(1,i_cryst),l_MCC(1,i_cryst),DWF,F0(1,i_cryst),FH(1,i_cryst),F_H(1,i_cryst),absor,...
                        Range_E_neg,Range_E_pos,polarization,Asymmetry_MCC(1,i_cryst),Thickness_MCC(1,i_cryst),N_Step,...
                        Transmission_MCC(1,i_cryst),kx_transvers_array,ky_transvers_array,Normal_MCC(1,i_cryst),h.cluster);
                end
                
                if pos_MCC(1,i_cryst) == 1
                    R_S_3D_plot(1,:) = R_S_3D_SMCC(N_Step_y/2,N_Step_x/2,:);
                    R_S_3D_MCC(1,:,:,:) = R_S_3D_SMCC(:,:,:);
                    
                elseif pos_MCC(1,i_cryst) == 2
                    R_S_3D_plot(2,:) = R_S_3D_SMCC(N_Step_y/2,N_Step_x/2,:);
                    R_S_3D_MCC(2,:,:,:) = R_S_3D_SMCC(:,:,:);
                    
                elseif pos_MCC(1,i_cryst) == 3
                    R_S_3D_plot(3,:) = R_S_3D_SMCC(N_Step_y/2,N_Step_x/2,:);
                    R_S_3D_MCC(3,:,:,:) = R_S_3D_SMCC(:,:,:);
                    
                elseif pos_MCC(1,i_cryst) == 4
                    R_S_3D_plot(4,:) = R_S_3D_SMCC(N_Step_y/2,N_Step_x/2,:);
                    R_S_3D_MCC(4,:,:,:) = R_S_3D_SMCC(:,:,:);
                    
                elseif pos_MCC(1,i_cryst) == 5
                    R_S_3D_plot(5,:) = R_S_3D_SMCC(N_Step_y/2,N_Step_x/2,:);
                    R_S_3D_MCC(5,:,:,:) = R_S_3D_SMCC(:,:,:);
                    
                elseif pos_MCC(1,i_cryst) == 6
                    R_S_3D_plot(6,:) = R_S_3D_SMCC(N_Step_y/2,N_Step_x/2,:);
                    R_S_3D_MCC(6,:,:,:) = R_S_3D_SMCC(:,:,:);
                    
                elseif pos_MCC(1,i_cryst) == 7
                    R_S_3D_plot(7,:) = R_S_3D_SMCC(N_Step_y/2,N_Step_x/2,:);
                    R_S_3D_MCC(7,:,:,:) = R_S_3D_SMCC(:,:,:);
                    
                elseif pos_MCC(1,i_cryst) == 8
                    R_S_3D_plot(8,:) = R_S_3D_SMCC(N_Step_y/2,N_Step_x/2,:);
                    R_S_3D_MCC(8,:,:,:) = R_S_3D_SMCC(:,:,:);
                    
                end
            end
            
            %Plots each of the calculations
            for i_cryst = 1:size(pos_MCC,2)
                plot(E_Scan_plot,abs(R_S_3D_plot(i_cryst,:)).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)
            end
            
            R_S_3D_plot(1,:) =R_S_3D_MCC(i_cryst,N_Step_y/2,N_Step_x/2,:);
            if get(h.Plot_on_Check,'value')
                plot(E_Scan_plot,abs(R_S_3D_plot).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','b')
            end
            
        else %Only one crystal
            %Calculate the Green function using Kx and K
            if get(h.Bragg_Check,'Value') ==1 || get(h.Bragg_FBD_Check,'Value') == 1
                [R_S_3D] = Bragg_temp_Gui_3D_test...
                    (a_Par,b_Par,c_Par,Energy_center,Energy_center,...
                    h_Miller,k_Miller,l_Miller,DWF,F0,FH,F_H,absor,...
                    Range_E_neg,Range_E_pos,Polarization,Ang_asy_Deg,Thickness,N_Step,...
                    FBD,kx_transvers_array,ky_transvers_array,crystal_orientation,h.cluster);
                LaueD = 0;
                
                elseif get(h.Laue_Check,'Value') ==1 || get(h.Laue_FBD_Check,'Value') == 1
                [R_S_3D] = Laue_temp_Gui_3D_test...
                    (a_Par,b_Par,c_Par,Energy_center,Energy_center,...
                    h_Miller,k_Miller,l_Miller,DWF,F0,FH,F_H,absor,...
                    Range_E_neg,Range_E_pos,Polarization,Ang_asy_Deg,Thickness,N_Step,...
                    FBD,kx_transvers_array,ky_transvers_array,crystal_orientation,h.cluster);
                LaueD = 1;
                                
            end
            
            %Plots the results
            if get(h.Plot_on_Check,'value')
                axes(h.I_Fig_Beam_3D_reflectivity_F7)
                hold on
                R_S_3D_plot(1,:) = R_S_3D(N_Step_y/2,N_Step_x/2,:);
                plot(E_Scan_plot,abs(R_S_3D_plot).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7,'LineWidth',1,'Marker','s','MarkerSize',1,'Color','b')
            end
            
        end
        axis auto
        
        
        R_S_3D_plot = [];
        
        %% test
        %Check that the simulations are runnning
        if get(h.Pause_Dynamical_3D,'Value') == 1
            pause(0.1)
            for i_pause =1:1000
                if get(h.Pause_Dynamical_3D,'Value') == 1
                    set (h.Status_Dynamical_3D,'String','Status: Paused','BackgroundColor',[0 0.8 0.8])
                    pause(0.1)
                else
                    set (h.Status_Dynamical_3D,'String','Status: working','BackgroundColor',[0.5 0.5 0.5])
                end
            end
        else
            %pause(0.1)
        end
        
        %% Plotting
        if get(h.Plot_on_Check,'value')
            axes(h.I_Fig_Beam_3D_mono_F5)
        end
        
        h.Beam_3D_plot_AutoSave
        
        if get(h.More_Crystal_Chk,'value') == 1
            
            
            for i_cryst = 1:size(pos_MCC,2)
                R_S_3D(:,:,:) = R_S_3D_MCC(i_cryst,:,:,:);
                R_S_3D_plot(:,:) = sum(abs(R_S_3D),1).^2;
                if get(h.Plot_on_Check,'value')
                    surf(E_Scan_plot,kx_transvers_array,R_S_3D_plot,'Parent',h.I_Fig_Beam_3D_mono_F5,'edgecolor','none')
                    
                    view([20 20]);
                end
                
                R_S_3D_plot = [];
                
                if get(h.Pause_Dynamical_3D,'Value') == 1
                    pause(0)
                    for i_pause =1:1000
                        if get(h.Pause_Dynamical_3D,'Value') == 1
                            pause(0.1)
                        else
                        end
                    end
                else
                    %pause(0.1)
                end
                
                % Convolute both signals R MONO and R crystal in 2D
                R_S_G = R_S_3D .* Gaussian_K_3D;
                
                
                % Gaussian_K_3D = R_S_G;
                %   Gaussian_K_3D = [];
                if get(h.Plot_on_Check,'value')
                    axes(h.I_Fig_Beam_3D_F1)
                    imagesc(x_array,y_array,sum(abs(R_S_G).^2,3),'Parent',h.I_Fig_Beam_3D_F1)
                end
                %end
                
                
                if get(h.Shift_x,'Value') == 1
                    R_S_G = fftshift(R_S_G,1);
                end
                if get(h.Shift_y,'Value') == 1
                    R_S_G = fftshift(R_S_G,2);
                end
                if get(h.Shift_t2,'Value') == 1
                    R_S_G = fftshift(R_S_G,3);
                end
                Gaussian_R = (ifftn(R_S_G));
                
                if get(h.Plot_on_Check,'value')
                    axes(h.I_Fig_Beam_3D_Section_F2)
                    if get(h.TX_plain_3D_Check,'Value') == 1 
                        Gaussian_R_plot(:,:) = sum(abs(Gaussian_R).^2,1);
                        imagesc(t_array,x_array,Gaussian_R_plot,'Parent',h.I_Fig_Beam_3D_Section_F2)
                        
                    elseif get(h.TY_plain_3D_Check,'Value') == 1 
                        Gaussian_R_plot(:,:) = sum(abs(Gaussian_R).^2,2);
                        imagesc(t_array,y_array,Gaussian_R_plot,'Parent',h.I_Fig_Beam_3D_Section_F2)
                        
                    elseif  get(h.XY_plain_3D_Check,'Value') == 1
                        Gaussian_R_plot(:,:) = sum(abs(Gaussian_R).^2,3);
                        imagesc(x_array,y_array,Gaussian_R_plot,'Parent',h.I_Fig_Beam_3D_Section_F2)
                    end
                    Gaussian_R_plot = [];
                    %pause(0.1)
                end
                Gaussian_K_3D = fftshift(fftn(Gaussian_R));
                
            end
            Gaussian_K_3D = [];
            if get(h.Plot_on_Check,'value')
                axes(h.I_Fig_Beam_3D_Section_T_F3)
                if get(h.Time_um_F4_Check,'Value') == 1
                    Intensityplot_array(i_steps,:) = sum(sum(abs(Gaussian_R).^2,1),2);
                    plot_array = t_array;
                    plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_Section_T_F3)
                elseif get(h.Transverse_um_F4_Check,'Value') == 1
                    Intensityplot_array(i_steps,:) = sum(sum(abs(Gaussian_R).^2,1),3);
                    plot_array = x_array;
                    plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_Section_T_F3)
                    
                elseif get(h.Transversey_um_F4_Check,'Value') == 1
                    Intensityplot_array(i_steps,:) = sum(sum(abs(Gaussian_R).^2,2),3);
                    plot_array = y_array;
                    plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_Section_T_F3)
                end
                hold on
            end
            
            Intensity_array(1,i_steps) = sum(sum(sum(abs(Gaussian_R).^2,1),2),3);
            if get(h.Plot_on_Check,'value')
                axes(h.I_Fig_Beam_3D_convolution_F8)
                %             plot(Energy_array(1,i_steps),Intensity_array(1,i_steps),'Parent',h.I_Fig_Beam_3D_convolution_F8,'LineStyle','none',...
                %                 'Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r');
                %             title_Convolution = strcat('Monochromator(',get(h.H_Mono,'String'),',',get(h.K_Mono,'String'),',',...
                %                 get(h.L_Mono,'String'),') Convoluted with (',num2str(h_Miller),',',num2str(k_Miller),',',num2str(l_Miller),')');
                %             title(title_Convolution)
                %             ylabel('Intensity (arb. unit)')
                %             xlabel('Energy (eV)')
                %             xlim auto
                %             hold on
                %  pause(0.1)
            end
            
        else
            R_S_3D_plot(:,:) = sum(abs(R_S_3D),1).^2;
            if get(h.Plot_on_Check,'value')
                imagesc(abs(E_Scan_plot),kx_transvers_array,R_S_3D_plot,'Parent',h.I_Fig_Beam_3D_mono_F5)
                
            end
            R_S_3D_plot = [];
            
            if get(h.Pause_Dynamical_3D,'Value') == 1
                pause(0.1)
                for i_pause =1:1000
                    if get(h.Pause_Dynamical_3D,'Value') == 1
                        pause(0.1)
                    else
                    end
                end
            else
                %pause(0.1)
            end
            
            
            % Convolute both signals R MONO and R crystal in 2D
            R_S_G = R_S_3D .* Gaussian_K_3D;
            
            Gaussian_K_3D = [];
            if get(h.Plot_on_Check,'value')
                axes(h.I_Fig_Beam_3D_F1)
                imagesc(x_array,y_array,sum(abs(R_S_G).^2,3),'Parent',h.I_Fig_Beam_3D_F1)
                
            end
            
            if get(h.Shift_x,'Value') == 1
                R_S_G = fftshift(R_S_G,1);
            end
            if get(h.Shift_y,'Value') == 1
                R_S_G = fftshift(R_S_G,2);
            end
            if get(h.Shift_t2,'Value') == 1
                R_S_G = fftshift(R_S_G,3);
            end
            
            Gaussian_R = fftshift(ifftn(R_S_G),3);
            
            Gaussian_R = Gaussian_R * sqrt(Flux_Beam);
            
            if get(h.Plot_on_Check,'value')
                axes(h.I_Fig_Beam_3D_Section_F2)
                if get(h.TX_plain_3D_Check,'Value') == 1 
                    Gaussian_R_plot(:,:) = sum(abs(Gaussian_R).^2,1);
                    imagesc(t_array,x_array,Gaussian_R_plot,'Parent',h.I_Fig_Beam_3D_Section_F2)
                    
                elseif get(h.TY_plain_3D_Check,'Value') == 1 
                    Gaussian_R_plot(:,:) = sum(abs(Gaussian_R).^2,2);
                    imagesc(t_array,y_array,Gaussian_R_plot,'Parent',h.I_Fig_Beam_3D_Section_F2)
                    
                elseif get(h.XY_plain_3D_Check,'Value') == 1
                    Gaussian_R_plot(:,:) = sum(abs(Gaussian_R).^2,3);
                    imagesc(x_array,y_array,Gaussian_R_plot,'Parent',h.I_Fig_Beam_3D_Section_F2)
                end
            end
            Gaussian_R_plot = [];
            
            if get(h.Plot_on_Check,'value')
                axes(h.I_Fig_Beam_3D_Section_T_F3)
                if get(h.Time_um_F4_Check,'Value') == 1
                    Intensityplot_array(i_steps,:) = sum(sum(abs(Gaussian_R).^2,1),2);
                    plot_array = t_array;
                    plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_Section_T_F3)
                    
                    %   plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_GK_F4)
                elseif get(h.Transverse_um_F4_Check,'Value') == 1
                    Intensityplot_array(i_steps,:) = sum(sum(abs(Gaussian_R).^2,1),3);
                    plot_array = x_array;
                    plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_Section_T_F3)
                    
                    % plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_GK_F4)
                elseif get(h.Transversey_um_F4_Check,'Value') == 1
                    Intensityplot_array(i_steps,:) = sum(sum(abs(Gaussian_R).^2,2),3);
                    plot_array = y_array;
                    plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_Section_T_F3)
                    
                    % plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_GK_F4)
                end
                hold on
            end
            Intensity_array(1,i_steps) = sum(sum(sum(abs(Gaussian_R).^2,1),2),3);
            
            
%             axes(h.I_Fig_Beam_3D_convolution_F8)
%             plot(Energy_array(1,i_steps),Intensity_array(1,i_steps),'Parent',h.I_Fig_Beam_3D_convolution_F8,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r');
%             title_Convolution = strcat('Monochromator(',get(h.H_Mono,'String'),',',get(h.K_Mono,'String'),',',get(h.L_Mono,'String'),') Convoluted with (',num2str(h_Miller),',',num2str(k_Miller),',',num2str(l_Miller),')');
%             title(title_Convolution)
%             ylabel('Intensity (arb. unit)')
%             xlabel('Energy (eV)')
%             xlim auto
%             hold on
%             %pause(0.1)
        end
        
        
        
        %save_folder_intermediate = '/das/work/p15/p15366/RN84/SwissFEL Simulations/Calculation_Support';
        if h.cluster == true
            save_folder_intermediate = '/gpfs/exfel/data/user/rodrigfa/Temporal_data_Multi';
        else
            save_folder_intermediate = '/Users/rodrigfa/Desktop/MultiBeam_calculator/Temporal_Data';
        end
        h.save_folder_intermediate = save_folder_intermediate;
        
        if get(h.Channel_Save_XY_Check,'value')
            Gaussian_R_XY(:,:) = sum(abs(Gaussian_R).^2,3);
            R_S_G_XY(:,:) = sum(abs(R_S_G).^2,3);
            
            Channel_rep = eval(get(h.Repetition_channel,'String'));
            Name_Filep = sprintf('Gaussian_R_XY_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
            filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
            save(filename_Output,'Gaussian_R_XY','R_S_G_XY','G_mono');
        end
        
        if get(h.Channel_Save_XT_Check,'value')
            Gaussian_R_XT(:,:) = sum(abs(Gaussian_R).^2,1);
            R_S_G_XT(:,:) = sum(abs(R_S_G).^2,2);
            
            Channel_rep = eval(get(h.Repetition_channel,'String'));
            Name_Filep = sprintf('Gaussian_R_XT_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
            filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
            save(filename_Output,'Gaussian_R_XT','R_S_G_XT','G_mono');
        end
        
        if get(h.Channel_Save_YT_Check,'value')
            Gaussian_R_YT(:,:) = sum(abs(Gaussian_R).^2,2);
            R_S_G_YT(:,:) = sum(abs(R_S_G).^2,1);
            
            Channel_rep = eval(get(h.Repetition_channel,'String'));
            Name_Filep = sprintf('Gaussian_R_YT_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
            filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
            save(filename_Output,'Gaussian_R_YT','R_S_G_YT','G_mono');
        end
        
        if get(h.Channel_Save_All_Check,'value')
            Channel_rep = eval(get(h.Repetition_channel,'String'));
            Name_Filep = sprintf('Gaussian_R_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
            filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep) ;
            
            Gaussian_R_re = real(Gaussian_R);
            Gaussian_R_im = imag(Gaussian_R);
            
            R_S_G_re = real(R_S_G);
            R_S_G_im = imag(R_S_G);
            
            save(filename_Output,'Gaussian_R_re','Gaussian_R_im','R_S_G_re','R_S_G_im','G_mono');
            
            R_S_G_im =[];
            R_S_G_re =[];
            Gaussian_R_re =[];
            Gaussian_R_im =[];
        end
        
        
        
        Gaussian_R_sum = Gaussian_R.*0;
        R_S_G_sum = R_S_G.*0;
        G_mono_sum = G_mono.*0;
        h.Gaussian_R = Gaussian_R;
        Gaussian_R = [];
        R_S_G = [];
        
        
        if get(h.Channel_Save_XY_Check,'value')
            Gaussian_R_XY_sum = Gaussian_R_XY.*0;
            R_S_G_XY_sum = R_S_G_XY.*0;
            G_mono_XY_sum = G_mono.*0;
            Gaussian_R_XY = [];
            R_S_G_XY = [];
            
        end
        
        if get(h.Channel_Save_XT_Check,'value')
            Gaussian_R_XT_sum = Gaussian_R_XT.*0;
            R_S_G_XT_sum = R_S_G_XT.*0;
            G_mono_XT_sum = G_mono.*0;
            Gaussian_R_XT = [];
            R_S_G_XT = [];
            
        end
        
        if get(h.Channel_Save_YT_Check,'value')
            Gaussian_R_YT_sum = Gaussian_R_YT.*0;
            R_S_G_YT_sum = R_S_G_YT.*0;
            G_mono_YT_sum = G_mono.*0;
            Gaussian_R_YT = [];
            R_S_G_YT = [];
        end
        
        G_mono = [];
        G_mono = [];
        Gaussian_R_XY_ave = [];
        R_S_G_XY_ave = [];
        Gaussian_R_XT_ave = [];
        R_S_G_XT_ave = [];
        Gaussian_R_YT_ave = [];
        R_S_G_YT_ave = [];
        Gaussian_R_ave = [];
        R_S_G_ave = [];
        
        for i_average = 1: eval(get(h.Repetition_ave,'String'))
            if get(h.Channel_Save_XY_Check,'value')
                Name_Filep = sprintf('Gaussian_R_XY_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
                filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                load(filename_input)
                Gaussian_R_XY_sum = Gaussian_R_XY_sum + Gaussian_R_XY;
                R_S_G_XY_sum = R_S_G_XY_sum + R_S_G_XY;
                G_mono_XY_sum = G_mono_XY_sum +G_mono;
                if get(h.Channel_Save_average_Check,'value') == 0
                    delete(filename_input)
                end
            end
            
            if get(h.Channel_Save_XT_Check,'value')
                Name_Filep = sprintf('Gaussian_R_XT_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
                filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                load(filename_input)
                Gaussian_R_XT_sum = Gaussian_R_XT_sum + Gaussian_R_XT;
                R_S_G_XT_sum = R_S_G_XT_sum + R_S_G_XT;
                G_mono_XT_sum = G_mono_XT_sum +G_mono;
                if get(h.Channel_Save_average_Check,'value') == 0
                    delete(filename_input)
                end
            end
            
            if get(h.Channel_Save_YT_Check,'value')
                Name_Filep = sprintf('Gaussian_R_YT_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
                filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                load(filename_input)
                Gaussian_R_YT_sum = Gaussian_R_YT_sum + Gaussian_R_YT;
                R_S_G_YT_sum = R_S_G_YT_sum + R_S_G_YT;
                G_mono_YT_sum = G_mono_YT_sum +G_mono;
                if get(h.Channel_Save_average_Check,'value') == 0
                    delete(filename_input)
                end
            end
            
            if get(h.Channel_Save_All_Check,'value')
                Name_Filep = sprintf('Gaussian_R_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
                filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                load(filename_input)
                
                Gaussian_R = Gaussian_R_re +1i*Gaussian_R_im;
                R_S_G = R_S_G_re + 1i* R_S_G_im;
                
                Gaussian_R_sum = Gaussian_R_sum + Gaussian_R;
                R_S_G_sum = R_S_G_sum + Gaussian_R;
                
                G_mono_sum = G_mono_sum + G_mono;
                
                if get(h.Channel_Save_average_Check,'value') == 0
                    delete(filename_input)
                end
            end
            
        end
        
        if get(h.Channel_Save_XY_Check,'value')
            Gaussian_R_XY_ave = Gaussian_R_XY_sum./eval(get(h.Repetition_ave,'String'));
            R_S_G_XY_ave = R_S_G_XY_sum./eval(get(h.Repetition_ave,'String'));
            G_mono_ave = G_mono_XY_sum./eval(get(h.Repetition_ave,'String'));
            
            Name_Filep = sprintf('Gaussian_R_XY_Energy_%0.1d_channel_%0.1d_average.mat',i_steps,Channel_rep);
            filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
            save(filename_Output,'Gaussian_R_XY_ave','R_S_G_XY_ave','G_mono_ave');
            
            Gaussian_R_XY=[];
            G_mono=[];
            R_S_G_XY=[];
            Gaussian_R_XY_sum = [];
            R_S_G_XY_sum=[];
            G_mono_XY_sum =[];
            G_mono_ave= [];
            Gaussian_R_XY_ave = [];
            R_S_G_XY_ave = [];
        end
        
        if get(h.Channel_Save_XT_Check,'value')
            Gaussian_R_XT_ave = Gaussian_R_XT_sum./eval(get(h.Repetition_ave,'String'));
            R_S_G_XT_ave = R_S_G_XT_sum./eval(get(h.Repetition_ave,'String'));
            G_mono_ave = G_mono_XT_sum./eval(get(h.Repetition_ave,'String'));
            
            Name_Filep = sprintf('Gaussian_R_XT_Energy_%0.1d_channel_%0.1d_average.mat',i_steps,Channel_rep);
            filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
            save(filename_Output,'Gaussian_R_XT_ave','R_S_G_XT_ave','G_mono_ave');
            if eval(get(h.Repetition_ave,'String')) == 1
            else
                if get(h.Time_um_F4_Check,'Value') == 1
                    Intensityplot_array = sum(Gaussian_R_XT_ave,1);
                    plot(plot_array,Intensityplot_array,'Parent',h.I_Fig_Beam_3D_Section_T_F3,'Color','k','linewidth',2)
                    
                    
                elseif get(h.Transverse_um_F4_Check,'Value') == 1
                    Intensityplot_array = sum(Gaussian_R_XT_ave,2);
                    plot(plot_array,Intensityplot_array,'Parent',h.I_Fig_Beam_3D_Section_T_F3,'Color','k','linewidth',2)
                end
            end
            
            Gaussian_R_XT=[];
            G_mono=[];
            R_S_G_XT=[];
            Gaussian_R_XT_sum = [];
            R_S_G_XT_sum=[];
            G_mono_XT_sum =[];
            G_mono_ave= [];
            Gaussian_R_XT_ave = [];
            R_S_G_XT_ave = [];
        end
        
        if get(h.Channel_Save_YT_Check,'value')
            Gaussian_R_YT_ave = Gaussian_R_YT_sum./eval(get(h.Repetition_ave,'String'));
            R_S_G_YT_ave = R_S_G_YT_sum./eval(get(h.Repetition_ave,'String'));
            G_mono_ave = G_mono_YT_sum./eval(get(h.Repetition_ave,'String'));
            
            Name_Filep = sprintf('Gaussian_R_YT_Energy_%0.1d_channel_%0.1d_average.mat',i_steps,Channel_rep);
            filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
            save(filename_Output,'Gaussian_R_YT_ave','R_S_G_YT_ave','G_mono_ave');
            Gaussian_R_YT=[];
            G_mono=[];
            R_S_G_YT=[];
            Gaussian_R_YT_sum = [];
            R_S_G_YT_sum=[];
            G_mono_YT_sum =[];
            G_mono_ave= [];
            Gaussian_R_YT_ave = [];
            R_S_G_YT_ave = [];
        end
        
        if get(h.Channel_Save_All_Check,'value')
            Gaussian_R_ave = Gaussian_R_sum./eval(get(h.Repetition_ave,'String'));
            R_S_G_ave = R_S_G_sum./eval(get(h.Repetition_ave,'String'));
            G_mono_ave = G_mono_sum./eval(get(h.Repetition_ave,'String'));
            
            Name_Filep = sprintf('Gaussian_R_Energy_%0.1d_channel_%0.1d_average.mat',i_steps,Channel_rep);
            filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
            save(filename_Output,'Gaussian_R_ave','R_S_G_ave','G_mono_ave');
            
            Guassian_R = Gaussian_R_re + 1i*Gaussian_R_im;
            
            if get(h.Plot_on_Check,'value')
                axes(h.I_Fig_Beam_3D_Section_T_F3)
                if get(h.Time_um_F4_Check,'Value') == 1
                    Intensityplot_array(i_steps,:) = sum(sum(abs(Gaussian_R_ave).^2,1),2);
                    plot_array = t_array;
                    plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_Section_T_F3,'Color','k','Marker','x')
                elseif get(h.Transverse_um_F4_Check,'Value') == 1
                    Intensityplot_array(i_steps,:) = sum(sum(abs(Gaussian_R_ave).^2,1),3);
                    plot_array = x_array;
                    plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_Section_T_F3,'Color','k','Marker','x')
                    
                elseif get(h.Transversey_um_F4_Check,'Value') == 1
                    Intensityplot_array(i_steps,:) = sum(sum(abs(Gaussian_R_ave).^2,2),3);
                    plot_array = y_array;
                    plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_Section_T_F3,'Color','k','Marker','x')
                end
                hold on
            end
            Gaussian_R=[];
            G_mono=[];
            R_S_G=[];
            Gaussian_R_sum = [];
            R_S_G_sum=[];
            G_mono_sum =[];
            G_mono_ave= [];
            Gaussian_R_ave = [];
            R_S_G_ave = [];
        end
        
        if get(h.Stop_Dynamical_3D,'Value') == 0
            
        else
            
            Gaussian_KXY = [];
            
%             
%             if number_Steps == 0
%             else
%                 if get(h.Mono_Scan_Check,'value') == 1
%                     if get(h.Gaussian_Beam_1D_Check,'Value') == 1
%                         axes(h.I_Fig_Beam_3D_convolution_F8)
%                         plot(Energy_array,Intensity_array,'Parent',h.I_Fig_Beam_3D_convolution_F8,'LineStyle','-','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r');
%                         title_Convolution = strcat('Monochromator(',get(h.H_Mono,'String'),',',get(h.K_Mono,'String'),',',get(h.L_Mono,'String'),') Convoluted with (',num2str(h_Miller),',',num2str(k_Miller),',',num2str(l_Miller),')');
%                         title(title_Convolution)
%                         ylabel('Intensity (arb. unit)')
%                         xlabel('Energy (eV)')
%                         hold on
%                         xlim([E_Scan(1,1),E_Scan(1,size(E_Scan,2))])
%                         
%                         
%                         
%                     elseif get(h.Gaussian_Beam_3D_Check,'Value') == 1
%                         axes(h.I_Fig_Beam_3D_convolution_F8)
%                         plot(Energy_array,Intensity_array,'Parent',h.I_Fig_Beam_3D_convolution_F8,'LineStyle','-','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r');
%                         title_Convolution = strcat('Monochromator(',get(h.H_Mono,'String'),',',get(h.K_Mono,'String'),',',get(h.L_Mono,'String'),') Convoluted with (',num2str(h_Miller),',',num2str(k_Miller),',',num2str(l_Miller),')');
%                         title(title_Convolution)
%                         ylabel('Intensity (arb. unit)')
%                         xlabel('Energy (eV)')
%                         hold on
%                         
%                         
%                         h.Energy_array = Energy_array;
%                         %                     h.Gaussian_R_all = Gaussian_R_all;
%                         h.plot_array = plot_array;
%                         h.Intensityx_array = Intensityplot_array;
%                         h.E_Scan_plot = E_Scan_plot;
%                         h.kx_transvers_array = kx_transvers_array;
%                         h.ky_transvers_array = ky_transvers_array;
%                         %                     h.R_S_G_all = R_S_G_all;
%                         h.FBD = FBD;
%                         h.LaueD = LaueD;
%                         h.R_S_all = R_S_3D;
% 
%                     end
%                     
%                 end
%             end

            h.Energy_array = Energy_array;
            
            if get(h.Plot_on_Check,'value')
                h.plot_array = plot_array;
                h.Intensityx_array = Intensityplot_array;
            end
            
            h.E_Scan_plot = E_Scan_plot;
            h.kx_transvers_array = kx_transvers_array;
            h.ky_transvers_array = ky_transvers_array;
            h.FBD = FBD;
            h.LaueD = LaueD;
            h.R_S_all = R_S_3D;
            
        end
         
    end

    function More_Crystal_Scan(source, eventdata)
        
        h.x_array  = [];
        x_array = [];
        h.y_array  = [];
        y_array = [];
        h.t_array  = [];
        t_array = [];
        
        h.Energy_array  = [];
        Energy_array = [];
        h.Gaussian_R_all  = [];
        Gaussian_R_all = [];
        h.Intensityx_array  = [];
        Intensityx_array = [];
        h.E_Scan_plot  = [];
        E_Scan_plot = [];
        h.kx_transvers_array  = [];
        kx_transvers_array = [];
        h.ky_transvers_array  = [];
        ky_transvers_array = [];
        h.R_S_G_all  = [];
        R_S_G_all = [];
        h.FBD  = [];
        
        h.LaueD  = [];
        LaueD = [];
        h.R_S_all  = [];
        R_S_all = [];
        
        R_0H_S_Mono_all  = [];
        h.R_0H_S_Mono_all = [];
        
        child = get(h.I_Fig_Beam_3D_Section_F2,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.I_Fig_Beam_3D_reflectivity_F7,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_convolution_F8,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.I_Fig_Beam_3D_F1,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_mono_F5,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_profile_F6,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_GK_F4,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_Section_T_F3,'Children');
        for i=1:length(child)
            delete(child(i));
        end

        i_Cryst_show = eval(get(h.crystal_show,'String'));
        
        c_light= 299792458; %Light Speed m/s
        h_planck = 4.13566733*10^(-15);% eV
              
        Energy_center = eval(get(h.Energy_input,'String'));
        
        DWF = eval(get(h.DWF,'String'));
        
        Range_E_neg = (-1)*eval(get(h.Range_Left,'String'));
        Range_E_pos = eval(get(h.Range_Right,'String'));        
                
        N_Step = eval(get(h.Nstep_t_Beam,'String'));

        absor = get(h.Absorption,'Value');
        
        pos_MCC = h.pos_MCC;  
        
        Element_MCC = h.Element_MCC;
        h_MCC = h.h_MCC;
        k_MCC = h.k_MCC;
        l_MCC = h.l_MCC;
        Thickness_MCC = h.Thickness_MCC;
        Geometry_MCC = h.Geometry_MCC;
        Transmission_MCC = h.Transmission_MCC;
        Asymmetry_MCC =h.Asymmetry_MCC;
        Normal_MCC = h.Normal_MCC;
        polarization_MCC = h.polarization_MCC ;
        Energy_MCC = h.name_Energy;
        Beam_MCC = h.name_Beam;
        
        i_cryst_show = eval(get(h.crystal_show,'string'));
        
        
        for i_cryst = 1:size(pos_MCC,2)
            Z = Element_MCC(1,i_cryst);
            vector_Miller = [h_MCC(1,i_cryst), k_MCC(1,i_cryst),l_MCC(1,i_cryst)];
            [f_0_i,f_1_i,f_2_i,a_Par_i,b_Par_i,c_Par_i] = Element_Bragg_temp_Gui(Z,h_MCC(1,i_cryst), k_MCC(1,i_cryst),l_MCC(1,i_cryst),Energy_center);
            f_0(1,i_cryst) = f_0_i;
            f_1(1,i_cryst) = f_1_i;
            f_2(1,i_cryst) = f_2_i;
            a_Par(1,i_cryst) = a_Par_i;
            b_Par(1,i_cryst) = b_Par_i;
            c_Par(1,i_cryst) = c_Par_i;
        end
            
        set(h.f0,'String',f_0(1,i_Cryst_show))
        set(h.f1,'String',f_1(1,i_Cryst_show))
        set(h.f2,'String',f_2(1,i_Cryst_show))

        set(h.a_parameter,'String',a_Par(1,i_Cryst_show))
        set(h.b_parameter,'String',b_Par(1,i_Cryst_show))
        set(h.c_parameter,'String',c_Par(1,i_Cryst_show))
        
        
        if Geometry_MCC(1,i_cryst_show) ==1 
            [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_S,E_Scan,G_S,t_array,k_array,Dwidth] = Bragg_temp_Gui_test(Z(1,i_cryst_show),a_Par(1,i_cryst_show),b_Par(1,i_cryst_show),c_Par(1,i_cryst_show),Energy_center,Energy_center,h_MCC(1,i_cryst_show),k_MCC(1,i_cryst_show),l_MCC(1,i_cryst_show),DWF,f_0(1,i_cryst_show),f_1(1,i_cryst_show),f_2(1,i_cryst_show),absor,Range_E_neg,Range_E_pos,polarization_MCC(1,i_cryst_show),Asymmetry_MCC(1,i_cryst_show),Thickness_MCC(1,i_cryst_show),N_Step,Transmission_MCC(1,i_cryst_show),Normal_MCC(1,i_cryst_show));
            set(h.Chi_0,'String',Chi_0_Cx)
            set(h.Chi_h,'String',Chi_h_Cx)
            set(h.Theta_view,'String',Theta_Bragg*180/pi)
            set(h.DarwinWidth,'string',Dwidth)
            FBD = get(h.Bragg_FBD_Check,'Value');
            
        else
            [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_S,E_Scan,t_array,k_array,Dwidth] = Laue_temp_Gui_test(Z(1,i_cryst_show),a_Par(1,i_cryst_show),b_Par(1,i_cryst_show),c_Par(1,i_cryst_show),Energy_center,Energy_center,h_MCC(1,i_cryst_show),k_MCC(1,i_cryst_show),l_MCC(1,i_cryst_show),DWF,f_0(1,i_cryst_show),f_1(1,i_cryst_show),f_2(1,i_cryst_show),absor,Range_E_neg,Range_E_pos,polarization_MCC(1,i_cryst_show),Asymmetry_MCC(1,i_cryst_show),Thickness_MCC(1,i_cryst_show),N_Step,Transmission_MCC(1,i_cryst_show),Normal_MCC(1,i_cryst_show));
            set(h.Chi_0,'String',Chi_0_Cx)
            set(h.Chi_h,'String',Chi_h_Cx)
            set(h.Theta_view,'String',Theta_Bragg*180/pi)
            set(h.DarwinWidth,'string',Dwidth)
            FBD = get(h.Laue_FBD_Check,'Value');
        end
        
        E_Scan_plot = E_Scan-Energy_center;
        
        h.R_S = R_S;
        
        
        set (h.Status_Dynamical_3D,'String','Status: working','BackgroundColor',[0.5 0.5 0.5])
        
        
        N_Step_x = eval(get(h.Nstep_x_Beam,'String'));
        N_Step_y = eval(get(h.Nstep_y_Beam,'String'));
        
        initial_range_x = eval(get(h.initial_range_x,'String'));
        initial_range_y = eval(get(h.initial_range_y,'String'));
        
        %Definition of x
        sigma_x = eval(get(h.size_X_Beam,'String'))*1e-6; %um
        x_array = linspace(-initial_range_x/2,initial_range_x/2,N_Step_x)*1e-6;
        
        if get(h.Lorenztian_Distribution,'Value') == 1
            sigma_x = sigma_x/2;
            Gaussian_x = 1e-3/(pi*sigma_x)./(1+((x_array)/sigma_x).^2)/100;
        else
            sigma_x = sigma_x/2.355;
            Gaussian_x = 1*exp(-((x_array)/sigma_x).^2./2);
        end
        
        
        %Definition of y
        sigma_y = eval(get(h.size_Y_Beam,'String'))*1e-6; %um
        y_array = linspace(-initial_range_y/2,initial_range_y/2,N_Step_y)*1e-6;
        if get(h.Lorenztian_Distribution,'Value') == 1
            Gaussian_y = 1e-3/(pi*sigma_y)./(1+((y_array)/sigma_y).^2)/100;
        else
            Gaussian_y = 1*exp(-((y_array)/sigma_y).^2./2);
        end
        
        % What is the realtion kx x?
        dx = x_array(1,1)-x_array(1,2);
        dkx = 2*pi/(N_Step_x*dx);
        kx_transvers_array = dkx *linspace(1,N_Step_x,N_Step_x);        
        Gaussian_kx = fftshift(fft(Gaussian_x));
        
        % What is the realtion ky y?
        dy = y_array(1,1)-y_array(1,2);
        dky = 2*pi/(N_Step_y*dy);
        ky_transvers_array = dky *linspace(1,N_Step_y,N_Step_y) ;        
        Gaussian_ky = fftshift(fft(Gaussian_y));
        
        for i_y = 1:size(ky_transvers_array,2)
            Gaussian_XY (:,i_y)= Gaussian_kx'.*Gaussian_ky(1,i_y);
        end
        
        axes(h.I_Fig_Beam_3D_F1)
        surf(ky_transvers_array,kx_transvers_array,abs(Gaussian_XY).^2,'Parent',h.I_Fig_Beam_3D_F1,'edgecolor','none')
        
        Gaussian_ky =[];
        Gaussian_kx =[];
        Gaussian_y =[];
        Gaussian_x =[];
        
        
        axes(h.I_Fig_Beam_3D_reflectivity_F7)
        hold on
        
        for i_cryst = 1:size(pos_MCC,2)
            if polarization_MCC(1,i_cryst) == 1
                polarization = 's';
            else
                polarization = 'p';
            end
            
            Z = Element_MCC(1,i_cryst);
            if Geometry_MCC(1,i_cryst) ==1
                [R_S_3D] = Bragg_temp_Gui_3D_test...
                    (Z,a_Par(1,i_cryst),b_Par(1,i_cryst),c_Par(1,i_cryst),Energy_center,Energy_center+Energy_MCC(1,i_cryst),...
                    h_MCC(1,i_cryst),k_MCC(1,i_cryst),l_MCC(1,i_cryst),DWF,f_0(1,i_cryst),f_1(1,i_cryst),f_2(1,i_cryst),absor,...
                    Range_E_neg,Range_E_pos,polarization,Asymmetry_MCC(1,i_cryst),Thickness_MCC(1,i_cryst),N_Step,...
                    Transmission_MCC(1,i_cryst),kx_transvers_array,ky_transvers_array,Normal_MCC(1,i_cryst),h.cluster);
                LaueD = 0;
            else
                [R_S_3DM] = Laue_temp_Gui_3D_test...
                    (Z,a_Par(1,i_cryst),b_Par(1,i_cryst),c_Par(1,i_cryst),Energy_center,Energy_center+Energy_MCC(1,i_cryst),...
                    h_MCC(1,i_cryst),k_MCC(1,i_cryst),l_MCC(1,i_cryst),DWF,f_0(1,i_cryst),f_1(1,i_cryst),f_2(1,i_cryst),absor,...
                    Range_E_neg,Range_E_pos,polarization,Asymmetry_MCC(1,i_cryst),Thickness_MCC(1,i_cryst),N_Step,...
                    Transmission_MCC(1,i_cryst),kx_transvers_array,ky_transvers_array,Normal_MCC(1,i_cryst),h.cluster);
                LaueD = 1;
            end
            
            R_S_3D_Mat(i_cryst,:) = R_S_3DM(1,:);
            
            if pos_MCC(1,i_cryst) == 1                
                if get(h.crystal_line_chk_1,'Value') == 1
                else
                    R_S_3D_plot(1,:) = R_S_3DM(N_Step_y/2,N_Step_x/2,:);
                    plot(E_Scan_plot,abs(R_S_3D_plot(1,:)).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)
                end   
                
            elseif pos_MCC(1,i_cryst) == 2                
                if get(h.crystal_line_chk_2,'Value') == 1
                else
                    R_S_3D_plot(2,:) = R_S_3DM(N_Step_y/2,N_Step_x/2,:);
                    plot(E_Scan_plot,abs(R_S_3D_plot(2,:)).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)
                end
                
            elseif pos_MCC(1,i_cryst) == 3               
                if get(h.crystal_line_chk_3,'Value') == 1
                else
                    R_S_3D_plot(3,:) = R_S_3DM(N_Step_y/2,N_Step_x/2,:);
                    plot(E_Scan_plot,abs(R_S_3D_plot(3,:)).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)
                end
                
            elseif pos_MCC(1,i_cryst) == 4                
                if get(h.crystal_line_chk_4,'Value') == 1
                else
                    R_S_3D_plot(4,:) = R_S_3DM(N_Step_y/2,N_Step_x/2,:);
                    plot(E_Scan_plot,abs(R_S_3D_plot(4,:)).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)
                end
                
            elseif pos_MCC(1,i_cryst) == 5                
                if get(h.crystal_line_chk_5,'Value') == 1
                else
                    R_S_3D_plot(5,:) = R_S_3DM(N_Step_y/2,N_Step_x/2,:);
                    plot(E_Scan_plot,abs(R_S_3D_plot(5,:)).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)
                end
                
            elseif pos_MCC(1,i_cryst) == 6                
                if get(h.crystal_line_chk_6,'Value') == 1
                else
                    R_S_3D_plot(6,:) = R_S_3DM(N_Step_y/2,N_Step_x/2,:);
                    plot(E_Scan_plot,abs(R_S_3D_plot(6,:)).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)
                end
                
            elseif pos_MCC(1,i_cryst) == 7                
                if get(h.crystal_line_chk_7,'Value') == 1
                else
                    R_S_3D_plot(7,:) = R_S_3DM(N_Step_y/2,N_Step_x/2,:);
                    plot(E_Scan_plot,abs(R_S_3D_plot(7,:)).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)
                end
            elseif pos_MCC(1,i_cryst) == 8                
                if get(h.crystal_line_chk_8,'Value') == 1
                else
                    R_S_3D_plot(8,:) = R_S_3DM(N_Step_y/2,N_Step_x/2,:);
                    plot(E_Scan_plot,abs(R_S_3D_plot(8,:)).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)
                end
            end   
            
            axis auto
            R_S_3D_plot = [];
            
        end
        
        
        Energy_Bragg = Energy_center;
        
        
        if get(h.Mono_Beam_Check,'Value') == 1
            
            Thickness_Mono = eval(get(h.Thickness_Mono,'string'));
            Z_Mono = eval(get(h.Element_Mono,'String'));
            crystal_orientation_Mono = get(h.crystal_orientation_Mono,'value');
            
            % Perfect crystal
            Ang_asy_Deg_Mono = eval(get(h.Asymmetry_Mono,'String'));
            
            %Polarization Mono
            if get(h.Polarization_s_Mono,'Value') == 1
                Polarization_Mono = 's';
            elseif get(h.Polarization_p_Mono,'Value') == 1
                Polarization_Mono = 'p';
            end
            
            
            h_Miller_Mono = eval(get(h.H_Mono,'String'));
            k_Miller_Mono = eval(get(h.K_Mono,'String'));
            l_Miller_Mono = eval(get(h.L_Mono,'String'));
            
            vector_Miller_Mono = [h_Miller_Mono k_Miller_Mono l_Miller_Mono];
            
            [f_0_Mono,f_1_Mono,f_2_Mono,a_Par_Mono,b_Par_Mono,c_Par_Mono]=Element_Bragg_temp_Gui(Z_Mono,h_Miller_Mono,k_Miller_Mono,l_Miller_Mono,Energy_Bragg);
            
            set(h.f0_Mono,'String',f_0_Mono)
            set(h.f1_Mono,'String',f_1_Mono)
            set(h.f2_Mono,'String',f_2_Mono)
            
            if get(h.f_check_values,'Value') == 1
                f_0 = eval(get(h.f0_Mono,'String'));
                f_1 = eval(get(h.f1_Mono,'String'));
                f_2 = eval(get(h.f2_Mono,'String'));
            end
            
            
            [Theta_Bragg_Mono,Chi_0_Cx_Mono,Chi_h_Cx_Mono,R_0H_S_Mono,E_Scan,G_S,t_array,k_array,Dwidth] = Bragg_temp_Gui_test(Z_Mono,a_Par_Mono,b_Par_Mono,c_Par_Mono,Energy_Bragg,Energy_center,h_Miller_Mono,k_Miller_Mono,l_Miller_Mono,DWF,f_0_Mono,f_1_Mono,f_2_Mono,absor,Range_E_neg,Range_E_pos,Polarization_Mono,Ang_asy_Deg_Mono,Thickness_Mono,N_Step,0,crystal_orientation_Mono);
            
            axes(h.I_Fig_Beam_3D_reflectivity_F7)
            plot(E_Scan,abs(R_0H_S_Mono).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)
            title_Mono = strcat('Monochromator:(',get(h.H_Mono,'String'),',',get(h.K_Mono,'String'),',',get(h.L_Mono,'String'),')');
            title(title_Mono)
            ylabel('Intensity (arb. unit)')
            xlabel('Energy (eV)')
            axis auto
            hold on
            
            % To time space

             Gaussian_K = R_0H_S_Mono;
             axes(h.I_Fig_Beam_3D_reflectivity_F7)
             hold on
             plot(E_Scan_plot,abs(Gaussian_K).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)

            

            Gaussian_K_all(1,:) = Gaussian_K;
            
        end
        
        if get(h.Mono_Beam_Check,'Value') == 0
            
            WaveL_Bragg = h_planck*c_light/Energy_Bragg    ; %m
            k0=2*pi/WaveL_Bragg;
            rho = eval(get(h.rhoparameter,'String'));
            %rho=5e-4; %related to number of periodes undulator 5e-4
            sigk=rho*k0;
            
            phase = exp(1i*2*pi*random('unif',0,1,1,N_Step));
            Gaussian_k=exp(-0.5*(k_array-k0).*(k_array-k0)/sigk/sigk);
            
            axes(h.I_Fig_Beam_3D_Section_T_F3)
            % k space gaussian define by machine porperties
            plot(E_Scan_plot,Gaussian_k,'Parent',h.I_Fig_Beam_3D_Section_T_F3)
            ylabel('Intensity (arb. unit)')
            xlabel('Energy (eV)')
            axis auto
            hold on
           % pause(0.1)
            
            
            if get(h.Gaussian_Beam_SASE_Check,'Value') == 1
                Gaussian_k= Gaussian_k.*phase;
                % k space gaussian define by machine porperties
                plot(E_Scan_plot,abs(Gaussian_k).^2,'Parent',h.I_Fig_Beam_3D_Section_T_F3)
                
                % To time space
                Gaussian_T = ifft(fftshift(Gaussian_k));
                axes(h.I_Fig_Beam_3D_Section_T_F3)
                plot(t_array,Gaussian_T,'Parent',h.I_Fig_Beam_3D_Section_T_F3)
                %pause(0.1)
                
                %Definition time window
                lt = eval(get(h.size_T_Beam,'String'))*1e-15; %seg
                dt = t_array(1,2)- t_array(1,1);
                Nsam=floor(lt/dt);
                Gaussian_T(Nsam:end)=0;
                
                plot(t_array,abs(Gaussian_T).^2,'Parent',h.I_Fig_Beam_3D_GK_F4)
               % pause(0.1)
                
                %Back to k space
                Gaussian_K=fftshift(fft(Gaussian_T))*3;
                
                axes(h.I_Fig_Beam_3D_reflectivity_F7)
                hold on
                plot(E_Scan_plot,abs(Gaussian_K).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)
               % pause(0.1)
                
                Gaussian_K_all(1,:) = Gaussian_K;
                %G_mono = R_S.*Gaussian_K;
                G_mono = Gaussian_K;
                
            else
                
                
                Gaussian_K_all(1,:) = Gaussian_k;
                %G_mono = R_S.*Gaussian_K;
                G_mono = Gaussian_k;
                
            end
        else
            G_mono =  Gaussian_K;
            
        end
        
        for i_x = 1 :size(E_Scan_plot,2)
            Gaussian_K_3D (:,:,i_x)= Gaussian_XY'.*G_mono(1,i_x);
        end
        
        axes(h.I_Fig_Beam_3D_F1)
        surf(kx_transvers_array,ky_transvers_array,sum(abs(Gaussian_K_3D).^2,3),'Parent',h.I_Fig_Beam_3D_F1,'edgecolor','none')
        view([20 20]);
        
        Crystal_range_step = 1;
        Crystal_range_n = 0;
        Crystal_range_p = 0;
        
        if get(h.crystal_line_chk_1,'Value') == 1
        Crystal_range_p = eval(get(h.crystal_range_p_1,'string'));
        Crystal_range_n = eval(get(h.crystal_range_n_1,'string'));
        Crystal_range_step =eval(get( h.crystal_range_steps_1,'string'));
        i_cryst = 1;
        
        elseif get(h.crystal_line_chk_2,'Value') == 1
        Crystal_range_p =eval(get( h.crystal_range_p_2,'string'));
        Crystal_range_n =eval(get( h.crystal_range_n_2,'string'));
        Crystal_range_step = eval(get(h.crystal_range_steps_2,'string'));
        i_cryst = 2;
        
        elseif get(h.crystal_line_chk_3,'Value') == 1
        Crystal_range_p = eval(get(h.crystal_range_p_3,'string'));
        Crystal_range_n = eval(get(h.crystal_range_n_3,'string'));
        Crystal_range_step = eval(get(h.crystal_range_steps_3,'string'));
        i_cryst = 3;
        
        elseif get(h.crystal_line_chk_4,'Value') == 1
        Crystal_range_p = eval(get(h.crystal_range_p_4,'string'));
        Crystal_range_n = eval(get(h.crystal_range_n_4,'string'));
        Crystal_range_step = eval(get(h.crystal_range_steps_4,'string'));
        i_cryst = 4;
         
        elseif get(h.crystal_line_chk_5,'Value') == 1
        Crystal_range_p = eval(get(h.crystal_range_p_5,'string'));
        Crystal_range_n =eval(get( h.crystal_range_n_5,'string'));
        Crystal_range_step = eval(get(h.crystal_range_steps_5,'string'));
        i_cryst = 5;
          
        elseif get(h.crystal_line_chk_6,'Value') == 1
        Crystal_range_p = eval(get(h.crystal_range_p_6,'string'));
        Crystal_range_n = eval(get(h.crystal_range_n_6,'string'));
        Crystal_range_step = eval(get(h.crystal_range_steps_6,'string'));
        i_cryst = 6;
                  
        elseif get(h.crystal_line_chk_7,'Value') == 1
        Crystal_range_p = eval(get(h.crystal_range_p_7,'string'));
        Crystal_range_n = eval(get(h.crystal_range_n_7,'string'));
        Crystal_range_step = eval(get(h.crystal_range_steps_7,'string'));
        i_cryst = 7; 
                  
        elseif get(h.crystal_line_chk_8,'Value') == 1
        Crystal_range_p = eval(get(h.crystal_range_p_8,'string'));
        Crystal_range_n = eval(get(h.crystal_range_n_8,'string'));
        Crystal_range_step = eval(get(h.crystal_range_steps_8,'string'));
        i_cryst = 8;
        end
        
        Crystal_range_step_size = (Crystal_range_n - Crystal_range_p)/(Crystal_range_step);
        if Crystal_range_step == 1
            Crystal_range_step = Crystal_range_step-1;            
        end

        Gaussian_K_3D_int = Gaussian_K_3D;
        
        for i_steps = 1 : (Crystal_range_step)+1
            
            for i_average = 1: eval(get(h.Repetition_ave,'String'))
                set(h.Repetition_num ,'string',i_average)
                
                if get(h.Pause_Dynamical_3D,'Value') == 1
                    pause(1)
                    for i_pause =1:1000
                        if get(h.Pause_Dynamical_3D,'Value') == 0
                            set (h.Status_Dynamical_3D,'String','Status: Paused','BackgroundColor',[0 0.8 0.8])
                            pause(0.1)
                        else
                            set (h.Status_Dynamical_3D,'String','Status: working','BackgroundColor',[0.5 0.5 0.5])
                        end
                    end
                else
                   % pause(0.1)
                end
                                
                Gaussian_K_3D = Gaussian_K_3D_int;
                
                Energy_Scan = Crystal_range_p +(i_steps-1)* Crystal_range_step_size;
                
                set(h.Energy_point,'String',Energy_Scan)
                
                Energy_array(1,i_steps) = Energy_Scan;
                set(h.Image_point,'String',i_steps)
                
                if Crystal_range_step == 1
                    
                else
                    
                    if Geometry_MCC(1,i_cryst) == 1
                        [R_S_3DScan] = Bragg_temp_Gui_3D_test...
                            (Z,a_Par(1,i_cryst),b_Par(1,i_cryst),c_Par(1,i_cryst),Energy_center,Energy_center+Energy_Scan,...
                            h_MCC(1,i_cryst),k_MCC(1,i_cryst),l_MCC(1,i_cryst),DWF,f_0(1,i_cryst),f_1(1,i_cryst),f_2(1,i_cryst),absor,...
                            Range_E_neg,Range_E_pos,polarization,Asymmetry_MCC(1,i_cryst),Thickness_MCC(1,i_cryst),N_Step,...
                            Transmission_MCC(1,i_cryst),kx_transvers_array,ky_transvers_array,Normal_MCC(1,i_cryst),h.cluster);
                        
                    else
                        [R_S_3DScan] = Laue_temp_Gui_3D_test...
                            (Z,a_Par(1,i_cryst),b_Par(1,i_cryst),c_Par(1,i_cryst),Energy_center,Energy_center+Energy_Scan,...
                            h_MCC(1,i_cryst),k_MCC(1,i_cryst),l_MCC(1,i_cryst),DWF,f_0(1,i_cryst),f_1(1,i_cryst),f_2(1,i_cryst),absor,...
                            Range_E_neg,Range_E_pos,polarization,Asymmetry_MCC(1,i_cryst),Thickness_MCC(1,i_cryst),N_Step,...
                            Transmission_MCC(1,i_cryst),kx_transvers_array,ky_transvers_array,Normal_MCC(1,i_cryst), h.cluster);
                        
                    end                    
                    R_S_3D_plot(1,:) = R_S_3DScan(N_Step_y/2,N_Step_x/2,:);
                    plot(E_Scan_plot,abs(R_S_3D_plot).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)

                end
                
                axes(h.I_Fig_Beam_3D_mono_F5)
                if get(h.More_Crystal_Chk,'value') == 1
                    
                    for i_cryst_scan = 1:size(pos_MCC,2)
                        
%                         size(R_S_3DScan)
%                         R_S_3D_plot(:,:) = sum(abs(R_S_3DScan),1).^2;
%                         surf(E_Scan_plot,kx_transvers_array,R_S_3D_plot,'Parent',h.I_Fig_Beam_3D_mono_F5,'edgecolor','none')
%                         
%                         view([20 20]);
%                         R_S_3D_plot = [];
                        
                        if get(h.Pause_Dynamical_3D,'Value') == 1
                            for i_pause =1:1000
                                if get(h.Pause_Dynamical_3D,'Value') == 1
                                    pause(0.1)
                                else
                                end
                            end
                        else
                           % pause(0.1)
                        end
                        
                        if i_cryst_scan == 1
                            if get(h.crystal_line_chk_1,'Value') == 1
                                R_S_3D = R_S_3DScan;
                            else
                                R_S_3D(1,:) = R_S_3D_Mat(1,:);
                            end
                            
                        elseif i_cryst_scan == 2
                            if get(h.crystal_line_chk_2,'Value') == 1
                                R_S_3D = R_S_3DScan;
                            else
                                R_S_3D(1,:) = R_S_3D_Mat(2,:);
                            end
                            
                        elseif i_cryst_scan == 3
                            if get(h.crystal_line_chk_3,'Value') == 1
                                R_S_3D = R_S_3DScan;
                            else
                                R_S_3D(1,:) = R_S_3D_Mat(3,:);
                            end
                            
                        elseif i_cryst_scan == 4
                            if get(h.crystal_line_chk_4,'Value') == 1
                                R_S_3D = R_S_3DScan;
                            else
                                R_S_3D(1,:) = R_S_3D_Mat(4,:);
                            end
                            
                        elseif i_cryst_scan == 5
                            if get(h.crystal_line_chk_5,'Value') == 1
                                R_S_3D = R_S_3DScan;
                            else
                                R_S_3D(1,:) = R_S_3D_Mat(5,:);
                            end
                            
                        elseif i_cryst_scan == 6
                            if get(h.crystal_line_chk_6,'Value') == 1
                                R_S_3D = R_S_3DScan;
                            else
                                R_S_3D(1,:) = R_S_3D_Mat(6,:);
                            end
                            
                        elseif i_cryst_scan == 7
                            if get(h.crystal_line_chk_7,'Value') == 1
                                R_S_3D = R_S_3DScan;
                            else
                                R_S_3D(1,:) = R_S_3D_Mat(7,:);
                            end
                            
                        elseif i_cryst_scan == 8
                            if get(h.crystal_line_chk_8,'Value') == 1
                                R_S_3D = R_S_3DScan;
                            else
                                R_S_3D(1,:) = R_S_3D_Mat(8,:);
                            end
                            
                        end
                        % Convolute both signals R MONO and R crystal in 2D
                        
                        R_S_G = R_S_3D.*Gaussian_K_3D;
                        
                        Gaussian_K_3D = R_S_G;
                        %Gaussian_K_3D = [];
                        
                        axes(h.I_Fig_Beam_3D_F1)
                        surf(x_array,y_array,sum(abs(R_S_G).^2,3),'Parent',h.I_Fig_Beam_3D_F1,'edgecolor','none')
                        view([20 20]);
                    end
                    
                    if get(h.Shift_x,'Value') == 1
                        R_S_G = fftshift(R_S_G,1);
                    end
                    if get(h.Shift_y,'Value') == 1
                        R_S_G = fftshift(R_S_G,2);
                    end
                    if get(h.Shift_t2,'Value') == 1
                        R_S_G = fftshift(R_S_G,3);
                    end
                    
                    Gaussian_R = (ifftn(R_S_G));
                    
                    
                    axes(h.I_Fig_Beam_3D_Section_F2)
                    if get(h.TX_plain_3D_Check,'Value') 
                        Gaussian_R_plot(:,:) = sum(abs(Gaussian_R).^2,1);
                        imagesc(t_array,x_array,Gaussian_R_plot,'Parent',h.I_Fig_Beam_3D_Section_F2)
                        
                    elseif get(h.TY_plain_3D_Check,'Value') == 1
                        Gaussian_R_plot(:,:) = sum(abs(Gaussian_R).^2,2);
                        imagesc(t_array,y_array,Gaussian_R_plot,'Parent',h.I_Fig_Beam_3D_Section_F2)
                        
                    elseif get(h.XY_plain_3D_Check,'Value') == 1
                        Gaussian_R_plot(:,:) = sum(abs(Gaussian_R).^2,3);
                        imagesc(x_array,y_array,Gaussian_R_plot,'Parent',h.I_Fig_Beam_3D_Section_F2)
                    end
                    
                    Gaussian_R_plot = [];
                   % pause(0.1)
                    
                    %  Gaussian_K_3D = fftshift(fftn(Gaussian_R));
                    
                    % end
%                    Gaussian_K_3D = [];
                    
                    axes(h.I_Fig_Beam_3D_profile_F6)
                    if get(h.Time_um_F4_Check,'Value') == 1
                        Intensityplot_array(i_steps,:) = sum(sum(abs(Gaussian_R).^2,1),2);
                        plot_array = t_array;
                        plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_profile_F6)
                        
                    elseif get(h.Transverse_um_F4_Check,'Value') == 1
                        Intensityplot_array(i_steps,:) = sum(sum(abs(Gaussian_R).^2,1),3);
                        plot_array = x_array;
                        plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_profile_F6)
                        
                    elseif get(h.Transversey_um_F4_Check,'Value') == 1
                        Intensityplot_array(i_steps,:) = sum(sum(abs(Gaussian_R).^2,2),3);
                        plot_array = y_array;
                        plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_profile_F6)
                    end
                    hold on
                    
                    Intensity_array(1,i_steps) = sum(sum(sum(abs(Gaussian_R).^2,1),2),3);
                    axes(h.I_Fig_Beam_3D_convolution_F8)
                    plot(Energy_array(1,i_steps),Intensity_array(1,i_steps),'Parent',h.I_Fig_Beam_3D_convolution_F8,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r');
                    
                    ylabel('Intensity (arb. unit)')
                    xlabel('Energy (eV)')
                    xlim auto
                    hold on
                    %pause(0.1)
                    
                else
                    R_S_3D_plot(:,:) = sum(abs(R_S_3D1),1).^2;
                    surf(E_Scan_plot,kx_transvers_array,R_S_3D_plot,'Parent',h.I_Fig_Beam_3D_mono_F5,'edgecolor','none')
                    
                    view([20 20]);
                    R_S_3D_plot = [];
                    
                    if get(h.Pause_Dynamical_3D,'Value') == 1
                        for i_pause =1:1000
                            if get(h.Pause_Dynamical_3D,'Value') == 1
                                pause(0.1)
                            else
                            end
                        end
                    else
                       % pause(0.1)
                    end
                    
                    
                    % Convolute both signals R MONO and R crystal in 2D
                    R_S_G = R_S_3D1.*Gaussian_K_3D;
                    
                    
                    Gaussian_K_3D = [];
                    
                    axes(h.I_Fig_Beam_3D_F1)
                    surf(x_array,y_array,sum(abs(R_S_G).^2,3),'Parent',h.I_Fig_Beam_3D_F1,'edgecolor','none')
                    view([20 20]);
                    
                    
                    if get(h.Shift_x,'Value') == 1
                        R_S_G = fftshift(R_S_G,1);
                    end
                    if get(h.Shift_y,'Value') == 1
                        R_S_G = fftshift(R_S_G,2);
                    end
                    if get(h.Shift_t2,'Value') == 1
                        R_S_G = fftshift(R_S_G,3);
                    end
                    
                    Gaussian_R = (ifftn(R_S_G));
                    
                    
                    
                    axes(h.I_Fig_Beam_3D_Section_F2)
                    if get(h.TX_plain_3D_Check,'Value') == 1
                        Gaussian_R_plot(:,:) = sum(abs(Gaussian_R).^2,1);
                        imagesc(t_array,x_array,Gaussian_R_plot,'Parent',h.I_Fig_Beam_3D_Section_F2)
                        
                    elseif get(h.TY_plain_3D_Check,'Value') == 1 
                        Gaussian_R_plot(:,:) = sum(abs(Gaussian_R).^2,2);
                        imagesc(t_array,y_array,Gaussian_R_plot,'Parent',h.I_Fig_Beam_3D_Section_F2)
                        
                    elseif get(h.XY_plain_3D_Check,'Value') == 1
                        Gaussian_R_plot(:,:) = sum(abs(Gaussian_R).^2,3);
                        imagesc(x_array,y_array,Gaussian_R_plot,'Parent',h.I_Fig_Beam_3D_Section_F2)
                    end
                    Gaussian_R_plot = [];
                    
                    axes(h.I_Fig_Beam_3D_profile_F6)
                    if get(h.Time_um_F4_Check,'Value') == 1
                        Intensityplot_array(i_steps,:) = sum(sum(abs(Gaussian_R).^2,1),2);
                        plot_array = t_array;
                        plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_profile_F6)
                        
                    elseif get(h.Transverse_um_F4_Check,'Value') == 1
                        Intensityplot_array(i_steps,:) = sum(sum(abs(Gaussian_R).^2,1),3);
                        plot_array = x_array;
                        plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_profile_F6)
                        
                    elseif get(h.Transversey_um_F4_Check,'Value') == 1
                        Intensityplot_array(i_steps,:) = sum(sum(abs(Gaussian_R).^2,2),3);
                        plot_array = y_array;
                        plot(plot_array',Intensityplot_array(i_steps,:),'Parent',h.I_Fig_Beam_3D_profile_F6)
                    end
                    hold on
                    
                    Intensity_array(1,i_steps) = sum(sum(sum(abs(Gaussian_R).^2,1),2),3);
                    axes(h.I_Fig_Beam_3D_convolution_F8)
                    plot(Energy_array(1,i_steps),Intensity_array(1,i_steps),'Parent',h.I_Fig_Beam_3D_convolution_F8,'LineStyle','none','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r');
                    title_Convolution = strcat('Monochromator(',get(h.H_Mono,'String'),',',get(h.K_Mono,'String'),',',get(h.L_Mono,'String'),') Convoluted with (',num2str(h_Miller),',',num2str(k_Miller),',',num2str(l_Miller),')');
                    title(title_Convolution)
                    ylabel('Intensity (arb. unit)')
                    xlabel('Energy (eV)')
                    xlim auto
                    hold on
                  %  pause(0.1)
                end

                
                %save_folder_intermediate = '/das/work/p15/p15366/RN84/SwissFEL Simulations/Calculation_Support';
                if h.cluster == true
                    save_folder_intermediate = '/home/angrod/Desktop/MultiBeam_calculator/Temporal_Data';
                else
                    save_folder_intermediate = '/Users/angrod/Desktop/MultiBeam_calculator/Temporal_Data';
                end
                h.save_folder_intermediate = save_folder_intermediate;
                
                if get(h.Channel_Save_XY_Check,'value')
                    Gaussian_R_XY(:,:) = sum(abs(Gaussian_R).^2,3);  
                    R_S_G_XY(:,:) = sum(abs(R_S_G).^2,3);  
                    
                    Channel_rep = eval(get(h.Repetition_channel,'String'));
                    Name_Filep = sprintf('Gaussian_R_XY_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
                    filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                    save(filename_Output,'Gaussian_R_XY','R_S_G_XY','G_mono');
                end
                
                if get(h.Channel_Save_XT_Check,'value')
                    Gaussian_R_XT(:,:) = sum(abs(Gaussian_R).^2,1);  
                    R_S_G_XT(:,:) = sum(abs(R_S_G).^2,2);
                    
                    Channel_rep = eval(get(h.Repetition_channel,'String'));
                    Name_Filep = sprintf('Gaussian_R_XT_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
                    filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                    save(filename_Output,'Gaussian_R_XT','R_S_G_XT','G_mono');
                end
                
                if get(h.Channel_Save_YT_Check,'value')
                    Gaussian_R_YT(:,:) = sum(abs(Gaussian_R).^2,2);                        
                    R_S_G_YT(:,:) = sum(abs(R_S_G).^2,1);
                    
                    Channel_rep = eval(get(h.Repetition_channel,'String'));
                    Name_Filep = sprintf('Gaussian_R_YT_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
                    filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                    save(filename_Output,'Gaussian_R_YT','R_S_G_YT','G_mono');
                end
                
                if get(h.Channel_Save_All_Check,'value') 
                    Channel_rep = eval(get(h.Repetition_channel,'String'));
                    Name_Filep = sprintf('Gaussian_R_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
                    filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                    save(filename_Output,'Gaussian_R','R_S_G','G_mono');
                end
                
            end
            Gaussian_R_sum = Gaussian_R.*0;
            R_S_G_sum = R_S_G.*0;
            G_mono_sum = G_mono.*0;
            h.Gaussian_R = Gaussian_R;
            Gaussian_R = [];
            R_S_G = [];
            
            
            if get(h.Channel_Save_XY_Check,'value')
                Gaussian_R_XY_sum = Gaussian_R_XY.*0;
                R_S_G_XY_sum = R_S_G_XY.*0;
                G_mono_XY_sum = G_mono.*0;
                Gaussian_R_XY = [];
                R_S_G_XY = [];
                
            end
            
            if get(h.Channel_Save_XT_Check,'value')
                Gaussian_R_XT_sum = Gaussian_R_XT.*0;
                R_S_G_XT_sum = R_S_G_XT.*0;
                G_mono_XT_sum = G_mono.*0;
                Gaussian_R_XT = [];
                R_S_G_XT = [];
                
            end
            
            if get(h.Channel_Save_YT_Check,'value')
                Gaussian_R_YT_sum = Gaussian_R_YT.*0;
                R_S_G_YT_sum = R_S_G_YT.*0;
                G_mono_YT_sum = G_mono.*0;
                Gaussian_R_YT = [];
                R_S_G_YT = [];
            end
            G_mono = [];
            Gaussian_R = [];
            R_S_G = [];
            G_mono = [];
            Gaussian_R_XY_ave = [];
            R_S_G_XY_ave = [];
            Gaussian_R_XT_ave = [];
            R_S_G_XT_ave = [];
            Gaussian_R_YT_ave = [];
            R_S_G_YT_ave = [];
            Gaussian_R_ave = [];
            R_S_G_ave = [];
            
            for i_average = 1: eval(get(h.Repetition_ave,'String'))
                if get(h.Channel_Save_XY_Check,'value')
                    Name_Filep = sprintf('Gaussian_R_XY_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
                    filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                    load(filename_input)
                    Gaussian_R_XY_sum = Gaussian_R_XY_sum + Gaussian_R_XY;
                    R_S_G_XY_sum = R_S_G_XY_sum + R_S_G_XY;
                    G_mono_XY_sum = G_mono_XY_sum +G_mono;
                    if get(h.Channel_Save_average_Check,'value') == 0
                        delete(filename_input)
                    end
                end
                
                if get(h.Channel_Save_XT_Check,'value')
                    Name_Filep = sprintf('Gaussian_R_XT_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
                    filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                    load(filename_input)
                    Gaussian_R_XT_sum = Gaussian_R_XT_sum + Gaussian_R_XT;
                    R_S_G_XT_sum = R_S_G_XT_sum + R_S_G_XT;
                    G_mono_XT_sum = G_mono_XT_sum +G_mono;
                    if get(h.Channel_Save_average_Check,'value') == 0
                        delete(filename_input)
                    end
                end
                
                if get(h.Channel_Save_YT_Check,'value')
                    Name_Filep = sprintf('Gaussian_R_YT_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
                    filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                    load(filename_input)
                    Gaussian_R_YT_sum = Gaussian_R_YT_sum + Gaussian_R_YT;
                    R_S_G_YT_sum = R_S_G_YT_sum + R_S_G_YT;
                    G_mono_YT_sum = G_mono_YT_sum +G_mono;
                    if get(h.Channel_Save_average_Check,'value') == 0
                        delete(filename_input)
                    end
                end
                
                if get(h.Channel_Save_All_Check,'value')
                    Name_Filep = sprintf('Gaussian_R_Energy_%0.1d_channel_%0.1d_point_%0.1d.mat',i_steps,Channel_rep,i_average);
                    filename_input = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                    load(filename_input)
                    
                    Gaussian_R_sum = Gaussian_R_sum + Gaussian_R;
                    R_S_G_sum = R_S_G_sum + R_S_G;
                    G_mono_sum = G_mono_sum +G_mono;
                    if get(h.Channel_Save_average_Check,'value') == 0
                        delete(filename_input)
                    end
                end
                
            end
            
            if get(h.Channel_Save_XY_Check,'value')
                Gaussian_R_XY_ave = Gaussian_R_XY_sum./eval(get(h.Repetition_ave,'String'));
                R_S_G_XY_ave = R_S_G_XY_sum./eval(get(h.Repetition_ave,'String'));
                G_mono_ave = G_mono_XY_sum./eval(get(h.Repetition_ave,'String'));
                
                Name_Filep = sprintf('Gaussian_R_XY_Energy_%0.1d_channel_%0.1d_average.mat',i_steps,Channel_rep);
                filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                save(filename_Output,'Gaussian_R_XY_ave','R_S_G_XY_ave','G_mono_ave');
                
                Gaussian_R_XY=[];
                G_mono=[];
                R_S_G_XY=[];
                Gaussian_R_XY_sum = [];
                R_S_G_XY_sum=[];
                G_mono_XY_sum =[];
                G_mono_ave= [];
                Gaussian_R_XY_ave = [];
                R_S_G_XY_ave = [];
            end
            if get(h.Channel_Save_XT_Check,'value')
                Gaussian_R_XT_ave = Gaussian_R_XT_sum./eval(get(h.Repetition_ave,'String'));
                R_S_G_XT_ave = R_S_G_XT_sum./eval(get(h.Repetition_ave,'String'));
                G_mono_ave = G_mono_XT_sum./eval(get(h.Repetition_ave,'String'));
                
                Name_Filep = sprintf('Gaussian_R_XT_Energy_%0.1d_channel_%0.1d_average.mat',i_steps,Channel_rep);
                filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                save(filename_Output,'Gaussian_R_XT_ave','R_S_G_XT_ave','G_mono_ave');
                
                Gaussian_R_XT=[];
                G_mono=[];
                R_S_G_XT=[];
                Gaussian_R_XT_sum = [];
                R_S_G_XT_sum=[];
                G_mono_XT_sum =[];
                G_mono_ave= [];                
                R_S_G_XT_ave = [];               
                Gaussian_R_XT_ave = [];
                
            end
            if get(h.Channel_Save_YT_Check,'value')
                Gaussian_R_YT_ave = Gaussian_R_YT_sum./eval(get(h.Repetition_ave,'String'));
                R_S_G_YT_ave = R_S_G_YT_sum./eval(get(h.Repetition_ave,'String'));
                G_mono_ave = G_mono_YT_sum./eval(get(h.Repetition_ave,'String'));
                
                Name_Filep = sprintf('Gaussian_R_YT_Energy_%0.1d_channel_%0.1d_average.mat',i_steps,Channel_rep);
                filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                save(filename_Output,'Gaussian_R_YT_ave','R_S_G_YT_ave','G_mono_ave');
                Gaussian_R_YT=[];
                G_mono=[];
                R_S_G_YT=[];
                Gaussian_R_YT_sum = [];
                R_S_G_YT_sum=[];
                G_mono_YT_sum =[];
                G_mono_ave= [];
                Gaussian_R_YT_ave = [];
                R_S_G_YT_ave = [];
                
            end
            if get(h.Channel_Save_All_Check,'value')
                Gaussian_R_ave = Gaussian_R_sum./eval(get(h.Repetition_ave,'String'));
                R_S_G_ave = R_S_G_sum./eval(get(h.Repetition_ave,'String'));
                G_mono_ave = G_mono_sum./eval(get(h.Repetition_ave,'String'));
                
                Name_Filep = sprintf('Gaussian_R_Energy_%0.1d_channel_%0.1d_average.mat',i_steps,Channel_rep);
                filename_Output = sprintf('%s/%s',save_folder_intermediate,Name_Filep);
                save(filename_Output,'Gaussian_R_ave','R_S_G_ave','G_mono_ave');
                
                Gaussian_R=[];
                G_mono=[];
                R_S_G=[];
                Gaussian_R_sum = [];
                R_S_G_sum=[];
                G_mono_sum =[];
                G_mono_ave= [];
                Gaussian_R_ave = [];
                R_S_G_ave = [];
                
            end
            
            
        end
            
        
        Gaussian_XY = [];
        
        

        if get(h.Mono_Scan_Check,'value') == 1
            
            axes(h.I_Fig_Beam_3D_convolution_F8)
            plot(Energy_array,Intensity_array,'Parent',h.I_Fig_Beam_3D_convolution_F8,'LineStyle','-','Marker','o','MarkerFaceColor','r','MarkerEdgeColor','r');
            title_Convolution = strcat('Monochromator(',get(h.H_Mono,'String'),',',get(h.K_Mono,'String'),',',get(h.L_Mono,'String'),') Convoluted with (',num2str(h_Miller),',',num2str(k_Miller),',',num2str(l_Miller),')');
            title(title_Convolution)
            ylabel('Intensity (arb. unit)')
            xlabel('Energy (eV)')
            hold on
            xlim([E_Scan(1,1),E_Scan(1,size(E_Scan,2))])
            
            
            axes(h.I_Fig_Beam_3D_profile_F6)
            hold off
            surf(plot_array,Energy_array,Intensityplot_array,'Parent',h.I_Fig_Beam_3D_profile_F6,'edgecolor','none')
            zlabel('Intensity (arb. unit)')
            xlabel('Transverse displecement (m)')
            ylabel('Energy (eV)')
            axis auto
            
            h.x_array = x_array;
            h.y_array = y_array;
            h.t_array = t_array;
            h.Energy_array = Energy_array;
            %                     h.Gaussian_R_all = Gaussian_R_all;
            h.plot_array = plot_array;
            h.Intensityx_array = Intensityplot_array;
            h.E_Scan_plot = E_Scan_plot;
            h.kx_transvers_array = kx_transvers_array;
            h.ky_transvers_array = ky_transvers_array;
            %                     h.R_S_G_all = R_S_G_all;
            h.FBD = FBD;
            h.LaueD = LaueD;
            h.R_S_all = R_S_3D1;
            if get(h.Mono_Beam_Check,'Value') == 1
                h.R_0H_S_Mono_all = R_0H_S_Mono_all;
            else
                h.R_0H_S_Mono_all = Gaussian_K_all;
            end
        end

        
        h.x_array = x_array;
        h.y_array = y_array;
        h.t_array = t_array;
        h.Energy_array = Energy_array;
        h.plot_array = plot_array;
        h.Intensityx_array = Intensityplot_array;
        h.E_Scan_plot = E_Scan_plot;
        h.kx_transvers_array = kx_transvers_array;
        h.ky_transvers_array = ky_transvers_array;
        h.FBD = FBD;
        h.LaueD = LaueD;
        h.R_S_all = R_S_3D_MCC;
        if get(h.Mono_Beam_Check,'Value') == 1
            h.R_0H_S_Mono_all = R_0H_S_Mono_all;
        else
            h.R_0H_S_Mono_all = Gaussian_K_all;
        end
        
        set (h.Status_Dynamical_3D,'String','Status: Finnish','BackgroundColor',[0 0 0.9])
        
    end

%% simulates a crystal with 2D reads a matrix and with it calculates for each step the strain
%Not under use
    function Xtal_2D(source,eventdata)
        
        
        if source == h.Xtal_2D
             h.I_Fig_Crystal_2D= figure(d+199); 
            
            Position_Fig_Strain = get(h.lp_fit,'Position');
            Position_x = Position_Fig_Strain(1,1);
            Position_y = Position_Fig_Strain(1,2);
            width_x = Position_Fig_Strain(1,3);
            width_y = Position_Fig_Strain(1,4);
            
            set(h.I_Fig_Crystal_2D,'Name','Crystal 2D',...
                'NumberTitle', 'Off',...
                'visible','on',...
                'Units','normalized',...
                'Position', [Position_x Position_y-0.74 width_x width_y+0.25],...
                'Color',[0.8 0.8 0.8],...
                'Toolbar','figure',...
                'Menubar','none',...
                'KeyReleaseFcn',@Press);
            
            h.Name_Folder_path = uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','push',...
                'Units','normalized',...
                'Position',[0.01 0.95 0.1 0.05],...
                'String','Folder',...
                'FontWeight','bold',...
                'BackgroundColor',[0.9 0.9 0.9],...
                'FontSize',Font_size,...
                'Callback',@Xtal_2D); 
            
            h.Folder_XTAL_2D = uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.11 0.95 0.3 0.05],...
                'String','/gpfs/exfel/data/user/rodrigfa/XTAL_2D/',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size);
            
            h.Name_File_path = uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','push',...
                'Units','normalized',...
                'Position',[0.01 0.9 0.1 0.05],...
                'String','File',...
                'FontWeight','bold',...
                'BackgroundColor',[0.9 0.9 0.9],...
                'FontSize',Font_size,...
                'Callback',@Xtal_2D); 
            
            h.File_XTAL_2D= uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.11 0.9 0.3 0.05],...
                'String','XTAL_2_Prueba',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size); 
            
            h.Name_Extra_name_save_XTAL_2D = uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','text','Units','normalized','FontWeight','bold','String','ExtraSave',...
                'Position',[0.41 0.95 0.1 0.05],'BackgroundColor',[0.9 0.9 0.9],'FontSize',Font_size); 
            
            h.Extra_name_save_XTAL_2D = uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','edit','Units','normalized','FontWeight','bold','String','date',...
                'Position',[0.41 0.9 0.1 0.05],'BackgroundColor',[0.6 0.6 0.6],'FontSize',Font_size);
            
            h.name_XTAL_2D_x_size= uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','text',...
                'Units','normalized',...
                'Position',[0.01 0.85 0.1 0.05],...
                'String','X (um)',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size);            
            h.XTAL_2D_x_size = uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.11 0.85 0.1 0.05],...
                'String','-',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size);
            
            h.name_XTAL_2D_x_step= uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','text',...
                'Units','normalized',...
                'Position',[0.21 0.85 0.1 0.05],...
                'String','step (um)',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size);
            h.XTAL_2D_x_step = uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.31 0.85 0.1 0.05],...
                'String','-',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size);
            h.XTAL_2D_x_nstep = uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','text',...
                'Units','normalized',...
                'Position',[0.41 0.85 0.1 0.05],...
                'String','-',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size);
            
            
            h.name_XTAL_2D_y_size= uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','text',...
                'Units','normalized',...
                'Position',[0.01 0.8 0.1 0.05],...
                'String','Y (um)',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size);
            h.XTAL_2D_y_size = uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.11 0.8 0.1 0.05],...
                'String','-',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size);
            
            h.name_XTAL_2D_y_sstep= uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','text',...
                'Units','normalized',...
                'Position',[0.21 0.8 0.1 0.05],...
                'String','Step (um)',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size);
            h.XTAL_2D_y_step = uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.31 0.8 0.1 0.05],...
                'String','-',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size);
            h.XTAL_2D_y_nstep = uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','text',...
                'Units','normalized',...
                'Position',[0.41 0.8 0.1 0.05],...
                'String','-',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size);
            
            
            h.name_XTAL_2D_value= uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','text',...
                'Units','normalized',...
                'Position',[0.01 0.75 0.1 0.05],...
                'String','d (um)',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size);
            h.XTAL_2D_value = uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.11 0.75 0.1 0.05],...
                'String','100',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size);
            
            h.name_XTAL_2D_position_value= uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','text',...
                'Units','normalized',...
                'Position',[0.21 0.75 0.1 0.05],...
                'String','Cells HxV',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size);
            
            h.XTAL_2D_position_value = uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.31 0.75 0.2 0.05],...
                'String','-',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size);
            
            
            %% push to save, load and write new 2D maps
            h.Save_Xtal_2D = uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','push',...
                'Units','normalized',...
                'Position',[0.01 0.7 0.1 0.05],...
                'String','Save',...
                'FontWeight','bold',...
                'BackgroundColor',[0 0.95 0],...
                'FontSize',Font_size,...
                'Callback',@Xtal_2D);
            
            h.Load_Xtal_2D = uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','push',...
                'Units','normalized',...
                'Position',[0.11 0.7 0.1 0.05],...
                'String','Load',...
                'FontWeight','bold',...
                'BackgroundColor',[0. 0 0.95],...
                'FontSize',Font_size,...
                'Callback',@Xtal_2D);
            
            h.Write_Xtal_2D = uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','push',...
                'Units','normalized',...
                'Position',[0.21 0.7 0.1 0.05],...
                'String','Write',...
                'FontWeight','bold',...
                'BackgroundColor',[0. 0.95 0.95],...
                'FontSize',Font_size,...
                'Callback',@Xtal_2D);
            
            h.Rotate_90_Xtal_2D = uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','push',...
                'Units','normalized',...
                'Position',[0.31 0.7 0.1 0.05],...
                'String','Rotate 90',...
                'FontWeight','bold',...
                'BackgroundColor',[0. 0.95 0.95],...
                'FontSize',Font_size,...
                'Callback',@Xtal_2D);
            
            %% Table and initial data
            x_size = eval(get(h.initial_range_x,'string'));
            x_step = eval(get(h.Nstep_x_Beam,'string'));
            y_size = eval(get(h.initial_range_y,'string'));
            y_step = eval(get(h.Nstep_y_Beam,'string'));
            
            
            Matrix_Xtal_2D = zeros(y_step,x_step);
            x_Xtal_2D = linspace(-x_size/2,x_size/2,x_step);
            y_Xtal_2D = linspace(-y_size/2,y_size/2,y_step);
            h.x_Xtal_2D = x_Xtal_2D;
            h.y_Xtal_2D = y_Xtal_2D;

            set(h.XTAL_2D_x_size,'String',x_size)
            set(h.XTAL_2D_x_step,'String',x_size/x_step)
            set(h.XTAL_2D_y_size,'String',y_size)
            set(h.XTAL_2D_y_step,'String',y_size/y_step)
            set(h.XTAL_2D_x_nstep,'String',x_step)
            set(h.XTAL_2D_y_nstep,'String',y_step)
            String_step = sprintf('%s:%s,%s:%s',num2str(-x_size/2),num2str(x_size/2),num2str(-y_size/2),num2str(y_size/2));
            
            set(h.XTAL_2D_position_value,'String',String_step)
            
            %Table
            
            h.uit = uitable(h.I_Fig_Crystal_2D);
            h.uit.Data = Matrix_Xtal_2D;
            h.uit.ColumnEditable = true;
            h.uit.Position(3) = 375;
%            h.uit.DisplayDataChangedFcn = @updatePlot;
            
            
            %Beam 2D and plot
            h.name_Beam_2D_CHK= uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','text',...
                'Units','normalized',...
                'Position',[0.55 0.95 0.1 0.05],...
                'String','Beam 2D',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size);            
            
            h.name_Beam_2D_CHK= uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','check',...
                'Units','normalized',...
                'Position',[0.65 0.95 0.07 0.05],...
                'value',1,...
                'String','On',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size,...
                'Callback',@Xtal_2D);
            
            h.name_Beam_2D_x_size = uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','text',...
                'Units','normalized',...
                'Position',[0.72 0.95 0.05 0.05],...
                'String','B X',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size);
            h.Beam_2D_x_center = uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.77 0.95 0.05 0.05],...
                'String','-',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size);
            
            h.name_Beam_2D_y_size = uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','text',...
                'Units','normalized',...
                'Position',[0.82 0.95 0.05 0.05],...
                'String','B Y',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size);
            h.Beam_2D_y_center = uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.87 0.95 0.05 0.05],...
                'String','-',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size);
            
            h.Beam_2D_center = uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','push',...
                'Units','normalized',...
                'Position',[0.92 0.95 0.04 0.05],...
                'String','Show',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size-2,...
                'callback',@Xtal_2D);
            
            %single shot position to check parameters in simulations
             h.Shot_Beam_push_2D =  uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','push',...
                'Units','normalized',...
                'Position',[0.96 0.95 0.04 0.05],...
                'value',0,...
                'String','Shot',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size-2,...
                'Callback',@Shot_2D_Beam);
                %'Callback',@Scan_2D_Beam);
            
            %% Scan
            set(h.Beam_2D_x_center, 'String','0')
            set(h.Beam_2D_y_center, 'String','0')
            h.Beam_2D_x_center_val = 0 + x_size/2;
            h.Beam_2D_y_center_val = 0 + y_size/2;
            
            h.name_Beam_2D_Gaussaian_CHK= uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','check',...
                'Units','normalized',...
                'Position',[0.55 0.9 0.05 0.05],...
                'value',1,...
                'String','Gaussian',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size,...
                'Callback',@Xtal_2D);
            
            h.name_Beam_2D_FLAT_CHK= uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','check',...
                'Units','normalized',...
                'Position',[0.6 0.9 0.05 0.05],...
                'value',0,...
                'String','Flat',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size,...
                'Callback',@Xtal_2D);
            
                        
            h.name_Total_Steps_Scan_2D_Beam =  uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','Text',...
                'Units','normalized',...
                'Position',[0.65 0.9 0.035 0.05],...
                'value',0,...
                'String','-',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size-2);
            
           h.name_Actual_Steps_Scan_2D_Beam =  uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','Text',...
                'Units','normalized',...
                'Position',[0.685 0.9 0.035 0.05],...
                'value',0,...
                'String','-',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size-2);
            
            h.name_Scan_2D_Beam_range_x =  uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','Text',...
                'Units','normalized',...
                'Position',[0.72 0.9 0.05 0.05],...
                'value',0,...
                'String','Scan x',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size-2);
            
            h.Scan_2D_Beam_range_x =  uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.77 0.9 0.05 0.05],...
                'value',0,...
                'String','-1:14:30',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size);
            
            h.name_Scan_2D_Beam_range_y =  uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','Text',...
                'Units','normalized',...
                'Position',[0.82 0.9 0.05 0.05],...
                'value',0,...
                'String','Scan Y',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size-2);
            
            h.Scan_2D_Beam_range_y =  uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','edit',...
                'Units','normalized',...
                'Position',[0.87 0.9 0.05 0.05],...
                'value',0,...
                'String','-10:10:40',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size);
            
            h.Scan_2D_Beam =  uicontrol('Parent',h.I_Fig_Crystal_2D,...
                'Style','push',...
                'Units','normalized',...
                'Position',[0.92 0.9 0.08 0.05],...
                'value',0,...
                'String','Scan2D',...
                'FontWeight','bold',...
                'BackgroundColor',[0.6 0.6 0.6],...
                'FontSize',Font_size,...
                'Callback',@Scan_2D_Beam);
            
            h.Figure_Xtal_2D = axes('Parent',h.I_Fig_Crystal_2D, 'Units','normalized',...
                'Position',[0.57 0.1 0.4 0.7],...
                'box','on',...
                'LineWidth',0.5,...
                'FontSize',Font_size,...
                'box','on',...
                'Color',[1 1 1],...
                'FontName','Helvetica',...
                'FontWeight','bold',...
                'Xlim',[-1 1]);
            
            axes(h.Figure_Xtal_2D)
            title('XTAL 2D viewer')
            grid('on'); 
            hold on
            
            ylim([x_Xtal_2D(1,1) x_Xtal_2D(1,size(x_Xtal_2D,2))])
            xlim([y_Xtal_2D(1,1) y_Xtal_2D(1,size(y_Xtal_2D,2))])
            
            surf(x_Xtal_2D,y_Xtal_2D,Matrix_Xtal_2D','Parent',h.Figure_Xtal_2D,'edgecolor','none')
            ylabel('Position Y (um)')
            xlabel('Position X (um)')
            view([90 90]);
            
            
            
%% Extra functions
        elseif source == h.name_Beam_2D_Gaussaian_CHK
            %Check if it use a 2D beam or a flat beam
            if get(h.name_Beam_2D_Gaussaian_CHK,'value') == 1
                set(h.name_Beam_2D_Gaussaian_CHK,'value',1)
                set(h.name_Beam_2D_FLAT_CHK,'value',0)
            else
                set(h.name_Beam_2D_Gaussaian_CHK,'value',0)
                set(h.name_Beam_2D_FLAT_CHK,'value',1)
            end
            
        elseif source == h.name_Beam_2D_FLAT_CHK
            %check if need of flat beam
            if get(h.name_Beam_2D_FLAT_CHK,'value') == 1
                set(h.name_Beam_2D_FLAT_CHK,'value',1)
                set(h.name_Beam_2D_Gaussaian_CHK,'value',0)
            else
                set(h.name_Beam_2D_FLAT_CHK,'value',0)
                set(h.name_Beam_2D_Gaussaian_CHK,'value',1)
            end
            
        elseif source == h.Name_Folder_path
            %folder of the file with the 2D information
            name_dir1 = get(h.Folder_XTAL_2D,'String');
            name_dir = uigetdir(name_dir1);
            
            for i_name = 1:size(name_dir,2)
                if name_dir(1,i_name) == '\'
                    name_dir_2(1,i_name) = '/';
                else
                    name_dir_2(1,i_name) = name_dir(1,i_name);
                end
            end
            %name_dir_2
            set(h.Folder_XTAL_2D,'String', name_dir_2)
            
        elseif source == h.Name_File_path
            %Name of the file with the 2D imformation 
            name_dir = get(h.Folder_XTAL_2D,'String');
            name_file = uigetfile('*.*','mytitle',name_dir);
            
            if name_file(size(name_file,2)-3:size(name_file,2)) == '.mat'
                set(h.File_XTAL_2D,'String', name_file(1:size(name_file,2)-4))
            else
                set(h.File_XTAL_2D,'String', 'wrong file')
            end
            
        elseif source == h.name_XTAL_2D_CHK
            if get(h.name_XTAL_2D_CHK,'value') == 1
                set(h.name_XTAL_2D_CHK,'value',1,'string','on')
            else
                set(h.name_XTAL_2D_CHK,'value',0,'string','off')
            end
            
        elseif source == h.name_Beam_2D_CHK
            if get(h.name_Beam_2D_CHK,'value') == 1
               set(h.name_Beam_2D_CHK,'value',1,'string','on') 
            else
                set(h.name_Beam_2D_CHK,'value',0,'string','off') 
            end
            
        elseif source == h.Rotate_90_Xtal_2D
            %Rotate the 2D image by 90 degrees
            x_Xtal_2D = h.x_Xtal_2D;
            y_Xtal_2D = h.y_Xtal_2D;
            
            Data_XTAL_2D = get(h.uit,'data')';            
            
            h.uit.Data = Data_XTAL_2D;
            h.uit.DisplayDataChangedFcn = @updatePlot;
            child = get(h.Figure_Xtal_2D,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
            surf(x_Xtal_2D,y_Xtal_2D,Data_XTAL_2D','Parent',h.Figure_Xtal_2D,'edgecolor','none')
            view([90 90]);
            
        elseif source == h.Write_Xtal_2D  
            %save the 2D map introducesd in the matrix locally 
            XTAL_2D_value = eval(get(h.XTAL_2D_value,'string'));
            XTAL_2D_position_value = get(h.XTAL_2D_position_value,'string');
            XTAL_2D_position_x1s = '';
            XTAL_2D_position_x2s = '';
            XTAL_2D_position_y1s = '';
            XTAL_2D_position_y2s = '';
            
            i_count_XTAL_2D = 0;
            
            for i_XTAL_Position = 1:size(XTAL_2D_position_value,2)
                
                if i_count_XTAL_2D == 0
                    
                    if (XTAL_2D_position_value(1,i_XTAL_Position)==':')
                        i_count_XTAL_2D = 1;
                    else
                        XTAL_2D_position_x1s = sprintf('%s%s',XTAL_2D_position_x1s ,  XTAL_2D_position_value(1,i_XTAL_Position));
                    end
                end
                
                if i_count_XTAL_2D == 1
                    
                    if (XTAL_2D_position_value(1,i_XTAL_Position)==',')
                        i_count_XTAL_2D = 2;
                    elseif (XTAL_2D_position_value(1,i_XTAL_Position)==':')
                    else
                        XTAL_2D_position_x2s = sprintf('%s%s',XTAL_2D_position_x2s ,  XTAL_2D_position_value(1,i_XTAL_Position));
                    end
                end
                
                if i_count_XTAL_2D == 2
                    
                    if (XTAL_2D_position_value(1,i_XTAL_Position)==':')
                        i_count_XTAL_2D = 3;
                    elseif (XTAL_2D_position_value(1,i_XTAL_Position)==',')
                    else
                        XTAL_2D_position_y1s = sprintf('%s%s',XTAL_2D_position_y1s ,  XTAL_2D_position_value(1,i_XTAL_Position));
                    end
                end
                
                if i_count_XTAL_2D == 3
                    if (XTAL_2D_position_value(1,i_XTAL_Position)==':')
                    else
                        
                        XTAL_2D_position_y2s = sprintf('%s%s',XTAL_2D_position_y2s , XTAL_2D_position_value(1,i_XTAL_Position));
                    end
                end
            
            end
            
            XTAL_2D_position_x1 = str2num(XTAL_2D_position_x1s);
            XTAL_2D_position_x2 = str2num(XTAL_2D_position_x2s);
            XTAL_2D_position_y1 = str2num(XTAL_2D_position_y1s);
            XTAL_2D_position_y2 = str2num(XTAL_2D_position_y2s);

            
            x_Xtal_2D = h.x_Xtal_2D;
            y_Xtal_2D = h.y_Xtal_2D;
            
            if XTAL_2D_position_x1 > 0
                numberx_1 = find((x_Xtal_2D < XTAL_2D_position_x1))-1;
                numberx1 = numberx_1(1,size(numberx_1,2));
            else
                numberx_1 = find((x_Xtal_2D > XTAL_2D_position_x1))-1;
                numberx1 = numberx_1(1,1);
            end
            
            
            if XTAL_2D_position_x2 > 0
                numberx_1 = find((x_Xtal_2D < XTAL_2D_position_x2))+1;
                numberx2 = numberx_1(1,size(numberx_1,2));
            else
                numberx_1 = find((x_Xtal_2D > XTAL_2D_position_x2))+1;
                numberx2 = numberx_1(1,1);
            end
            

            if XTAL_2D_position_y1 > 0
                numbery_1 = find((y_Xtal_2D < XTAL_2D_position_y1))-1;
                numbery1 = numbery_1(1,size(numbery_1,2));
            else
                numbery_1 = find((y_Xtal_2D > XTAL_2D_position_y1))-1;
                numbery1 = numbery_1(1,1);
            end
            
            if XTAL_2D_position_y2 > 0
                numbery_1 = find((y_Xtal_2D < XTAL_2D_position_y2))+1;  
                numbery2 = numbery_1(1,size(numbery_1,2));
            else
                numbery_1 = find((y_Xtal_2D > XTAL_2D_position_y2))+1; 
                numbery2 = numbery_1(1,1);
            end
            
            Data_XTAL_2D = get(h.uit,'data');
            
            Data_XTAL_2D(numbery1:numbery2,numberx1:numberx2) = XTAL_2D_value;
            
            h.uit.Data = Data_XTAL_2D;
            h.uit.DisplayDataChangedFcn = @updatePlot;
            child = get(h.Figure_Xtal_2D,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
            surf(x_Xtal_2D,y_Xtal_2D,Data_XTAL_2D','Parent',h.Figure_Xtal_2D,'edgecolor','none')
            view([90 90]);            

        elseif source == h.Save_Xtal_2D
            %Save the 2d map to a file in the folder defined with the name
            %defined
            
            save_path_XTAL_2D = get(h.Folder_XTAL_2D,'String');
            name_File = get(h.File_XTAL_2D,'string');
            
            Name_Filep = sprintf('%s.mat', name_File);
            filename_Output = sprintf('%s/%s',save_path_XTAL_2D,Name_Filep);
            
            Data_XTAL_2D = get(h.uit,'data');
            
            x_Xtal_2D = h.x_Xtal_2D;
            y_Xtal_2D = h.y_Xtal_2D;
            
            save(filename_Output,'Data_XTAL_2D','x_Xtal_2D','y_Xtal_2D');
            
            Data_XTAL_2D = [];
            h.Beam_2D_x_center_val = eval(get(h.Beam_2D_x_center,'String')) - x_Xtal_2D(1,1);
            h.Beam_2D_y_center_val = eval(get(h.Beam_2D_y_center,'String')) - y_Xtal_2D(1,1);
            
        elseif source == h.Load_Xtal_2D
            %Load 2d map from file in the folder defined
            save_path_XTAL_2D = get(h.Folder_XTAL_2D,'String');
            name_File = get(h.File_XTAL_2D,'string');
            
            Name_Filep = sprintf('%s.mat', name_File);
            filename_Input = sprintf('%s/%s',save_path_XTAL_2D,Name_Filep);
            
            data_load = load(filename_Input);
            
            x_Xtal_2D = data_load.x_Xtal_2D;
            y_Xtal_2D = data_load.y_Xtal_2D;            
            Data_XTAL_2D = data_load.Data_XTAL_2D;
            x_nstep = size(x_Xtal_2D,2);
            x_size = x_Xtal_2D(1,size(x_Xtal_2D,2))-x_Xtal_2D(1,1);
            y_nstep = size(y_Xtal_2D,2);
            y_size = y_Xtal_2D(1,size(y_Xtal_2D,2))-y_Xtal_2D(1,1);
            x_step = x_size/x_nstep;
            y_step = y_size/y_nstep;
            
                        
            set(h.initial_range_x,'string',x_size)
            set(h.Nstep_x_Beam,'string',x_nstep)
            set(h.initial_range_y,'string',y_size)
            set(h.Nstep_y_Beam,'string',y_nstep)
            
            set(h.XTAL_2D_x_size,'String',x_size)
            set(h.XTAL_2D_x_step,'String',x_step)
            set(h.XTAL_2D_y_size,'String',y_size)
            set(h.XTAL_2D_y_step,'String',y_step)
            set(h.XTAL_2D_x_nstep,'String',x_nstep)
            set(h.XTAL_2D_y_nstep,'String',y_nstep)
            String_step = sprintf('%s:%s,%s:%s',num2str(-x_size/2),num2str(x_size/2),num2str(-y_size/2),num2str(y_size/2));            
            set(h.XTAL_2D_position_value,'String',String_step)
            
            h.uit.Data = Data_XTAL_2D;
%            h.uit.DisplayDataChangedFcn = @updatePlot;
            h.x_Xtal_2D = x_Xtal_2D;
            h.y_Xtal_2D =   y_Xtal_2D;
            
            child = get(h.Figure_Xtal_2D,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
            surf(x_Xtal_2D,y_Xtal_2D,Data_XTAL_2D','Parent',h.Figure_Xtal_2D,'edgecolor','none')
            view([90 90])
            ylim([x_Xtal_2D(1,1) x_Xtal_2D(1,size(x_Xtal_2D,2))])
            xlim([y_Xtal_2D(1,1) y_Xtal_2D(1,size(y_Xtal_2D,2))])
            
            numberx_1= find((x_Xtal_2D < eval(get(h.Beam_2D_x_center,'string')) + x_step/2));
            numberx = numberx_1(1,size(find((x_Xtal_2D < eval(get(h.Beam_2D_x_center,'string')) + x_step/2)),2));
            
            numbery_1= find((y_Xtal_2D < eval(get(h.Beam_2D_y_center,'string')) + y_step/2));
            numbery = numbery_1(1,size(find((y_Xtal_2D < eval(get(h.Beam_2D_y_center,'string')) + y_step/2)),2));
            
            axes(h.Figure_Xtal_2D)
            hold on
            
            scatter3(y_Xtal_2D(numbery),x_Xtal_2D(numberx),1000,'Parent',h.Figure_Xtal_2D,'.r')
            
        elseif source == h.Beam_2D_center
            %plot the beam in the position
            %help to define the area to scan
            Data_XTAL_2D = get(h.uit,'Data');
            x_Xtal_2D = h.x_Xtal_2D;
            y_Xtal_2D =   h.y_Xtal_2D;
            x_step = eval(get(h.XTAL_2D_x_step,'String'));
            y_step = eval(get(h.XTAL_2D_y_step,'String'));
            
            child = get(h.Figure_Xtal_2D,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            surf(x_Xtal_2D,y_Xtal_2D,Data_XTAL_2D','Parent',h.Figure_Xtal_2D,'edgecolor','none')
            view([90 90]);  

            numberx_1= find((x_Xtal_2D < eval(get(h.Beam_2D_x_center,'string')) + x_step/2));
            numberx = numberx_1(1,size(find((x_Xtal_2D < eval(get(h.Beam_2D_x_center,'string')) + x_step/2)),2));
            
            numbery_1= find((y_Xtal_2D < eval(get(h.Beam_2D_y_center,'string')) + y_step/2));
            numbery = numbery_1(1,size(find((y_Xtal_2D < eval(get(h.Beam_2D_y_center,'string')) + y_step/2)),2));
            
            axes(h.Figure_Xtal_2D)
            hold on
            
            scatter3(y_Xtal_2D(numbery),x_Xtal_2D(numberx),1000,'Parent',h.Figure_Xtal_2D,'.r')
            h.Beam_2D_y_center_val = y_Xtal_2D(numbery);
            h.Beam_2D_x_center_val = x_Xtal_2D(numberx);
            h.Beam_2D_x_center_pos =numberx;
            h.Beam_2D_y_center_pos =numbery;
            
        end   
        
    end
%% Relates to Xtal_2D
%not in use
    function Scan_2D_Beam (source ,eventdata)
        % scan the 2D map following a mesh scan defined by user
        
        Tstart_scan = tic;
       
        h.x_array  = [];
        x_array = [];
        h.y_array  = [];
        y_array = [];
        h.t_array  = [];
        t_array = [];
        
        h.Energy_array  = [];
        Energy_array = [];
        h.Gaussian_R_all  = [];
        Gaussian_R_all = [];
        h.Intensityx_array  = [];
        Intensityx_array = [];
        h.E_Scan_plot  = [];
        E_Scan_plot = [];
        h.kx_transvers_array  = [];
        kx_transvers_array = [];
        h.ky_transvers_array  = [];
        ky_transvers_array = [];
        h.R_S_G_all  = [];
        R_S_G_all = [];
        h.FBD  = [];
        
        h.LaueD  = [];
        LaueD = [];
        h.R_S_all  = [];
        R_S_all = [];
        
        Flux_Beam = 1;
        
        %multiples for nomber of photons
        %         if get(h.Flux_Beam_Check,'value') == 1
        %             Flux_Beam = eval(get(h.Flux_Beam,'string'));
        %         else
        %             Flux_Beam = 1;
        %         end
        
        
        R_0H_S_Mono_all  = [];
        h.R_0H_S_Mono_all = [];
        
        child = get(h.I_Fig_Beam_3D_Section_F2,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.I_Fig_Beam_3D_reflectivity_F7,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.I_Fig_Beam_3D_convolution_F8,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.I_Fig_Beam_3D_F1,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_mono_F5,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_profile_F6,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_GK_F4,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_Section_T_F3,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        %figure Ana
        h.I_Figure_Ana = figure(d+190);
            
        channel_calculation  = get(h.Repetition_channel,'string');
        name_figure_plot = sprintf('Dynamical Reflectivity 3D Beam Channel %s',channel_calculation);
        set(h.I_Figure_Ana,'Name',name_figure_plot,...
            'NumberTitle', 'Off','Toolbar','figure','visible','on',...
            'Units','normalized','Menubar','figure',...            
            'KeyReleaseFcn',@Press);

        %Sum of all intenstity in a scan point
        h.Figure_Xtal_2D_Ana = axes('Parent',h.I_Figure_Ana, 'Units','normalized',...
            'box','on','FontName','Helvetica','FontWeight','bold','FontSize',Font_size-2,...
            'Position',[0.15 0.55 0.7 0.35],'LineWidth',0.5,'Color',[1 1 1]);
        
        axes(h.Figure_Xtal_2D_Ana)
        title('XTAL 2D Sum')
        grid('on');
        hold on
        ylabel('Position Y (um)')
        xlabel('Position X (um)')

        
        %figure Ana 2 Integrate intensity
        h.Figure_Xtal_2D_Ana2 = axes('Parent',h.I_Figure_Ana, 'Units','normalized',...
            'box','on','FontName','Helvetica','FontWeight','bold','FontSize',Font_size-2,...
        'Position',[0.15 0.1 0.7 0.35],'LineWidth',0.5,'Color',[1 1 1]);
        
        axes(h.Figure_Xtal_2D_Ana2)
        title('XTAL 2D Sum')
        grid('on');
        hold on
        ylabel('Position Y (um)')
        xlabel('Position X (um)')
        
        set(h.Pause_Dynamical_3D,'Value',0)
        set(h.Stop_Dynamical_3D,'Value',1,'ForegroundColor',[0 0 0])
        
        
        element = (get(h.Element,'String'));
        crystal_orientation = get(h.crystal_orientation,'value');
        
        
        Energy_center = eval(get(h.Energy_input,'String'));
        
        h_Miller = eval(get(h.h_miller,'String'));
        k_Miller = eval(get(h.k_miller,'String'));
        l_Miller = eval(get(h.l_miller,'String'));
        vector_Miller = [h_Miller k_Miller l_Miller];
        
        DWF = eval(get(h.DWF,'String'));
        
        Range_E_neg = (-1)*eval(get(h.Range_Left,'String'));
        Range_E_pos = eval(get(h.Range_Right,'String'));
        
        Ang_asy_Deg = eval(get(h.Asymmetry,'String'));
        
        N_Step = eval(get(h.Nstep_t_Beam,'String'));
        
        if get(h.Polarization_s ,'value') == 1
            Polarization = 's';
        else
            Polarization = 'p';
        end
        absor = get(h.Absorption,'Value');
        
        if get(h.More_Crystal_Chk,'value') == 1
            pos_MCC = h.pos_MCC;
            Element_MCC = h.Element_MCC;
            h_Miller = h.h_MCC;
            k_Miller = h.k_MCC;
            l_Miller = h.l_MCC;
            Thickness = h.Thickness_MCC;
            Geometry = h.Geometry_MCC;
            Transmission = h.Transmission_MCC;
            Ang_asy_Deg =h.Asymmetry_MCC;
            crystal_orientation = h.Normal_MCC;
            Polarization = h.polarization_MCC ;
            Energy = h.name_Energy;
            Beam = h.name_Beam;
            da_MCC = h.da_MCC;
            db_MCC = h.db_MCC;
            dc_MCC = h.dc_MCC;
            
            i_cryst_show = eval(get(h.crystal_show,'string'));
        else
            i_cryst = 1;
            i_cryst_show = 1;
            if (get(h.Laue_FBD_Check,'value') == 1) || (get(h.Laue_Check,'value') == 1)
                Geometry_MCC(1,1) = 0;
            else
                Geometry_MCC(1,1) = 1;
                
            end
        end

        Thickness_array = get(h.uit,'data');
        
        
        h.h_Miller_val = h_Miller;
        h.k_Miller_val = k_Miller;
        h.l_Miller_val = l_Miller;
        h.DWF_val = DWF;
        
        h.Energy_center = Energy_center;
        h.Range_E_neg = Range_E_neg;
        h.Range_E_pos = Range_E_pos;
        h.N_Step = N_Step;
        h.Flux_Beam_val = Flux_Beam;
        h.absor = absor;
        h.Ang_asy_Deg= Ang_asy_Deg;
        h.crystal_orientation_val = crystal_orientation;
        h.Polarization = Polarization;
            
        if get(h.More_Crystal_Chk,'value') == 1   %More crystals 
            for i_cryst = 1:size(pos_MCC,2)
                element = char(Element_MCC(1,i_cryst));
                vector_Miller = [h_MCC(1,i_cryst), k_MCC(1,i_cryst),l_MCC(1,i_cryst)];
                [Z_i, F0_i, FH_i, F_H_i, a_Par_i, b_Par_i, c_Par_i,alpha_Par_i,beta_Par_i,gamma_Par_i] = Element_Bragg_temp_Gui...
                    (element,h_MCC(1,i_cryst),k_MCC(1,i_cryst),l_MCC(1,i_cryst),Energy_center);
                
                F0(1,i_cryst) = F0_i;
                FH(1,i_cryst) = FH_i;
                F_H(1,i_cryst) = F_H_i;
                a_Par(1,i_cryst) = a_Par_i+da_MCC(1,i_cryst)*a_Par_i;
                b_Par(1,i_cryst) = b_Par_i+db_MCC(1,i_cryst)*b_Par_i;
                c_Par(1,i_cryst) = c_Par_i+dc_MCC(1,i_cryst)*c_Par_i;
            end
            
        else
            [Z,F0,FH,F_H,a_Par,b_Par,c_Par,alpha_Par,beta_Par,gamma_Par] = Element_Bragg_temp_Gui(element,h_Miller,k_Miller,l_Miller,Energy_center);
            
           
        end
        
        set(h.f0,'String',F0(1,i_cryst))
        set(h.f1,'String',FH(1,i_cryst))
        set(h.f2,'String',F_H(1,i_cryst))
        
        if get(h.CParameter_Check,'Value') == 1
            a_Par = eval(get(h.a_parameter,'String'));
            b_Par = eval(get(h.b_parameter,'String'));
            c_Par = eval(get(h.c_parameter,'String'));
        end
        set(h.a_parameter,'String',a_Par(1,i_cryst))
        set(h.b_parameter,'String',b_Par(1,i_cryst))
        set(h.c_parameter,'String',c_Par(1,i_cryst))
        h.a_Par = a_Par;
        h.b_Par = b_Par;
        h.c_Par = c_Par;
        h.F0 = F0;
        h.FH = FH;
        h.F_H = F_H;
        
        x_Xtal_2D = h.x_Xtal_2D;
        y_Xtal_2D =   h.y_Xtal_2D;        
       
        x_step = eval(get(h.XTAL_2D_x_step,'String'));
        y_step = eval(get(h.XTAL_2D_y_step,'String'));
        
        if source == h.Shot_Beam_push_2D
            %Is ti really neededd?            
            Beam_2D_x_center_pos_array = h.Beam_2D_x_center_pos;            
            Beam_2D_y_center_pos_array = h.Beam_2D_y_center_pos;  
            
            XTAL_2D_position_x1 = 0;
            XTAL_2D_position_x2 = 0;
            XTAL_2D_position_x3 = 1;
            XTAL_2D_position_y1 = 0;
            XTAL_2D_position_y2 = 0;
            XTAL_2D_position_y3 = 1;
            
            Beam_2D_y_center_pos1 = Beam_2D_y_center_pos_array;
            Beam_2D_y_center_pos2 = Beam_2D_y_center_pos_array;
            Beam_2D_y_center_pos3 = 1;
            Beam_2D_x_center_pos1 = Beam_2D_x_center_pos_array;
            Beam_2D_x_center_pos2 = Beam_2D_x_center_pos_array;
            Beam_2D_x_center_pos3 = 1;
            
            Beam_2D_x_center_pos_array = h.Beam_2D_x_center_pos;            
            Beam_2D_y_center_pos_array = h.Beam_2D_y_center_pos;
            
            number_steps_2D_Scan_x = size(Beam_2D_x_center_pos_array,2);
            number_steps_2D_Scan_y = size(Beam_2D_y_center_pos_array,2);

        elseif source == h.Scan_2D_Beam
            
            range_Scan_2D_x = get(h.Scan_2D_Beam_range_x,'string');
            
            i_count_XTAL_2D = 0;
            XTAL_2D_position_x1s = '';
            XTAL_2D_position_x2s = '';
            XTAL_2D_position_x3s = '';
            for i_XTAL_Position = 1:size(range_Scan_2D_x,2)
                
                if i_count_XTAL_2D == 2
                    
                    if (range_Scan_2D_x(1,i_XTAL_Position)==':')
                    else
                        XTAL_2D_position_x3s = sprintf('%s%s',XTAL_2D_position_x3s ,  range_Scan_2D_x(1,i_XTAL_Position));
                    end
                end
                
                if i_count_XTAL_2D == 1
                    
                    if (range_Scan_2D_x(1,i_XTAL_Position)==':')
                        i_count_XTAL_2D = 2;
                    else
                        XTAL_2D_position_x2s = sprintf('%s%s',XTAL_2D_position_x2s ,  range_Scan_2D_x(1,i_XTAL_Position));
                    end
                end
                
                if i_count_XTAL_2D == 0
                    
                    if (range_Scan_2D_x(1,i_XTAL_Position)==':')
                        i_count_XTAL_2D = 1;
                    else
                        XTAL_2D_position_x1s = sprintf('%s%s',XTAL_2D_position_x1s ,  range_Scan_2D_x(1,i_XTAL_Position));
                    end
                end   
                
            end
            
            XTAL_2D_position_x1 = str2num(XTAL_2D_position_x1s);
            XTAL_2D_position_x2 = str2num(XTAL_2D_position_x2s);
            XTAL_2D_position_x3 = str2num(XTAL_2D_position_x3s);
            
            range_Scan_2D_y = get(h.Scan_2D_Beam_range_y,'string');
            i_count_XTAL_2D = 0;
            XTAL_2D_position_y1s = '';
            XTAL_2D_position_y2s = '';
            XTAL_2D_position_y3s = '';
            
            for i_XTAL_Position = 1:size(range_Scan_2D_y,2)
                
                if i_count_XTAL_2D == 2
                    
                    if (range_Scan_2D_y(1,i_XTAL_Position)==':')
                        
                    else
                        XTAL_2D_position_y3s = sprintf('%s%s',XTAL_2D_position_y3s ,  range_Scan_2D_y(1,i_XTAL_Position));
                    end
                end
                
                if i_count_XTAL_2D == 1
                    
                    if (range_Scan_2D_y(1,i_XTAL_Position)==':')
                         i_count_XTAL_2D = 2;
                    else
                        XTAL_2D_position_y2s = sprintf('%s%s',XTAL_2D_position_y2s ,  range_Scan_2D_y(1,i_XTAL_Position));
                    end
                end
                
                if i_count_XTAL_2D == 0
                    
                    if (range_Scan_2D_y(1,i_XTAL_Position)==':')
                        i_count_XTAL_2D = 1;
                    else
                        XTAL_2D_position_y1s = sprintf('%s%s',XTAL_2D_position_y1s ,  range_Scan_2D_y(1,i_XTAL_Position));
                    end
                end                
               
            end
            
            XTAL_2D_position_y1 = str2num(XTAL_2D_position_y1s);
            XTAL_2D_position_y2 = str2num(XTAL_2D_position_y2s);
            XTAL_2D_position_y3 = str2num(XTAL_2D_position_y3s);
            
            numberx_1 = find((x_Xtal_2D < XTAL_2D_position_x1 + x_step/2));            
            Beam_2D_x_center_pos1 = numberx_1(1,size(find((x_Xtal_2D < XTAL_2D_position_x1 + x_step/2)),2));
            numberx_2 = find((x_Xtal_2D < XTAL_2D_position_x2 + x_step/2));
            Beam_2D_x_center_pos2 = numberx_2(1,size(find((x_Xtal_2D < XTAL_2D_position_x2 + x_step/2)),2));
            
            Beam_2D_x_center_pos_array = uint16(linspace(Beam_2D_x_center_pos1,Beam_2D_x_center_pos2,XTAL_2D_position_x3+1));
            
            
            numbery_1 = find((y_Xtal_2D < XTAL_2D_position_y1 + y_step/2));            
            Beam_2D_y_center_pos1 = numbery_1(1,size(find((y_Xtal_2D < XTAL_2D_position_y1 + y_step/2)),2));
            numbery_2 = find((y_Xtal_2D < XTAL_2D_position_y2 + y_step/2));
            Beam_2D_y_center_pos2 = numbery_2(1,size(find((y_Xtal_2D < XTAL_2D_position_y2 + y_step/2)),2));
            
            Beam_2D_y_center_pos_array = uint16(linspace(Beam_2D_y_center_pos1,Beam_2D_y_center_pos2,XTAL_2D_position_y3+1));           
            
            number_steps_2D_Scan_x = size(Beam_2D_x_center_pos_array,2);
            number_steps_2D_Scan_y = size(Beam_2D_y_center_pos_array,2);
        end
        
        %Incoming Beam--------------------
        Range_Mono_neg = -eval(get(h.Range_neg_Mono,'String'));
        Energy_Bragg = Energy_center - Range_Mono_neg;
        set(h.Energy_point,'String',Energy_Bragg)
        Energy_array(1,1) = Energy_Bragg;
        set(h.Image_point,'String',1)
        
        if get(h.Mono_Beam_Check,'Value') == 1
            
            Thickness_Mono = eval(get(h.Thickness_Mono,'string'));
            element_Mono = get(h.Element_Mono,'String');
            crystal_orientation_Mono = get(h.crystal_orientation_Mono,'value');
            
            % Perfect crystal
            Ang_asy_Deg_Mono = eval(get(h.Asymmetry_Mono,'String'));
            
            %Polarization Mono
            if get(h.Polarization_s_Mono,'Value') == 1
                Polarization_Mono = 's';
            elseif get(h.Polarization_p_Mono,'Value') == 1
                Polarization_Mono = 'p';
            end            
            
            h_Miller_Mono = eval(get(h.H_Mono,'String'));
            k_Miller_Mono = eval(get(h.K_Mono,'String'));
            l_Miller_Mono = eval(get(h.L_Mono,'String'));
            
            vector_Miller_Mono = [h_Miller_Mono k_Miller_Mono l_Miller_Mono];
            
            [Z_Mono,F0_Mono,FH_Mono,F_H_Mono,a_Par_Mono,b_Par_Mono,c_Par_Mono,alpha_Par_Mono,beta_Par_Mono,gamma_Par_Mono]=Element_Bragg_temp_Gui...
                (element_Mono,h_Miller_Mono,k_Miller_Mono,l_Miller_Mono,Energy_Bragg);
            
            set(h.f0_Mono,'String',F0_Mono)
            set(h.f1_Mono,'String',FH_Mono)
            set(h.f2_Mono,'String',F_H_Mono)
            
            if get(h.f_check_values,'Value') == 1
                f_0 = eval(get(h.f0_Mono,'String'));
                f_1 = eval(get(h.f1_Mono,'String'));
                f_2 = eval(get(h.f2_Mono,'String'));
            end
            
            
            [Theta_Bragg_Mono,Chi_0_Cx_Mono,Chi_h_Cx_Mono,R_0H_S_Mono,E_Scan,G_S,t_array,k_array,Dwidth] = Bragg_temp_Gui_test...
                (a_Par_Mono,b_Par_Mono,c_Par_Mono,Energy_Bragg,Energy_center,...
                h_Miller_Mono,k_Miller_Mono,l_Miller_Mono,DWF,F0_Mono,FH_Mono,F_H_Mono,absor,...
                Range_E_neg,Range_E_pos,Polarization_Mono,Ang_asy_Deg_Mono,Thickness_Mono,N_Step,...
                0,crystal_orientation_Mono);
            
            
            E_scan_plot = E_Scan -Energy_center;
            
            Gaussian_K = R_0H_S_Mono ;
            
            %pause(0.1)
            
            Gaussian_K_all(1,:) = Gaussian_K;
            
            if get(h.Plot_on_Check,'value')
                axes(h.I_Fig_Beam_3D_reflectivity_F7)
                plot(E_scan_plot,abs(R_0H_S_Mono).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)
                title_Mono = strcat('Monochromator:(',get(h.H_Mono,'String'),',',get(h.K_Mono,'String'),',',get(h.L_Mono,'String'),')');
                title(title_Mono)
                ylabel('Intensity (arb. unit)')
                xlabel('Energy (eV)')
                axis auto
                hold on
                
                axes(h.I_Fig_Beam_3D_reflectivity_F7)
                hold on
                plot(E_scan_plot,abs(Gaussian_K).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)
            end           
           
            
        end
        
        if get(h.Mono_Beam_Check,'Value') == 0
            
            WaveL_Bragg = h.h_planck * h.c_light / Energy_Bragg    ; %m
            k0=2*pi/WaveL_Bragg;
            rho = eval(get(h.rhoparameter,'String'));
            %rho=5e-4; %related to number of periodes undulator 5e-4
            sigk=rho*k0;
            
            Gaussian_k=exp(-0.5*(k_array-k0).*(k_array-k0)/sigk/sigk)*2;
            
            if get(h.Plot_on_Check,'value')
                axes(h.I_Fig_Beam_3D_Section_T_F3)
                % k space gaussian define by machine porperties
                plot(E_Scan_plot,Gaussian_k,'Parent',h.I_Fig_Beam_3D_Section_T_F3)
                ylabel('Intensity (arb. unit)')
                xlabel('Energy (eV)')
                axis auto
                hold on
                % pause(0.1)
            end
            
            if get(h.Gaussian_Beam_SASE_Check,'Value') == 1
                phase = exp(1i*2*pi*random('unif',0,1,1,N_Step));
                Gaussian_k= Gaussian_k.*phase;
                
                % k space gaussian define by machine porperties
                if get(h.Plot_on_Check,'value')
                    plot(E_Scan_plot,abs(Gaussian_k).^2,'Parent',h.I_Fig_Beam_3D_Section_T_F3)
                end
                
                % To time space
                Gaussian_T = ifft(fftshift(Gaussian_k));
                if get(h.Plot_on_Check,'value')
                    axes(h.I_Fig_Beam_3D_Section_T_F3)
                    plot(t_array,Gaussian_T,'Parent',h.I_Fig_Beam_3D_Section_T_F3)
                end
                %  pause(0.1)
                
                %Definition time window
                lt = eval(get(h.size_T_Beam,'String'))*1e-15; %seg
                dt = t_array(1,2)- t_array(1,1);
                Nsam=floor(lt/dt);
                Gaussian_T(Nsam:end)=0;
                
                if get(h.Plot_on_Check,'value')
                    plot(t_array,abs(Gaussian_T).^2,'Parent',h.I_Fig_Beam_3D_GK_F4)
                end
                %   pause(0.1)
                
                %Back to k space
                Gaussian_K=fftshift(fft(Gaussian_T))*3;
                
                if get(h.Plot_on_Check,'value')
                    axes(h.I_Fig_Beam_3D_reflectivity_F7)
                    hold on
                    plot(E_Scan_plot,abs(Gaussian_K).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)
                end
                %  pause(.1)
                
                Gaussian_K_all(i_steps,:) = Gaussian_K;
                %G_mono = R_S.*Gaussian_K;
                G_mono = Gaussian_K;
                
            else
                
                Gaussian_K_all(i_steps,:) = Gaussian_k;
                %G_mono = R_S.*Gaussian_K;
                G_mono = Gaussian_k;
                
            end
        else
            G_mono =  Gaussian_K;
            
        end
        
        h.G_mono = G_mono;
        
        %% 3D beam definition spatial
        N_Step_x = eval(get(h.Nstep_x_Beam,'String'));
        N_Step_y = eval(get(h.Nstep_y_Beam,'String'));
        
        initial_range_x = eval(get(h.initial_range_x,'String'));
        initial_range_y = eval(get(h.initial_range_y,'String'));
                
        
        %Definition of x
        x_0 =0;
        %x_0 = eval(get(h.Beam_2D_x_center,'string'))*1e-6;
        sigma_x = eval(get(h.size_X_Beam,'String'))*1e-6; %um
        x_array = linspace(-initial_range_x/2,initial_range_x/2,N_Step_x)*1e-6;
        
        if get(h.Lorenztian_Distribution,'Value') == 1
            sigma_x = sigma_x/2;
            Gaussian_x = 1e-3/(pi*sigma_x)./(1+((x_array-x_0)/sigma_x).^2)/100;
        else
            sigma_x = sigma_x/2.355;
            Gaussian_x = 1*exp(-((x_array-x_0)/sigma_x).^2./2);
        end
        
        %Definition of y
        y_0 =0;
        %y_0 = eval(get(h.Beam_2D_y_center,'string'))*1e-6;
        sigma_y = eval(get(h.size_Y_Beam,'String'))*1e-6; %um
        y_array = linspace(-initial_range_y/2,initial_range_y/2,N_Step_y)*1e-6;
        if get(h.Lorenztian_Distribution,'Value') == 1
            Gaussian_y = 1e-3/(pi*sigma_y)./(1+((y_array-y_0)/sigma_y).^2)/100;
        else
            Gaussian_y = 1*exp(-((y_array-y_0)/sigma_y).^2./2);
        end
        
        %Flat filed
        if get(h.flat_field,'value') == 1
            Gaussian_x = ones(1,N_Step_x);
            Gaussian_y = ones(1,N_Step_y);
        end
        
        % What is the realtion kx x?
        dx = x_array(1,1)-x_array(1,2);
        dkx = 2*pi/(N_Step_x*dx);
        kx_transvers_array = dkx *linspace(-N_Step_x/2,N_Step_x/2,N_Step_x);
        
        Gaussian_kx = fftshift(fft(Gaussian_x));
        
        
        % What is the realtion ky y?
        dy = y_array(1,1)-y_array(1,2);
        dky = 2*pi/(N_Step_y*dy);
        ky_transvers_array = dky *linspace(-N_Step_y/2,N_Step_y/2,N_Step_y) ;
        
        Gaussian_ky = fftshift(fft(Gaussian_y));
        
        for i_y = 1:size(ky_transvers_array,2)
            Gaussian_KXY (:,i_y)= Gaussian_kx'.*Gaussian_ky(1,i_y);
            Gaussian_XY (:,i_y)= Gaussian_x'.*Gaussian_y(1,i_y);
        end
        
        if get(h.Plot_on_Check,'value')
            axes(h.I_Fig_Beam_3D_F1)
            surf(ky_transvers_array,kx_transvers_array,abs(Gaussian_KXY).^2,'Parent',h.I_Fig_Beam_3D_F1,'edgecolor','none')
        end
              
        Gaussian_ky =[];
        Gaussian_kx =[];
        Gaussian_y =[];
        Gaussian_x =[];
        
        %% definition 3D beam
        for i_x = 1 :size(E_Scan,2)
            
            Gaussian_K_3D (:,:,i_x)= Gaussian_KXY'.*G_mono(1,i_x);
        end
        
        if get(h.Plot_on_Check,'value')  
            axes(h.I_Fig_Beam_3D_F1)            
            surf(kx_transvers_array,ky_transvers_array,sum(abs(Gaussian_K_3D).^2,3),'Parent',h.I_Fig_Beam_3D_F1,'edgecolor','none')
            view([20 20]);
        end
        
        h.Gaussian_K_3D = Gaussian_K_3D;
        h.kx_transvers_array = kx_transvers_array;
        h.ky_transvers_array = ky_transvers_array;
        h.x_array = x_array;
        h.y_array = y_array;
        
        %for possible energy scan
        h.i_steps_energy_2D_Xtal =1;
        h.i_average_energy_2D_Xtal = 1;
        
        %-----------------------
        x_int_sum = x_Xtal_2D(1,1) + XTAL_2D_position_x1;
        x_final_sum = x_Xtal_2D(1,size(x_Xtal_2D,2)) + XTAL_2D_position_x2;
        y_int_sum = y_Xtal_2D(1,1) + XTAL_2D_position_y1;
        y_final_sum = y_Xtal_2D(1,size(y_Xtal_2D,2)) + XTAL_2D_position_y2;
        
        N_Step_x_sum = (x_int_sum - x_final_sum-2) / (x_Xtal_2D(1,1) - x_Xtal_2D(1,size(x_Xtal_2D,2))) * size(x_Xtal_2D,2);
        N_Step_y_sum = (y_int_sum - y_final_sum-2) / (y_Xtal_2D(1,1) - y_Xtal_2D(1,size(y_Xtal_2D,2))) * size(y_Xtal_2D,2);
        
        set(h.name_Total_Steps_Scan_2D_Beam,'string',number_steps_2D_Scan_x*number_steps_2D_Scan_y)
        %Save path name
        Channel_rep = eval(get(h.Repetition_channel,'String'));        
        folder_save = get(h.Folder_XTAL_2D,'string');
        Extrainfosave = get(h.Extra_name_save_XTAL_2D,'string');
        Energy_name = sprintf('%dkeV',Energy_center);
        reflection_name = sprintf('%s_HKL%d_%d_%d',element,h_Miller,k_Miller,l_Miller);
        if Geometry_MCC(1,i_cryst_show) ==1
            FBD = get(h.Bragg_FBD_Check,'Value');                    
            if FBD == 1
                geometry_name ='FBD';
            else
                geometry_name ='BD';
            end
        else
            FBD = get(h.Laue_FBD_Check,'Value');
            if FBD == 1
                geometry_name ='FLD';
            else
                geometry_name ='LD';
            end
        end
        polarization_name = sprintf('polarization_%s',Polarization);
        Channel_name = sprintf('Channel_%d',Channel_rep);
        file_name_Intensity = sprintf('%s_%s_%s_%s_%s_Data_%s',get(h.File_XTAL_2D,'string'),reflection_name,geometry_name,polarization_name,Energy_name,Channel_name);
        
        path_save_data_file = sprintf('%ssimulatedData/%s.mat',folder_save,file_name_Intensity);
                
        if isfile(path_save_data_file)
            load(path_save_data_file);
            
        else
%             Intensity_plot_Sum= zeros(N_Step_y + number_steps_2D_Scan_y-1,N_Step_x + number_steps_2D_Scan_x-1);
%             Intensity_plot = zeros(N_Step_y + number_steps_2D_Scan_y-1,N_Step_x + number_steps_2D_Scan_x-1);
%             phase_R_sum_plot = zeros(N_Step_y + number_steps_2D_Scan_y-1,N_Step_x + number_steps_2D_Scan_x-1);
%             amplitud_R_sum_plot = zeros(N_Step_y + number_steps_2D_Scan_y-1,N_Step_x + number_steps_2D_Scan_x-1);
%             Intensity_sum_plot = zeros(N_Step_y + number_steps_2D_Scan_y-1,N_Step_x + number_steps_2D_Scan_x-1);
%             
%             phase_R_sum = zeros(N_Step_y + number_steps_2D_Scan_y-1,N_Step_x + number_steps_2D_Scan_x-1);
%             amplitud_R_sum= zeros(N_Step_y + number_steps_2D_Scan_y-1,N_Step_x + number_steps_2D_Scan_x-1);
%             Gaussian_R_sum = zeros(N_Step_y + number_steps_2D_Scan_y-1,N_Step_x + number_steps_2D_Scan_x-1);
            
            
            Intensity_plot_Sum= zeros(N_Step_x + number_steps_2D_Scan_x-1,N_Step_y + number_steps_2D_Scan_y-1); %ARF0321
            Intensity_plot = zeros(N_Step_x + number_steps_2D_Scan_x-1,N_Step_y + number_steps_2D_Scan_y-1); %ARF0321
            phase_R_sum_plot = zeros(N_Step_x + number_steps_2D_Scan_x-1,N_Step_y + number_steps_2D_Scan_y-1); %ARF0321
            amplitud_R_sum_plot = zeros(N_Step_x + number_steps_2D_Scan_x-1,N_Step_y + number_steps_2D_Scan_y-1); %ARF0321
            Intensity_sum_plot = zeros(N_Step_x + number_steps_2D_Scan_x-1,N_Step_y + number_steps_2D_Scan_y-1); %ARF0321
            
            phase_R_sum = zeros(N_Step_x + number_steps_2D_Scan_x-1,N_Step_y + number_steps_2D_Scan_y-1); %ARF0321
            amplitud_R_sum= zeros(N_Step_x + number_steps_2D_Scan_x-1,N_Step_y + number_steps_2D_Scan_y-1); %ARF0321
            Gaussian_R_sum = zeros(N_Step_x + number_steps_2D_Scan_x-1,N_Step_y + number_steps_2D_Scan_y-1); %ARF0321
        end
        
        T_scan = 0;
        % Loop mapping all positions
        for i_2D_Scan = 1:number_steps_2D_Scan_x
            
            if get(h.Stop_Dynamical_3D,'Value') == 0
                set(h.Status_Dynamical_3D,'String','Status: Stop by user','BackgroundColor',[0.9 0 0.9])
                break
                
            end
            
            if get(h.Plot_on_Check,'value')
                child = get(h.I_Fig_Beam_3D_Section_T_F3,'Children');
                for i=1:length(child)
                    delete(child(i));
                end
                child = get(h.I_Fig_Beam_3D_reflectivity_F7,'Children');
                for i=1:length(child)
                    delete(child(i));
                end
            end
            
            for j_2D_Scan = 1:number_steps_2D_Scan_y
               T_single_step = tic;
               
                count_step = (i_2D_Scan - 1) * number_steps_2D_Scan_y + j_2D_Scan;
                out_of = number_steps_2D_Scan_y * number_steps_2D_Scan_x;
                
                if get(h.Stop_Dynamical_3D,'Value') == 0
                    set(h.Status_Dynamical_3D,'String','Status: Stop by user','BackgroundColor',[0.9 0 0.9])
                    break
                    
                end
                
                %% Crystal definition
                %size(Thickness_array)
                %Beam_2D_y_center_pos_array(1,j_2D_Scan)
                %Beam_2D_x_center_pos_array(1,i_2D_Scan)
                
                disp(sprintf('New step: Matrix size %d x %d, stepx %d step y %d ', N_Step_x,N_Step_y,Beam_2D_x_center_pos_array(1,i_2D_Scan),Beam_2D_y_center_pos_array(1,j_2D_Scan)))
                
                Thickness = Thickness_array(Beam_2D_y_center_pos_array(1,j_2D_Scan),Beam_2D_x_center_pos_array(1,i_2D_Scan));
                set(h.Thickness,'string',Thickness)
                set(h.name_Actual_Steps_Scan_2D_Beam,'string',(i_2D_Scan-1) * number_steps_2D_Scan_y + j_2D_Scan)
                
                disp(sprintf('Position x: %.3d and y: %.3d, acutal thickness %d um ', x_Xtal_2D(Beam_2D_x_center_pos_array(1,i_2D_Scan)),y_Xtal_2D(Beam_2D_y_center_pos_array(1,j_2D_Scan)),Thickness))
                
                %Plot position  in 2D plot
                child = get(h.Figure_Xtal_2D,'Children');
                for i=1:length(child)
                    delete(child(i));
                end
                
                if get(h.Plot_on_Check,'value')
                    axes(h.Figure_Xtal_2D)
                    surf(y_Xtal_2D,x_Xtal_2D,Thickness_array','Parent',h.Figure_Xtal_2D,'edgecolor','none')
                    view([90 90])
                    
                    hold on
                    
                    scatter3(y_Xtal_2D(Beam_2D_y_center_pos_array(1,j_2D_Scan)),x_Xtal_2D(Beam_2D_x_center_pos_array(1,i_2D_Scan)),1000,'Parent',h.Figure_Xtal_2D,'.r')
                    pause(0.001)
                end
                
                set(h.Beam_2D_x_center,'string',x_Xtal_2D(Beam_2D_x_center_pos_array(1,i_2D_Scan)))
                set(h.Beam_2D_y_center,'string',y_Xtal_2D(Beam_2D_y_center_pos_array(1,j_2D_Scan)))
                
        
                %% Green function Crystal  
                if Geometry_MCC(1,i_cryst_show) ==1
                    FBD = get(h.Bragg_FBD_Check,'Value');
                    [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_S,E_Scan,G_S,t_array,k_array,Dwidth] = Bragg_temp_Gui_test...
                        (a_Par(1,i_cryst_show),b_Par(1,i_cryst_show),c_Par(1,i_cryst_show),Energy_center,Energy_center,...
                        h_Miller(1,i_cryst_show),k_Miller(1,i_cryst_show),l_Miller(1,i_cryst_show),DWF,F0(1,i_cryst_show),FH(1,i_cryst_show),F_H(1,i_cryst_show),absor,...
                        Range_E_neg,Range_E_pos,Polarization(1,i_cryst_show),Ang_asy_Deg(1,i_cryst_show),Thickness(1,i_cryst_show),N_Step,...
                        FBD,crystal_orientation(1,i_cryst_show));
                    if FBD == 1
                        geometry ='FBD';
                    else
                        geometry ='BD';
                    end
                else
                    FBD = get(h.Laue_FBD_Check,'Value');
                    [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_S,E_Scan,t_array,k_array,Dwidth] =...
                        Laue_temp_Gui_1D_test(a_Par(1,i_cryst_show),b_Par(1,i_cryst_show),c_Par(1,i_cryst_show),Energy_center,Energy_center,...
                        h_Miller(1,i_cryst_show),k_Miller(1,i_cryst_show),l_Miller(1,i_cryst_show),DWF,F0(1,i_cryst_show),FH(1,i_cryst_show),F_H(1,i_cryst_show),absor,...
                        Range_E_neg,Range_E_pos,Polarization(1,i_cryst_show),Ang_asy_Deg(1,i_cryst_show),Thickness(1,i_cryst_show),N_Step,...
                        FBD,crystal_orientation(1,i_cryst_show));
                    if FBD == 1
                        geometry ='FLD';
                    else
                        geometry ='LD';
                    end
                end
                
                set(h.Chi_0,'String',Chi_0_Cx)
                set(h.Chi_h,'String',Chi_h_Cx)
                set(h.Theta_view,'String',Theta_Bragg*180/pi)
                set(h.DarwinWidth,'string',Dwidth)
                
                
                h.Chi_h_Cx = Chi_h_Cx;
                h.Chi_0_Cx = Chi_0_Cx;
                h.Theta_Bragg = Theta_Bragg;
                h.R_S = R_S;
                h.k_array = k_array;
                h.FBD = FBD;
                h.E_Scan = E_Scan;
                %Crystal properties
                h.Thickness_val = Thickness;
                x_array = h.x_array;
                y_array = h.y_array;
                N_Step_x = size(x_array,2);
                N_Step_y = size(y_array,2);
                
                % Set working Matrix to zero
                %amplitud_actual = zeros(N_Step_y + number_steps_2D_Scan_y-1,N_Step_x + number_steps_2D_Scan_x-1);
                %phase_actual = zeros(N_Step_y + number_steps_2D_Scan_y-1,N_Step_x + number_steps_2D_Scan_x-1);
                %Gaussian_R_actual = zeros(N_Step_y + number_steps_2D_Scan_y-1,N_Step_x + number_steps_2D_Scan_x-1);
                
                amplitud_actual = zeros(N_Step_x + number_steps_2D_Scan_x-1,N_Step_y + number_steps_2D_Scan_y-1); %ARF0321
                phase_actual = zeros(N_Step_x + number_steps_2D_Scan_x-1,N_Step_y + number_steps_2D_Scan_y-1); %ARF0321
                Gaussian_R_actual = zeros(N_Step_x + number_steps_2D_Scan_x-1,N_Step_y + number_steps_2D_Scan_y-1); %ARF0321
                
                %call to Function of Green Function
                Beam_3D_Reflectivity_call
                
                % recover the variable result of the green function
                Gaussian_R = h.Gaussian_R;
                
                Gaussian_R_x_plot = sum(sum(abs(Gaussian_R).^2,1),3);
                [pks,locs,w,p] = findpeaks(Gaussian_R_x_plot,x_array);
                
                [pksmax,indexmax] = max(pks);
                [pksmin,indexmin] = min(pks);
                
                if (get(h.Laue_Check,'value') == 1) %Laue is different case as it is symmetric
                else
                    if locs(indexmax) > locs(indexmin)
                        Gaussian_R = fftshift(Gaussian_R,2);
                        % Definition of the first maxima
                        Gaussian_R_x_plot = sum(sum(abs(Gaussian_R).^2,1),3);
                        [pks,locs,w,p] = findpeaks(Gaussian_R_x_plot,x_array);
                    end
                end
                
                if Thickness ==0
                    X_tal_2D_center = 0;
                else
                    X_tal_2D_center = find(x_array == locs(1))- size(y_array,2)/2;
                end
                
                
%                 %Index for position sum
%                 X_tal_2D_center
%                 %position in y
%                 j_diff = int16(size(y_array,2)/2) - Y_tal_2D_center - int16(Beam_2D_y_center_pos_array(1,j_2D_Scan))
%                 if j_diff <= 0                    
%                     j_diff = abs(j_diff);
%                     
%                     j_init_sum = 1;
%                     j_final_sum = size(y_array,2) - j_diff;
%                     
%                     j_init_actual = j_diff+1;
%                     j_final_actual = size(y_array,2);
%                     
%                 else
%                     
%                     j_init_sum = j_diff+1;
%                     j_final_sum = size(y_array,2);
%                     
%                     j_init_actual = 1;
%                     j_final_actual = size(y_array,2) - j_diff;
%                 end
%                 
%                 %position in x
%                 i_diff = int16(size(x_array,2)/2) - int16(Beam_2D_x_center_pos_array(1,i_2D_Scan))
%                 
%                 if i_diff <= 0                   
%                     i_diff = abs(i_diff);
%                     i_init_sum = 1;
%                     i_final_sum = size(x_array,2) - i_diff;
%                     
%                     i_init_actual = i_diff + 1;
%                     i_final_actual = size(x_array,2);
%                     
%                 else                    
%                     i_init_sum = i_diff+1;
%                     i_final_sum = size(x_array,2);
%                     
%                     i_init_actual = 1;
%                     i_final_actual = size(x_array,2) - i_diff;
%                 end
                
                %name_Gaussian_R_acutal = [i_init_actual,i_final_actual,j_init_actual,j_final_actual];
                %name_Gaussian_R_sum = [i_init_sum,i_final_sum,j_init_sum,j_final_sum];
                
%                 i_init_sum = 0 + i_2D_Scan;
%                 i_final_sum = size(x_array,2) + i_2D_Scan -1;
%                 j_init_sum = 0 + j_2D_Scan;
%                 j_final_sum =size(y_array,2) + j_2D_Scan -1;
                
                j_init_sum = 0 + i_2D_Scan;%ARF0321
                j_final_sum = size(y_array,2) + i_2D_Scan -1;%ARF0321
                i_init_sum = 0 + j_2D_Scan;%ARF0321
                i_final_sum =size(x_array,2) + j_2D_Scan -1;%ARF0321

                %Gaussian_R_2D(:,:) = sum(Gaussian_R,3);
                Gaussian_R_2D(:,:) = sum(Gaussian_R,3)'; %ARF0321
%                 size(Gaussian_R_2D)%ARF0321
                %Copy the Gaussian to the related position in the 2D map
                %Gaussian_R_actual(j_init_sum:j_final_sum,i_init_sum:i_final_sum) = Gaussian_R_2D(:,:);
                Gaussian_R_actual(i_init_sum:i_final_sum,j_init_sum:j_final_sum) = Gaussian_R_2D(:,:);%ARF0321
                %size(Gaussian_R_actual)%ARF0321
                
%                 Gaussian_R_x_plot = sum(sum(abs(Gaussian_R_actual).^2,1),3);
%                 [pks,locs,w,p] = findpeaks(Gaussian_R_x_plot,x_Xtal_2D);
%                                 
%                 X_tal_2D_center = find(x_Xtal_2D == locs(1))- size(y_Xtal_2D,2)/2;
%                     
%                 figure (3)
%                 semilogy(x_Xtal_2D-x_Xtal_2D(X_tal_2D_center + size(y_Xtal_2D,2)/2),Gaussian_R_x_plot)
%                 hold on
%                 scatter(locs-x_Xtal_2D(X_tal_2D_center+ size(y_Xtal_2D,2)/2),pks)
                
                
                
                % Calculation of the Phase                
                if sum(sum(Gaussian_R_2D,1),2) == 0
                    phase2D =Gaussian_R_2D .* 0;
                else                    
                    phase2D= atan2(imag(Gaussian_R_2D),real(Gaussian_R_2D));
                end
                %Copy the phase to the related position in the 2D map
                %phase_actual(j_init_sum:j_final_sum,i_init_sum:i_final_sum) = phase2D(:,:);
%                 size(phase_actual(i_init_sum:i_final_sum,j_init_sum:j_final_sum))
%                 size(phase2D)
                phase_actual(i_init_sum:i_final_sum,j_init_sum:j_final_sum) = phase2D(:,:); %ARF0321
                
                %sum phases
                phase_R_sum = phase_R_sum + phase_actual;
                
                % Calculation of the Amplitud
                amplitud = sqrt(real(Gaussian_R_2D).^2 + imag(Gaussian_R_2D).^2);
                
                % in relation to the 2D map
                %amplitud_actual(j_init_sum:j_final_sum,i_init_sum:i_final_sum) = amplitud(:,:);
                amplitud_actual(i_init_sum:i_final_sum,j_init_sum:j_final_sum) = amplitud(:,:); %ARF0321
                %sum amplitud
                amplitud_R_sum = amplitud_R_sum + amplitud_actual;
                
                %sum Gaussian
                %size(Gaussian_R_sum)
                %size(Gaussian_R_actual)
                %Gaussian_R_sum = Gaussian_R_sum + Gaussian_R_actual;
                Gaussian_R_sum = Gaussian_R_sum + Gaussian_R_actual(:,:);%ARF0321
                
                % addition of all the intensity plots in relation to 2D map
                %Intensity_plot(:,:) = Intensity_plot + flip(sum(abs(Gaussian_R_actual).^2,3),2);
                %Intensity_sum_plot(:,:) = Intensity_sum_plot + abs(Gaussian_R_actual.^2);
                Intensity_sum_plot(:,:) = Intensity_sum_plot + abs(Gaussian_R_actual(:,1:size(Gaussian_R_sum,2))).^2;%ARF0321
                
                %Intensity_plot(:,:) = flip(Intensity_sum_plot,2);
                Intensity_plot(:,:) = Intensity_sum_plot; %ARF0321
                %Plot variables
%                 phase_R_sum_plot(:,:) = flip(phase_R_sum,2);
%                 amplitud_R_sum_plot (:,:) = flip(amplitud_R_sum,2);
                phase_R_sum_plot(:,:) = phase_R_sum;%ARF0321
                amplitud_R_sum_plot (:,:) = amplitud_R_sum;%ARF0321
                
                y_actual = y_Xtal_2D(Beam_2D_y_center_pos_array(1,j_2D_Scan));
                x_actual = x_Xtal_2D(Beam_2D_x_center_pos_array(1,i_2D_Scan));
                Intensity_plot_Sum(Beam_2D_y_center_pos_array(1,j_2D_Scan),Beam_2D_x_center_pos_array(1,i_2D_Scan))= abs(sum(sum(Gaussian_R_2D,2),1)).^2;
                
                y_Xtal_2D_plot = -1* y_Xtal_2D;
                
                if get(h.Plot_on_Check,'value')
                    child = get(h.I_Fig_Beam_3D_convolution_F8,'Children');
                    for i=1:length(child)
                        delete(child(i));
                    end
                    child = get(h.I_Fig_Beam_3D_GK_F4,'Children');
                    for i=1:length(child)
                        delete(child(i));
                    end
                    child = get(h.I_Fig_Beam_3D_profile_F6,'Children');
                    for i=1:length(child)
                        delete(child(i));
                    end
                    
                    child = get(h.Figure_Xtal_2D_Ana,'Children');
                    for i=1:length(child)
                        delete(child(i));
                    end
                    
                    child = get(h.Figure_Xtal_2D_Ana2,'Children');
                    for i=1:length(child)
                        delete(child(i));
                    end

                                        
                    axes(h.I_Fig_Beam_3D_GK_F4)
                    imagesc(y_Xtal_2D,x_Xtal_2D,phase_R_sum_plot,'parent',h.I_Fig_Beam_3D_GK_F4)                    
                    title('Phase sxs')
                    
                    axes(h.I_Fig_Beam_3D_convolution_F8)
                    imagesc(y_Xtal_2D,x_Xtal_2D,amplitud_R_sum_plot,'parent', h.I_Fig_Beam_3D_convolution_F8)
                    title('amplitud sxs')
                    
                    axes(h.I_Fig_Beam_3D_profile_F6)
                    imagesc(y_Xtal_2D,y_Xtal_2D,Intensity_plot,'parent',h.I_Fig_Beam_3D_profile_F6)
                    title('Intensity sxs')
                    
                    axes(h.Figure_Xtal_2D_Ana)
                    imagesc(y_Xtal_2D,x_Xtal_2D, flip(Intensity_plot_Sum,1),'Parent',h.Figure_Xtal_2D_Ana)
                    title_Ana = sprintf('Intensity sum %s E %d eV [%d,%d,%d]',geometry, Energy_center, h_Miller, k_Miller, l_Miller);
                    title(title_Ana)
                    colormap bone
                    
                    axes(h.Figure_Xtal_2D_Ana2)
                    Intensity_Ana_2D = abs(Gaussian_R_sum).^2;
                    imagesc(y_Xtal_2D,y_Xtal_2D,flip(Intensity_Ana_2D,1),'Parent',h.Figure_Xtal_2D_Ana2)
                    title_Ana2 = sprintf('abs(Gaus)^2 sum %s E %d eV [%d,%d,%d]',geometry, Energy_center, h_Miller, k_Miller, l_Miller);
                    title(title_Ana2)
                    Intensity_Ana_2D = [];
                    colormap bone
                    pause(0.001)
                    
                end
                
                %Save scan complete till step
                %file_name_Intensity = sprintf('%s_%s_%s_%s_%s_Data_%s_line%d',get(h.File_XTAL_2D,'string'),reflection_name,geometry_name,polarization_name,Energy_name,Channel_name,i_2D_Scan);
                file_name_Intensity = sprintf('%s_%s_%s_%s_%s_Data_%s',get(h.File_XTAL_2D,'string'),reflection_name,geometry_name,polarization_name,Energy_name,Channel_name);
                path_save_data_file_save = sprintf('%ssimulatedData/%s%s.mat',folder_save,file_name_Intensity,Extrainfosave);
                save(path_save_data_file_save,'phase_R_sum','amplitud_R_sum','Intensity_plot','Intensity_plot_Sum','x_Xtal_2D','y_Xtal_2D','E_scan_plot','Gaussian_R_sum');
                
                %Toc for single step
                T_single_step_count = toc(T_single_step);
                %Time for each step and absolute time
                T_scan = T_scan + T_single_step_count;
                %running avarage for calculating final time
                if count_step == 1
                    Total_time_calculated = out_of * T_single_step_count;
                else
                    Total_time_calculated = out_of * (0.95 * Total_time_calculated / out_of + 0.05 * T_single_step_count);
                end
                %time to end
                Time_2_end_calculated =  (Total_time_calculated - T_scan)/3600;
                
                disp(sprintf('Step %d from %d, time use %d.', count_step, out_of,T_single_step_count))
                disp(sprintf('Time elapse %d s of %d s. Time elapse  %f h, finish estimated in %f hours ', T_scan, Total_time_calculated, T_scan/3600, Time_2_end_calculated))
                disp(sprintf('Save to file %s ', path_save_data_file))
                
            end
            
            child = get(h.Figure_Xtal_2D,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
            if get(h.Plot_on_Check,'value')
                axes(h.Figure_Xtal_2D)
                surf(y_Xtal_2D,x_Xtal_2D,Thickness_array','Parent',h.Figure_Xtal_2D,'edgecolor','none')
                view([90 90])
                
                hold on
                
                scatter3(y_Xtal_2D(Beam_2D_y_center_pos_array(1,j_2D_Scan)),x_Xtal_2D(Beam_2D_x_center_pos_array(1,i_2D_Scan)),1000,'Parent',h.Figure_Xtal_2D,'.r')
                pause(0.001)
            end
            
            child = get(h.I_Fig_Beam_3D_convolution_F8,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
            child = get(h.I_Fig_Beam_3D_GK_F4,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            child = get(h.I_Fig_Beam_3D_profile_F6,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
            child = get(h.Figure_Xtal_2D_Ana,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
            child = get(h.Figure_Xtal_2D_Ana2,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
            axes(h.I_Fig_Beam_3D_GK_F4)
            imagesc(y_Xtal_2D_plot,x_Xtal_2D,phase_R_sum_plot,'parent',h.I_Fig_Beam_3D_GK_F4)
            title('Phase sxs')
            
            axes(h.I_Fig_Beam_3D_convolution_F8)
            imagesc(y_Xtal_2D_plot,x_Xtal_2D,amplitud_R_sum_plot,'parent', h.I_Fig_Beam_3D_convolution_F8)
            title('amplitud sxs')
            
            axes(h.I_Fig_Beam_3D_profile_F6)
            imagesc(y_Xtal_2D_plot,x_Xtal_2D,Intensity_plot,'parent',h.I_Fig_Beam_3D_profile_F6)
            title('Intensity sxs')
            
            %path_save_data_file3 = sprintf('%s%s_plot_all',folder_save,file_name_Intensity);
            %saveas(h.I_Fig_3D_Reflectivity_Dynamical, path_save_data_file3, 'fig')

            %Special figures
            axes(h.Figure_Xtal_2D_Ana)
            imagesc(y_Xtal_2D,x_Xtal_2D,flip(Intensity_plot_Sum,1),'Parent',h.Figure_Xtal_2D_Ana)
            title_Ana = sprintf('Intensity sum %s E %d eV [%d,%d,%d]',geometry, Energy_center, h_Miller, k_Miller, l_Miller);
            title(title_Ana)
            colormap hot
            
            axes(h.Figure_Xtal_2D_Ana2)
            imagesc(y_Xtal_2D,y_Xtal_2D,flip(abs(Gaussian_R_sum).^2,1),'Parent',h.Figure_Xtal_2D_Ana2)
            title_Ana2 = sprintf('Abs(Gaus)^2 sum %s E %d eV [%d,%d,%d]',geometry, Energy_center, h_Miller, k_Miller, l_Miller);
            title(title_Ana2)
            colormap hot
            
%             path_save_data_file2 = sprintf('%s%s_Intensity_sum.fig',folder_save,file_name_Intensity);
%             saveas(h.I_Figure_Ana, path_save_data_file2)

            pause(.001)

        end
        
        
        set (h.Status_Dynamical_3D,'String','Status: Finnish','BackgroundColor',[0 0 0.9])
        toc(Tstart_scan)
    end
%% Relates to Xtal_2D
%not in use
    function Shot_2D_Beam (source ,eventdata)
       
        h.x_array  = [];
        x_array = [];
        h.y_array  = [];
        y_array = [];
        h.t_array  = [];
        t_array = [];
        
        h.Energy_array  = [];
        Energy_array = [];
        h.Gaussian_R_all  = [];
        Gaussian_R_all = [];
        h.Intensityx_array  = [];
        Intensityx_array = [];
        h.E_Scan_plot  = [];
        E_Scan_plot = [];
        h.kx_transvers_array  = [];
        kx_transvers_array = [];
        h.ky_transvers_array  = [];
        ky_transvers_array = [];
        h.R_S_G_all  = [];
        R_S_G_all = [];
        h.FBD  = [];
        
        h.LaueD  = [];
        LaueD = [];
        h.R_S_all  = [];
        R_S_all = [];
        
        Flux_Beam = 1;
        
        %multiples for nomber of photons
        %         if get(h.Flux_Beam_Check,'value') == 1
        %             Flux_Beam = eval(get(h.Flux_Beam,'string'));
        %         else
        %             Flux_Beam = 1;
        %         end
        
        
        R_0H_S_Mono_all  = [];
        h.R_0H_S_Mono_all = [];
        
        child = get(h.I_Fig_Beam_3D_Section_F2,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.I_Fig_Beam_3D_reflectivity_F7,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.I_Fig_Beam_3D_convolution_F8,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.I_Fig_Beam_3D_F1,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_mono_F5,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_profile_F6,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_GK_F4,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_Section_T_F3,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        %figure Ana
        h.I_Figure_Ana = figure(1);
        h.Figure_Xtal_2D_Ana = axes('Parent',h.I_Figure_Ana, 'Units','normalized',...
            'Position',[0.05 0.1 0.9 0.9],...
            'box','on',...
            'LineWidth',0.5,...
            'FontSize',Font_size,...
            'box','on',...
            'Color',[1 1 1],...
            'FontName','Helvetica',...
            'FontWeight','bold');
        
        axes(h.Figure_Xtal_2D_Ana)
        title('XTAL 2D Sum')
        grid('on');
        hold on
        ylabel('Position Y (um)')
        xlabel('Position X (um)')

        
        %figure Ana
        h.I_Figure_Ana2 = figure(1);
        h.Figure_Xtal_2D_Ana2 = axes('Parent',h.I_Figure_Ana2, 'Units','normalized',...
            'Position',[0.05 0.1 0.9 0.9],...
            'box','on',...
            'LineWidth',0.5,...
            'FontSize',Font_size,...
            'box','on',...
            'Color',[1 1 1],...
            'FontName','Helvetica',...
            'FontWeight','bold');
        
        axes(h.Figure_Xtal_2D_Ana2)
        title('XTAL 2D Sum')
        grid('on');
        hold on
        ylabel('Position Y (um)')
        xlabel('Position X (um)')
        
        set(h.Pause_Dynamical_3D,'Value',0)
        set(h.Stop_Dynamical_3D,'Value',1,'ForegroundColor',[0 0 0])
        
        
        element = (get(h.Element,'String'));
        crystal_orientation = get(h.crystal_orientation,'value');
        
        
        Energy_center = eval(get(h.Energy_input,'String'));
        
        h_Miller = eval(get(h.h_miller,'String'));
        k_Miller = eval(get(h.k_miller,'String'));
        l_Miller = eval(get(h.l_miller,'String'));
        vector_Miller = [h_Miller k_Miller l_Miller];
        
        DWF = eval(get(h.DWF,'String'));
        
        Range_E_neg = (-1)*eval(get(h.Range_Left,'String'));
        Range_E_pos = eval(get(h.Range_Right,'String'));
        
        Ang_asy_Deg = eval(get(h.Asymmetry,'String'));
        
        N_Step = eval(get(h.Nstep_t_Beam,'String'));
        
        if get(h.Polarization_s ,'value') == 1
            Polarization = 's';
        else
            Polarization = 'p';
        end
        absor = get(h.Absorption,'Value');
        
        if get(h.More_Crystal_Chk,'value') == 1
            pos_MCC = h.pos_MCC;
            Element_MCC = h.Element_MCC;
            h_Miller = h.h_MCC;
            k_Miller = h.k_MCC;
            l_Miller = h.l_MCC;
            Thickness = h.Thickness_MCC;
            Geometry = h.Geometry_MCC;
            Transmission = h.Transmission_MCC;
            Ang_asy_Deg =h.Asymmetry_MCC;
            crystal_orientation = h.Normal_MCC;
            Polarization = h.polarization_MCC ;
            Energy = h.name_Energy;
            Beam = h.name_Beam;
            da_MCC = h.da_MCC;
            db_MCC = h.db_MCC;
            dc_MCC = h.dc_MCC;
            
            i_cryst_show = eval(get(h.crystal_show,'string'));
        else
            i_cryst = 1;
            i_cryst_show = 1;
            if (get(h.Laue_FBD_Check,'value') == 1) || (get(h.Laue_Check,'value') == 1)
                Geometry_MCC(1,1) = 0;
            else
                Geometry_MCC(1,1) = 1;
                
            end
        end

        Thickness_array = get(h.uit,'data');
        
        
        h.h_Miller_val = h_Miller;
        h.k_Miller_val = k_Miller;
        h.l_Miller_val = l_Miller;
        h.DWF_val = DWF;
        
        h.Energy_center = Energy_center;
        h.Range_E_neg = Range_E_neg;
        h.Range_E_pos = Range_E_pos;
        h.N_Step = N_Step;
        h.Flux_Beam_val = Flux_Beam;
        h.absor = absor;
        h.Ang_asy_Deg= Ang_asy_Deg;
        h.crystal_orientation_val = crystal_orientation;
        h.Polarization = Polarization;
            
        if get(h.More_Crystal_Chk,'value') == 1   %More crystals 
            for i_cryst = 1:size(pos_MCC,2)
                element = char(Element_MCC(1,i_cryst));
                vector_Miller = [h_MCC(1,i_cryst), k_MCC(1,i_cryst),l_MCC(1,i_cryst)];
                [Z_i, F0_i, FH_i, F_H_i, a_Par_i, b_Par_i, c_Par_i,alpha_Par_i,beta_Par_i,gamma_Par_i] = Element_Bragg_temp_Gui...
                    (element,h_MCC(1,i_cryst),k_MCC(1,i_cryst),l_MCC(1,i_cryst),Energy_center);
                
                F0(1,i_cryst) = F0_i;
                FH(1,i_cryst) = FH_i;
                F_H(1,i_cryst) = F_H_i;
                a_Par(1,i_cryst) = a_Par_i+da_MCC(1,i_cryst)*a_Par_i;
                b_Par(1,i_cryst) = b_Par_i+db_MCC(1,i_cryst)*b_Par_i;
                c_Par(1,i_cryst) = c_Par_i+dc_MCC(1,i_cryst)*c_Par_i;
            end
            
        else
            [Z,F0,FH,F_H,a_Par,b_Par,c_Par,alpha_Par,beta_Par,gamma_Par] = Element_Bragg_temp_Gui(element,h_Miller,k_Miller,l_Miller,Energy_center);            
           
        end
        
        set(h.f0,'String',F0(1,i_cryst))
        set(h.f1,'String',FH(1,i_cryst))
        set(h.f2,'String',F_H(1,i_cryst))
        
        if get(h.CParameter_Check,'Value') == 1
            a_Par = eval(get(h.a_parameter,'String'));
            b_Par = eval(get(h.b_parameter,'String'));
            c_Par = eval(get(h.c_parameter,'String'));
        end
        set(h.a_parameter,'String',a_Par(1,i_cryst))
        set(h.b_parameter,'String',b_Par(1,i_cryst))
        set(h.c_parameter,'String',c_Par(1,i_cryst))
        h.a_Par = a_Par;
        h.b_Par = b_Par;
        h.c_Par = c_Par;
        h.F0 = F0;
        h.FH = FH;
        h.F_H = F_H;
        
        
        %Incoming Beam--------------------
        Range_Mono_neg = -eval(get(h.Range_neg_Mono,'String'));
        Energy_Bragg = Energy_center - Range_Mono_neg;
        set(h.Energy_point,'String',Energy_Bragg)
        Energy_array(1,1) = Energy_Bragg;
        set(h.Image_point,'String',1)
        
        if get(h.Mono_Beam_Check,'Value') == 1
            
            Thickness_Mono = eval(get(h.Thickness_Mono,'string'));
            element_Mono = get(h.Element_Mono,'String');
            crystal_orientation_Mono = get(h.crystal_orientation_Mono,'value');
            
            % Perfect crystal
            Ang_asy_Deg_Mono = eval(get(h.Asymmetry_Mono,'String'));
            
            %Polarization Mono
            if get(h.Polarization_s_Mono,'Value') == 1
                Polarization_Mono = 's';
            elseif get(h.Polarization_p_Mono,'Value') == 1
                Polarization_Mono = 'p';
            end            
            
            h_Miller_Mono = eval(get(h.H_Mono,'String'));
            k_Miller_Mono = eval(get(h.K_Mono,'String'));
            l_Miller_Mono = eval(get(h.L_Mono,'String'));
            
            vector_Miller_Mono = [h_Miller_Mono k_Miller_Mono l_Miller_Mono];
            
            [Z_Mono,F0_Mono,FH_Mono,F_H_Mono,a_Par_Mono,b_Par_Mono,c_Par_Mono,alpha_Par_Mono,beta_Par_Mono,gamma_Par_Mono]=Element_Bragg_temp_Gui...
                (element_Mono,h_Miller_Mono,k_Miller_Mono,l_Miller_Mono,Energy_Bragg);
            
            set(h.f0_Mono,'String',F0_Mono)
            set(h.f1_Mono,'String',FH_Mono)
            set(h.f2_Mono,'String',F_H_Mono)
            
            if get(h.f_check_values,'Value') == 1
                f_0 = eval(get(h.f0_Mono,'String'));
                f_1 = eval(get(h.f1_Mono,'String'));
                f_2 = eval(get(h.f2_Mono,'String'));
            end
            
            
            [Theta_Bragg_Mono,Chi_0_Cx_Mono,Chi_h_Cx_Mono,R_0H_S_Mono,E_Scan,G_S,t_array,k_array,Dwidth] = Bragg_temp_Gui_test...
                (a_Par_Mono,b_Par_Mono,c_Par_Mono,Energy_Bragg,Energy_center,...
                h_Miller_Mono,k_Miller_Mono,l_Miller_Mono,DWF,F0_Mono,FH_Mono,F_H_Mono,absor,...
                Range_E_neg,Range_E_pos,Polarization_Mono,Ang_asy_Deg_Mono,Thickness_Mono,N_Step,...
                0,crystal_orientation_Mono);
            
            
            E_scan_plot = E_Scan -Energy_center;
            
            Gaussian_K = R_0H_S_Mono ;
            
            %pause(0.1)
            
            Gaussian_K_all(1,:) = Gaussian_K;
            
            if get(h.Plot_on_Check,'value')
                axes(h.I_Fig_Beam_3D_reflectivity_F7)
                plot(E_scan_plot,abs(R_0H_S_Mono).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)
                title_Mono = strcat('Monochromator:(',get(h.H_Mono,'String'),',',get(h.K_Mono,'String'),',',get(h.L_Mono,'String'),')');
                title(title_Mono)
                ylabel('Intensity (arb. unit)')
                xlabel('Energy (eV)')
                axis auto
                hold on
                
                axes(h.I_Fig_Beam_3D_reflectivity_F7)
                hold on
                plot(E_scan_plot,abs(Gaussian_K).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)
            end           
           
            
        end
        
        if get(h.Mono_Beam_Check,'Value') == 0
            
            WaveL_Bragg = h.h_planck * h.c_light / Energy_Bragg    ; %m
            k0=2*pi/WaveL_Bragg;
            rho = eval(get(h.rhoparameter,'String'));
            %rho=5e-4; %related to number of periodes undulator 5e-4
            sigk=rho*k0;
            
            Gaussian_k=exp(-0.5*(k_array-k0).*(k_array-k0)/sigk/sigk)*2;
            
            if get(h.Plot_on_Check,'value')
                axes(h.I_Fig_Beam_3D_Section_T_F3)
                % k space gaussian define by machine porperties
                plot(E_Scan_plot,Gaussian_k,'Parent',h.I_Fig_Beam_3D_Section_T_F3)
                ylabel('Intensity (arb. unit)')
                xlabel('Energy (eV)')
                axis auto
                hold on
                % pause(0.1)
            end
            
            if get(h.Gaussian_Beam_SASE_Check,'Value') == 1
                phase = exp(1i*2*pi*random('unif',0,1,1,N_Step));
                Gaussian_k= Gaussian_k.*phase;
                
                % k space gaussian define by machine porperties
                if get(h.Plot_on_Check,'value')
                    plot(E_Scan_plot,abs(Gaussian_k).^2,'Parent',h.I_Fig_Beam_3D_Section_T_F3)
                end
                
                % To time space
                Gaussian_T = ifft(fftshift(Gaussian_k));
                if get(h.Plot_on_Check,'value')
                    axes(h.I_Fig_Beam_3D_Section_T_F3)
                    plot(t_array,Gaussian_T,'Parent',h.I_Fig_Beam_3D_Section_T_F3)
                end
                %  pause(0.1)
                
                %Definition time window
                lt = eval(get(h.size_T_Beam,'String'))*1e-15; %seg
                dt = t_array(1,2)- t_array(1,1);
                Nsam=floor(lt/dt);
                Gaussian_T(Nsam:end)=0;
                
                if get(h.Plot_on_Check,'value')
                    plot(t_array,abs(Gaussian_T).^2,'Parent',h.I_Fig_Beam_3D_GK_F4)
                end
                %   pause(0.1)
                
                %Back to k space
                Gaussian_K=fftshift(fft(Gaussian_T))*3;
                
                if get(h.Plot_on_Check,'value')
                    axes(h.I_Fig_Beam_3D_reflectivity_F7)
                    hold on
                    plot(E_Scan_plot,abs(Gaussian_K).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)
                end
                %  pause(.1)
                
                Gaussian_K_all(i_steps,:) = Gaussian_K;
                %G_mono = R_S.*Gaussian_K;
                G_mono = Gaussian_K;
                
            else
                
                Gaussian_K_all(i_steps,:) = Gaussian_k;
                %G_mono = R_S.*Gaussian_K;
                G_mono = Gaussian_k;
                
            end
        else
            G_mono =  Gaussian_K;
            
        end
        
        h.G_mono = G_mono;
        
        %% 3D beam definition spatial
        N_Step_x = eval(get(h.Nstep_x_Beam,'String'));
        N_Step_y = eval(get(h.Nstep_y_Beam,'String'));
        
        initial_range_x = eval(get(h.initial_range_x,'String'));
        initial_range_y = eval(get(h.initial_range_y,'String'));
                
        
        %Definition of x
        x_0 =0;
        %x_0 = eval(get(h.Beam_2D_x_center,'string'))*1e-6;
        sigma_x = eval(get(h.size_X_Beam,'String'))*1e-6; %um
        x_array = linspace(-initial_range_x/2,initial_range_x/2,N_Step_x)*1e-6;
        
        if get(h.Lorenztian_Distribution,'Value') == 1
            sigma_x = sigma_x/2;
            Gaussian_x = 1e-3/(pi*sigma_x)./(1+((x_array-x_0)/sigma_x).^2)/100;
        else
            sigma_x = sigma_x/2.355;
            Gaussian_x = 1*exp(-((x_array-x_0)/sigma_x).^2./2);
        end
        
        %Definition of y
        y_0 =0;
        %y_0 = eval(get(h.Beam_2D_y_center,'string'))*1e-6;
        sigma_y = eval(get(h.size_Y_Beam,'String'))*1e-6; %um
        y_array = linspace(-initial_range_y/2,initial_range_y/2,N_Step_y)*1e-6;
        if get(h.Lorenztian_Distribution,'Value') == 1
            Gaussian_y = 1e-3/(pi*sigma_y)./(1+((y_array-y_0)/sigma_y).^2)/100;
        else
            Gaussian_y = 1*exp(-((y_array-y_0)/sigma_y).^2./2);
        end
        

        % What is the realtion kx x?
        dx = x_array(1,1)-x_array(1,2);
        dkx = 2*pi/(N_Step_x*dx);
        kx_transvers_array = dkx *linspace(-N_Step_x/2,N_Step_x/2,N_Step_x);
        
        Gaussian_kx = fftshift(fft(Gaussian_x));
        
        
        % What is the realtion ky y?
        dy = y_array(1,1)-y_array(1,2);
        dky = 2*pi/(N_Step_y*dy);
        ky_transvers_array = dky *linspace(-N_Step_y/2,N_Step_y/2,N_Step_y) ;
        
        Gaussian_ky = fftshift(fft(Gaussian_y));
        
        %Flat filed
        if get(h.flat_field,'value') == 1
            Gaussian_kx = ones(1,N_Step_x);
            Gaussian_ky = ones(1,N_Step_y);
        end
        
        
        for i_y = 1:size(ky_transvers_array,2)
            Gaussian_KXY (:,i_y)= Gaussian_kx'.*Gaussian_ky(1,i_y);
            Gaussian_XY (:,i_y)= Gaussian_x'.*Gaussian_y(1,i_y);
        end
        
        if get(h.Plot_on_Check,'value')
            axes(h.I_Fig_Beam_3D_F1)
            surf(ky_transvers_array,kx_transvers_array,abs(Gaussian_KXY).^2,'Parent',h.I_Fig_Beam_3D_F1,'edgecolor','none')
        end
              
        Gaussian_ky =[];
        Gaussian_kx =[];
        Gaussian_y =[];
        Gaussian_x =[];
        
        %% definition 3D beam
        for i_x = 1 :size(E_Scan,2)            
            Gaussian_K_3D (:,:,i_x)= Gaussian_KXY'.* G_mono(1,i_x);
        end
        
        if get(h.Plot_on_Check,'value')  
            axes(h.I_Fig_Beam_3D_F1)            
            surf(kx_transvers_array,ky_transvers_array,sum(abs(Gaussian_K_3D).^2,3),'Parent',h.I_Fig_Beam_3D_F1,'edgecolor','none')
            view([20 20]);
        end
        
        h.Gaussian_K_3D = Gaussian_K_3D;
        h.kx_transvers_array = kx_transvers_array;
        h.ky_transvers_array = ky_transvers_array;
        h.x_array = x_array;
        h.y_array = y_array;
        
        %for possible energy scan
        h.i_steps_energy_2D_Xtal =1;
        h.i_average_energy_2D_Xtal = 1;
        
        %-----------------------                      
        folder_save = get(h.Folder_XTAL_2D,'string');
        Energy_name = sprintf('%dkeV',Energy_center);
        reflection_name = sprintf('%s_HKL%d_%d_%d',element,h_Miller,k_Miller,l_Miller);
        file_name_Intensity = sprintf('%s_%s_%s_Data',get(h.File_XTAL_2D,'string'),reflection_name,Energy_name);
        
        path_save_data_file = sprintf('%s%s.mat',folder_save,file_name_Intensity);
        
        x_Xtal_2D = h.x_Xtal_2D;
        y_Xtal_2D =   h.y_Xtal_2D;   
          
        % Loop mapping all positions
        if get(h.Stop_Dynamical_3D,'Value') == 0
            set(h.Status_Dynamical_3D,'String','Status: Stop by user','BackgroundColor',[0.9 0 0.9])            
            
        end
        
        if get(h.Plot_on_Check,'value')
            child = get(h.I_Fig_Beam_3D_Section_T_F3,'Children');
            for i=1:length(child)
                delete(child(i));
            end
        end
        
        
        if get(h.Stop_Dynamical_3D,'Value') == 0
            set(h.Status_Dynamical_3D,'String','Status: Stop by user','BackgroundColor',[0.9 0 0.9])
                        
        end
        
        %% Crystal definition
        Thickness = Thickness_array;
       
        %Plot position  in 2D plot
        child = get(h.Figure_Xtal_2D,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        if get(h.Plot_on_Check,'value')
            axes(h.Figure_Xtal_2D)
            surf(y_Xtal_2D,x_Xtal_2D,Thickness_array','Parent',h.Figure_Xtal_2D,'edgecolor','none')
            view([90 90])     
        end
        
              
        %% Green function Crystal
        if Geometry_MCC(1,i_cryst_show) ==1
            FBD = get(h.Bragg_FBD_Check,'Value');
            [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_S,E_Scan,G_S,t_array,k_array,Dwidth] = Bragg_temp_Gui_test...
                (a_Par(1,i_cryst_show),b_Par(1,i_cryst_show),c_Par(1,i_cryst_show),Energy_center,Energy_center,...
                h_Miller(1,i_cryst_show),k_Miller(1,i_cryst_show),l_Miller(1,i_cryst_show),DWF,F0(1,i_cryst_show),FH(1,i_cryst_show),F_H(1,i_cryst_show),absor,...
                Range_E_neg,Range_E_pos,Polarization(1,i_cryst_show),Ang_asy_Deg(1,i_cryst_show),Thickness(1,i_cryst_show),N_Step,...
                FBD,crystal_orientation(1,i_cryst_show));
        else
            FBD = get(h.Laue_FBD_Check,'Value');
            [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_S,E_Scan,t_array,k_array,Dwidth] =...
                Laue_temp_Gui_1D_test(a_Par(1,i_cryst_show),b_Par(1,i_cryst_show),c_Par(1,i_cryst_show),Energy_center,Energy_center,...
                h_Miller(1,i_cryst_show),k_Miller(1,i_cryst_show),l_Miller(1,i_cryst_show),DWF,F0(1,i_cryst_show),FH(1,i_cryst_show),F_H(1,i_cryst_show),absor,...
                Range_E_neg,Range_E_pos,Polarization(1,i_cryst_show),Ang_asy_Deg(1,i_cryst_show),Thickness(1,i_cryst_show),N_Step,...
                FBD,crystal_orientation(1,i_cryst_show));
        end
        
        set(h.Chi_0,'String',Chi_0_Cx)
        set(h.Chi_h,'String',Chi_h_Cx)
        set(h.Theta_view,'String',Theta_Bragg*180/pi)
        set(h.DarwinWidth,'string',Dwidth)
        
        
        h.Chi_h_Cx = Chi_h_Cx;
        h.Chi_0_Cx = Chi_0_Cx;
        h.Theta_Bragg = Theta_Bragg;
        h.R_S = R_S;
        h.k_array = k_array;
        h.FBD = FBD;
        h.E_Scan = E_Scan;
        %Crystal properties
        h.Thickness_val = Thickness;
        
        % Set working Matrix to zero
        amplitud_actual = zeros(size(x_Xtal_2D,2),size(y_Xtal_2D,2),N_Step);
        phase_actual = zeros(size(x_Xtal_2D,2),size(y_Xtal_2D,2),N_Step);
        Gaussian_R_actual = zeros(size(x_Xtal_2D,2),size(y_Xtal_2D,2),N_Step);
        
        %call to Function of Green Function
        Beam_3D_Reflectivity_call
        
        % recover the variable result of the green function
        Gaussian_R = h.Gaussian_R;
        
        R_S_3D = h.R_S_all;
        
        R_S_3D_plot(:,:) = R_S_3D(:,:,size(R_S_3D,3)/2);        
        figure
        imagesc(x_Xtal_2D,y_Xtal_2D,abs(R_S_3D_plot).^2)

        
        Gaussian_3D = R_S_3D .* Gaussian_K_3D;
        
        R_S_3D_plot(:,:) = Gaussian_3D(:,:,size(Gaussian_3D,3)/2);        
        
        figure
        imagesc(x_Xtal_2D,y_Xtal_2D,abs(R_S_3D_plot).^2)

        
        % Calculation of the Phase
        if sum(sum(sum(Gaussian_R,1),2),3) == 0
            phase =Gaussian_R .*0;
        else
            phase= atan2(imag(Gaussian_R),real(Gaussian_R));
        end
        
        % Calculation of the Amplitud
        amplitud = sqrt(real(Gaussian_R).^2 + imag(Gaussian_R).^2);

        Intensity_plot(:,:) = sum(abs(Gaussian_R).^2,3);

        
        phase_R_sum_plot(:,:) = sum(phase,3);
        amplitud_R_sum_plot (:,:) = sum(amplitud,3);
        
        
        y_Xtal_2D_plot = -1* y_Xtal_2D;
        
        if get(h.Plot_on_Check,'value')
            child = get(h.I_Fig_Beam_3D_convolution_F8,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            child = get(h.I_Fig_Beam_3D_GK_F4,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            child = get(h.I_Fig_Beam_3D_profile_F6,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
            child = get(h.Figure_Xtal_2D_Ana,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            child = get(h.Figure_Xtal_2D_Ana2,'Children');
            for i=1:length(child)
                delete(child(i));
            end            
                        
            axes(h.I_Fig_Beam_3D_GK_F4)
            imagesc(x_Xtal_2D,y_Xtal_2D,phase_R_sum_plot,'parent',h.I_Fig_Beam_3D_GK_F4)
            title('Phase sxs')
            
            axes(h.I_Fig_Beam_3D_convolution_F8)
            imagesc(x_Xtal_2D,y_Xtal_2D,amplitud_R_sum_plot,'parent', h.I_Fig_Beam_3D_convolution_F8)
            title('amplitud sxs')
            
            axes(h.I_Fig_Beam_3D_profile_F6)
            imagesc(x_Xtal_2D,y_Xtal_2D,Intensity_plot,'parent',h.I_Fig_Beam_3D_profile_F6)
            title('Intensity sxs')
            
            pause(0.01)
        end
        save(path_save_data_file,'phase','amplitud','Intensity_plot','x_Xtal_2D','y_Xtal_2D','E_scan_plot','Gaussian_R');
        
        
        
        set (h.Status_Dynamical_3D,'String','Status: Finnish','BackgroundColor',[0 0 0.9])
    end

    function Scan_Energy (source ,eventdata)
        
        h.x_array  = [];
        x_array = [];
        h.y_array  = [];
        y_array = [];
        h.t_array  = [];
        t_array = [];
        
        h.Energy_array  = [];
        Energy_array = [];
        h.Gaussian_R_all  = [];
        Gaussian_R_all = [];
        h.Intensityx_array  = [];
        Intensityx_array = [];
        h.E_Scan_plot  = [];
        E_Scan_plot = [];
        h.kx_transvers_array  = [];
        kx_transvers_array = [];
        h.ky_transvers_array  = [];
        ky_transvers_array = [];
        h.R_S_G_all  = [];
        R_S_G_all = [];
        h.FBD  = [];
        
        h.LaueD  = [];
        LaueD = [];
        h.R_S_all  = [];
        R_S_all = [];
        
        Flux_Beam = 1;  
        
        R_0H_S_Mono_all  = [];
        h.R_0H_S_Mono_all = [];
        
        child = get(h.I_Fig_Beam_3D_Section_F2,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.I_Fig_Beam_3D_reflectivity_F7,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.I_Fig_Beam_3D_convolution_F8,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        child = get(h.I_Fig_Beam_3D_F1,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_mono_F5,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_profile_F6,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_GK_F4,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_Section_T_F3,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        %figure Ana
        h.I_Figure_Ana = figure(1);
        h.Figure_Xtal_2D_Ana = axes('Parent',h.I_Figure_Ana, 'Units','normalized',...
            'Position',[0.05 0.1 0.9 0.9],...
            'box','on',...
            'LineWidth',0.5,...
            'FontSize',Font_size,...
            'box','on',...
            'Color',[1 1 1],...
            'FontName','Helvetica',...
            'FontWeight','bold');
        
        axes(h.Figure_Xtal_2D_Ana)
        title('XTAL 2D Sum')
        grid('on');
        hold on
        ylabel('Position Y (um)')
        xlabel('Position X (um)')
        view([90 90]);
        
        set(h.Pause_Dynamical_3D,'Value',0)
        set(h.Stop_Dynamical_3D,'Value',1,'ForegroundColor',[0 0 0])
        
        
        element = (get(h.Element,'String'));
        crystal_orientation = get(h.crystal_orientation,'value');
        
        
        Energy_center = eval(get(h.Energy_input,'String'));
        
        h_Miller = eval(get(h.h_miller,'String'));
        k_Miller = eval(get(h.k_miller,'String'));
        l_Miller = eval(get(h.l_miller,'String'));
        vector_Miller = [h_Miller k_Miller l_Miller];
        
        DWF = eval(get(h.DWF,'String'));
        
        Range_E_neg = (-1)*eval(get(h.Range_Left,'String'));
        Range_E_pos = eval(get(h.Range_Right,'String'));
        
        Ang_asy_Deg = eval(get(h.Asymmetry,'String'));
        
        N_Step = eval(get(h.Nstep_t_Beam,'String'));
        
        if get(h.Polarization_s ,'value') == 1
            Polarization = 's';
        else
            Polarization = 'p';
        end
        absor = get(h.Absorption,'Value');
        
        if get(h.More_Crystal_Chk,'value') == 1
            pos_MCC = h.pos_MCC;
            Element_MCC = h.Element_MCC;
            h_Miller = h.h_MCC;
            k_Miller = h.k_MCC;
            l_Miller = h.l_MCC;
            Thickness = h.Thickness_MCC;
            Geometry = h.Geometry_MCC;
            Transmission = h.Transmission_MCC;
            Ang_asy_Deg =h.Asymmetry_MCC;
            crystal_orientation = h.Normal_MCC;
            Polarization = h.polarization_MCC ;
            Energy = h.name_Energy;
            Beam = h.name_Beam;
            da_MCC = h.da_MCC;
            db_MCC = h.db_MCC;
            dc_MCC = h.dc_MCC;
            
            i_cryst_show = eval(get(h.crystal_show,'string'));
        else
            i_cryst = 1;
            i_cryst_show = 1;
            if (get(h.Laue_FBD_Check,'value') == 1) || (get(h.Laue_Check,'value') == 1)
                Geometry_MCC(1,1) = 0;
            else
                Geometry_MCC(1,1) = 1;
                
            end
        end
        
        Thickness_array = get(h.uit,'data');
        
        
        h.h_Miller_val = h_Miller;
        h.k_Miller_val = k_Miller;
        h.l_Miller_val = l_Miller;
        h.DWF_val = DWF;
        
        h.Energy_center = Energy_center;
        h.Range_E_neg = Range_E_neg;
        h.Range_E_pos = Range_E_pos;
        h.N_Step = N_Step;
        h.Flux_Beam_val = Flux_Beam;
        h.absor = absor;
        h.Ang_asy_Deg= Ang_asy_Deg;
        h.crystal_orientation_val = crystal_orientation;
        h.Polarization = Polarization;
        
        if get(h.More_Crystal_Chk,'value') == 1   %More crystals
            for i_cryst = 1:size(pos_MCC,2)
                element = char(Element_MCC(1,i_cryst));
                vector_Miller = [h_MCC(1,i_cryst), k_MCC(1,i_cryst),l_MCC(1,i_cryst)];
                [Z_i, F0_i, FH_i, F_H_i, a_Par_i, b_Par_i, c_Par_i,alpha_Par_i,beta_Par_i,gamma_Par_i] = Element_Bragg_temp_Gui...
                    (element,h_MCC(1,i_cryst),k_MCC(1,i_cryst),l_MCC(1,i_cryst),Energy_center);
                
                F0(1,i_cryst) = F0_i;
                FH(1,i_cryst) = FH_i;
                F_H(1,i_cryst) = F_H_i;
                a_Par(1,i_cryst) = a_Par_i+da_MCC(1,i_cryst)*a_Par_i;
                b_Par(1,i_cryst) = b_Par_i+db_MCC(1,i_cryst)*b_Par_i;
                c_Par(1,i_cryst) = c_Par_i+dc_MCC(1,i_cryst)*c_Par_i;
            end
            
        else
            [Z,F0,FH,F_H,a_Par,b_Par,c_Par,alpha_Par,beta_Par,gamma_Par] = Element_Bragg_temp_Gui(element,h_Miller,k_Miller,l_Miller,Energy_center);
            
            
        end
        
        set(h.f0,'String',F0(1,i_cryst))
        set(h.f1,'String',FH(1,i_cryst))
        set(h.f2,'String',F_H(1,i_cryst))
        
        if get(h.CParameter_Check,'Value') == 1
            a_Par = eval(get(h.a_parameter,'String'));
            b_Par = eval(get(h.b_parameter,'String'));
            c_Par = eval(get(h.c_parameter,'String'));
        end
        set(h.a_parameter,'String',a_Par(1,i_cryst))
        set(h.b_parameter,'String',b_Par(1,i_cryst))
        set(h.c_parameter,'String',c_Par(1,i_cryst))
        h.a_Par = a_Par;
        h.b_Par = b_Par;
        h.c_Par = c_Par;
        h.F0 = F0;
        h.FH = FH;
        h.F_H = F_H;
        
        x_Xtal_2D = h.x_Xtal_2D;
        y_Xtal_2D =   h.y_Xtal_2D;
        
        x_step = eval(get(h.XTAL_2D_x_step,'String'));
        y_step = eval(get(h.XTAL_2D_y_step,'String'));
        
        if source == h.Shot_Beam_push_2D
            
            Beam_2D_x_center_pos_array = h.Beam_2D_x_center_pos;
            Beam_2D_y_center_pos_array = h.Beam_2D_y_center_pos;
            
            XTAL_2D_position_x1 = 0;
            XTAL_2D_position_x2 = 0;
            XTAL_2D_position_x3 = 1;
            XTAL_2D_position_y1 = 0;
            XTAL_2D_position_y2 = 0;
            XTAL_2D_position_y3 = 1;
            
            Beam_2D_y_center_pos1 = Beam_2D_y_center_pos_array;
            Beam_2D_y_center_pos2 = Beam_2D_y_center_pos_array;
            Beam_2D_y_center_pos3 = 1;
            Beam_2D_x_center_pos1 = Beam_2D_x_center_pos_array;
            Beam_2D_x_center_pos2 = Beam_2D_x_center_pos_array;
            Beam_2D_x_center_pos3 = 1;
            
            Beam_2D_x_center_pos_array = h.Beam_2D_x_center_pos;
            Beam_2D_y_center_pos_array = h.Beam_2D_y_center_pos;
            
            number_steps_2D_Scan_x = size(Beam_2D_x_center_pos_array,2);
            number_steps_2D_Scan_y = size(Beam_2D_y_center_pos_array,2);
            
        elseif source == h.Scan_2D_Beam
            
            range_Scan_2D_x = get(h.Scan_2D_Beam_range_x,'string');
            
            i_count_XTAL_2D = 0;
            XTAL_2D_position_x1s = '';
            XTAL_2D_position_x2s = '';
            XTAL_2D_position_x3s = '';
            for i_XTAL_Position = 1:size(range_Scan_2D_x,2)
                
                if i_count_XTAL_2D == 2
                    
                    if (range_Scan_2D_x(1,i_XTAL_Position)==':')
                    else
                        XTAL_2D_position_x3s = sprintf('%s%s',XTAL_2D_position_x3s ,  range_Scan_2D_x(1,i_XTAL_Position));
                    end
                end
                
                if i_count_XTAL_2D == 1
                    
                    if (range_Scan_2D_x(1,i_XTAL_Position)==':')
                        i_count_XTAL_2D = 2;
                    else
                        XTAL_2D_position_x2s = sprintf('%s%s',XTAL_2D_position_x2s ,  range_Scan_2D_x(1,i_XTAL_Position));
                    end
                end
                
                if i_count_XTAL_2D == 0
                    
                    if (range_Scan_2D_x(1,i_XTAL_Position)==':')
                        i_count_XTAL_2D = 1;
                    else
                        XTAL_2D_position_x1s = sprintf('%s%s',XTAL_2D_position_x1s ,  range_Scan_2D_x(1,i_XTAL_Position));
                    end
                end
                
            end
            
            XTAL_2D_position_x1 = str2num(XTAL_2D_position_x1s);
            XTAL_2D_position_x2 = str2num(XTAL_2D_position_x2s);
            XTAL_2D_position_x3 = str2num(XTAL_2D_position_x3s);
            
            range_Scan_2D_y = get(h.Scan_2D_Beam_range_y,'string');
            i_count_XTAL_2D = 0;
            XTAL_2D_position_y1s = '';
            XTAL_2D_position_y2s = '';
            XTAL_2D_position_y3s = '';
            
            for i_XTAL_Position = 1:size(range_Scan_2D_y,2)
                
                if i_count_XTAL_2D == 2
                    
                    if (range_Scan_2D_y(1,i_XTAL_Position)==':')
                        
                    else
                        XTAL_2D_position_y3s = sprintf('%s%s',XTAL_2D_position_y3s ,  range_Scan_2D_y(1,i_XTAL_Position));
                    end
                end
                
                if i_count_XTAL_2D == 1
                    
                    if (range_Scan_2D_y(1,i_XTAL_Position)==':')
                        i_count_XTAL_2D = 2;
                    else
                        XTAL_2D_position_y2s = sprintf('%s%s',XTAL_2D_position_y2s ,  range_Scan_2D_y(1,i_XTAL_Position));
                    end
                end
                
                if i_count_XTAL_2D == 0
                    
                    if (range_Scan_2D_y(1,i_XTAL_Position)==':')
                        i_count_XTAL_2D = 1;
                    else
                        XTAL_2D_position_y1s = sprintf('%s%s',XTAL_2D_position_y1s ,  range_Scan_2D_y(1,i_XTAL_Position));
                    end
                end
                
            end
            
            XTAL_2D_position_y1 = str2num(XTAL_2D_position_y1s);
            XTAL_2D_position_y2 = str2num(XTAL_2D_position_y2s);
            XTAL_2D_position_y3 = str2num(XTAL_2D_position_y3s);
            
            numberx_1 = find((x_Xtal_2D < XTAL_2D_position_x1 + x_step/2));
            Beam_2D_x_center_pos1 = numberx_1(1,size(find((x_Xtal_2D < XTAL_2D_position_x1 + x_step/2)),2));
            numberx_2 = find((x_Xtal_2D < XTAL_2D_position_x2 + x_step/2));
            Beam_2D_x_center_pos2 = numberx_2(1,size(find((x_Xtal_2D < XTAL_2D_position_x2 + x_step/2)),2));
            
            Beam_2D_x_center_pos_array = uint16(linspace(Beam_2D_x_center_pos1,Beam_2D_x_center_pos2,XTAL_2D_position_x3+1));
            
            
            numbery_1 = find((y_Xtal_2D < XTAL_2D_position_y1 + y_step/2));
            Beam_2D_y_center_pos1 = numbery_1(1,size(find((y_Xtal_2D < XTAL_2D_position_y1 + y_step/2)),2));
            numbery_2 = find((y_Xtal_2D < XTAL_2D_position_y2 + y_step/2));
            Beam_2D_y_center_pos2 = numbery_2(1,size(find((y_Xtal_2D < XTAL_2D_position_y2 + y_step/2)),2));
            
            Beam_2D_y_center_pos_array = uint16(linspace(Beam_2D_y_center_pos1,Beam_2D_y_center_pos2,XTAL_2D_position_y3+1));
            
            number_steps_2D_Scan_x = size(Beam_2D_x_center_pos_array,2);
            number_steps_2D_Scan_y = size(Beam_2D_y_center_pos_array,2);
        end
        
        %Incoming Beam--------------------
        Range_Mono_neg = -eval(get(h.Range_neg_Mono,'String'));
        Energy_Bragg = Energy_center - Range_Mono_neg;
        set(h.Energy_point,'String',Energy_Bragg)
        Energy_array(1,1) = Energy_Bragg;
        set(h.Image_point,'String',1)
        
        if get(h.Mono_Beam_Check,'Value') == 1
            
            Thickness_Mono = eval(get(h.Thickness_Mono,'string'));
            element_Mono = get(h.Element_Mono,'String');
            crystal_orientation_Mono = get(h.crystal_orientation_Mono,'value');
            
            % Perfect crystal
            Ang_asy_Deg_Mono = eval(get(h.Asymmetry_Mono,'String'));
            
            %Polarization Mono
            if get(h.Polarization_s_Mono,'Value') == 1
                Polarization_Mono = 's';
            elseif get(h.Polarization_p_Mono,'Value') == 1
                Polarization_Mono = 'p';
            end
            
            h_Miller_Mono = eval(get(h.H_Mono,'String'));
            k_Miller_Mono = eval(get(h.K_Mono,'String'));
            l_Miller_Mono = eval(get(h.L_Mono,'String'));
            
            vector_Miller_Mono = [h_Miller_Mono k_Miller_Mono l_Miller_Mono];
            
            [Z_Mono,F0_Mono,FH_Mono,F_H_Mono,a_Par_Mono,b_Par_Mono,c_Par_Mono,alpha_Par_Mono,beta_Par_Mono,gamma_Par_Mono]=Element_Bragg_temp_Gui...
                (element_Mono,h_Miller_Mono,k_Miller_Mono,l_Miller_Mono,Energy_Bragg);
            
            set(h.f0_Mono,'String',F0_Mono)
            set(h.f1_Mono,'String',FH_Mono)
            set(h.f2_Mono,'String',F_H_Mono)
            
            if get(h.f_check_values,'Value') == 1
                f_0 = eval(get(h.f0_Mono,'String'));
                f_1 = eval(get(h.f1_Mono,'String'));
                f_2 = eval(get(h.f2_Mono,'String'));
            end
            
            
            [Theta_Bragg_Mono,Chi_0_Cx_Mono,Chi_h_Cx_Mono,R_0H_S_Mono,E_Scan,G_S,t_array,k_array,Dwidth] = Bragg_temp_Gui_test...
                (a_Par_Mono,b_Par_Mono,c_Par_Mono,Energy_Bragg,Energy_center,...
                h_Miller_Mono,k_Miller_Mono,l_Miller_Mono,DWF,F0_Mono,FH_Mono,F_H_Mono,absor,...
                Range_E_neg,Range_E_pos,Polarization_Mono,Ang_asy_Deg_Mono,Thickness_Mono,N_Step,...
                0,crystal_orientation_Mono);
            
            
            E_scan_plot = E_Scan -Energy_center;
            
            Gaussian_K = R_0H_S_Mono ;
            
            %pause(0.1)
            
            Gaussian_K_all(1,:) = Gaussian_K;
            
            if get(h.Plot_on_Check,'value')
                axes(h.I_Fig_Beam_3D_reflectivity_F7)
                plot(E_scan_plot,abs(R_0H_S_Mono).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)
                title_Mono = strcat('Monochromator:(',get(h.H_Mono,'String'),',',get(h.K_Mono,'String'),',',get(h.L_Mono,'String'),')');
                title(title_Mono)
                ylabel('Intensity (arb. unit)')
                xlabel('Energy (eV)')
                axis auto
                hold on
                
                axes(h.I_Fig_Beam_3D_reflectivity_F7)
                hold on
                plot(E_scan_plot,abs(Gaussian_K).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)
            end
            
            
        end
        
        if get(h.Mono_Beam_Check,'Value') == 0
            
            WaveL_Bragg = h.h_planck * h.c_light / Energy_Bragg    ; %m
            k0=2*pi/WaveL_Bragg;
            rho = eval(get(h.rhoparameter,'String'));
            %rho=5e-4; %related to number of periodes undulator 5e-4
            sigk=rho*k0;
            
            Gaussian_k=exp(-0.5*(k_array-k0).*(k_array-k0)/sigk/sigk)*2;
            
            if get(h.Plot_on_Check,'value')
                axes(h.I_Fig_Beam_3D_Section_T_F3)
                % k space gaussian define by machine porperties
                plot(E_Scan_plot,Gaussian_k,'Parent',h.I_Fig_Beam_3D_Section_T_F3)
                ylabel('Intensity (arb. unit)')
                xlabel('Energy (eV)')
                axis auto
                hold on
                % pause(0.1)
            end
            
            if get(h.Gaussian_Beam_SASE_Check,'Value') == 1
                phase = exp(1i*2*pi*random('unif',0,1,1,N_Step));
                Gaussian_k= Gaussian_k.*phase;
                
                % k space gaussian define by machine porperties
                if get(h.Plot_on_Check,'value')
                    plot(E_Scan_plot,abs(Gaussian_k).^2,'Parent',h.I_Fig_Beam_3D_Section_T_F3)
                end
                
                % To time space
                Gaussian_T = ifft(fftshift(Gaussian_k));
                if get(h.Plot_on_Check,'value')
                    axes(h.I_Fig_Beam_3D_Section_T_F3)
                    plot(t_array,Gaussian_T,'Parent',h.I_Fig_Beam_3D_Section_T_F3)
                end
                %  pause(0.1)
                
                %Definition time window
                lt = eval(get(h.size_T_Beam,'String'))*1e-15; %seg
                dt = t_array(1,2)- t_array(1,1);
                Nsam=floor(lt/dt);
                Gaussian_T(Nsam:end)=0;
                
                if get(h.Plot_on_Check,'value')
                    plot(t_array,abs(Gaussian_T).^2,'Parent',h.I_Fig_Beam_3D_GK_F4)
                end
                %   pause(0.1)
                
                %Back to k space
                Gaussian_K=fftshift(fft(Gaussian_T))*3;
                
                if get(h.Plot_on_Check,'value')
                    axes(h.I_Fig_Beam_3D_reflectivity_F7)
                    hold on
                    plot(E_Scan_plot,abs(Gaussian_K).^2,'Parent',h.I_Fig_Beam_3D_reflectivity_F7)
                end
                %  pause(.1)
                
                Gaussian_K_all(i_steps,:) = Gaussian_K;
                %G_mono = R_S.*Gaussian_K;
                G_mono = Gaussian_K;
                
            else
                
                Gaussian_K_all(i_steps,:) = Gaussian_k;
                %G_mono = R_S.*Gaussian_K;
                G_mono = Gaussian_k;
                
            end
        else
            G_mono =  Gaussian_K;
            
        end
        
        h.G_mono = G_mono;
        
        %% 3D beam definition spatial
        N_Step_x = eval(get(h.Nstep_x_Beam,'String'));
        N_Step_y = eval(get(h.Nstep_y_Beam,'String'));
        
        initial_range_x = eval(get(h.initial_range_x,'String'));
        initial_range_y = eval(get(h.initial_range_y,'String'));
        
        
        %Definition of x
        x_0 =0;
        %x_0 = eval(get(h.Beam_2D_x_center,'string'))*1e-6;
        sigma_x = eval(get(h.size_X_Beam,'String'))*1e-6; %um
        x_array = linspace(-initial_range_x/2,initial_range_x/2,N_Step_x)*1e-6;
        
        if get(h.Lorenztian_Distribution,'Value') == 1
            sigma_x = sigma_x/2;
            Gaussian_x = 1e-3/(pi*sigma_x)./(1+((x_array-x_0)/sigma_x).^2)/100;
        else
            sigma_x = sigma_x/2.355;
            Gaussian_x = 1*exp(-((x_array-x_0)/sigma_x).^2./2);
        end
        
        %Definition of y
        y_0 =0;
        %y_0 = eval(get(h.Beam_2D_y_center,'string'))*1e-6;
        sigma_y = eval(get(h.size_Y_Beam,'String'))*1e-6; %um
        y_array = linspace(-initial_range_y/2,initial_range_y/2,N_Step_y)*1e-6;
        if get(h.Lorenztian_Distribution,'Value') == 1
            Gaussian_y = 1e-3/(pi*sigma_y)./(1+((y_array-y_0)/sigma_y).^2)/100;
        else
            Gaussian_y = 1*exp(-((y_array-y_0)/sigma_y).^2./2);
        end
        
        
        % What is the realtion kx x?
        dx = x_array(1,1)-x_array(1,2);
        dkx = 2*pi/(N_Step_x*dx);
        kx_transvers_array = dkx *linspace(-N_Step_x/2,N_Step_x/2,N_Step_x);
        
        Gaussian_kx = fftshift(fft(Gaussian_x));
        
        
        % What is the realtion ky y?
        dy = y_array(1,1)-y_array(1,2);
        dky = 2*pi/(N_Step_y*dy);
        ky_transvers_array = dky *linspace(-N_Step_y/2,N_Step_y/2,N_Step_y) ;
        
        Gaussian_ky = fftshift(fft(Gaussian_y));
        
        for i_y = 1:size(ky_transvers_array,2)
            Gaussian_KXY (:,i_y)= Gaussian_kx'.*Gaussian_ky(1,i_y);
            Gaussian_XY (:,i_y)= Gaussian_x'.*Gaussian_y(1,i_y);
        end
        
        if get(h.Plot_on_Check,'value')
            axes(h.I_Fig_Beam_3D_F1)
            surf(ky_transvers_array,kx_transvers_array,abs(Gaussian_KXY).^2,'Parent',h.I_Fig_Beam_3D_F1,'edgecolor','none')
        end
        
        Gaussian_ky =[];
        Gaussian_kx =[];
        Gaussian_y =[];
        Gaussian_x =[];
        
        %% definition 3D beam
        for i_x = 1 :size(E_Scan,2)
            
            Gaussian_K_3D (:,:,i_x)= Gaussian_KXY'.*G_mono(1,i_x);
        end
        
        if get(h.Plot_on_Check,'value')
            axes(h.I_Fig_Beam_3D_F1)
            surf(kx_transvers_array,ky_transvers_array,sum(abs(Gaussian_K_3D).^2,3),'Parent',h.I_Fig_Beam_3D_F1,'edgecolor','none')
            view([20 20]);
        end
        
        h.Gaussian_K_3D = Gaussian_K_3D;
        h.kx_transvers_array = kx_transvers_array;
        h.ky_transvers_array = ky_transvers_array;
        h.x_array = x_array;
        h.y_array = y_array;
        
        %for possible energy scan
        h.i_steps_energy_2D_Xtal =1;
        h.i_average_energy_2D_Xtal = 1;
        
        %-----------------------
        x_int_sum = x_Xtal_2D(1,1) + XTAL_2D_position_x1;
        x_final_sum = x_Xtal_2D(1,size(x_Xtal_2D,2)) + XTAL_2D_position_x2;
        y_int_sum = y_Xtal_2D(1,1) + XTAL_2D_position_y1;
        y_final_sum = y_Xtal_2D(1,size(y_Xtal_2D,2)) + XTAL_2D_position_y2;
        
        N_Step_x_sum = (x_int_sum - x_final_sum-2) / (x_Xtal_2D(1,1) - x_Xtal_2D(1,size(x_Xtal_2D,2))) * size(x_Xtal_2D,2);
        N_Step_y_sum = (y_int_sum - y_final_sum-2) / (y_Xtal_2D(1,1) - y_Xtal_2D(1,size(y_Xtal_2D,2))) * size(y_Xtal_2D,2);
        
        set(h.name_Total_Steps_Scan_2D_Beam,'string',number_steps_2D_Scan_x*number_steps_2D_Scan_y)
        
        folder_save = get(h.Folder_XTAL_2D,'string');
        Energy_name = sprintf('%dkeV',Energy_center);
        reflection_name = sprintf('%s_HKL%d_%d_%d',element,h_Miller,k_Miller,l_Miller);
        file_name_Intensity = sprintf('%s_%s_%s_Data',get(h.File_XTAL_2D,'string'),reflection_name,Energy_name);
        
        path_save_data_file = sprintf('%s%s.mat',folder_save,file_name_Intensity);
        
        if isfile(path_save_data_file)
            load(path_save_data_file);
        else
            Intensity_plot_Sum= zeros(size(x_Xtal_2D,2),size(y_Xtal_2D,2));
            Intensity_plot = zeros(size(x_Xtal_2D,2),size(y_Xtal_2D,2));
            phase_R_sum_plot = zeros(size(x_Xtal_2D,2),size(y_Xtal_2D,2));
            amplitud_R_sum_plot = zeros(size(x_Xtal_2D,2),size(y_Xtal_2D,2));
            phase_R_sum = zeros(size(x_Xtal_2D,2),size(y_Xtal_2D,2),N_Step);
            amplitud_R_sum= zeros(size(x_Xtal_2D,2),size(y_Xtal_2D,2),N_Step);
            Gaussian_R_sum = zeros(size(x_Xtal_2D,2),size(y_Xtal_2D,2),N_Step);
        end
        
        
        
        for i_2D_Scan = 1:number_steps_2D_Scan_x
            
            if get(h.Stop_Dynamical_3D,'Value') == 0
                set(h.Status_Dynamical_3D,'String','Status: Stop by user','BackgroundColor',[0.9 0 0.9])
                break
                
            end
            
            if get(h.Plot_on_Check,'value')
                child = get(h.I_Fig_Beam_3D_Section_T_F3,'Children');
                for i=1:length(child)
                    delete(child(i));
                end
                child = get(h.I_Fig_Beam_3D_reflectivity_F7,'Children');
                for i=1:length(child)
                    delete(child(i));
                end
            end
            
            for j_2D_Scan = 1:number_steps_2D_Scan_y
                
                if get(h.Stop_Dynamical_3D,'Value') == 0
                    set(h.Status_Dynamical_3D,'String','Status: Stop by user','BackgroundColor',[0.9 0 0.9])
                    break
                    
                end
                
                %% Crystal definition
                Thickness = Thickness_array(Beam_2D_y_center_pos_array(1,j_2D_Scan),Beam_2D_x_center_pos_array(1,i_2D_Scan));
                set(h.Thickness,'string',Thickness)
                set(h.name_Actual_Steps_Scan_2D_Beam,'string',(i_2D_Scan-1) * number_steps_2D_Scan_y + j_2D_Scan)
                
                %Plot position  in 2D plot
                child = get(h.Figure_Xtal_2D,'Children');
                for i=1:length(child)
                    delete(child(i));
                end
                
                if get(h.Plot_on_Check,'value')
                    axes(h.Figure_Xtal_2D)
                    surf(y_Xtal_2D,x_Xtal_2D,Thickness_array','Parent',h.Figure_Xtal_2D,'edgecolor','none')
                    view([90 90])
                    
                    hold on
                    
                    scatter3(y_Xtal_2D(Beam_2D_y_center_pos_array(1,j_2D_Scan)),x_Xtal_2D(Beam_2D_x_center_pos_array(1,i_2D_Scan)),1000,'Parent',h.Figure_Xtal_2D,'.r')
                    pause(0.001)
                end
                
                set(h.Beam_2D_x_center,'string',x_Xtal_2D(Beam_2D_x_center_pos_array(1,i_2D_Scan)))
                set(h.Beam_2D_y_center,'string',y_Xtal_2D(Beam_2D_y_center_pos_array(1,j_2D_Scan)))
                
                
                %% Green function Crystal
                if Geometry_MCC(1,i_cryst_show) ==1
                    FBD = get(h.Bragg_FBD_Check,'Value');
                    [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_S,E_Scan,G_S,t_array,k_array,Dwidth] = Bragg_temp_Gui_test...
                        (a_Par(1,i_cryst_show),b_Par(1,i_cryst_show),c_Par(1,i_cryst_show),Energy_center,Energy_center,...
                        h_Miller(1,i_cryst_show),k_Miller(1,i_cryst_show),l_Miller(1,i_cryst_show),DWF,F0(1,i_cryst_show),FH(1,i_cryst_show),F_H(1,i_cryst_show),absor,...
                        Range_E_neg,Range_E_pos,Polarization(1,i_cryst_show),Ang_asy_Deg(1,i_cryst_show),Thickness(1,i_cryst_show),N_Step,...
                        FBD,crystal_orientation(1,i_cryst_show));
                else
                    FBD = get(h.Laue_FBD_Check,'Value');
                    [Theta_Bragg,Chi_0_Cx,Chi_h_Cx,R_S,E_Scan,t_array,k_array,Dwidth] =...
                        Laue_temp_Gui_1D_test(a_Par(1,i_cryst_show),b_Par(1,i_cryst_show),c_Par(1,i_cryst_show),Energy_center,Energy_center,...
                        h_Miller(1,i_cryst_show),k_Miller(1,i_cryst_show),l_Miller(1,i_cryst_show),DWF,F0(1,i_cryst_show),FH(1,i_cryst_show),F_H(1,i_cryst_show),absor,...
                        Range_E_neg,Range_E_pos,Polarization(1,i_cryst_show),Ang_asy_Deg(1,i_cryst_show),Thickness(1,i_cryst_show),N_Step,...
                        FBD,crystal_orientation(1,i_cryst_show));
                end
                
                set(h.Chi_0,'String',Chi_0_Cx)
                set(h.Chi_h,'String',Chi_h_Cx)
                set(h.Theta_view,'String',Theta_Bragg*180/pi)
                set(h.DarwinWidth,'string',Dwidth)
                
                
                h.Chi_h_Cx = Chi_h_Cx;
                h.Chi_0_Cx = Chi_0_Cx;
                h.Theta_Bragg = Theta_Bragg;
                h.R_S = R_S;
                h.k_array = k_array;
                h.FBD = FBD;
                h.E_Scan = E_Scan;
                %Crystal properties
                h.Thickness_val = Thickness;
                
                % Set working Matrix to zero
                amplitud_actual = zeros(size(x_Xtal_2D,2),size(y_Xtal_2D,2),N_Step);
                phase_actual = zeros(size(x_Xtal_2D,2),size(y_Xtal_2D,2),N_Step);
                Gaussian_R_actual = zeros(size(x_Xtal_2D,2),size(y_Xtal_2D,2),N_Step);
                
                %call to Function of Green Function
                Beam_3D_Reflectivity_call
                
                % recover the variable result of the green function
                Gaussian_R = h.Gaussian_R;
                
                Gaussian_R_x_plot = sum(sum(abs(Gaussian_R).^2,1),3);
                [pks,locs,w,p] = findpeaks(Gaussian_R_x_plot,x_Xtal_2D);
                
                [pksmax,indexmax] = max(pks);
                [pksmin,indexmin] = min(pks);
                
                if (get(h.Laue_Check,'value') == 1) %Laue is different case as it is symmetric
                else
                    if locs(indexmax) > locs(indexmin)
                        Gaussian_R = fftshift(Gaussian_R,2);
                        % Definition of the first maxima
                        Gaussian_R_x_plot = sum(sum(abs(Gaussian_R).^2,1),3);
                        [pks,locs,w,p] = findpeaks(Gaussian_R_x_plot,x_Xtal_2D);
                    end
                end
                
                if Thickness ==0
                    X_tal_2D_center = 0;
                else
                    X_tal_2D_center = find(x_Xtal_2D == locs(1))- size(y_Xtal_2D,2)/2;
                end
                %                 figure (2)
                %                 semilogy(x_Xtal_2D-x_Xtal_2D(X_tal_2D_center + size(y_Xtal_2D,2)/2),Gaussian_R_x_plot)
                %                 hold on
                %                 scatter(locs-x_Xtal_2D(X_tal_2D_center+ size(y_Xtal_2D,2)/2),pks)
                
                
                %Index for position sum
                %size(y_Xtal_2D,2)/2
                %Beam_2D_y_center_pos_array(1,j_2D_Scan)
                %j_diff = size(y_Xtal_2D,2)/2 - Beam_2D_y_center_pos_array(1,j_2D_Scan)
                j_diff = int16(size(y_Xtal_2D,2)/2) - X_tal_2D_center - int16(Beam_2D_y_center_pos_array(1,j_2D_Scan));
                i_diff = int16(size(x_Xtal_2D,2)/2) - int16(Beam_2D_x_center_pos_array(1,i_2D_Scan));
                
                if j_diff <= 0
                    j_diff = abs(j_diff);
                    
                    j_init_sum = 1;
                    j_final_sum = size(y_Xtal_2D,2) - j_diff;
                    
                    j_init_actual = j_diff+1;
                    j_final_actual = size(y_Xtal_2D,2);
                    
                else
                    
                    j_init_sum = j_diff+1;
                    j_final_sum = size(y_Xtal_2D,2);
                    
                    j_init_actual = 1;
                    j_final_actual = size(y_Xtal_2D,2) - j_diff;
                end
                
                if i_diff <= 0
                    i_diff = abs(i_diff);
                    i_init_sum = 1;
                    i_final_sum = size(x_Xtal_2D,2) - i_diff;
                    
                    i_init_actual = i_diff + 1;
                    i_final_actual = size(x_Xtal_2D,2);
                    
                else
                    i_init_sum = i_diff+1;
                    i_final_sum = size(x_Xtal_2D,2);
                    
                    i_init_actual = 1;
                    i_final_actual = size(x_Xtal_2D,2) - i_diff;
                end
                
                name_Gaussian_R_acutal = [i_init_actual,i_final_actual,j_init_actual,j_final_actual];
                name_Gaussian_R_sum = [i_init_sum,i_final_sum,j_init_sum,j_final_sum];
                
                %Copy the Gaussian to the related position in the 2D map
                Gaussian_R_actual(i_init_sum:i_final_sum,j_init_sum:j_final_sum,:) = Gaussian_R(i_init_actual:i_final_actual,j_init_actual:j_final_actual,:);
                
                %                 Gaussian_R_x_plot = sum(sum(abs(Gaussian_R_actual).^2,1),3);
                %                 [pks,locs,w,p] = findpeaks(Gaussian_R_x_plot,x_Xtal_2D);
                %
                %                 X_tal_2D_center = find(x_Xtal_2D == locs(1))- size(y_Xtal_2D,2)/2;
                %
                %                 figure (3)
                %                 semilogy(x_Xtal_2D-x_Xtal_2D(X_tal_2D_center + size(y_Xtal_2D,2)/2),Gaussian_R_x_plot)
                %                 hold on
                %                 scatter(locs-x_Xtal_2D(X_tal_2D_center+ size(y_Xtal_2D,2)/2),pks)
                
                % Calculation of the Phase
                if sum(sum(sum(Gaussian_R,1),2),3) == 0
                    phase =Gaussian_R .*0;
                else
                    phase= atan2(imag(Gaussian_R),real(Gaussian_R));
                end
                %Copy the phase to the related position in the 2D map
                phase_actual(i_init_sum:i_final_sum,j_init_sum:j_final_sum,:) = phase(i_init_actual:i_final_actual,j_init_actual:j_final_actual,:);
                
                %sum phases
                phase_R_sum = phase_R_sum + phase_actual;
                
                % Calculation of the Amplitud
                amplitud = sqrt(real(Gaussian_R).^2 + imag(Gaussian_R).^2);
                
                % in relation to the 2D map
                amplitud_actual(i_init_sum:i_final_sum,j_init_sum:j_final_sum,:) = amplitud(i_init_actual:i_final_actual,j_init_actual:j_final_actual,:);
                
                %sum amplitud
                amplitud_R_sum = amplitud_R_sum + amplitud_actual;
                
                %sum Gaussian
                Gaussian_R_sum = Gaussian_R_sum + Gaussian_R_actual;
                
                % addition of all the intensity plots in relation to 2D map
                %Intensity_plot(:,:) = Intensity_plot + flip(sum(abs(Gaussian_R_actual).^2,3),2);
                Intensity_plot(:,:) = Intensity_plot + sum(abs(Gaussian_R_actual).^2,3);
                                
                phase_R_sum_plot(:,:) = sum(phase_R_sum,3);
                amplitud_R_sum_plot (:,:) = sum(amplitud_R_sum,3);
                
                Intensity_plot_Sum(Beam_2D_x_center_pos_array(1,i_2D_Scan),Beam_2D_y_center_pos_array(1,j_2D_Scan))= sum(sum(sum(abs(Gaussian_R).^2,3),2),1);
                
                y_Xtal_2D_plot = -1* y_Xtal_2D;
                
                if get(h.Plot_on_Check,'value')
                    child = get(h.I_Fig_Beam_3D_convolution_F8,'Children');
                    for i=1:length(child)
                        delete(child(i));
                    end
                    child = get(h.I_Fig_Beam_3D_GK_F4,'Children');
                    for i=1:length(child)
                        delete(child(i));
                    end
                    child = get(h.I_Fig_Beam_3D_profile_F6,'Children');
                    for i=1:length(child)
                        delete(child(i));
                    end
                    
                    child = get(h.Figure_Xtal_2D_Ana,'Children');
                    for i=1:length(child)
                        delete(child(i));
                    end   
                    
                    axes(h.I_Fig_Beam_3D_GK_F4)
                    imagesc(y_Xtal_2D_plot,y_Xtal_2D,phase_R_sum_plot,'parent',h.I_Fig_Beam_3D_GK_F4)
                    title('Phase sxs')
                    
                    axes(h.I_Fig_Beam_3D_convolution_F8)
                    imagesc(y_Xtal_2D_plot,y_Xtal_2D,amplitud_R_sum_plot,'parent', h.I_Fig_Beam_3D_convolution_F8)
                    title('amplitud sxs')
                    
                    axes(h.I_Fig_Beam_3D_profile_F6)
                    imagesc(y_Xtal_2D_plot,y_Xtal_2D,Intensity_plot,'parent',h.I_Fig_Beam_3D_profile_F6)
                    title('Intensity sxs')
                    
                    axes(h.Figure_Xtal_2D_Ana)
                    imagesc(y_Xtal_2D,y_Xtal_2D,Intensity_plot_Sum,'Parent',h.Figure_Xtal_2D_Ana)
                    colormap bone
                    pause(0.01)
                end
                save(path_save_data_file,'phase_R_sum','amplitud_R_sum','Intensity_plot','Intensity_plot_Sum','x_Xtal_2D','y_Xtal_2D','E_scan_plot','Gaussian_R_sum');
                
                
            end
            
                      
            child = get(h.I_Fig_Beam_3D_convolution_F8,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            child = get(h.I_Fig_Beam_3D_GK_F4,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            child = get(h.I_Fig_Beam_3D_profile_F6,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
            child = get(h.Figure_Xtal_2D_Ana,'Children');
            for i=1:length(child)
                delete(child(i));
            end
            
            axes(h.I_Fig_Beam_3D_GK_F4)
            imagesc(y_Xtal_2D_plot,x_Xtal_2D,phase_R_sum_plot,'parent',h.I_Fig_Beam_3D_GK_F4)
            title('Phase sxs')
            
            axes(h.I_Fig_Beam_3D_convolution_F8)
            imagesc(y_Xtal_2D_plot,x_Xtal_2D,amplitud_R_sum_plot,'parent', h.I_Fig_Beam_3D_convolution_F8)
            title('amplitud sxs')
            
            axes(h.I_Fig_Beam_3D_profile_F6)
            imagesc(y_Xtal_2D_plot,x_Xtal_2D,Intensity_plot,'parent',h.I_Fig_Beam_3D_profile_F6)
            title('Intensity sxs')           
            
        end
        
        child = get(h.I_Fig_Beam_3D_convolution_F8,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_GK_F4,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        child = get(h.I_Fig_Beam_3D_profile_F6,'Children');
        for i=1:length(child)
            delete(child(i));
        end
        
        axes(h.I_Fig_Beam_3D_GK_F4)
        imagesc(y_Xtal_2D_plot,x_Xtal_2D,phase_R_sum_plot,'parent',h.I_Fig_Beam_3D_GK_F4)
        title('Phase sxs')
        
        axes(h.I_Fig_Beam_3D_convolution_F8)
        imagesc(y_Xtal_2D_plot,x_Xtal_2D,amplitud_R_sum_plot,'parent', h.I_Fig_Beam_3D_convolution_F8)
        title('amplitud sxs')
        
        axes(h.I_Fig_Beam_3D_profile_F6)
        imagesc(y_Xtal_2D_plot,x_Xtal_2D,Intensity_plot,'parent',h.I_Fig_Beam_3D_profile_F6)
        title('Intensity sxs')        
        
        set (h.Status_Dynamical_3D,'String','Status: Finnish','BackgroundColor',[0 0 0.9])
    end

    function Help_FBD(source,eventdata)
        if source == h.Help_FBD_Simulations
            winopen('Help_FBD.pdf')
        end
    end
end
   