import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  // text Controllers
  final _emailControllerReset = TextEditingController();

  @override
  void dispose() {
    _emailControllerReset.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailControllerReset.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Password reset link send! Check your email'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff9FC9F3),
      appBar: AppBar(
        backgroundColor: Color(0xffF07DEA),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Text(
                  'Enter your Phone Number',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'and we will send you a password link',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          // Phone Number
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffEEEEEE),
                  border: Border.all(color: Color(0xffA460ED)),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: TextField(
                  controller: _emailControllerReset,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Phone Number',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),

          //  Reset Password Button
          Container(
            child: MaterialButton(
              onPressed: passwordReset,
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Text(
                'Reset Password',
                style: TextStyle(fontSize: 18),
              ),
              color: Color(0xffF07DEA),
            ),
          ),
        ],
      ),
    );
  }
}
