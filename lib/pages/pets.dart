import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PetsList extends StatefulWidget {
  const PetsList({super.key});

  @override
  _PetsListState createState() => _PetsListState();
}

class _PetsListState extends State<PetsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('pets').snapshots(),
          builder: (context, petSnapshot) {
            if (petSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              final petDocs = petSnapshot.data!.docs;
              return ListView.builder(
                itemCount: petDocs.length,
                itemBuilder: (_, index) {
                  return Card(
                    elevation: 10,
                    child: ListTile(
                      title: Text(petDocs[index]['name']),
                      subtitle: Text(petDocs[index]['animal']),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
