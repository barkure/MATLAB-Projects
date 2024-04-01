timestamps = [6, 8, 10, 12, 14, 16, 18];  % 时间点
indoor_temperatures = [18.0, 20.0, 22.0, 25.0, 30.0, 28.0, 24.0];  % 室内温度
outdoor_temperatures = [15.0, 19.0, 24.0, 28.0, 34.0, 32.0, 30.0];  % 室外温度

% 计算6:30~17:30之间每隔2小时的温度值
new_timestamps = 6.5:2:17.5;
estimated_indoor_temperatures = interp1(timestamps, indoor_temperatures, new_timestamps, 'spline');
estimated_outdoor_temperatures = interp1(timestamps, outdoor_temperatures, new_timestamps, 'spline');

% 显示结果
for i = 1:length(new_timestamps)
    fprintf('时间：%.1f，室内温度：%.2fºC，室外温度：%.2fºC\n', new_timestamps(i), estimated_indoor_temperatures(i), estimated_outdoor_temperatures(i));
end