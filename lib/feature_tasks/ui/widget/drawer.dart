

import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/onBoard.png"),
                ),
                const SizedBox(height: 15,),
                Text("Sami Aissa"),
                Text("aissasemi2@gmail.com")
              ],
            ),
          ),
          const SizedBox(height: 30,),
                    Divider(),

          Column(
            children: [
              ListTile(
                leading: Icon(Icons.punch_clock),
                title: Text("Calender"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings")
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text("Shares"),
              )
            ],
          )
        ],
      ),
    );
  }
}