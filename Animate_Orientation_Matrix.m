function Animate_Orientation_Matrix(O_matrix, pause_time)

O_DA = O_matrix;

quiver3(0,0,0, O_DA(1,1), O_DA(2,1),O_DA(3,1),'r')
hold on
quiver3(0,0,0, O_DA(1,2), O_DA(2,2),O_DA(3,2),'g')
quiver3(0,0,0, O_DA(1,3), O_DA(2,3),O_DA(3,3),'b')
view(135,45)
hold off
axis([-1 1 -1 1 -1 1])
axis square
pause(pause_time)
