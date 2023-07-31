import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../services/auth.dart';
import '../screens/auth_screen.dart';
import 'original_button.dart';

class AuthForm extends StatefulWidget {
  final AuthType authType;
  final String? username;

  const AuthForm({Key? key, required this.authType, this.username}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '', _password = '', _username = '';
  AuthBase authBase = AuthBase();
  UserService userService = UserService(); // เพิ่มการสร้าง UserService

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Enter your email',
                hintText: 'ex: test@gmail.com',
              ),
              onChanged: (value) {
                _email = value;
              },
              validator: (value) =>
                  value!.isEmpty ? 'You must enter a valid email' : null,
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Enter your password',
              ),
              obscureText: true,
              onChanged: (value) {
                _password = value;
              },
              validator: (value) => value!.length <= 6
                  ? 'Your password must be larger than 6 characters'
                  : null,
            ),
            if (widget.authType == AuthType.register) // เพิ่มส่วนให้กรอกชื่อผู้ใช้เมื่อเป็นการลงทะเบียน
              Column(
                children: [
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Enter your username',
                    ),
                    onChanged: (value) {
                      _username = value;
                    },
                    validator: (value) =>
                        value!.isEmpty ? 'You must enter a username' : null,
                  ),
                ],
              ),
            const SizedBox(height: 20),
            OriginalButton(
              text: widget.authType == AuthType.login ? 'Login' : 'Register',
              color: Colors.lightBlue,
              textColor: Colors.white,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  if (widget.authType == AuthType.login) {
                    await authBase.loginWithEmailAndPassword(
                        _email, _password);
                    Navigator.of(context).pushReplacementNamed('page1');
                  } else {
                    await authBase.registerWithEmailAndPassword(
                        _email, _password, _username);
                    await userService.createUser(_username, _email); // เพิ่มการสร้างข้อมูลผู้ใช้ใน Firestore
                    Navigator.of(context).pushReplacementNamed('page1');
                  }
                }
              },
            ),
            const SizedBox(height: 6),
            ElevatedButton(
              onPressed: () {
                if (widget.authType == AuthType.login) {
                  Navigator.of(context).pushReplacementNamed('register');
                } else {
                  Navigator.of(context).pushReplacementNamed('login');
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                elevation: 0,
              ),
              child: Text(
                widget.authType == AuthType.login
                    ? 'Don\'t have an account?'
                    : 'Already have an account?',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
            if (widget.authType == AuthType.login) // เพิ่มปุ่ม Anonymous ในกรณีเข้าสู่ระบบ
              ElevatedButton(
                onPressed: () async {
                  await authBase.signInAnonymously();
                  Navigator.of(context).pushReplacementNamed('page1');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0,
                ),
                child: const Text(
                  'Login anonymously',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class UserService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> createUser(String username, String email) async {
    await usersCollection.doc(email).set({
      'username': username,
      'email': email,
    });
  }
}