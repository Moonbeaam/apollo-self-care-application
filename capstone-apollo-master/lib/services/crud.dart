import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods {
  Future<void> addData(blogData) async {
    final docRef = await FirebaseFirestore.instance
        .collection("data")
        .add({'name': blogData})
        .then((value) => {print(value.id)})
        .catchError(
          (e) {
            print(e);
          },
        );
  }

  getData() async {
    return await FirebaseFirestore.instance
        .collection("data")
        .doc('docRef')
        .get();
  }
}
