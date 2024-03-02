import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:Plantify/Const.dart';
import 'package:Plantify/Database/db.dart';
import 'package:Plantify/Frames/ScannerFrame.dart';
import 'package:Plantify/Models/Users.dart';
import 'package:Plantify/Wrappers/PagesWrapper.dart';
import 'package:provider/provider.dart';

import '../Pages/Home/lists.dart';

class MainFrame extends StatefulWidget {
  const MainFrame({super.key});

  @override
  State<MainFrame> createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {

  late int currentPage;

  @override
  void initState() {
    currentPage=0;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final QuerySnapshot? snapshot = Provider.of<QuerySnapshot?>(context);
    CurrentUser? user = null;
    if (snapshot != null) user = getUserInformation(snapshot);

    return user == null
        ? Scaffold(
            body: Center(
            child: SpinKitThreeBounce(
              color: sColor,
              size: 20.0,
            ),
          ))
        : Scaffold(

            body: currentPage==0? PagesWrapper(currentUser: user,):Lists(),

            floatingActionButton: SizedBox(
              height: MediaQuery.of(context).size.width*0.17,
              width: MediaQuery.of(context).size.width*0.17,
              child: FloatingActionButton(
                backgroundColor:Colors.grey[800],
            
                child: ImageIcon(
                              AssetImage("assets/icons/scan.png"),
                              color: btnColor,
                              size: MediaQuery.of(context).size.width*0.1,
                            ),
                onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ScannerFrame()));
                },
              ),
            ),

            floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,

            bottomNavigationBar: Container(
              
              color: Colors.transparent,
              child: CurvedNavigationBar(
                backgroundColor: Colors.transparent,
                height: MediaQuery.of(context).size.height*0.08,
                color: BNbgColor,
                animationCurve: Curves.easeIn,
                onTap: (value) {
                  setState(() {
                    currentPage=value;
                  });
                },
                items: [
                  Icon(Icons.home_filled, size: 30,color: btnColor,),
                  Icon(Icons.search, size: 30,color: btnColor,),
                ],
              ),
            ),

          );
  }
}
