import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Common {
  static Widget button(
      {required String text, Color? color, GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(text,style:const  TextStyle(fontSize: 15),),
      ),
    );
  }
}
