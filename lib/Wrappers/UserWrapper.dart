import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Plantify/Frames/MainFrame.dart';
import 'package:provider/provider.dart';

import '../Database/db.dart';

class UserWrapper extends StatefulWidget {
  const UserWrapper({super.key});

  @override
  State<UserWrapper> createState() => _UserWrapperState();
}

class _UserWrapperState extends State<UserWrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
          value: streamUser,
          initialData: null,
          child: MainFrame(),
        );
  }
}