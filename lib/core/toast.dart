
// ignore_for_file: depend_on_referenced_packages

import 'extensions.dart';
import 'theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToastFlutter(msg,
    {ToastGravity gravity = ToastGravity.TOP, Color color = kcGreen}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: gravity,
    timeInSecForIosWeb: 3,
    webShowClose: true,
    webPosition: gravity == ToastGravity.TOP ? "right" : "center",
    webBgColor:
        "linear-gradient(to right, ${color.toHex().replaceFirst("#ff", "#")}, ${color.toHex().replaceFirst("#ff", "#")})",
    backgroundColor: color,
    textColor: kcWhite,
    fontSize: 16.0,
  );
}