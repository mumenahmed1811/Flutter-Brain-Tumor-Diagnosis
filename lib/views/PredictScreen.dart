import 'dart:io';
import 'package:graduation_project/models/Result.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../controllers/DiagnosisController.dart';
import '../helpers/design.dart';
import '../helpers/media.dart';
import '../models/HistoryResponse.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'layouts/DrawerMenu.dart';

class PredictScreen extends StatefulWidget {
  @override
  _PredictScreenState createState() => _PredictScreenState();
}

class _PredictScreenState extends State<PredictScreen> {
  Result? result;
  bool isResult = false;
  var image;
  bool isLoading = false;
  Future getImageCamera() async {
    // ignore: deprecated_member_use
    await picker
        .getImage(
      source: ImageSource.camera,
      maxHeight: 600,
      maxWidth: 480,
      imageQuality: 75,
    )
        .then((value) {
      if (value != null) {
        setState(() {
          image = new File(value.path);
          isPicked = true;
        });
      }
    });
  }

  ImagePicker picker = new ImagePicker();
  Future getImageGallery() async {
    // ignore: deprecated_member_use
    await picker
        .getImage(
      source: ImageSource.gallery,
      maxHeight: 600,
      maxWidth: 480,
      imageQuality: 75,
    )
        .then((value) {
      if (value != null) {
        setState(() {
          image = new File(value.path);
          isPicked = true;
        });
        print("done");
      } else {
        print("none");
      }
    });
  }

