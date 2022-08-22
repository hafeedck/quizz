import 'package:flutter/material.dart';

const primary = Color.fromARGB(255, 36, 35, 35);
const bg = Color.fromARGB(255, 239, 236, 236);
const gry = Color(0xFF4D4D4D);
const white = Color.fromARGB(255, 245, 242, 242);
const shadow = Color(0xFF242424);

const smile = IconData(0x1F600);
const frown = IconData(0x1F61F);
const meh = IconData(0x1F628);

Widget free({double h = 20, double w = 20}) {
  return SizedBox(
    height: h,
    width: w,
  );
}
