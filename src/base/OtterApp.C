#include "OtterApp.h"
#include "Moose.h"
#include "AppFactory.h"

template<>
InputParameters validParams<OtterApp>()
{
  InputParameters params = validParams<MooseApp>();
  return params;
}

OtterApp::OtterApp(const std::string & name, InputParameters parameters) :
    MooseApp(name, parameters)
{
  srand(libMesh::processor_id());
  
  Moose::registerObjects(_factory);
  OtterApp::registerObjects(_factory);

  Moose::associateSyntax(_syntax, _action_factory);
  OtterApp::associateSyntax(_syntax, _action_factory);
}

OtterApp::~OtterApp()
{
}

void
OtterApp::registerApps()
{
  registerApp(OtterApp);
}

void
OtterApp::registerObjects(Factory & factory)
{
}

void
OtterApp::associateSyntax(Syntax & syntax, ActionFactory & action_factory)
{
}
