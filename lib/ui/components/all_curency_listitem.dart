
import 'package:currency_converter/model/currency_model.dart';
import 'package:flutter/material.dart';

class allcurencylistitem extends StatelessWidget {
   final Curreny_Model curreny_model;
  const allcurencylistitem({super.key, required this.curreny_model});

  @override
  Widget build(BuildContext context) {
    return Container(
         padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
         margin: EdgeInsets.all(9),
         decoration: BoxDecoration(
            color: Colors.blue.withAlpha(80),
             borderRadius: BorderRadius.circular(10)
         ),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
                curreny_model.code.toString(),
                style: TextStyle(color: Colors.white,fontSize: 17),
             ),
            Text(
               curreny_model.value?.toStringAsFixed(2).toString() ?? "",
               style: TextStyle(color: Colors.white, fontSize: 17),
            )
          ],
       ),
    );
  }
}
