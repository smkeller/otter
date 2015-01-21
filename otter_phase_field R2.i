[Mesh]
  # uniform_refine = 2
  type = GeneratedMesh
  dim = 2
  nx = 60
  ny = 60
  nz = 0
  xmax = 100
  ymax = 100
  zmax = 0
  elem_type = QUAD4
[]

[Variables]
  [./c]
    order = THIRD
    family = HERMITE
    [./InitialCondition]
      min = -.1
      max = .1
      variable = c
      type = RandomIC
    [../]
  [../]
[]

[Kernels]
  [./td_c]
    type = TimeDerivative
    variable = c
  [../]
  [./CHinterface]
    type = CHInterface
    variable = c
    mob_name = M
    kappa_name = kappa_c
    grad_mob_name = grad_M
  [../]
  [./CHBulk]
    type = CHMath
    variable = c
    mob_name = M
  [../]
[]

[BCs]
  [./Periodic]
    [./all]
      auto_direction = 'x y'
    [../]
  [../]
[]

[Materials]
  [./constant]
    type = PFMobility
    block = 0
    mob = 1.0
    kappa = .5
  [../]
[]

[Postprocessors]
  [./c_left]
    type = SideIntegralVariablePostprocessor
    variable = c
    boundary = left
  [../]
  [./c_top]
    type = SideIntegralVariablePostprocessor
    variable = c
    boundary = top
  [../]
[]

[Preconditioning]
  [./precon]
    type = SBP
    pc_side = left
  [../]
[]

[Executioner]
  # Preconditioned JFNK (default)
  # num_steps = 2
  type = Transient
  scheme = bdf2
  solve_type = PJFNK
  petsc_options_iname = '-pc_type -pc_hypre_type -ksp_gmres_restart'
  petsc_options_value = 'hypre boomeramg 31'
  l_max_its = 15
  l_tol = 1.e-4
  nl_rel_tol = 1.0e-9
  nl_max_its = 10
  start_time = 0.0
  dt = 1.0
  end_time = 8.
[]

[Outputs]
  # console = true
  file_base = box
  output_initial = true
  exodus = true
  print_linear_residuals = true
  print_perf_log = true
  [./console]
    type = Console
    perf_header = true
  [../]
[]

