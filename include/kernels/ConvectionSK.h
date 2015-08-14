#ifndef CONVECTION_SK_H
#define CONVECTION_SK_H

#include "Kernel.h"

//Forward Declarations
class ConvectionSK;

template<>
InputParameters validParams<ConvectionSK>();

class ConvectionSK : public Kernel
{
public:
  ConvectionSK(InputParameters parameters);
protected:
  virtual Real computeQpResidual();

  virtual Real computeQpJacobian();

  virtual Real computeQpOffDiagJacobian(unsigned int jvar);

/*  MaterialProperty<SymmTensor> & _stress;
  MaterialProperty<SymmElasticityTensor> & _Jacobian_mult;
  MaterialProperty<SymmTensor> & _d_stress_dT; */

private:
  VariableGradient & _grad_var;
/*
  const unsigned int _component;
// These are new model (field) variables to be solved for
  const bool _xdisp_coupled;
  const bool _ydisp_coupled;
  const bool _zdisp_coupled;
  const bool _temp_coupled;
// These paired uint's are to index the variables with the system so they can be identified elsewhere
  const unsigned int _xdisp_var;
  const unsigned int _ydisp_var;
  const unsigned int _zdisp_var;
  const unsigned int _temp_var; */
};
#endif /* CONVECTION_SK_H */