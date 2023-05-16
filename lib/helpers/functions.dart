import 'package:flutter/material.dart';

String getCurrentDate() {
  var now = DateTime.now();
  var monthNames = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',
    'September', 'October', 'November', 'December'
  ];
  
  var month = monthNames[now.month - 1];
  var day = now.day.toString();
  var year = now.year.toString();
  
  return '$month $day, $year';
}

enum Status{
  idle,
  failure,
  success,
  loading
}


String insertSlash(String input) {
  StringBuffer buffer = StringBuffer();
  
  for (int i = 0; i < input.length; i += 2) {
    if (i + 2 <= input.length) {
      buffer.write(input.substring(i, i + 2));
      if (i + 2 < input.length) {
        buffer.write('/');
      }
    }
  }
  
  return buffer.toString();
}





