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
[]

[Outputs]
  # console = true
  file_base = box
  output_initial = true
  exodus = true
  [./console]
    type = Console
    perf_log = true
    linear_residuals = true
    perf_header = true
  [../]
[]

