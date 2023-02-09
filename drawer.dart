import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // ignore: prefer_const_literals_to_create_immutables
      child: ListView(padding: EdgeInsets.zero, children: [
        // DrawerHeader(
        //   child: Text(
        //     "hi rahul",
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   decoration: BoxDecoration(color: Colors.purpleAccent),
        // ),
        const UserAccountsDrawerHeader(
          accountName: Text("Rahul kumar"),
          accountEmail: Text("rahulk841501@gmail.com"),
          currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/childAvatar.png")),
        ),

        const ListTile(
          leading: Icon(Icons.person),
          title: Text("Account"),
          subtitle: Text("Personal"),
          trailing: Icon(Icons.edit),
        ),
        const ListTile(
          leading: Icon(Icons.email),
          title: Text("Email"),
          subtitle: Text("rahulk841501@gmail.com"),
          trailing: Icon(Icons.send),
        ),
        const ListTile(
          leading: Icon(Icons.content_copy),
          title: Text("Contect"),
          subtitle: Text("7261888792"),
          trailing: Icon(Icons.call),
        )
      ]),
    );
  }
}
