import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:Plantify/Models/Users.dart";
import "package:provider/provider.dart";

import "../Database/db.dart";
import "../Pages/Home/pages.dart";

// ignore: must_be_immutable
class PagesWrapper extends StatefulWidget {
  CurrentUser currentUser;
  PagesWrapper({super.key, required this.currentUser});

  @override
  State<PagesWrapper> createState() => _PagesWrapperState();
}

class _PagesWrapperState extends State<PagesWrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: streamSaves,
       initialData: null,
       child: Pages(currentUser: widget.currentUser),
       );
  }
}