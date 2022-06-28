[Mesh]
  type = GeneratedMesh #generates simple lines/rectangles/rectangular prisms
  dim = 2 #dimension
  nx = 100 #elements in x direction
  ny = 10 #elements in y direction
  xmax = 0.304 #length  of test chamber
  ymax = 0.0257 #Test chamber radius
[]

[Problem]
  type = FEProblem #normal finite element problem
  coord_type = RZ #Axisymmetric RZ
  rz_coord_axis = X #axis of symmetry
[]

[Variables]
  [pressure]
   #By default adds linear lagrange variable
  []
[]

[Kernels]
  [diffusion]
    type = DarcyPressure #Zero-Gravity, divergence-free form of Darcy's law
    variable = pressure #this variable is defined above
  []
[]

[BCs]
  [inlet]
    type = ADDirichletBC # adding dirichlet boundary condition, u=value
    variable = pressure #variable set with boundary condition
    boundary = left #Name of a sideset in the mesh (How do you know??)
    value = 4000 # (Pa), given from the paper
  []
  [outlet]
    type=ADDirichletBC
    variable = pressure #Variable to be set
    boundary = right
    value = 0 #Pa
  []
[]
[Executioner]
  type = Steady #steady-state problem
  solve_type = NEWTON #perform newton solve
  # set PETSc parameters to optimize solver efficiency
  petsc_options_iname = '-pc_type -pc_hypre_type'
  petsc_options_value = ' hypre    boomeramg'
[]

[Outputs]
  exodus = true #Output exodus format
[] 
