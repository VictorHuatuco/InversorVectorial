Vdc = 400; 
Lf = 800e-6;
Cf = 400e-6;
Lload = 2e-3;
Rload = 50;
f = 60;
fz = 3000;
a = 0.6;
w = 2*pi*60;
Tz = 1/fz;
V_ref = (2/3)*a*Vdc;

u=[1
     1
     1];

%Coeficientes de Modelo Espacial
A = [zeros(3,3) eye(3)/(3*Cf) -eye(3)/(3*Cf)
    -eye(3)/Lf zeros(3,3) zeros(3,3)
    eye(3,3)/Lload zeros(3,3) -eye(3)*Rload/Lload];

B = [zeros(3,3)
    eye(3)/Lf
    zeros(3,3)];

C = [eye(9)];

D = [zeros(9,3)];

Ks = 1/3*[-1 0 1;1 -1 0;0 1 -1];

% Written by Jin Woo Jung
% Date: 02/20/05
% ECE743, Simulation Project #2 (Space Vector PWM)


% Matlab program for plotting Simulation Results
% using Simulink
% t = [0:0.01:1]
% Vi = ([500 0 -500]);
% VL = ([250 0 -250]);
% IiABC = ([100 0 -100]);
% ILABC = ([45 0 -45]);
% 
% ViAB = Vi(:,1);
% ViBC = Vi(:,2);
% ViCA = Vi(:,3);
% 
% 
% VLAB= VL(:,1);
% VLBC= VL(:,2);
% VLCA= VL(:,3);
% 
% 
% iiA= IiABC(:,1);
% iiB= IiABC(:,2);
% iiC= IiABC(:,3);
% 
% 
% iLA= ILABC(:,1);
% iLB= ILABC(:,2);
% iLC= ILABC(:,3);
% 
% 
% 
% figure(1) 
% subplot(3,1,1) 
% plot(t,ViAB) 
% axis([0.9 1 -500 500])
% ylabel('V_i_A_B [V]')
% title('Inverter output line to line voltages (V_i_A_B, V_i_B_C, V_i_C_A)')
%  
% grid
% 
% subplot(3,1,2) 
% plot(t,ViBC)
% axis([0.9 1 -500 500])
% ylabel('V_i_B_C [V]') 
% grid
% 
% subplot(3,1,3) 
% plot(t,ViCA) 
% axis([0.9 1 -500 500])
% ylabel('V_i_C_A [V]') 
% xlabel('Time [Sec]') 
% grid
% 
% 
% figure(2) 
% subplot(3,1,1) 
% plot(t,iiA)
% axis([0.9 1 -100 100])
% ylabel('i_i_A [A]')
% title('Inverter output currents (i_i_A, i_i_B, i_i_C)') 
% grid
% 
% subplot(3,1,2) 
% plot(t,iiB)
% axis([0.9 1 -100 100])
% ylabel('i_i_B [A]') 
% grid
% 
% subplot(3,1,3)
%  
% plot(t,iiC)
% axis([0.9 1 -100 100])
% ylabel('i_i_C [A]')
% xlabel('Time [Sec]') 
% grid
% 
% figure(3) 
% subplot(3,1,1) 
% plot(t,VLAB) 
% axis([0.9 1 -400 400])
% ylabel('V_L_A_B [V]')
% title('Load line to line voltages (V_L_A_B, V_L_B_C, V_L_C_A)') 
% grid
% 
% subplot(3,1,2) 
% plot(t,VLBC) 
% axis([0.9 1 -400 400])
% ylabel('V_L_B_C [V]') 
% grid
% 
% subplot(3,1,3) 
% plot(t,VLCA) 
% axis([0.9 1 -400 400])
% ylabel('V_L_C_A [V]') 
% xlabel('Time [Sec]') 
% grid
% 
% figure(4) 
% subplot(3,1,1) 
% plot(t,iLA) 
% axis([0.9 1 -50 50])
%  
% ylabel('i_L_A [A]')
% title('Load phase currents (i_L_A, i_L_B, i_L_C)') 
% grid
% 
% subplot(3,1,2) 
% plot(t,iLB) 
% axis([0.9 1 -50 50])
% ylabel('i_L_B [A]') 
% grid
% 
% subplot(3,1,3) 
% plot(t,iLC) 
% axis([0.9 1 -50 50])
% ylabel('i_L_C [A]')
% xlabel('Time [Sec]') 
% grid
% 
% figure(5) 
% subplot(4,1,1) 
% plot(t,ViAB) 
% axis([0.9 1 -500 500])
% ylabel('V_i_A_B [V]') 
% grid
% 
% subplot(4,1,2)
% plot(t,iiA,'-', t,iiB,'-.',t,iiC,':') 
% axis([0.9 1 -100 100])
% ylabel('i_i_A, i_i_B, i_i_C [A]') 
% legend('i_i_A', 'i_i_B', 'i_i_C') 
% grid
%  
% subplot(4,1,3)
% plot(t,VLAB,'-', t,VLBC,'-.',t,VLCA,':') 
% axis([0.9 1 -400 400])
% ylabel('V_L_A_B, V_L_B_C, V_L_C_A [V]') 
% legend('V_L_A_B', 'V_L_B_C', 'V_L_C_A') 
% grid
% 
% subplot(4,1,4)
% plot(t,iLA,'-', t,iLB,'-.',t,iLC,':') 
% axis([0.9 1 -50 50])
% ylabel('i_L_A, i_L_B, i_L_C [A]') 
% legend('i_L_A', 'i_L_B', 'i_L_C') 
% xlabel('Time [Sec]')
% grid