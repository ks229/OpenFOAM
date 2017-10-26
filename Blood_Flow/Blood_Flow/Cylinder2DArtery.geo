Point(1) = {0, 0, 0, 1.0};
Point(2) = {0.015, 0, 0, 1.0};
Point(3) = {0, 0.015, 0, 1.0};
Point(4) = {-0.015, 0, 0, 1.0};
Point(5) = {0, -0.015, 0, 1.0};

Circle(1) = {2, 1, 3};
Circle(2) = {3, 1, 4};
Circle(3) = {4, 1, 5};
Circle(4) = {5, 1, 2};

Line(5) = {1, 2};
Line(6) = {1, 3};
Line(7) = {1, 4};
Line(8) = {1, 5};



Transfinite Line {1} = 10 Using Progression 1;
Transfinite Line {2} = 10 Using Progression 1;
Transfinite Line {3} = 10 Using Progression 1;
Transfinite Line {4} = 10 Using Progression 1;


Transfinite Line {5} = 10 Using Progression 1;
Transfinite Line {6} = 10 Using Progression 1;
Transfinite Line {7} = 10 Using Progression 1;
Transfinite Line {8} = 10 Using Progression 1;

Line Loop(9) = {5, 1, -6};
Plane Surface(10) = {9};
Line Loop(11) = {6, 2, -7};
Plane Surface(12) = {11};
Line Loop(13) = {7, 3, -8};
Plane Surface(14) = {13};
Line Loop(15) = {8, 4, -5};
Plane Surface(16) = {15};


Transfinite Surface {10};
Transfinite Surface {12};
Transfinite Surface {14};
Transfinite Surface {16};


Recombine Surface {10};
Recombine Surface {12};
Recombine Surface {14};
Recombine Surface {16};



Extrude {0, 0, 0.75} {
  Surface{10};
  Layers{225};
Recombine;
}
Extrude {0, 0, 0.75} {
  Surface{12};
  Layers{225};
Recombine;
}
Extrude {0, 0, 0.75} {
  Surface{14};
  Layers{225};
Recombine;
}
Extrude {0, 0, 0.75} {
  Surface{16};
  Layers{225};
Recombine;
}
Physical Surface("Inlet") = {33, 50, 67, 84};

Physical Surface("Outlet") = {14, 12, 10, 16};

Physical Surface("Wall") = {62, 45, 28, 79};

Physical Volume("Fluid") = {3, 2, 1, 4};
