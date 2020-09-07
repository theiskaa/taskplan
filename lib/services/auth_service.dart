import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/model/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _firebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_firebaseUser);
  }

  Future singUp(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      return _firebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future singIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      return _firebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future singOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
