function gaussianPoints2D = gaussianPoints2D(numRows, x0, y0)
    rand_matrix = randn(numRows, 2);
    rand_matrix_x = rand_matrix(:,1);
    rand_matrix_y = rand_matrix(:,2);

    for row = 1:length(rand_matrix_y)
        rand_matrix_y(row) = rand_matrix_y(row)+y0;
    end

    for row = 1:length(rand_matrix_x)
        rand_matrix_x(row) = rand_matrix_x(row)+x0;
    end
    
    gaussianPoints2D = [rand_matrix_x rand_matrix_y];

end