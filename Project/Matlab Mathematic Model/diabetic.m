function [sys,x0,str,ts,simStateCompliance] = diabetic(t,y,u,flag)

switch flag,
    case 0,
        [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes();
        
    case 1,
        sys=mdlDerivatives(t,y,u);
        
    case 2,
        sys=mdlUpdate(t,y,u);

    case 3,
        sys=mdlOutputs(t,y,u);

    case 4,
        sys=mdlGetTimeOfNextVarHit(t,y,u);

    case 9,
        sys=mdlTerminate(t,y,u);

    otherwise
        DAStudio.error('Simulink:blocks:unhandledFlag', num2str(flag));
        
end

function [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes()

sizes = simsizes;

sizes.NumContStates  = 6;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 1;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;   % at least one sample time is needed

sys = simsizes(sizes);

x0 = [ 76.2159  33.3333   33.3333   16.6667   16.6667  250.0000]';

str = [];

ts  = [0 0];

simStateCompliance = 'UnknownSimState';

function sys=mdlDerivatives(t,y,u)

ui = u(1);               % micro-U/min

d = u(2)*10;

g = y(1,1);               % blood glucose (mg/dl)
x = y(2,1);               % remote insulin (micro-u/ml)
i = y(3,1);               % insulin (micro-u/ml)
q1 = y(4,1);
q2 = y(5,1);
g_gut = y(6,1);           % gut blood glucose (mg/dl)

% Parameters:
gb    = 291;            
p1    = 3.17e-2;        
p2    = 1.23e-2;         
si    = 2.9e-2;          
ke    = 9.0e-2;          
kabs  = 1.2e-2;          
kemp  = 1.8e-1;          
f     = 8.00e-1;         
vi    = 12.0;            
vg    = 12.0;            

% Compute ydot:
sys(1,1) = -p1*(g-gb) - si*x*g + ...
    f*kabs/vg * g_gut + f/vg * d;  
sys(2,1) =  p2*(i-x);             
sys(3,1) = -ke*i + ui;            
sys(4,1) = ui - kemp * q1;
sys(5,1) = -kemp*(q2-q1); 
sys(6,1) = kemp*q2 - kabs*g_gut;


sys = sys/60;

function sys=mdlUpdate(t,y,u)

sys = [];

function sys=mdlOutputs(t,y,u)

y1 = y(1);

sys = [y1];

function sys=mdlGetTimeOfNextVarHit(t,y,u)

sampleTime = 1;    
sys = t + sampleTime;


function sys=mdlTerminate(t,y,u)

sys = [];

