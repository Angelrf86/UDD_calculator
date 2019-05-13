% GaMnAs1d (29.12.2005)
clear all
str = sprintf('\n'); disp(str),

Lambda = 1.5406;
k = 2.*pi/Lambda;

% GaMnAs layer
chi0(1)  = -2.90467e-05 - 9.29655e-07*i;
chih(1)  = -1.68794e-05 - 8.63442e-07*i;
chimh(1) = -1.68794e-05 - 8.63442e-07*i;
a(1) = 5.6647;
thickness(1) = 1000.; % 1000000.
% LT GaAs:
chi0(2)  = -2.91699e-05 - 8.72074e-07*i;
chih(2)  = -1.69424202e-05 - 8.09489181e-07*i;
chimh(2) = -1.69424202e-05 - 8.09489181e-07*i;
a(2) = 5.6532;
thickness(2) = 0; % 600;
% GaAs substrate
chi0(3)  = -2.91699e-05 - 8.72074e-07*i;
chih(3)  = -1.69424202e-05 - 8.09489181e-07*i;
chimh(3) = -1.69424202e-05 - 8.09489181e-07*i;
a(3) = 5.6532;

poiss = 0.331;
a = a(3) + (a-a(3))*(1+poiss)/(1-poiss);

HKL = [0 0 1];
hkl = [0 0 4];

isym = 1;
hh = 2.*pi/a(3)*norm(hkl);
h = 2.*pi/a(3)*hkl;
hz = HKL*h'/norm(HKL);
hx = sqrt(abs(hh*hh-hz*hz))*isym; phi = -asin(hx/hh); cosphi = hz/hh;
th = asin(hh/2./k); polf = abs(cos(2.*th)); sin2th = sin(2.*th);
    
% other params
alphamax = th-phi; % kinematical maximum position
amon = 5.6575; % lattice parameter of the monochromator (5.6575 for Ge)
r0 = 0.73e5; % primary int.
bkg = 0.1; % background
  
alpha1 = 33.026-0.4; %33.0292-0.0003; %32.6;%15.60230;
alpha2 = 33.032+0.2; %33.0292+0.0003; %33.2;%15.90130;
alpha3 = 0.00002*100; %0.0000004; %0.00080;

str = sprintf('Bragg angle of the substrate = %.4f deg', th*180./pi); disp(str),
str = sprintf('asymmetry angle of the substrate = %.4f deg', phi*180./pi); disp(str),
str = sprintf('kinematical maximum position = %.4f deg', alphamax*180./pi); disp(str),
str = sprintf('angle of incidence from to step in deg'); disp(str),
str = sprintf('%.4f\n%.4f\n%.4f', alpha1, alpha2, alpha3); disp(str),
    
str = sprintf('lattice parameter of the Bartels monochromator = %.4f', amon); disp(str),
str = sprintf('primary int. = %.4f', r0); disp(str),
str = sprintf('background = %.4f', bkg); disp(str),

g0 = sin(th-phi); gh = -sin(th+phi);
d0 = cos(th-phi); dh =  cos(th+phi);
def = (a-a(3))/a(3);
% diffraction 220 on the Bartels monochromator
thmon = asin(sqrt(2)/amon*Lambda); polfmon = abs(cos(2.*thmon));
    
%
alpha = alpha1;
pol = polf; nlayers=3;
n = 1;
CM = zeros(4,4,nlayers); % C-matrix
mPHIM = zeros(4,4,nlayers-1); % mPhi-matrix
TM = zeros(4,4,nlayers-1); % T-matrix
%pause(5),
disp('calc started'),
while (alpha <= alpha2)
    %
    eta = alpha*pi/180.-th+phi;
    for m=1:nlayers % layers
        xi = g0*(eta-hz*gh/k/sin2th*def(m));
        B = 2.*k*hx/hz*(xi-0.5*(d0+dh));
        C = k*k*(xi/cosphi*(xi-(d0+dh))/cosphi-chi0(m));
		E2 = (k*k*pol)*(k*k*pol)*chih(m)*chimh(m);
        if logical(1)
            p = [1., 2.*B, 2.*C+B.^2-hz*hz, 2.*B*C, C.^2-E2];
            q(1:4) = roots(p);
        else  %%%
            tb = 2*C-hz^2; tc = C^2-E2;
            tdet = sqrt(tb^2-4.*tc); if real(tb'*tdet)<0 tdet = -tdet; end
            q = []; q(1)=-0.5*(tb+tdet);q(2)=tc/q(1);q=sqrt(q);q=[q -q];
        end
        data(n,:) = q;
        cc(n,m,:) = pol*chih(m)*k*k./(q.^2+(B+hz)*q+C);
        ck(n,m,:) = -k*g0+k*hx/hz*xi+q;
        if (m==nlayers) % swap substrate waves
            Lind = imag(ck(n,m,:)) >= 0.;
            t1 = cc(n,m,Lind); t2 = cc(n,m,~Lind); cc(n,m,1:2) = t1; cc(n,m,3:4) = t2; 
            t1 = ck(n,m,Lind); t2 = ck(n,m,~Lind); ck(n,m,1:2) = t1; ck(n,m,3:4) = t2;
        else % define mPhi-matrix
            t1 = zeros(4); t2 = squeeze(ck(n,m,:));
            t1(logical(eye(4))) = exp(-i*t2*thickness(m));
            mPHIM(:,:,m)=t1;
        end
        % define C-matrix
        CM(1,:,m) = ones(1,4);
        CM(2,:,m) = ck(n,m,:);
        CM(3,:,m) = cc(n,m,:);
        CM(4,:,m) = (ck(n,m,:)+hz).*cc(n,m,:);
        if (m~=nlayers) % calc T-matrix for each layer
            cm = squeeze(CM(:,:,m));
            mphim = squeeze(mPHIM(:,:,m));
            TM(:,:,m) = cm*mphim*inv(cm);
        end
    end % layers (m)
    % calc M-matrix
    k0z = -k*(g0+d0*eta);
    C0M = zeros(4);
    C0M(1,1:2) = ones(1,2); C0M(2,1:2) = k0z*[1 -1];
    C0M(3,3:4) = ones(1,2); C0M(4,3:4) = (k0z+hz)*[1 1];
    MM = eye(4);
    for m=1:nlayers-1 tm=squeeze(TM(:,:,m)); MM = MM*tm; end
    cm = squeeze(CM(:,:,nlayers));
    MM = MM*cm;
    % build system of eq
    A = [-C0M(:,[2 3]) MM(:,[1 2])]; b = C0M(:,1);
    x = A\b;
    data1(n,1) = alpha;
    data1(n,2) = x(2);
    %
    alpha = alpha + alpha3;
    n = n+1;
end % (alpha)
n = length(data);
disp('calc done'),


%rr = abs(cc(:,3,4)).^2*abs(gh)/g0;
rr = abs(data1(:,2)).^2*abs(gh)/g0;
figure
semilogy(data1(:,1),rr,'-')

figure
plot(data1(:,1),rr,'-')
 