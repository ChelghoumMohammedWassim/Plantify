import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../Const.dart';
import '../../Database/db.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController fullName_input = TextEditingController();
  TextEditingController email_input = TextEditingController();
  TextEditingController password_input = TextEditingController();

  late String email_error;
  late String password_error;
  late bool loding;

  late bool fullName_state;
  late bool email_state;
  late bool password_state;

  @override
  void initState() {
    email_error = 'Done';
    password_error = 'Done';
    loding = false;
    fullName_state = true;
    email_state = true;
    password_state = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           
           Text(
            'CREATE ACCOUNT',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 28,
                fontFamily: 'Poppins'),
          ),
           
           const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
            decoration: BoxDecoration(
                color: Colors.grey[800], borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: fullName_input,
              decoration: InputDecoration(
                  hintText: 'Full Name',
                  icon: Icon(Icons.person),
                  border: InputBorder.none,
                  focusColor: Colors.grey,
                  enabled: fullName_state),
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
              controller: email_input,
              decoration: InputDecoration(
                  hintText: 'Email',
                  icon: Icon(Icons.email_outlined),
                  border: InputBorder.none,
                  focusColor: Colors.grey,
                  enabled: email_state,
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
                  focusColor: Colors.grey,
                  enabled: password_state,
                  errorText: password_error == 'Done' ? null : password_error),
            ),
          ),

          SizedBox(
            height: 30,
          ),

          Container(
            child: ElevatedButton(
              onPressed: () async {
                if (fullName_input.text.trim().isNotEmpty &&
                    email_input.text.trim().isNotEmpty &&
                    password_input.text.trim().isNotEmpty) {
                  setState(() {
                    loding = true;
                    fullName_state = false;
                    email_state = false;
                    password_state = false;
                  });
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email_input.text.trim(), password: password_input.text.trim());
                    setUser(fullName_input.text.trim(), email_input.text.trim(), password_input.text.trim());
                    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email_input.text.trim(), password: password_input.text.trim());
                    Navigator.of(context).pop();
                  } on FirebaseAuthException catch (e) {
                    setState(() {
                      loding = false;
                      fullName_state = true;
                      email_state = true;
                      password_state = true;
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
                }else{
                   setState(() {
                    fullName_state = true;
                    email_state = true;
                    password_state = true;
                  });
                }
              },
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
                  
              child: Container(
                child: Container(
                  child: loding == false
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Register",
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
            ),
          ),
        ],
      ),
    );
  }
}
