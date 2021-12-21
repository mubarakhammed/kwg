import 'package:flutter/material.dart';
import 'package:kwg/ui/common/kwg_theme.dart';

TextStyle headerStyle() =>
    TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Alata', fontSize: 16);

TextStyle greylabelStyle() =>
    TextStyle(fontSize: 10, fontFamily: 'Poppins', color: GREY);

//Screen helper

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
