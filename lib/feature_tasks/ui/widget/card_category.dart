import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CardCategory extends StatelessWidget {
  const CardCategory({required this.icon,required this.categ});
final IconData icon;
final String categ;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width*0.44,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.09),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                shape: BoxShape.circle
              ),
              child: Icon(icon),
            ),
            const SizedBox(width: 7,),
            Text(categ,style: TextStyle(fontWeight: FontWeight.bold),),
          ],),
          const SizedBox(height: 8,),
           Text("3 plan remaining"),
           const SizedBox(height: 8,),

           Text("Go to plan",style: TextStyle(color: Colors.blueAccent),)


        ],
      ),
    );
  }
}