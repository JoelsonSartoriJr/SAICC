import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import '../sources/firebase.dart';

abstract class AuthImplementation {
  Future<FirebaseUser> signIn(String email, String password, File file);
  Future<FirebaseUser> createUser(String email, String password, File file);
  Future<void> requestNewPassword(String email);
  Future<FirebaseUser> getCurrentUser();
  Future<void> signOut();
}

class Auth implements AuthImplementation {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<FirebaseUser> signIn(String email, String password, File file) async {
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    if (file != null) {
      String url;
      await FirebaseStorageFiles().uploadImage(file, user).then((valor){
        url = valor;
      });
      UserUpdateInfo info = UserUpdateInfo();
      info.photoUrl = url;
      await user.updateProfile(info);
    }
    return user;
  }

  @override
  Future<FirebaseUser> createUser(
      String email, String password, File file) async {
    FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (file != null) {
      Future<String> url = FirebaseStorageFiles().uploadImage(file, user);
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
