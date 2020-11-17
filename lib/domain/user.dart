import 'package:firebase_auth/firebase_auth.dart' as auth;

class User {
  String id;

  User.fromFirebase(auth.User user) {
    id = user.uid;
  }
}
