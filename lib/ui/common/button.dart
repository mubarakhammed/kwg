import 'package:flutter/material.dart';
import 'package:kwg/ui/common/kwg_theme.dart';

Widget defaultButton({onPressed, text, color}) {
  return Container(
    height: 54,
    margin: const EdgeInsets.symmetric(
      vertical: 16.0,
    ),
    child: ButtonTheme(
      child: TextButton(
        onPressed: onPressed,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: PRIMARY_COLOR, fontSize: 24, fontWeight: FontWeight.w600),
        )),
      ),
    ),
    decoration: BoxDecoration(
      color: color ?? PRIMARY_COLOR,
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
