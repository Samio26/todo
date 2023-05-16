import 'package:flutter/cupertino.dart';


class ButtonTask extends StatelessWidget {
  const ButtonTask({required this.colorbutton,required this.label,required this.onPress});
final Color colorbutton;
final String label;
final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        width: MediaQuery.of(context).size.width*.4,
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colorbutton,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(label,style: TextStyle(fontWeight: FontWeight.w700),),
      ),
    );
  }
}