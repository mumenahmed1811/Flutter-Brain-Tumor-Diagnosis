import 'package:graduation_project/helpers/data.dart';
import 'package:graduation_project/models/HistoryElement.dart';
import 'package:graduation_project/models/Result.dart';
import 'package:flutter/material.dart';
import '../History/HistoryModel.dart';

class HistoryItem extends StatelessWidget {
  final Result item;

  HistoryItem(this.item);

  @override
  Widget build(BuildContext context) {
    return CustomItem(item);
  }
}

class CustomItem extends StatelessWidget {
  final Result item;
  CustomItem(this.item);

  @override
  Widget build(BuildContext context) {
    print(imgPreUrl()+item.imgPath!);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: Row(
        children: [
          Expanded(
              flex : 2,
              child: Image.network(
                imgPreUrl()+item.imgPath!,
                width: MediaQuery.of(context).size.width*0.5,
                height: MediaQuery.of(context).size.height*0.15,
              )
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Does the patient have tumor?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                RichText(
                    text : TextSpan( text :  "CNN : ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan( text: item.cnn1,
                            style: TextStyle(color: getResultColor(item.cnn1!), fontWeight: FontWeight.normal))
                      ]
                    )
                ),
                RichText(
                    text : TextSpan( text :  "SVM : ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan( text: item.svm1,
                              style: TextStyle(color: getResultColor(item.svm1!),fontWeight: FontWeight.normal))
                        ]
                    )
                ),
                RichText(
                    text : TextSpan( text :  "KNN : ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan( text: item.knn1!,
                              style: TextStyle(color: getResultColor(item.knn1!), fontWeight: FontWeight.normal))
                        ]
                    )
                ),
                RichText(
                    text : TextSpan( text :  "Final Result: ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan( text: item.result1!,
                              style: TextStyle(color: getResultColor(item.knn1!), fontWeight: FontWeight.normal))
                        ]
                    )
                ),
                Text("Type of the tumor:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17) ),
                RichText(
                    text : TextSpan( text :  "CNN : ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan( text: item.cnn2 , style: TextStyle(fontWeight: FontWeight.normal))
                        ]
                    )
                ),
                RichText(
                    text : TextSpan( text :  "SVM : ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan( text: item.svm2, style: TextStyle(fontWeight: FontWeight.normal) )
                        ]
                    )
                ),
                RichText(
                    text : TextSpan( text :  "KNN : ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan( text: item.knn2, style: TextStyle(fontWeight: FontWeight.normal))
                        ]
                    )
                ),
                RichText(
                    text : TextSpan( text :  "Final Result: ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan( text: item.result2,
                              style: TextStyle(color: getResultColor(item.result2!), fontWeight: FontWeight.normal))
                        ]
                    )
                )
              ],
            )
          )
        ],
      ),
    );
  }

  getResultColor(String string) {
    if(string == "Have tumor")
      return Color.fromRGBO(255, 0, 0, 1);
    else if(string == "No tumor")
      return Color.fromRGBO(50,205,50, 1);
    else
      return Color.fromRGBO(0, 0, 0, 1);
  }


}

