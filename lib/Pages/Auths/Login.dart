import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../Const.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String email_error;
  late String password_error;
  late bool loding;
  TextEditingController email_input = TextEditingController();
  TextEditingController password_input = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email_error = 'Done';
    password_error = 'Done';
    loding = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'HELLO AGAIN!',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 28,
                fontFamily: 'Poppins'),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Welcome back, you've been missed",
            style: TextStyle(wordSpacing: 3, letterSpacing: 1.2),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
            decoration: BoxDecoration(
                color: Colors.grey[800], borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: email_input,
              decoration: InputDecoration(
                  hintText: 'Email',
                  icon: Icon(Icons.email_outlined),
                  border: InputBorder.none,
                  focusColor: shadowColor,
                  errorText: email_error == 'Done' ? null : email_error),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
            decoration: BoxDecoration(
                color: Colors.grey[800], borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: password_input,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Password',
                  icon: Icon(Icons.password),
                  border: InputBorder.none,
                  focusColor: shadowColor,
                  errorText: password_error == 'Done' ? null : password_error),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: ElevatedButton(
              onPressed: () async {
                String email = email_input.text.trim();
                String password = password_input.text.trim();
                if (email_input.text.trim().isNotEmpty &&
                    password_input.text.trim().isNotEmpty) {
                  setState(() {
                    loding = true;
                    email_input.text = email;
                    password_input.text = password;
                  });
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email_input.text.trim(),
                        password: password_input.text.trim());
                    Navigator.of(context).pop();
                  } on FirebaseAuthException catch (e) {
                    setState(() {
                      loding = false;
                      email_input.text = email;
                      password_input.text = password;
                      if (e.message
                          .toString()
                          .toLowerCase()
                          .contains('email')) {
                        email_error = e.message.toString();
                        password_error = 'Done';
                      } else {
                        if (e.message
                            .toString()
                            .toLowerCase()
                            .contains('password')) {
                          password_error = e.message.toString();
                          email_error = 'Done';
                        } else {
                          email_error = e.message.toString();
                          password_error = e.message.toString();
                        }
                      }
                    });
                  }
                }
              },

              
              child: Container(
                child: Container(
                  child: loding == false
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sign In",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Icon(Icons.arrow_circle_right_sharp),
                          ],
                        )
                      : const SpinKitThreeBounce(
                          color: Colors.white,
                          size: 20.0,
                        ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: sColor,
                  minimumSize: Size(double.infinity,50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight:Radius.circular(23) ,
                      bottomLeft: Radius.circular(23),
                      bottomRight: Radius.circular(23),
                      topLeft: Radius.circular(10)
                    )
                  )
                  ),
                  
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
