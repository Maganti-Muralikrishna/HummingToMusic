% Record live audio
fs = 16000; % Sample rate
ch = 1; % Number of channels

recObj = audiorecorder(fs, 16, ch); % Create audiorecorder object with specified sample rate and bits per sample
record(recObj);
pause(5); % Record for 5 seconds
stop(recObj);
y = getaudiodata(recObj);

% Extract pitch information using MATLAB's pitch detection function
f0 = pitch(y, fs);

% Calculate the mean pitch
mean_pitch = mean(f0);

% Plot the time domain graph
figure;
plot(y);
title('Time Domain Graph');
xlabel('Time (samples)');
ylabel('Amplitude');

% Plot the pitch track
figure;
plot(f0);
title('Pitch Track');
xlabel('Time (samples)');
ylabel('Pitch (Hz)');

% Print the mean pitch
disp(['Mean pitch: ', num2str(mean_pitch)]);
