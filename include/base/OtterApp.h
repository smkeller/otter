#ifndef OTTERAPP_H
#define OTTERAPP_H

#include "MooseApp.h"

class OtterApp;

template<>
InputParameters validParams<OtterApp>();

class OtterApp : public MooseApp
{
public:
  OtterApp(const std::string & name, InputParameters parameters);
  virtual ~OtterApp();

  static void registerApps();
  static void registerObjects(Factory & factory);
  static void associateSyntax(Syntax & syntax, ActionFactory & action_factory);
};

#endif /* OTTERAPP_H */