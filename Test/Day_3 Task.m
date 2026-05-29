%dikshant added this

% Spiral of Circles - All 9 Runs from Table

% Parameters
N = 1000;           % number of iteration
dr = 0.1;           % change in radius
r_max = dr * N;     % for axis scaling
axis_limit = r_max + 2;

% Table of num and den values (from the problem)
num_list = [1, 1, 1, 2, 3, 0.12, 0.128, 1, 1];
den_list = [5, 7, 9, 5, 5, 1, 1, 3.1416, 1.618];

% Run each configuration
for run = 1:length(num_list)
    % Extract current num and den
    num = num_list(run);
    den = den_list(run);
    fr = num / den;

    % Initialize r and phi
    r = dr;
    phi = 0;

    % Create a new figure for each run
    figure('Name', sprintf('Run %d - num = %.4f, den = %.4f, fr = %.4f', ...
        run, num, den, fr));
    
    % Set fixed axes
    axis equal;
    axis([-axis_limit axis_limit -axis_limit axis_limit]);
    hold on;
    title(sprintf('Run %d: num = %.4f, den = %.4f, fr = %.4f', ...
        run, num, den, fr));
    xlabel('Re(z)');
    ylabel('Im(z)');

    % Plot the spiral
    for k = 1:N
        z = r * exp(1j * phi);
        plot(real(z), imag(z), 'or');
        pause(0.01);      % Optional: comment this out for faster runs
        r = r + dr;
        phi = phi + fr * 2 * pi;
    end
end
