/***************************************************************
* Copyright notice
*
* (c) 2011-2014 Chi Hoang (info@chihoang.de)
*  All rights reserved
*
***************************************************************/

#ifndef _MAEMOMM_EXAMPLEWINDOW_H
#define _MAEMOMM_EXAMPLEWINDOW_H

#include <hildonmm/window.h>
#include <hildonmm/button.h>
#include <hildonmm/note.h>
#include <gtkmm/buttonbox.h>

class ExampleWindow : public Hildon::Window
{
public:
  ExampleWindow();
  virtual ~ExampleWindow();

private:
  // Signal handlers:
  void on_button1();
  void on_button2();
  void on_button3();
  void on_button4();

  // Child widgets:
  Gtk::HButtonBox box_;
  Hildon::Button button_1;
  Hildon::Button button_2;
  Hildon::Button button_3;
  Hildon::Button button_4;

  // Other variables:
  int type_;
};

#endif /* _MAEMOMM_EXAMPLEWINDOW_H */
