import 'package:flutter/material.dart';
import '../History/history_item.dart';

class HistoryItemListGenerator extends StatelessWidget {

  final List myList;
  const HistoryItemListGenerator({required this.myList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: ListView.builder(
          itemCount: myList.length,
          itemBuilder: (context, index) {
        return HistoryItem(
            myList[index]
        );
      }
      ),
    );
  }
}
