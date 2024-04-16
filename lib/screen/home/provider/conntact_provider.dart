import 'package:contact_app/screen/home/modal/contact_modal.dart';
import 'package:flutter/material.dart';

class ContactProvider with ChangeNotifier
{
    List<ContactModal> ContactList=[];
    int stepIndex=0;

   void addContact(ContactModal m1)
    {
      ContactList.add(m1);
      notifyListeners();
    }

    void stepNext()
    {
      if(stepIndex!=4)
        {
          stepIndex++;
        }
      notifyListeners();
    }
    void stepPrev()
    {
      if(stepIndex!=0)
      {
        stepIndex--;
      }
      notifyListeners();
    }
}