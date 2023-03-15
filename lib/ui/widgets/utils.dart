import 'package:flutter/widgets.dart';

const horizontal4 = SizedBox(width: 4);
const horizontal8 = SizedBox(width: 8);
const horizontal12 = SizedBox(width: 12);
const horizontal16 = SizedBox(width: 16);
const horizontal24 = SizedBox(width: 24);
const vertical4 = SizedBox(height: 4);
const vertical8 = SizedBox(height: 8);
const vertical12 = SizedBox(height: 12);
const vertical16 = SizedBox(height: 16);

const colorLineGrey = Color(0xFFF4F5F7);
const colorLineRed = Color(0xFFEE655F);
const colorLineBlue = Color(0xFFE5E7F2);
const colorLineOrange = Color(0xFFF5A405);
const colorTextBlue = Color(0xFF32468D);
const colorTextTeal = Color(0xFF0BA6A8);
const colorTextRed = Color(0xFFEE655F);
const colorTextBlack90 = Color(0xFF29333A);
const colorTextBlack80 = Color(0xFF545C61);
const colorTextBlack60 = Color(0xFF7F8589);

void log(String msg, {String? component, String? tag}) {
  String fullMsg = msg;
  if (component != null && tag != null) {
    fullMsg = '$component:$tag - $msg';
  } else if (component != null) {
    fullMsg = '$component - $msg';
  }

  // ignore: avoid_print
  print(fullMsg);
}
