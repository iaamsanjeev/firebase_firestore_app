import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/functions/dataBaseFunctions.dart';
import 'package:flutter_firebase_app/pages/pets.dart';

class DatabaseOptions extends StatefulWidget {
  const DatabaseOptions({super.key});

  @override
  _DatabaseOptionsState createState() => _DatabaseOptionsState();
}

class _DatabaseOptionsState extends State<DatabaseOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Database Options "),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.leave_bags_at_home),
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  create('pets', 'jerry', 'tiger', 'cat', 10);
                },
                child: Text("Create"),
              ),
              ElevatedButton(
                onPressed: () {
                  update('pets', 'tom', 'animal', 'tiger');
                },
                child: Text("Update"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PetsList()),
                  );
                },
                child: Text("Retrieve"),
              ),
              ElevatedButton(
                onPressed: () {
                  delete('pets', 'tom');
                },// delete
                child: Text("Delete"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
