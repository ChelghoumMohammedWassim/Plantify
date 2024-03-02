import 'package:flutter/material.dart';

import '../../Frames/FlowersDetailsFrame.dart';
import '../../Models/Plant.dart';
import 'SearchItem.dart';

class Lists extends StatefulWidget {
  const Lists({super.key});

  @override
  State<Lists> createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  late String input;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    input = '';
  }

  @override
  Widget build(BuildContext context) {

    return Container(
          margin: EdgeInsets.only(top: 30),
          child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Search Here',
                        suffixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          input = value;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
                    child: ListView.builder(
                      itemCount: Plants.length,
                      itemBuilder: (context, index) {
                        if (input.isEmpty) {
                          return InkWell(
                            child: searchItem(
                              Plants[index],
                            ),
                            onTap: () {
                              // push  details frame
                              Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return DetailsFrame(
                                    plant: Plants[index],
                                  );
                                },
                              ));
                            },
                          );
                        }
                        if (Plants[index].name
                            .toLowerCase()
                            .startsWith(input.toLowerCase())) {
                          return InkWell(
                            child: searchItem(
                              Plants[index],
                            ),
                            onTap: () {
                              // push  details frame
                              Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return DetailsFrame(
                                    plant: Plants[index],
                                  );
                                },
                              ));
                            },
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                ),
              ],
            ),
        );
  }
}
