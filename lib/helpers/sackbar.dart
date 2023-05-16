import 'package:flutter/material.dart';

snackbar(BuildContext context,String content,Color color){
   ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                
                SnackBar(
                 
                  behavior:SnackBarBehavior.floating ,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  content: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsetsDirectional.all(16),
                    height: 70,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text(content,textAlign: TextAlign.center,)
                    
                    )
                ),
              );
}