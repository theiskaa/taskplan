import 'package:cloud_firestore/cloud_firestore.dart';

class DbService {
  uploadUserInfo(userMap) async {
    return await Firestore.instance.collection("users").add(userMap);
  }
}
