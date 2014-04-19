# [Kernels]
# [./CHbulk]
# type = CHMath
# variable = c
# mob_name = M
# block = 0
# [../]
# [./CHinterface]
# type = CHInterface
# variable = c
# mob_name = M
# kappa_name = kapp_c
# grad_mob_name = grad_M
# block = 0
# [../]
# [./td_c]
# type = TimeDerivative
# variable = c
# [../]
# []

[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 4
  ny = 4
  xmax = 100
  ymax = 100
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
  [./ie_c]
    type = TimeDerivative
    variable = c
  [../]
  [./CHSolid]
    type = CHMath
    variable = c
    mob_name = M
  [../]
  [./CHInterface]
    type = CHInterface
    variable = c
    kappa_name = kappa_c
    mob_name = M
    grad_mob_name = grad_M
  [../]
[]

[Materials]
  [./pf_mob]
    type = PFMobility
    block = 0
    mob = 1
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

[Executioner]
  type = Transient
  scheme = bdf2
  solve_type = PJFNK
  dt = 2.
  petsc_options_iname = '-pc_type -pc_hypre_type -ksp_gmres_restart'
  petsc_options_value = 'hypre boomeramg 31'
  l_max_its = 15
  l_tol = 1.0e-4
  nl_rel_tol = 1.0e-9
  nl_max_its = 20
  end_time = 8.
[]

[Outputs]
  output_initial = true
  exodus = true
  linear_residuals = true
  perf_log = true
[]

