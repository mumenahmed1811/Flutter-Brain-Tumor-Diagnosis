
import '../helpers/design.dart';
import '../helpers/media.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'layouts/DrawerMenu.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return
                Scaffold(
                    appBar: AppBar(
                      toolbarHeight: 60,
                      title: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text("About Us",style: TextStyle(fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),),),
                              SizedBox(height:5),
                              splittedLine(context,width: 120)
                            ],)
                      ),

                    ),
                    body: Container(
                        margin: EdgeInsets.all(20),
                        child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  width: getScreenWidth(context, percentage: 0.9),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: Offset(0, 2),
                                          color: Colors.grey),
                                    ],
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10, right: 10),
                                    width: MediaQuery.of(context).size.width * 0.2,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: Text(
                                            "About Application",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        splittedLine(context,
                                            width: 200, inlineWidth: 160),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(aboutApp,style: TextStyle(color: Color.fromRGBO(159, 149, 145, 1)),)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                // Container(
                                //   padding: EdgeInsets.all(10),
                                //   width: getScreenWidth(context, percentage: 0.9),
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(30),
                                //     color: Colors.white,
                                //     boxShadow: [
                                //       BoxShadow(
                                //           spreadRadius: 1,
                                //           blurRadius: 7,
                                //           offset: Offset(0, 2),
                                //           color: Colors.grey),
                                //     ],
                                //   ),
                                //   child: Container(
                                //     padding: EdgeInsets.only(left: 10, right: 10),
                                //     width: getScreenWidth(context, percentage: 0.2),
                                //     child: Column(
                                //       mainAxisAlignment: MainAxisAlignment.end,
                                //       crossAxisAlignment: CrossAxisAlignment.start,
                                //       children: [
                                //         Container(
                                //           margin: EdgeInsets.only(top: 10),
                                //           child: Text(
                                //             "Application Team Engineers and Supervisors",
                                //             style: TextStyle(
                                //                 fontSize: 20,
                                //                 fontWeight: FontWeight.bold,
                                //                 color: Colors.black),
                                //           ),
                                //         ),
                                //         SizedBox(
                                //           height: 10,
                                //         ),
                                //         splittedLine(context,
                                //             width: 200, inlineWidth: 160),
                                //         SizedBox(
                                //           height: 20,
                                //         ),
                                //         CardImage(imgUrl:"assets/images/mumen.png",firstLine: "Eng: Mumen Ahmed Hamed",secondLine: "Android Developer"),
                                //
                                //       ],
                                //     ),
                                //   ),
                                // ),
                              ],
                            ))));
  }

  String aboutApp = """
Most brain tumors are not diagnosed until after symptoms appear.
Often a brain tumor is initially diagnosed by an internist or a
neurologist, in addition to asking the patient for a detailed medical
history and doing a physical examination and lab tests of blood,
urine, or other body fluids that can help doctors make a diagnosis.
However, abnormal lab results are not a sure sign of cancer and
spend a lot of time,
  """;
}

class CardImage extends StatelessWidget {
  final String imgUrl;
  final String firstLine;
  final String secondLine;

  CardImage({required this.imgUrl,required this.firstLine,required this.secondLine});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                shape: BoxShape.circle,
                image: DecorationImage(
                  scale: 0.0001,
                  image: AssetImage(imgUrl),
                  //fit: BoxFit.cover,
                ),
                color: Colors.black
            ),
          ),
          SizedBox(width: 10,),
          Container(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(firstLine,style: TextStyle(),),
                Text(secondLine)
              ],
            ),)
        ],
      ),);
  }
}
