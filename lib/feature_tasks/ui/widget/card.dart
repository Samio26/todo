import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height*.23,
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Keep it up! Your daily\n goals almost done",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.center,
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),

            ),
            child: Text('View Plan',style: TextStyle(fontWeight: FontWeight.bold),),
          )
        ],),
        Stack(
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: CircularProgressIndicator(
                value: 0.87,
                color: Colors.white,
                backgroundColor: Colors.grey.withOpacity(0.2),
              ),
            ),
            Positioned(
              right: 0,
              left: 25,
              top: 30,
              child: Text("87%",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),))
          ],
        )
      ],),
    );
  }
}