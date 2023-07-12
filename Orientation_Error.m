function error = Orientation_Error(O_matrix1, O_Matrix2)
error = trace(O_matrix1 * transpose(O_Matrix2) - eye(3));