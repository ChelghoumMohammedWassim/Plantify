import 'package:flutter/material.dart';
import 'package:Plantify/Database/db.dart';
import 'package:Plantify/Models/Plant.dart';

import '../Const.dart';
import '../Models/Save.dart';


// ignore: must_be_immutable
class DetailsFrame extends StatefulWidget {
  Save save;
  DetailsFrame({super.key, required this.save});

  @override
  State<DetailsFrame> createState() => _DetailsFrameState();
}

class _DetailsFrameState extends State<DetailsFrame> {
  @override
  Widget build(BuildContext context) {
    Plant plant=Plants[widget.save.result_id];
    return Scaffold(
      body: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 15, right: 8),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        padding: EdgeInsets.all(5),
                                        child: ImageIcon(
                                          AssetImage(
                                              "assets/icons/thermometer.png"),
                                          color: Colors.white,
                                        ),
                                        decoration: BoxDecoration(
                                          color: btnColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(plant.temperature)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        padding: EdgeInsets.all(5),
                                        child: ImageIcon(
                                          AssetImage(
                                              "assets/icons/humidity.png"),
                                          color: Colors.white,
                                        ),
                                        decoration: BoxDecoration(
                                          color: btnColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(plant.humidity)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        padding: EdgeInsets.all(5),
                                        child: ImageIcon(
                                          AssetImage(
                                              "assets/icons/measure.png"),
                                          color: Colors.white,
                                        ),
                                        decoration: BoxDecoration(
                                          color: btnColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(plant.max_height.toString() + " cm")
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Hero(
                              tag: widget.save.image_url,
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.45,
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(30)),
                                    image: DecorationImage(
                                        image: NetworkImage(widget.save.image_url),
                                        fit: BoxFit.cover),
                                    boxShadow: [
                                      BoxShadow(
                                          color: shadowColor.withOpacity(0.6),
                                          blurRadius: 30,
                                          offset: Offset(-6, 5))
                                    ]),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                plant.name.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.5,
                                    color: Colors.grey[100],
                                    fontFamily: "Poppins"),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                plant.about,
                                style: TextStyle(color: Colors.grey[100]),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SafeArea(
                    child: Positioned(
                      top: 25,
                      left: 0,
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios_new,
                                color: btnColor,
                                size: 27,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: CircleAvatar(
                                backgroundColor: Colors.black.withOpacity(0.65),
                                radius: 25,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.delete_forever,
                                    color:btnColor,
                                    size: 27,
                                  ),
                                  onPressed: () async {
                                    showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => AlertDialog(
                                    // <-- SEE HERE
                                    title: const Text('Remove'),
                                    content: const SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          Text(
                                              'Are you sure want to delete it?'),
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
                                          deleteSave(widget.save.id);
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ));
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
    );
  }
}