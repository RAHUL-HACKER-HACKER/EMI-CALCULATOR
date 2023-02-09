import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Database.dart';
import 'package:flutterapp/Home.dart';
import 'package:flutterapp/drawer.dart';
import 'FloatingButton.dart';
import 'MyHomePage.dart';
import 'LoginPage.dart';
import 'dart:math';

//important click on the main.dart file than run the program if we do'nt do like this we will get error
//for new dart class =first create new class.dart file than add class file name in body(main.dart) part and click(ctrl+ .) on class name and select extract widget and come below and change stateless widget to statefull wiget(ctrl+ .) and cut class part and paste into created class.dart file

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final postController = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.ref("path");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("DATABASE ACTION"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: postController,
              keyboardType: TextInputType.number,
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: "hintText", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  // databaseRef.push().set({"title": postController.text.toString()});
                  DateTime now = DateTime.now();
                  String id = now.hour.toString() +
                      ":" +
                      now.minute.toString() +
                      ":" +
                      now.second.toString();
                  var textvalue = postController.text.toString();
                  var num = double.parse(textvalue) * 2;
                  databaseRef.child(id).set({"id": id, "Value": num});
                },
                child: const Text("Add")),
          ],
        ),
      ),
    );
  }
}
