#include "DiffusionSK.h"

//#include "Material.h"

template<>
InputParameters validParams<DiffusionSK>()
{
  InputParameters params = validParams<Kernel>();
/*
  params.addRequiredParam<unsigned int>("component", "An integer corresponding to the direction the variable this kernel acts in. (0 for x, 1 for y, 2 for z)");
  params.addCoupledVar("disp_x", "The x displacement");
  params.addCoupledVar("disp_y", "The y displacement");
  params.addCoupledVar("disp_z", "The z displacement");
  params.addCoupledVar("temp", "The temperature");
  params.addParam<std::string>("appended_property_name", "", "Name appended to material properties to make them unique");

  params.set<bool>("use_displaced_mesh") = true;
*/
  return params;
}


<<<<<<< HEAD
DiffusionSK::DiffusionSK(InputParameters parameters)
=======
DiffusionSK::DiffusionSK(const InputParameters & parameters)
>>>>>>> eb5c587727e6cec7236a570f702dfabe86f4b017
  :Kernel(parameters)
/*   _component(getParam<unsigned int>("component")),
   _xdisp_coupled(isCoupled("disp_x")),
   _ydisp_coupled(isCoupled("disp_y")),
   _zdisp_coupled(isCoupled("disp_z")),
   _temp_coupled(isCoupled("temp")),
   _xdisp_var(_xdisp_coupled ? coupled("disp_x") : 0),
   _ydisp_var(_ydisp_coupled ? coupled("disp_y") : 0),
   _zdisp_var(_zdisp_coupled ? coupled("disp_z") : 0),
   _temp_var(_temp_coupled ? coupled("temp") : 0) */
{}

Real
DiffusionSK::computeQpResidual()
{
  return _grad_test[_i][_qp] * _grad_u[_qp];
}

Real
DiffusionSK::computeQpJacobian()
{
  return  _grad_test[_i][_qp] * _grad_phi[_j][_qp];
}

Real
DiffusionSK::computeQpOffDiagJacobian(unsigned int jvar)
{
/*  unsigned int coupled_component = 0;

  bool active(false);

  if ( _xdisp_coupled && jvar == _xdisp_var )
  {
    coupled_component = 0;
    active = true;
  }
  else if ( _ydisp_coupled && jvar == _ydisp_var )
  {
    coupled_component = 1;
    active = true;
  }
  else if ( _zdisp_coupled && jvar == _zdisp_var )
  {
    coupled_component = 2;
    active = true;
  }

  if ( active )
  {
    return _Jacobian_mult[_qp].stiffness( _component, coupled_component,
                                          _grad_test[_i][_qp], _grad_phi[_j][_qp] );
  }

  if ( _temp_coupled && jvar == _temp_var )
  {
    return _d_stress_dT[_qp].rowDot(_component, _grad_test[_i][_qp]) * _phi[_j][_qp];
  }
*/
  return 0;
}