  bool isPicked = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        drawer: DrawerMenu(),
        appBar: AppBar(
          toolbarHeight: 60,
          title: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "Brain Tumor Diagnosis",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan),
                ),
              ),
              SizedBox(height: 5),
              splittedLine(context, width: 200)
            ],
          )),
        ),
        body: LoadingOverlay(
            opacity: 0.15,
            progressIndicator: SpinKitWave(
              color: Colors.cyan,
              size: 50.0,
            ),
            isLoading: isLoading,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          image: isPicked
                              ? DecorationImage(
                                  image: FileImage(image), fit: BoxFit.fill)
                              : null),
                      height: isResult
                          ? MediaQuery.of(context).size.height * 0.4
                          : MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: isPicked
                          ? SizedBox()
                          : Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.cyan)),
                              child: IconButton(
                                icon: Icon(
                                  Icons.cloud_upload,
                                  color: Colors.cyan,
                                  size: 100,
                                ),
                                onPressed: () {},
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    isResult
                        ? Container(
                            child: Column(
                            children: [
                              Container(
                                child: Text(
                                  "Phase 1",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: getScreenWidth(context),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ResultElement(
                                                    title: "Cnn",
                                                    data: result != null &&
                                                            result!.cnn1! != ""
                                                        ? result!.cnn1!
                                                        : "",
                                                  ),
                                                  ResultElement(
                                                      title: "Knn",
                                                      data: result != null &&
                                                              result!.knn1! !=
                                                                  ""
                                                          ? result!.knn1!
                                                          : ""),
                                                  ResultElement(
                                                      title: "Svm",
                                                      data: result != null &&
                                                              result!.svm1! !=
                                                                  ""
                                                          ? result!.svm1!
                                                          : "")
                                                ],
                                              ),
                                              Container(
                                                width: getScreenWidth(context,
                                                    percentage: 0.25),
                                                height: getScreenWidth(context,
                                                    percentage: 0.2),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    border: Border.all(
                                                        color: Colors.red)),
                                                child: Center(
                                                  child: Text(
                                                    result != null &&
                                                            result!.result1! !=
                                                                ""
                                                        ? result!.result1!
                                                        : "",
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              result != null
                                  ? result!.result1! == "No tumor"
                                      ? SizedBox(
                                          height: 50,
                                        )
                                      : Row(
                                          children: [
                                            Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    child: Text("Phase 2",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  Container(
                                                      width: getScreenWidth(
                                                          context),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              ResultElement(
                                                                title: "Cnn",
                                                                data: result !=
                                                                            null &&
                                                                        result!.cnn2 !=
                                                                            null &&
                                                                        result!.cnn2! !=
                                                                            ""
                                                                    ? result!
                                                                        .cnn2!
                                                                    : "",
                                                              ),
                                                              ResultElement(
                                                                  title: "Knn",
                                                                  data: result != null &&
                                                                          result!.knn2 !=
                                                                              null &&
                                                                          result!.knn2! !=
                                                                              ""
                                                                      ? result!
                                                                          .knn2!
                                                                      : ""),
                                                              ResultElement(
                                                                  title: "Svm",
                                                                  data: result != null &&
                                                                          result!.svm2 !=
                                                                              null &&
                                                                          result!.svm2! !=
                                                                              ""
                                                                      ? result!
                                                                          .svm2!
                                                                      : ""),
                                                            ],
                                                          ),
                                                          Container(
                                                              width:
                                                                  getScreenWidth(
                                                                      context,
                                                                      percentage:
                                                                          0.25),
                                                              height:
                                                                  getScreenWidth(
                                                                      context,
                                                                      percentage:
                                                                          0.2),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              100),
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .red)),
                                                              child: Center(
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      result != null &&
                                                                              result!.result2 != null &&
                                                                              result!.result2! != ""
                                                                          ? result!.result2!
                                                                          : "",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .red,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      "Tumor",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .red,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )
                                                                  ],
                                                                ),
                                                              ))
                                                        ],
                                                      )),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                  : SizedBox(
                                      height: 50,
                                    ),
                              SizedBox(height: 10),
                              SizedBox(
                                  width:
                                      getScreenWidth(context, percentage: 0.7),
                                  height: getScreenHeight(context,
                                      percentage: 0.07),
                                  child: customFormButton(
                                      color: Colors.white,
                                      label: 'Upload Another Image',
                                      onPressed: () {
                                        setState(() {
                                          isResult = false;
                                          isPicked = false;
                                        });
                                      },
                                      backgroundColor: Colors.cyan)),
                            ],
                          ))
                        : !isPicked
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomButton(
                                      title: "Select From Gallery",
                                      onTap: () {
                                        //Navigator.of(context).push(routeAnimated(SplashScreen()));
                                        getImageGallery();
                                      }),
                                  //SizedBox(height: 10,),
                                  CustomButton(
                                      title: "Select From Camera",
                                      onTap: () {
                                        getImageCamera();
                                      })
                                ],
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (isLoading) return;
                                        isLoading = true;

                                        DiagnosisController()
                                            .predict(
                                                context: context,
                                                filePath: image.path)
                                            .then((resultResponse) {
                                          setState(() {
                                            isLoading = false;
                                            isResult = true;
                                          });

                                          if (resultResponse!.status == true) {
                                            setState(() {
                                              result = resultResponse.data;
                                            });
                                            print(result!.result1!);
                                          } else {
                                            failAlert(
                                                context: context,
                                                msg:
                                                    "Internet Connection failure");
                                          }
                                        });
                                      });
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                spreadRadius: 2,
                                                blurRadius: 3,
                                                offset: Offset(0, 0),
                                                color: Colors.white),
                                          ],
                                          border:
                                              Border.all(color: Colors.blue),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Icon(Icons.check,
                                          color: Colors.blue, size: 40),
                                    ),
                                  ),
                                  //SizedBox(height: 10,),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isPicked = false;
                                      });
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                spreadRadius: 2,
                                                blurRadius: 3,
                                                offset: Offset(0, 0),
                                                color: Colors.white),
                                          ],
                                          border: Border.all(color: Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Icon(Icons.close,
                                          color: Colors.red, size: 40),
                                    ),
                                  )
                                ],
                              )
                  ],
                ),
              ),
            )), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final dynamic onTap;
  CustomButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width / 2.2,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 2),
                  color: getTextGreyColor()),
            ],
          ),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ));
  }
}

class ResultElement extends StatelessWidget {
  final String title;
  final String data;

  ResultElement({required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: getScreenWidth(context, percentage: 0.5),
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(color: Colors.white38),
        child: Row(
          children: [
            Container(
              child: Text(
                " $title: ",
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
            ),
            Text(
              "$data",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ));
  }
}

class PhaseResultElement extends StatelessWidget {
  final String title;
  final String data;

  PhaseResultElement({required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(color: Colors.white38),
        child: Row(
          children: [
            Container(
              child: Text(
                " $title: ",
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "$data",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
