addpath('nethelp3')
addpath('netlab3')

load 'sparrows.dat';
load 'sparrows_labels.dat';
sparrows_dataset_dim = size(sparrows);
sparrows_label_dataset_dim = size(sparrows_labels);

% Part#1

% disp(sparrows_dataset_dim)
% disp(sparrows_label_dataset_dim)

dataset =[ -2, 2;
           -4, -4;
            4,  4;
            2, -2;
            0,  0
          ];
% Finding the co-varience of the matrix dataset
covarienced_dataset = cov(dataset);

% Finding the trace of the matrix
trace_dataset = trace(covarienced_dataset);

% Finding eigen value and eigen vector
[corrosponding_eigenvectors, eigenvalues_matrix] = eig(covarienced_dataset);

% Sorting the eigen values for applying PCA
[sorted_eigenvector, Index] = sort(diag(eigenvalues_matrix), 'descend');
sorted_eigenvalues_matrix =  eigenvalues_matrix(Index, Index);

% Sorted eigen vectors for rotation part in PCA
sorted_eigenvectors = corrosponding_eigenvectors(:,Index);

% disp(sorted_eigenvectors)

% Multiplication of the eigen vector and the dataset
matrix_multiplication = dataset * sorted_eigenvectors;

% Verifying trace of covarience of rotated matrix is equal to covarience
% of original data
covarience_of_rotated_matrix = cov(matrix_multiplication);
trace_of_rotated_matrix = trace(covarience_of_rotated_matrix);
% disp(trace_dataset);
% disp(trace_of_rotated_matrix);

% dataset_x = matrix_multiplication(:,1);
% dataset_y = matrix_multiplication(:,2);

% scatter(dataset_x,dataset_y, 'b')

% Part#2

% Normalised the dataset to zero means and unit standard deviation.
normilizing_sparrows = (sparrows - repmat(mean(sparrows), size(sparrows,1), 1)) ./ repmat(var(sparrows), size(sparrows,1), 1);

% Taking the covarience of the normilised matrix
covarienced_normilized_sparrows = cov(normilizing_sparrows);

% Finding the eigen value and the eigen vector of the covarienced
% normilised sparrow dataset
[corrosponding_eigenvector_sparrows, eigenvalue_matrix] = eig(covarienced_normilized_sparrows);

% Sorting the eigen values for applying PCA
[sorted_sparrow_eigenvector, Index] = sort(diag(eigenvalue_matrix), 'desc');
sorted_sparrow_eigenvalues_matrix = eigenvalue_matrix(Index, Index);

% Sorted eigen vectors for rotation part in PCA
sorted_sparrows_eigenvector = corrosponding_eigenvector_sparrows(:,Index);
% disp(sorted_sparrows_eigenvector)

% Multiplication of the eigen vector and the dataset
sparrows_matrix_multiplication = normilizing_sparrows * sorted_sparrows_eigenvector;
% disp(sparrows_matrix_multiplication);

 dataset_i = sparrows_matrix_multiplication(:,1);
 dataset_j = sparrows_matrix_multiplication(:,2);
 dataset_x = sparrows_matrix_multiplication(:,3);
 dataset_y = sparrows_matrix_multiplication(:,4);
 
%  scatter(dataset_i,dataset_j, 'b')
%  hold on
%  scatter(dataset_x,dataset_y, 'k')
%  hold off

% Part#3

% Using randn function to create 50*2 matrix
rand_matrix = randn(50, 2);

rand_matrix_x = rand_matrix(:,1);
rand_matrix_y = rand_matrix(:,2);

for row = 1:length(rand_matrix_y)
    rand_matrix_y(row) = rand_matrix_y(row)+5;
end

for row = 1:length(rand_matrix_x)
    rand_matrix_x(row) = rand_matrix_x(row)+15;
end

% axis([-5 25 -5 25])
% scatter(rand_matrix_x, rand_matrix_y)
returned_matrix = gaussianPoints2D(5, 3, 5);

% Part#4
% Uniform Distributaion 
a = 15; b = 5;
vector_from_uniform_distribution = a.*randn(500,1) + b;

% Gaussian Distribution
vector_from_gaussian_distribution = sqrt(5)*randn(300, 1) + 15;

% Merging two vectors in one
A = vector_from_gaussian_distribution; 
B = vector_from_uniform_distribution;
LenA =length(A);
combine_two_col = zeros(1, LenA+length(B));
combine_two_col(1:2:LenA*2) = A;
combine_two_col(2:2:LenA*2) = B(1:LenA);
combine_two_col(LenA*2+1:end) = B(LenA+1:end);
combine_two_col = combine_two_col.';

second_column = 15.*randn(800,1) + 5;

final_matrix = [combine_two_col second_column];

% final_matrix_x = final_matrix(:,1);
% final_martix_y = final_matrix(:,2);

scatter(final_matrix_x, final_martix_y);




