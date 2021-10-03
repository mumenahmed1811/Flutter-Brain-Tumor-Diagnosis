import 'package:graduation_project/controllers/DiagnosisController.dart';
import 'package:graduation_project/helpers/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';
import '../History/body.dart';
import '../History/history_item_list_generator.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List list = [];
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DiagnosisController().getHistory(context: context).then((historyResponse) {
      if(historyResponse!.status!){
        list = historyResponse.data!;
        setState(() {
          isLoading = false;
        });

      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        toolbarHeight: 60,
        title: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text("History",style: TextStyle(fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),),),
                SizedBox(height:5),
                splittedLine(context,width: 120)
              ],)
        ),

      ),
      // AppBar(
      //   backgroundColor: Colors.white70,
      //   elevation: 0,
      //
      //   title: Text("History", style: TextStyle(color: Colors.black),),
      // ),
      body: LoadingOverlay(
    opacity: 0.15,
    progressIndicator: SpinKitWave(
    color: Colors.cyan,
    size: 50.0,
    ),
    isLoading: isLoading,
    child:list.length != 0? HistoryItemListGenerator(myList: list,):Center(child: Container(
      child: Text("No History yet"),
    ),
    )),
      backgroundColor: Colors.white,
    );
  }
}
