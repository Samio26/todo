import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FieldDate extends StatefulWidget {
  const FieldDate({required this.hint,required this.controller});
final String hint;
final TextEditingController controller;
  @override
  State<FieldDate> createState() => _FieldDateState();
}

class _FieldDateState extends State<FieldDate> {

  
  @override
  Widget build(BuildContext context) {
      final _dateMaskFormatter = DateMaskTextInputFormatter();

    return TextFormField(
      controller: widget.controller,
      inputFormatters: [_dateMaskFormatter],
      keyboardType: TextInputType.number,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary)),
                                  hintText: widget.hint,
                                  hintStyle: TextStyle(
                                      color: Colors.black),
                                  contentPadding: EdgeInsets.only(left: 5),
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(.1),
                                ));
  }
}

class DateMaskTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      var newText = '';
      var count = 0;

      for (var i = 0; i < newValue.text.length; i++) {
        if (newValue.text[i] == '/') {
          if (count < 2) {
            newText += '/';
            count++;
          }
        } else {
          newText += newValue.text[i];
        }
      }

      return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }
    return newValue;
  }
}







