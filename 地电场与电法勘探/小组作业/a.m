% Define parameters
resistivity_layer1 = 1;  % Resistivity of the first layer
resistivity_layer2 = 2;  % Resistivity of the second layer
thickness_layer1 = 100;  % Thickness of the first layer (in arbitrary units)
thickness_layer2 = 200;  % Thickness of the second layer (in arbitrary units)
excitation_field = 1;    % Amplitude of the excitation field

% Define grid parameters
num_points_layer1 = 100;  % Number of grid points in the first layer
num_points_layer2 = 200;  % Number of grid points in the second layer
total_points = num_points_layer1 + num_points_layer2 + 1;  % Total number of grid points

% Initialize resistivity vector
resistivity = ones(total_points, 1);
resistivity(1:num_points_layer1) = resistivity_layer1;
resistivity(num_points_layer1+1:end) = resistivity_layer2;

% Initialize electric field vector
electric_field = zeros(total_points, 1);
electric_field(end) = excitation_field;  % Apply excitation field at the top interface of the second layer

% Solve electrical field equations
for i = 2:total_points
    delta_x = thickness_layer1/num_points_layer1;
    electric_field(i) = electric_field(i-1) + (delta_x / resistivity(i-1)) * electric_field(i-1);
end

% Calculate induced currents
induced_currents = electric_field(1:end-1) - electric_field(2:end);

% Analyze polarizability
polarizability = sum(induced_currents);

% Display results
disp("Polarizability observed at the second top interface: " + polarizability);