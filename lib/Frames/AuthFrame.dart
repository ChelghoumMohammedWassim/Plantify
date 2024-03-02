// ignore: file_names
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:Plantify/Pages/Auths/Register.dart';
import 'package:rive/rive.dart';

import '../Pages/Auths/Login.dart';

class AuthFrame extends StatefulWidget {
  const AuthFrame({super.key});

  @override
  State<AuthFrame> createState() => _AuthFrameState();
}

class _AuthFrameState extends State<AuthFrame> {
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation("active", autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, 
      body: Container(
        child: Stack(
          children: [
            Positioned(
              width: MediaQuery.of(context).size.width * 1.7,
              child: Image.asset("assets/Backgrounds/Spline.png"),
              bottom: MediaQuery.of(context).size.height * 0.15,
              left: 100,
            ),
            const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
            Positioned.fill(
                child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 10),
              child: const SizedBox(),
            )),
            SafeArea(
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                          width: 300,
                          child: Text(
                            "AI \nPlants Collection",
                            style:
                                TextStyle(fontSize: 57, fontFamily: "Poppins"),
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      const SizedBox(
                        width: 350,
                        child: Text(
                          "use artificial intelligence (AI) to recognize and describe plants, giving you immediate plant identification and comprehensive information.",
                          style: TextStyle(
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      GestureDetector(
                        onTap: () {
                          _btnAnimationController.isActive = true;
                          Future.delayed(Duration(milliseconds: 800),(){
                             AuthDialog(context);
                          });
                         
                        },
                        child: SizedBox(
                            height: 64,
                            width: 260,
                            child: Stack(
                              children: [
                                RiveAnimation.asset(
                                  "assets/RiveAssets/button.riv",
                                  controllers: [_btnAnimationController],
                                ),
                                const Positioned.fill(
                                  top: 6,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Start Now",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(Icons.arrow_circle_right_sharp),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ),
                      const Spacer(),
                      const Center(
                          child: Text(
                        "This application created by @Wassim_Ch",
                        style: TextStyle(fontSize: 10),
                      ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Object?> AuthDialog(BuildContext context) {
    return showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierLabel: 'auth',
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  Center(
                            child: SingleChildScrollView(
                              child: Container(
                                height: 550,
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 52, 52, 52).withOpacity(0.93),
                                    borderRadius: BorderRadius.circular(30)),
                                child: SizedBox(
                                  child: DefaultTabController(
                                    length: 2,
                                    child: SafeArea(
                                      child:
                                          Container(
                                            height: 500,
                                            constraints:
                                                BoxConstraints(maxHeight: 500),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Scaffold(
                                                backgroundColor:
                                                    Colors.transparent,
                                                    resizeToAvoidBottomInset: false, 
                                                body: Center(
                                                  child: Container(
                                                    height: 550,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      child: Column(
                                                        children: [
                                                          TabBar(tabs: [
                                                            Container(
                                                                padding: const EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            10),
                                                                child: const Text(
                                                                  "SignIn",
                                                              
                                                                )),
                                                            Container(
                                                                padding: const EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            10),
                                                                child: const Text(
                                                                    "Register",
                                                                    ))
                                                          ]),
                                                          SingleChildScrollView(
                                                              child: Container(
                                                                height: 450,
                                                                child: const TabBarView(
                                                                    children: [
                                                                  Login(),
                                                                  Register(),
                                                                ]),
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
  }
}
