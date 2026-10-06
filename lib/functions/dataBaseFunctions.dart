import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> create(String colName, docName, name, animal, int age) async {
  await FirebaseFirestore.instance.collection(colName).doc(docName).set({
    'name': name,
    'animal': animal,
    'age': age,
  });
  print('Database Updated');
}

Future<void> update(String colName, docName, field, var newFieldValue) async {
  await FirebaseFirestore.instance.collection(colName).doc(docName).update({
    field: newFieldValue,
  });
  print('fields Updated');
}

delete(String colName, docName) async {
  await FirebaseFirestore.instance.collection(colName).doc(docName).delete();
  print('document deleted');
}
