import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../domain/model/task.dart';

class Task extends StatelessWidget {
  const Task({required this.task});
final Taskk task;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black.withOpacity(0.15))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              const SizedBox(height: 6,),
              Text(task.date,style: TextStyle(color: Colors.grey),)
            ],
          ),
        ],
      ),
    );
  }
}