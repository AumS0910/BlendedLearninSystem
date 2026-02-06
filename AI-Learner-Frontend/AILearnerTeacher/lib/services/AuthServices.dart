// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<String> signInWithEmailAndPassword(String email, password) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // _fireStore
      //     .collection("Users")
      //     .doc(userCredential.user!.uid)
      //     .set({'uid': userCredential.user!.uid, 'email': email});
      return "success";
    } on FirebaseAuthException catch (e) {
      return "fail ${e.message}";
    }
  }

  Future<String> createUserWithMailPassword(
      // ignore: non_constant_identifier_names
      String email, password, name, PRN) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // save user info to fireStore
      _fireStore.collection("Users").doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'name': name,
        'PRN': PRN
      });

      return "success";
    } on FirebaseAuthException catch (e) {
      return "fail ${e.message}";
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<String?> getName() async {
    DocumentSnapshot<Map<String, dynamic>> snap =
        await _fireStore.collection("Users").doc(_auth.currentUser!.uid).get();
    String? name = snap['name'];
    return name;
  }

  Future<String?> getMail() async {
    return _auth.currentUser!.email;
  }
}
