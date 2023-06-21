import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IdModel {
  String? get id;
}

abstract class BaseFirebaseModel<T extends IdModel> {
  T fromJSon(Map<String, dynamic> json);

  T? fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();

    if (value == null) {
      return null;
    }
    value.addEntries([MapEntry("id", snapshot.id)]);
    return fromJSon(value);
  }
}
