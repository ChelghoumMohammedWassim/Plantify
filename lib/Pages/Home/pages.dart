import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:Plantify/Models/Save.dart';
import 'package:Plantify/Models/Users.dart';
import 'package:provider/provider.dart';

import '../../Const.dart';
import '../../Database/db.dart';
import '../../Frames/DetailsFrame.dart';

// ignore: must_be_immutable
class Pages extends StatefulWidget {
  CurrentUser currentUser;
  Pages({super.key, required this.currentUser});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  late PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    // TODO: implement initState

    pageController = PageController(initialPage: 0, viewportFraction: 0.8)
      ..addListener(() {
        setState(() {
          pageOffset = pageController.page!;
        });
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Save>? saves = null;
    final QuerySnapshot? snapshot = Provider.of<QuerySnapshot?>(context);

    if (snapshot != null) {
      saves = snapshotTOSaveList(snapshot);
    }

    return saves == null
        ? Center(
            child: SpinKitThreeBounce(
              color: btnColor,
              size: 20.0,
            ),
          )
        : Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(double.infinity, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(
                    child: Material(
                      elevation: 1,
                      child: Container(
                        child: Container(
                          color: BNbgColor,
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 15,),
                                  Image.asset("assets/icons/plant.png", height: 40, width: 40,),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Text(
                                        widget.currentUser.userName,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            ),
                                      ))
                                ],
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.logout,
                                  color: btnColor,
                                  size: 30,
                                ),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) => AlertDialog(
                                            // <-- SEE HERE
                                            title: const Text('Disconnect'),
                                            content: const SingleChildScrollView(
                                              child: ListBody(
                                                children: <Widget>[
                                                  Text(
                                                      'Are you sure want to disconnect?'),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text('No'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                child: const Text('Yes',style: TextStyle(color: Colors.white),),
                                                onPressed: () {
                                                  FirebaseAuth.instance.signOut();
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          ));
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          body: Container(
            child: PageView.builder(
                itemCount: saves.length,
                controller: pageController,
                pageSnapping: false,
                itemBuilder: (context, index) {
                  String formattedDate = DateFormat.yMMMEd().format(saves![index].date);
                  double scale = max(0.8, (1 - (pageOffset - index).abs() + 0.8));
                  double angle = (pageOffset - index).abs();
                  if (angle > 0.5) {
                    angle = 1 - angle;
                  }
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return DetailsFrame(
                            save: saves![index],
                          );
                        },
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                      ),
                        padding: EdgeInsets.only(
                            top: 80 - scale * 25, left: 20, bottom: 50),
                        child: Transform(
                          transform: Matrix4.identity()
                            ..setEntry(
                              3,
                              2,
                              0.0025,
                            )
                            ..rotateY(angle),
                          alignment: Alignment.center,
                          child: Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: [
                                Hero(
                                  tag: saves[index].image_url,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: NetworkImage(saves[index].image_url),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(20)
                                    ),
                                    foregroundDecoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.black38,
                                            Colors.transparent
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter),
                                          borderRadius: BorderRadius.circular(20)
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 70,
                                  left: 20,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        flowers[saves[index].result_id],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontFamily: "Poppins"),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "With confidence " +
                                            saves[index].confidence.toString() +
                                            "%",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      
                                      Text(formattedDate,overflow: TextOverflow.clip,maxLines: 1,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                  );
                },
              ),
          ),
        );
  }
}
