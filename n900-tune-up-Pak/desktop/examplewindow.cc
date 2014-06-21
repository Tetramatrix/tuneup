/***************************************************************
* Copyright notice
*
* (c) 2011-2014 Chi Hoang (info@chihoang.de)
*  All rights reserved
*
***************************************************************/

#include "examplewindow.h"
#include <gtkmm.h>
#include <hildonmm/note.h>
#include <iostream>

ExampleWindow::ExampleWindow() :
  button_1( Gtk::Hildon::SIZE_FINGER_HEIGHT | Gtk::Hildon::SIZE_FINGER_HEIGHT,
    Hildon::BUTTON_ARRANGEMENT_VERTICAL,
    "About",
    ""),
 button_2(Gtk::Hildon::SIZE_FINGER_HEIGHT | Gtk::Hildon::SIZE_FINGER_HEIGHT,
    Hildon::BUTTON_ARRANGEMENT_VERTICAL,
    "Install Libs",
    ""),
 button_3(Gtk::Hildon::SIZE_FINGER_HEIGHT | Gtk::Hildon::SIZE_FINGER_HEIGHT,
    Hildon::BUTTON_ARRANGEMENT_VERTICAL,
    "Partition SD-Card",
    ""),
 button_4(Gtk::Hildon::SIZE_FINGER_HEIGHT | Gtk::Hildon::SIZE_FINGER_HEIGHT,
    Hildon::BUTTON_ARRANGEMENT_VERTICAL,
    "Deinstall",
    ""),
  type_(1)
{    
  set_title("Tune-Up Utilities");
  
  // Attach the callback functions to the clicked signal.
  button_1.signal_clicked().connect(
    sigc::mem_fun(*this, &ExampleWindow::on_button1));
  
  button_2.signal_clicked().connect(
    sigc::mem_fun(*this, &ExampleWindow::on_button2));

  button_3.signal_clicked().connect(
    sigc::mem_fun(*this, &ExampleWindow::on_button3));

  button_4.signal_clicked().connect(
    sigc::mem_fun(*this, &ExampleWindow::on_button4));

  box_.pack_start(button_1);
  box_.pack_start(button_2);
  box_.pack_start(button_3);
  box_.pack_start(button_4);

  add(box_);
  
  // Make all widgets visible.
  show_all_children();
}


ExampleWindow::~ExampleWindow()
{
}

void ExampleWindow::on_button1()
{
      Hildon::Note note(Hildon::NOTE_TYPE_INFORMATION,
        "2011 (c) Chi Hoang / www.chihoang.de / info@chihoang.de");
      note.run();
}

void ExampleWindow::on_button2()
{ 
      Hildon::Note note(Hildon::NOTE_TYPE_CONFIRMATION_BUTTON, *this,
        "Do you agree?");
      note.add_button(Gtk::Stock::YES, Gtk::RESPONSE_YES);
      note.add_button(Gtk::Stock::NO, Gtk::RESPONSE_NO);
      gint response = note.run();
      switch (response) {
      case Gtk::RESPONSE_YES:
            system("sudo /opt/n900-tune-up/install.sh");
      break;
      }
}

void ExampleWindow::on_button3()
{
      Hildon::Note note(Hildon::NOTE_TYPE_CONFIRMATION_BUTTON, *this,
        "Do you agree?");
      note.add_button(Gtk::Stock::YES, Gtk::RESPONSE_YES);
      note.add_button(Gtk::Stock::NO, Gtk::RESPONSE_NO);
      gint response = note.run();
      switch (response) {
      case Gtk::RESPONSE_YES:
          system("sudo /opt/n900-tune-up/swapinst.sh");
      break;
      }
}

void ExampleWindow::on_button4()
{ 
      Hildon::Note note(Hildon::NOTE_TYPE_CONFIRMATION_BUTTON, *this,
        "Do you agree?");
      note.add_button(Gtk::Stock::YES, Gtk::RESPONSE_YES);
      note.add_button(Gtk::Stock::NO, Gtk::RESPONSE_NO);
      gint response = note.run();
      switch (response) {
      case Gtk::RESPONSE_YES:
           system("sudo /opt/n900-tune-up/deinstall.sh");
      break;
      }
}
