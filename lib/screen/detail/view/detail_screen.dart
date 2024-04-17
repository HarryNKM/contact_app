import 'dart:async';
import 'dart:io';

import 'package:contact_app/screen/home/provider/conntact_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int index = 0;
  String page = "";

  @override
  Widget build(BuildContext context) {
    List data = ModalRoute.of(context)!.settings.arguments as List;
    index = data[1];
    page = data[0];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Contact",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(11),
        child: Column(
          children: [
            Center(
                child: CircleAvatar(
              backgroundImage: FileImage(File(
                  "${context.read<ContactProvider>().ContactList[index].img}")),
              radius: 80,
            )),
            const SizedBox(
              height: 20,
            ),
            Text(
              "${context.read<ContactProvider>().ContactList[index].name}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              endIndent: 2,
              indent: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "+91 ${context.read<ContactProvider>().ContactList[index].no}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      IconButton.filledTonal(
                          onPressed: () async {
                            await launchUrl(Uri.parse(
                                "${context.read<ContactProvider>().ContactList[index].no}"));
                          },
                          icon: const Icon(Icons.call)),
                      const SizedBox(
                        width: 20,
                      ),
                      IconButton.filledTonal(
                          onPressed: () {}, icon: const Icon(Icons.sms)),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${context.read<ContactProvider>().ContactList[index].no}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      IconButton.filledTonal(
                          onPressed: () {}, icon: const Icon(Icons.video_call)),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${context.read<ContactProvider>().ContactList[index].no}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      IconButton.filledTonal(
                          onPressed: () {}, icon: const Icon(Icons.telegram)),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${context.read<ContactProvider>().ContactList[index].email}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      IconButton.filledTonal(
                          onPressed: () {}, icon: const Icon(Icons.email)),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<ContactProvider>(
                    builder: (context, value, child) => InkWell(
                      onTap: () {
                        context.read<ContactProvider>().remList(index);
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.sizeOf(context).width,
                        color: Colors.grey.shade300,
                        child: Text(
                          "Delete",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Consumer<ContactProvider>(
                    builder: (context, value, child) => InkWell(
                      onTap: () {
                        context.read<ContactProvider>().hideContact(index);
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.sizeOf(context).width,
                        color: Colors.grey.shade300,
                        child: Text(
                          "Hide",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
