import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User {
  final String uid;
  final String? username;
  User({required this.uid, this.username});
}


class AuthBase {
  User _userFromFirebase(UserCredential userCredential) {
    return User(uid: userCredential.user!.uid, username: '');
  }

  Future<User> registerWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Update the user's username in the database
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({'username': username, 'uid': userCredential.user!.uid,});

      return _userFromFirebase(userCredential);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<User> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(userCredential);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<User> signInAnonymously() async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      return _userFromFirebase(userCredential);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<User> getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser as User?;
    if (user != null) {
      // Fetch the user's username from the database
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();

      if (snapshot.exists) {
        return User(uid: user.uid, username: snapshot.data()!['username']);
      }
    }
    throw Exception('User not found');
  }
}


