import 'package:contact_app/screen/home/provider/conntact_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Screen",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: [
          ElevatedButton.icon(onPressed: () {
            Navigator.pushNamed(context, 'detail');
          }, icon: Icon(Icons.add), label: Text("hi")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'contact');
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<ContactProvider>(
        builder: (context, value, child) =>  ListView.builder(
          itemCount: value.ContactList.length,
          itemBuilder: (context, index) {
          return
            ListTile(
            title: Text("${context.read<ContactProvider>().ContactList[index].name}",style: Theme.of(context).textTheme.bodyLarge,),
            subtitle: Text("${context.read<ContactProvider>().ContactList[index].name}",),
          );
        },),
      ),
      );
  }
}
