import 'dart:io';

import 'package:contact_app/screen/home/modal/contact_modal.dart';
import 'package:contact_app/screen/home/provider/conntact_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtxNo = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  String? path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Contact",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Form(
        key: formkey,
        child: Consumer<ContactProvider>(
          builder: (context, value, child) => Stepper(
            connectorColor: MaterialStateProperty.all(
                MediaQuery.of(context).platformBrightness == Brightness.dark
                    ? Colors.blue
                    : Colors.green),
            currentStep: context.read<ContactProvider>().stepIndex,
            onStepContinue: () {
              context.read<ContactProvider>().stepNext();
            },
            onStepCancel: () {
              context.read<ContactProvider>().stepPrev();
            },
            steps: [
              Step(
                title: Text(
                  "Contact Image",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                content: path != null
                    ? CircleAvatar(
                        backgroundImage: FileImage(File("${path}")),
                        radius: 50,
                      )
                    : CircleAvatar(
                        radius: 50,
                        child: IconButton(
                          onPressed: () async {
                            ImagePicker picker = ImagePicker();
                            XFile? image = await picker.pickImage(
                                source: ImageSource.camera);
                            setState(() {
                              path = image!.path;
                            });
                          },
                          icon: const Icon(
                            Icons.person,
                            size: 75,
                            color: Colors.black,
                          ),
                        ),
                      ),
              ),
              Step(
                title: Text("Contact Name",
                    style: Theme.of(context).textTheme.titleMedium),
                content: TextFormField(
                  style: Theme.of(context).textTheme.labelSmall,
                  controller: txtName,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Name"),
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Enter Name";
                    }
                    return null;
                  },
                ),
              ),
              Step(
                title: Text("Contact No",
                    style: Theme.of(context).textTheme.titleMedium),
                content: TextFormField(
                  controller: txtxNo,
                  keyboardType: TextInputType.phone,
                  style: Theme.of(context).textTheme.labelSmall,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Mobile Number"),
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Enter Mobile Number";
                    }
                    else if(value.length!=10)
                      {
                        return "Enter Valid Number";
                      }
                  },
                ),
              ),
              Step(
                title: Text("Contact Email",
                    style: Theme.of(context).textTheme.titleMedium),
                content: TextFormField(
                  style: Theme.of(context).textTheme.labelSmall,
                  controller: txtEmail,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Enter Email";
                    }
                    else if(  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value))
                    {
                      return "Enter Valid Email";
                    }
                  },
                ),
              ),
              Step(
                  title: Text("SAVE",
                      style: Theme.of(context).textTheme.titleMedium),
                  content: ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        if (path != null) {
                          ContactModal m1 = ContactModal(
                              name: txtName.text,
                              email: txtEmail.text,
                              no: txtxNo.text,
                              img: path);
                          context.read<ContactProvider>().addContact(m1);
                          context.read<ContactProvider>().stepIndex=0;
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content:
                                  Text("Please Enter All Details Properly"),
                            ),
                          );
                        }
                      }
                    },
                    child: const Text("Save"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
