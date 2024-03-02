import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Plantify/Const.dart';
import 'package:Plantify/Database/db.dart';
import 'package:Plantify/Models/Plant.dart';
import 'package:Plantify/SnackBars/ErrorSnackBar.dart';
import 'package:uuid/uuid.dart';
import '../SnackBars/SuccessSnakBar.dart';
import '../function.dart';
import '../main.dart';

class ScannerFrame extends StatefulWidget {
  const ScannerFrame({super.key});

  @override
  State<ScannerFrame> createState() => _ScannerFrameState();
}

class _ScannerFrameState extends State<ScannerFrame> {
  late CameraController _cameraController;
  late String message;
  late String predictionLabel;
  late String predictionConfidence;
  late String predictionPlantID;
  late bool liked;

  late File image;

  late bool loading;

  @override
  void initState() {
    super.initState();
    loading = false;
    liked = false;
    message = "Loading...";
    predictionLabel = '';
    predictionConfidence = '';
    predictionPlantID = '';
    _cameraController = CameraController(cameras[0], ResolutionPreset.max);
    _cameraController.initialize().then((value) {
      setState(() {
        if (!mounted) {
          message = "Cant connect to the camera";
        }
      });
    });
    LoadModel();
  }

  LoadModel() async {
    await Tflite.loadModel(
        model: 'Models/model.tflite', labels: 'Models/labels.txt');

    // Get the input shape
    final inputShape = Tflite.anchors;

    // Print the input shape
    print('Input Shape: $inputShape');
    print("****************************load secc********************");
  }

  void like() {
    setState(() {
      liked = !liked;
    });
  }

  Predict(File image) async {
    try {
      var result = await Tflite.runModelOnImage(
          path: image.path,
          numResults: 16,
          threshold: 0.0,
          imageMean: 127.5,
          imageStd: 127.5);
      print('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&$result');
      setState(() {
        if (result![0]['confidence'] > 0.90) {
          List splits = result[0]['label'].toString().split(' ');
          predictionLabel = splits[1];
          predictionPlantID = splits[0];
          if(predictionPlantID==16){
            setState(() {
            predictionLabel = '';
            predictionConfidence = '';
            predictionPlantID = '';
          });
          }
          predictionConfidence =
              (result[0]['confidence'] * 100).toStringAsFixed(1);
        } else {
          setState(() {
            predictionLabel = '';
            predictionConfidence = '';
            predictionPlantID = '';
          });
        }
      });
    } catch (e) {
      print('***************************************');
      print(e.toString());
      print('***************************************');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _cameraController.cameraId == -1
          ? Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: GestureDetector(
                  child: Text(
                    message,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          : Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: CameraPreview(_cameraController),
                ),
                Positioned(
                  top: 40,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        IconButton(
                          icon: ImageIcon(
                            AssetImage("assets/icons/pick.png"),
                            color: btnColor,
                            size: 30,
                          ),
                          onPressed: () async {
                            try {
                              XFile? picture = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              if (picture != null) {
                                setState(() {
                                  loading = true;
                                });
                                image = File(picture.path);
                                File resizedImage =
                                    await resizeImage(picture.path);
                                await Predict(File(resizedImage.path));
                                // ignore: use_build_context_synchronously
                                ShowDetails(context, picture);
                                setState(() {
                                  loading = false;
                                });
                              }
                            } catch (e) {
                              print(
                                  '*********************************************error***************************************');
                              print(e);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: const Color.fromRGBO(66, 66, 66, 1).withOpacity(0.75),
                        radius: 35,
                        child: IconButton(
                          icon: ImageIcon(
                            AssetImage('assets/icons/scan.png'),
                            color: btnColor,
                            size: 30,
                          ),
                          onPressed: () async {
                            if (!_cameraController.value.isInitialized) {
                              return null;
                            }
                            if (_cameraController.value.isTakingPicture) {
                              return null;
                            }
                            try {
                              setState(() {
                                loading = true;
                              });
                              await _cameraController
                                  .setFlashMode(FlashMode.auto);
                              XFile picture =
                                  await _cameraController.takePicture();
                              File resizedImage =
                                  await resizeImage(picture.path);

                              image = File(picture.path);
                              await Predict(File(resizedImage.path));

                              // ignore: use_build_context_synchronously
                              ShowDetails(context, picture);

                              setState(() {
                                loading = false;
                              });
                            } catch (e) {
                              print(
                                  '*********************************************error***************************************');
                              print(e);
                              setState(() {
                                loading = false;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                loading
                    ? Positioned.fill(
                        child: SpinKitDancingSquare(
                          color: btnColor,
                          size: 120,
                        ),
                      )
                    : Container(
                        height: 10,
                        width: 10,
                        color: Colors.transparent,
                      )
              ],
            ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> ShowDetails(
      BuildContext context, XFile picture) {
    printImageShape(picture.path);
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        dismissDirection: DismissDirection.horizontal,
        duration: predictionLabel.length > 0
            ? Duration(seconds: 8)
            : Duration(seconds: 5),
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 150),
        elevation: 0,
        content: predictionLabel.length > 0
            ? GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  showDialog(context);
                },
                child: SuccessSnakBar(
                    predictionLabel: predictionLabel,
                    predictionConfidence: predictionConfidence),
              )
            : ErrorSnackBar(),
      ),
    );
  }

  Future<Object?> showDialog(BuildContext context) {
    Plant plant = Plants[int.parse(predictionPlantID)];
    var uuid = Uuid().v4();
    return showGeneralDialog(
        context: context,
        pageBuilder: (context, animation, secondaryAnimation) => Container(
              child: Scaffold(
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
                            Container(
                              height: MediaQuery.of(context).size.height * 0.45,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30)),
                                  image: DecorationImage(
                                      image: FileImage(image),
                                      fit: BoxFit.cover),
                                  boxShadow: [
                                    BoxShadow(
                                        color: shadowColor.withOpacity(0.6),
                                        blurRadius: 30,
                                        offset: Offset(-6, 5))
                                  ]),
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
                                    Icons.save,
                                    color:btnColor,
                                    size: 27,
                                  ),
                                  onPressed: () async {
                                    like();
                                    print("save clicked $liked");
                                    String url= await uploadImage(image);
                                    await setPrediction(uuid , url, int.parse(predictionPlantID), predictionConfidence);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('you saved this prediction.'))
                                    );
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
              )),
            ));
  }
}
