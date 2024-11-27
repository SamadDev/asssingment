import 'package:flutter/material.dart';

// screen size helpers
double screenWidth(context) => MediaQuery.of(context).size.width;
double screenHeight(context) => MediaQuery.of(context).size.height;

bool isSm(context) => screenWidth(context) < 850;
bool isMd(context) => screenWidth(context) >= 850 && screenWidth(context) < 980;
bool isLg(context) =>
    screenWidth(context) >= 980 && screenWidth(context) < 1200;
bool isXl(context) => screenWidth(context) >= 1200;
