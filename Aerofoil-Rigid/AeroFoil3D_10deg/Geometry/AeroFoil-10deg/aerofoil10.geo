// NACA5012 Aerofoil Shape and Spline fit

//Suction Side Points define a different characteristic length for suction side and pressure side
ss_lc = 0.005;
Point(1000) = { 0.99591000, 0.00228000, 0.00000000, ss_lc};
 Point(1001) = { 0.98332000, 0.00530000, 0.00000000, ss_lc};
 Point(1002) = { 0.96256000, 0.01018000, 0.00000000, ss_lc};
 Point(1003) = { 0.93397000, 0.01672000, 0.00000000, ss_lc};
 Point(1004) = { 0.89801000, 0.02463000, 0.00000000, ss_lc};
 Point(1005) = { 0.85526000, 0.03361000, 0.00000000, ss_lc};
 Point(1006) = { 0.80644000, 0.04331000, 0.00000000, ss_lc};
 Point(1007) = { 0.75236000, 0.05339000, 0.00000000, ss_lc};
 Point(1008) = { 0.69393000, 0.06349000, 0.00000000, ss_lc};
 Point(1009) = { 0.63212000, 0.07325000, 0.00000000, ss_lc};
 Point(1010) = { 0.56799000, 0.08233000, 0.00000000, ss_lc};
 Point(1011) = { 0.50264000, 0.09037000, 0.00000000, ss_lc};
 Point(1012) = { 0.43719000, 0.09706000, 0.00000000, ss_lc};
 Point(1013) = { 0.37278000, 0.10208000, 0.00000000, ss_lc};
 Point(1014) = { 0.31051000, 0.10521000, 0.00000000, ss_lc};
 Point(1015) = { 0.25148000, 0.10627000, 0.00000000, ss_lc};
 Point(1016) = { 0.19674000, 0.10519000, 0.00000000, ss_lc};
 Point(1017) = { 0.14722000, 0.10201000, 0.00000000, ss_lc};
 Point(1018) = { 0.10381000, 0.09684000, 0.00000000, ss_lc};
 Point(1019) = { 0.06726000, 0.08992000, 0.00000000, ss_lc};
 Point(1020) = { 0.03818000, 0.08151000, 0.00000000, ss_lc};
 Point(1021) = { 0.01707000, 0.07189000, 0.00000000, ss_lc};

// This is the leading edge
Point(1022) = { 0.00000000, 0.05000000, 0.00000000, ss_lc};

//Pressure Side
ps_lc = 0.005;
 Point(1023) = { 0.01700000, 0.02808000, 0.00000000, ps_lc};
 Point(1024) = { 0.03794000, 0.01835000, 0.00000000, ps_lc};
 Point(1025) = { 0.06672000, 0.00963000, 0.00000000, ps_lc};
 Point(1026) = { 0.10283000, 0.00209000, 0.00000000, ps_lc};
 Point(1027) = { 0.14567000, -0.00415000, 0.00000000, ps_lc};
 Point(1028) = { 0.19450000, -0.00902000, 0.00000000, ps_lc};
 Point(1029) = { 0.24852000, -0.01252000, 0.00000000, ps_lc};
 Point(1030) = { 0.30681000, -0.01473000, 0.00000000, ps_lc};
 Point(1031) = { 0.36841000, -0.01581000, 0.00000000, ps_lc};
 Point(1032) = { 0.43228000, -0.01596000, 0.00000000, ps_lc};
 Point(1033) = { 0.49736000, -0.01537000, 0.00000000, ps_lc};
 Point(1034) = { 0.56253000, -0.01428000, 0.00000000, ps_lc};
 Point(1035) = { 0.62670000, -0.01287000, 0.00000000, ps_lc};
 Point(1036) = { 0.68876000, -0.01128000, 0.00000000, ps_lc};
 Point(1037) = { 0.74764000, -0.00964000, 0.00000000, ps_lc};
 Point(1038) = { 0.80232000, -0.00801000, 0.00000000, ps_lc};
 Point(1039) = { 0.85184000, -0.00646000, 0.00000000, ps_lc};
 Point(1040) = { 0.89535000, -0.00503000, 0.00000000, ps_lc};
 Point(1041) = { 0.93206000, -0.00377000, 0.00000000, ps_lc};
 Point(1042) = { 0.96132000, -0.00271000, 0.00000000, ps_lc};
 Point(1043) = { 0.98261000, -0.00192000, 0.00000000, ps_lc};
 Point(1044) = { 0.99554000, -0.00142000, 0.00000000, ps_lc};
 Point(1045) = { 0.99987000, -0.00125000, 0.00000000, ps_lc};

// NACA aerofoils have the trailing edge undefined - so we make one up
Point(1046) = { 1.005, -0.0005, 0.00000000, ps_lc};

// Put a Spline fit through the appropriate points - note that we could 
// also use BSpline but you end up with a different shape 
Spline(1000) = {1000:1046,1000};

// This results in a spline that represents a NACA5012 aerofoil, it is not
// the best representation as the point density around the leading edge especially
// is a bit rough but it is good enough to be going on with

// Now add in points to max a box. 
edge_lc = 0.2;

Point(1100) = { 10, 4, 0, edge_lc};
Point(1101) = { 10, -4, 0, edge_lc};
Point(1102) = { -5, -4, 0, edge_lc};
Point(1103) = { -5, 4, 0, edge_lc};

Line(1) = {1100,1101};
Line(2) = {1101,1102};
Line(3) = {1102,1103};
Line(4) = {1103,1100};

//Having defined all the lines used for the geometry Spline(1000) is the aerofoil and
// Line(1) to Line(4) are the edges we now tell gmsh how they are related

// Create a boundary
Line Loop (1) = {1,2,3,4};
// Tell gmsh the Spline should also be a line loop
Line Loop (2) = {1000};
// Combine the two into a surface, gmsh makes a hole automagically
Plane Surface(1) = {1,2};


// We need to extrude the surface so that the mesh is 3D for OpenFOAM

Extrude {0, 0, 1} {
  Surface{1};
  Layers{1};
  Recombine;
}
Physical Surface("back") = {1027};
Physical Surface("front") = {1};
Physical Surface("top") = {1022};
Physical Surface("outlet") = {1010};
Physical Surface("bottom") = {1014};
Physical Surface("inlet") = {1018};
Physical Surface("aerofoil") = {1026};
Physical Volume("internal") = {1};





Rotate {{0, 0, 1}, {0, 0, 0}, -Pi/36} {
  Surface{1026};
}
