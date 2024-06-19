import 'package:flutter/material.dart';

const red = Color(0xffff606d);
const pink = Color(0xffd468cc);
const blue = Color(0xff4a82ff);

const gradient = LinearGradient(colors: [
  red, pink, blue
],
);
final lightGradient = LinearGradient(colors: [
  red.withAlpha(200), pink.withAlpha(200), blue.withAlpha(200)
],
);

class SmallTextStyle extends TextStyle{
  const SmallTextStyle({super.color, bool isBold = false}): super(
    fontSize: 14.0,
    fontWeight: FontWeight.bold
  );
}

class MediumTextStyle extends TextStyle{
  const MediumTextStyle({super.color, bool isBold = false}): super(
    fontSize: 16.0,
    fontWeight: FontWeight.bold
  );
}
class LargeTextStyle extends TextStyle{
  const LargeTextStyle({super.color, bool isBold = false}): super(
    fontSize: 20.0,
    fontWeight: FontWeight.bold
  );
}

const verticalSpace20 = SizedBox(height: 20,);
const verticalSpace10 = SizedBox(height: 20,);
const horizontalSpace20 = SizedBox(width: 20,);
const horizontalSpace10 = SizedBox(width: 20,);