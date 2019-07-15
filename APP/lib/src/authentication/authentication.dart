import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class AuthImplementation {
  Future<FirebaseUser> signIn(String email, String password);
  Future<FirebaseUser> createUser(String email, String password, var file);
  Future<void> requestNewPassword(String email);
  Future<FirebaseUser> getCurrentUser();
  Future<void> signOut();
}

class Auth implements AuthImplementation {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<FirebaseUser> signIn(String email, String password) async {
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return user;
  }

  @override
  Future<FirebaseUser> createUser(
      String email, String password, var file) async {
    Uri url;
    FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (file != null) {
      FirebaseStorage storage =
          FirebaseStorage(storageBucket: 'gs://saicix.appspot.com/users');
      await storage.ref().putFile(file).onComplete.then((event) {
        url = event.uploadSessionUri;
      });
      UserUpdateInfo info = UserUpdateInfo();
      info.photoUrl = url.toString();
      await user.updateProfile(info);
    }
    return user;
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<void> requestNewPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() async {
    _firebaseAuth.signOut();
  }
}
