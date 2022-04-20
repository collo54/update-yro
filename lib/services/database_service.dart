import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:update_yro/models/spicemodel.dart';
import 'package:update_yro/services/firestore_doc_path.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class Databaseservice {
  // generic funtion creates a dcomcument and sets data in the document
  Future<void> _set({required String path, Map<String, dynamic>? data}) async {
    final DocumentReference<Map<String, dynamic>?> reference =
        FirebaseFirestore.instance.doc(path);
    print('$path: $data');
    await reference.set(data);
  }

  //sets contributor data to users collection
  Future<void> setContibutor(SpiceModel model) async {
    await _set(path: FirestoreDocPath.spice(), data: model.toMap());
  }
}
