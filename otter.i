[Mesh]
//  file = mug.e
  file = PhaseFieldMesh.msh
[]

[Variables]
  active = 'diffused temp'

  [./diffused]
    order = FIRST
    family = LAGRANGE
  [../]
  [./temp]
    order = FIRST
    family = LAGRANGE
  [../]
[]

[Kernels]
  active = 'diff_diffusion diff_temp conv_temp'

  [./diff_diffusion]
    type = DiffusionSK
    variable = diffused
  [../]
  [./diff_temp]
    type=DiffusionSK
    variable=temp
  [../]
  [./conv_temp]
    type=ConvectionSK
    grad_velocity=temp
    variable=diffused
  [../]
  
[]

[BCs]
  active = 'bottom_conv bottom_diff top_conv top_diff'

  [./bottom_diff]
    type = DirichletBC
    variable = diffused
    boundary = 'bottom'
    value = 1
  [../]

  [./top_diff]
    type = DirichletBC
    variable = diffused
    boundary = 'top'
    value = 0
  [../]
  [./bottom_conv]
    type = DirichletBC
    variable = temp
    boundary = 'bottom'
    value = 2
  [../]

  [./top_conv]
    type = DirichletBC
    variable = temp
    boundary = 'top'
    value = 0
  [../]
[]

[Executioner]
  type = Steady

  #Preconditioned JFNK (default)
  solve_type = 'PJFNK'
  petsc_options_iname = '-pc_type -pc_hypre_type'
  petsc_options_value = 'hypre    boomeramg'


[]

[Outputs]
  file_base = out
  exodus = true
  [./console]
    type = Console
    perf_log = true
    linear_residuals = true
  [../]
[]
