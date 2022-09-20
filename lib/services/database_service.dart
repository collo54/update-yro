import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:update_yro/services/document_path.dart';

import '../models/checkout_product.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class Databaseservice {
  Databaseservice({required this.uid});
  final String uid;

  // generic funtion creates a dcomcument and sets data in the document
  Future<void> _set({required String path, Map<String, dynamic>? data}) async {
    final DocumentReference<Map<String, dynamic>?> reference =
        FirebaseFirestore.instance.doc(path);
    if (kDebugMode) {
      print('$path: $data');
    }
    await reference.set(data);
  }

  //creates or writes a product for buyers collection per user id
  Future<void> setCheckoutItem(CheckoutItem checkoutItem) async {
    await _set(
        path: DocumentPath.productcheckout(uid, checkoutItem.id),
        data: checkoutItem.toMap());
  }

  //reads a product from buyers collection per user id
  Stream<List<CheckoutItem>> checkoutItemsStream() {
    final path = DocumentPath.checkout(uid);
    final reference = FirebaseFirestore.instance.collection(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => snapshot.docs
        .map((
          snapshot,
        ) =>
            CheckoutItem.fromMap(snapshot.data(), snapshot.id))
        .toList());
  }

  //deletes a doc from buyers collection/uid/docid
  Future<void> deleteContibutor(CheckoutItem checkoutItem) async {
    final path = DocumentPath.productcheckout(uid, checkoutItem.id);
    final reference = FirebaseFirestore.instance.doc(path);
    if (kDebugMode) {
      print('delete: $path');
    }
    await reference.delete();
  }

  //creates or writes a product for all products collection per user id
  Future<void> setProductAll(CheckoutItem productItem) async {
    await _set(
        path: DocumentPath.newAllSpices(productItem.id),
        data: productItem.toMap());
  }

  //reads a product from all products collection
  Stream<List<CheckoutItem>> productItemStreamAll() {
    final path = DocumentPath.streamAllSpices();
    final reference = FirebaseFirestore.instance.collection(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => snapshot.docs
        .map((
          snapshot,
        ) =>
            CheckoutItem.fromMap(snapshot.data(), snapshot.id))
        .toList());
  }

  //deletes a doc from all products collection
  Future<void> deleteAllProduct(CheckoutItem productItem) async {
    final path = DocumentPath.newAllSpices(productItem.id);
    final reference = FirebaseFirestore.instance.doc(path);
    if (kDebugMode) {
      print('delete: $path');
    }
    await reference.delete();
  }

  //creates or writes a product for computers collection per user id
  Future<void> setProduct(CheckoutItem productItem) async {
    await _set(
        path: DocumentPath.newComputer(productItem.id),
        data: productItem.toMap());
  }

  //reads a product from computers collection
  Stream<List<CheckoutItem>> productItemStream() {
    final path = DocumentPath.streamComputer();
    final reference = FirebaseFirestore.instance.collection(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => snapshot.docs
        .map((
          snapshot,
        ) =>
            CheckoutItem.fromMap(snapshot.data(), snapshot.id))
        .toList());
  }

  //deletes a doc from computers collection
  Future<void> deleteComputer(CheckoutItem productItem) async {
    final path = DocumentPath.newComputer(productItem.id);
    final reference = FirebaseFirestore.instance.doc(path);
    if (kDebugMode) {
      print('delete: $path');
    }
    await reference.delete();
  }

  //creates or writes a product for phones collection per user id
  Future<void> setProduct2(CheckoutItem productItem) async {
    await _set(
        path: DocumentPath.newPhones(productItem.id),
        data: productItem.toMap());
  }

  //reads a product from phones collection
  Stream<List<CheckoutItem>> productItemStream2() {
    final path = DocumentPath.streamPhones();
    final reference = FirebaseFirestore.instance.collection(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => snapshot.docs
        .map((
          snapshot,
        ) =>
            CheckoutItem.fromMap(snapshot.data(), snapshot.id))
        .toList());
  }

  //deletes a doc from phones collection
  Future<void> deletePhonesProduct(CheckoutItem productItem) async {
    final path = DocumentPath.newPhones(productItem.id);
    final reference = FirebaseFirestore.instance.doc(path);
    if (kDebugMode) {
      print('delete: $path');
    }
    await reference.delete();
  }
}
