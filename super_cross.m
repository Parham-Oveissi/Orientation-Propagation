function matrix_out = super_cross(vector_in)

matrix_out = [0 -vector_in(3) vector_in(2); vector_in(3) 0 -vector_in(1); -vector_in(2) vector_in(1) 0];