/***************************************************************
* Copyright notice
*
* (c) 2011-2014 Chi Hoang (info@chihoang.de)
*  All rights reserved
*
***************************************************************/

#include <hildonmm.h>
#include "examplewindow.h"

int main(int argc, char *argv[])
{
  // Initialize gtkmm and maemomm:
  Gtk::Main kit(&argc, &argv);
  Hildon::init();

  // Create Window and set it to Program 
  ExampleWindow window;
  Hildon::Program::get_instance()->add_window(window);

  // Begin the main application
  kit.run(window);
  
  return 0;
}
