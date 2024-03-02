import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Plantify/Frames/AuthFrame.dart';
import 'package:Plantify/Wrappers/UserWrapper.dart';
import 'package:provider/provider.dart';

class FrameWrapper extends StatefulWidget {
  const FrameWrapper({super.key});

  @override
  State<FrameWrapper> createState() => _FrameWrapperState();
}

class _FrameWrapperState extends State<FrameWrapper> {
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User?>(context);
    return user==null? AuthFrame()
    :UserWrapper();
  }
}