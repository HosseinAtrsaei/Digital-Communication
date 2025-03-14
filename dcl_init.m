%% In the Name of Allah
% Digital Communication Initialization

%% Simulation Parameters
flg_hrdwr_usg = 0;
stop_time = 100;
%% Receiver Parameters
fs = 10e6;                      % Baseband Sampling Rate (65105 to 61.44e6 Hz)
ts = 1/fs;                      % Baseband Sampling Time
pkt_size = 1e3;                 % Number of Symbol in Each Packet
rx_alg = 1;                     % Receiver Detection Algorithm
cmpnst_mode = 3;                % Compensation Mode (0: No Compensation, 1: Amplitude Compensation, 2: Phase Compensation, 3: Compensation) 
delay_cmpnst = 0;               % Delay Compensation
rx_mode = "correlator";
%% Modulation Parameters
modulation = 'qam';             % Modulation Name ('psk', 'pam', 'qam', 'fsk')
modulation_type = 'conv';       % modulation_type ('conv', 'kron)
k = 4;                          % Bit Per Symbol
M = 2^k;                        % Modulation Order

smpl_per_symbl = 8;            % Sample Per Symbol
Ts = smpl_per_symbl*ts;         % Symbol Time

flg_gray_encode = 1;            % Gray Code Usage Flag
mod_det_opt = 'noncoherent';    % Modulation Detection Option ('coherent', 'noncoherent')

% Pulse Shape Parameters
pulse_name = 'rectangular';      % Name of Pulse Shaping Function
beta = 0.9;                     % Parameter for RC, RRC and Gaussian Pulse Shape
span_in_symbl = 6;              % Trunctation Length for RC, RRC and Gaussian Pulse Shape (Multiple of Symbol Time)

% Header Option
flg_add_hdr = 1;                % Flag For Having Packets with Header

% SNR Bound for BER Plots
snr_min = 0;				  	% Minimum SNR (dB)
snr_max = 10;				  	% Maximum SNR (dB)
snr_step = 1;		        	% SNR Step (dB)
snr_db = snr_min:snr_step:snr_max-snr_step;  % SNR Vector (dB)

%% Channel Parameters
delay = 0.5;
chnl_delay_in_smpl = ceil(delay*smpl_per_symbl);         % Channel Delay in Sample
chnl_phase_offset = 0 * pi/180; % Channel Phase Offset
chnl_freq_offset = 0;           % Channel Frequency Offset

%% Plot Parameters
% constellation_plot = 1;
% eye_diagram = 1;

% % Hardware Parameters
% Transmitter Parameters
% num_tx_smpl = smpl_per_symbl*pkt_size;
% tx_fc = 2400e6;                 % Set Transmiter Center Frequency (AD9363: 325-3800MHz) (AD9364: 70-6000MHz)
% tx_gain = 0;                    % Set Transmiter Attenutaion As a Negative Gain (-89.75 to 0 dB)
% tx_address = 'usb:0';           % Set Transmiter Identification Number
% 
% Receiver Parameters
% rx_fc = 2400e6;                 % Set Receiver Center Frequency (AD9363: 325-3800MHz) (AD9364: 70-6000MHz)
% rx_gain = 30;                   % Set Receiver Gain (-4dB to 71dB)
% rx_address = 'usb:0';           % Set Receiver Identification Number
% 
% % Initialize ADALM-PLUTO
% if flg_hrdwr_usg
%     dev = sdrdev('Pluto');          % Create Radio Object for ADALM-PLUTO
% %     setupSession(dev)
%     % configurePlutoRadio('AD9363');  % Configure ADALM-PLUTO Radio Firmware    
% end
% 
% ed = comm.EyeDiagram('DisplayMode','2D color histogram', ...
%                           'OversamplingMethod','Input interpolation');
%                       
%                       % Send Data By Transmitter
% if flg_hrdwr_usg
%     % Define Transmitter Object
%     tx = sdrtx('Pluto', 'RadioID' ,tx_address);   % Create Transmitter System Object
%     tx.CenterFrequency = tx_fc;                   % Set Transmiter Center Frequency (Hz)
%     tx.Gain = tx_gain;                            % Set Tranmiter Attenutaion As a Negative Gain (-89.75 to 0 dB)
%     tx.BasebandSampleRate = fs;                   % Set Baseband Sampling Rate (65105 to 61.44e6 Hz)
%     tx.ShowAdvancedProperties = true;
%     % tx.BISTLoopbackMode = 'Digital Tx -> Digital Rx';
%     
% 
% end
% 
%     
% % Receive Radio Signal Using ADALM-PLUTO
% if flg_hrdwr_usg
%     Define Receiver Object
%     rx = sdrrx('Pluto','RadioID',rx_address);     % Create Receiver System Object
%     rx.CenterFrequency = rx_fc;                   % Set Receiver Center Frequency (70.0e6 to 6.0e9 Hz)
%     rx.BasebandSampleRate = fs;                   % Set Baseband Sampling Rate (65105 to 61.44e6 Hz)
%     rx.SamplesPerFrame = num_tx_smpl*2;           % Samples Per Each Receiving Frame
%     rx.GainSource = 'Manual';                     % AGC Settings
%     rx.Gain = rx_gain;                            % Receiver Gain (-4dB to 71dB)
%     rx.OutputDataType = 'double';                 % Output Data Type
%     rx.ShowAdvancedProperties = true;
%     rx.EnableRFDCCorrection = true;
%     rx.EnableBasebandDCCorrection = false;
%     rx.BISTLoopbackMode = 'Digital Tx -> Digital Rx';
% end
