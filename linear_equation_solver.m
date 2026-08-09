function linear_equation_solver

    % Create the main window
    fig = uifigure('Name', 'Linear Equation Solver', ...
                   'Position', [500 250 500 500]);

    % Title
    uilabel(fig, ...
        'Text', '2 × 2 Linear Equation Solver', ...
        'Position', [120 440 300 30], ...
        'FontSize', 20, ...
        'FontWeight', 'bold');

    % Instructions
    uilabel(fig, ...
        'Text', 'Enter coefficients for:', ...
        'Position', [150 405 220 25], ...
        'FontSize', 14);

    uilabel(fig, ...
        'Text', 'a₁x + b₁y = c₁', ...
        'Position', [180 375 150 25], ...
        'FontSize', 14);

    uilabel(fig, ...
        'Text', 'a₂x + b₂y = c₂', ...
        'Position', [180 345 150 25], ...
        'FontSize', 14);


    % Labels for first equation
    uilabel(fig, 'Text', 'a₁', ...
        'Position', [80 290 30 22]);

    uilabel(fig, 'Text', 'b₁', ...
        'Position', [200 290 30 22]);

    uilabel(fig, 'Text', 'c₁', ...
        'Position', [320 290 30 22]);


    % Input fields for first equation
    a1 = uieditfield(fig, 'numeric', ...
        'Position', [60 255 80 30], ...
        'Value', 2);

    b1 = uieditfield(fig, 'numeric', ...
        'Position', [180 255 80 30], ...
        'Value', 3);

    c1 = uieditfield(fig, 'numeric', ...
        'Position', [300 255 80 30], ...
        'Value', 8);


    % Labels for second equation
    uilabel(fig, 'Text', 'a₂', ...
        'Position', [80 215 30 22]);

    uilabel(fig, 'Text', 'b₂', ...
        'Position', [200 215 30 22]);

    uilabel(fig, 'Text', 'c₂', ...
        'Position', [320 215 30 22]);


    % Input fields for second equation
    a2 = uieditfield(fig, 'numeric', ...
        'Position', [60 180 80 30], ...
        'Value', 4);

    b2 = uieditfield(fig, 'numeric', ...
        'Position', [180 180 80 30], ...
        'Value', -1);

    c2 = uieditfield(fig, 'numeric', ...
        'Position', [300 180 80 30], ...
        'Value', 2);


    % Solve button
    uibutton(fig, 'push', ...
        'Text', 'Solve', ...
        'Position', [180 125 140 40], ...
        'FontSize', 15, ...
        'ButtonPushedFcn', @solveEquation);


    % Clear button
    uibutton(fig, 'push', ...
        'Text', 'Clear', ...
        'Position', [180 75 140 35], ...
        'ButtonPushedFcn', @clearFields);


    % Result label
    result = uilabel(fig, ...
        'Text', 'Enter values and click Solve.', ...
        'Position', [80 25 350 35], ...
        'FontSize', 14, ...
        'HorizontalAlignment', 'center');


    % Function to solve equations
    function solveEquation(~, ~)

        % Create coefficient matrix
        A = [a1.Value b1.Value;
             a2.Value b2.Value];

        % Create constant matrix
        B = [c1.Value;
             c2.Value];

        % Check if the system has a unique solution
        if det(A) == 0

            result.Text = 'No unique solution exists.';

        else

            % Solve AX = B
            X = A \ B;

            % Display solution
            result.Text = sprintf('x = %.4f     y = %.4f', ...
                                  X(1), X(2));

        end
    end


    % Function to clear all fields
    function clearFields(~, ~)

        a1.Value = 0;
        b1.Value = 0;
        c1.Value = 0;

        a2.Value = 0;
        b2.Value = 0;
        c2.Value = 0;

        result.Text = 'Enter values and click Solve.';

    end

end
