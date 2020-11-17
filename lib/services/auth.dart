import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:fitness_app/domain/user.dart' as uuser;

class AuthService {
  final auth.FirebaseAuth _fAuth = auth.FirebaseAuth.instance;

  Future<uuser.User> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var result = await _fAuth.signInWithEmailAndPassword(
          email: email, password: password);
      auth.User user = result.user;
      return uuser.User.fromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  Future<uuser.User> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      var result = await _fAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      auth.User user = result.user;
      return uuser.User.fromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  Future logOut() async {
    await _fAuth.signOut();
  }

  Stream<uuser.User> get currentUser {
    return _fAuth.onAuthStateChanged.map((auth.User user) =>
        user != null ? uuser.User.fromFirebase(user) : null);
  }
}
