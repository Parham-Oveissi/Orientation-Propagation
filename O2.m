function O_matrix = O2(theta)
O_matrix = [cosd(theta) 0 -sind(theta); 0 1 0; sind(theta) 0 cosd(theta)];