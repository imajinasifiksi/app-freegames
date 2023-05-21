import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import '../pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool exist = prefs.containsKey("id");

  runApp(MyApp(
    exist: exist,
  ));

  final db = await openDatabase(
    join(await getDatabasesPath(), "freegames.db"),
    onCreate: (db, version) async {
      await db.transaction(
        (tx) async {
          await tx.execute("""
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT NOT NULL UNIQUE,
            password TEXT NOT NULL,
            message TEXT
          );""");

          await tx.execute("""
          CREATE TABLE favorites (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL UNIQUE,
            userId INTEGER NOT NULL,
            FOREIGN KEY (userId) REFERENCES users(id)
          );""");
        },
      );
    },
    version: 1,
  );
  db.close();
}

class MyApp extends StatelessWidget {
  final bool exist;

  const MyApp({Key? key, required this.exist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freegames App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login() ,
    );
  }
}
