import 'package:flutter/material.dart';

TextStyle getTitleTextStyle(BuildContext context) => TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).iconTheme.color?.withOpacity(0.9),
    );
const TextStyle kSubHeadStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
  color: Color(0xff1B1B1B),
);
const TextStyle kDarkSubHeadStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
  color: Color.fromARGB(255, 241, 241, 241),
);
const TextStyle kDescriptionStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.normal,
  color: Color(0xff1B1B1B),
);
const TextStyle kDarkDescriptionStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.normal,
  color: Color.fromARGB(255, 226, 226, 226),
);
TextStyle getDescriptionTextStyle(BuildContext context) => kDescriptionStyle;
TextStyle getSubHeadTextStyle(BuildContext context) => kSubHeadStyle;
TextStyle getSubtitleTextStyle(BuildContext context) => kSubTitleStyle;
const TextStyle kSubTitleStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.normal,
  color: Color(0xff656565),
);
const TextStyle kDarkSubTitleStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.normal,
  color: Color.fromARGB(255, 153, 153, 153),
);

BoxShadow kSubtleShadow = BoxShadow(
  blurRadius: 32,
  offset: const Offset(0, 8),
  color: Colors.black.withOpacity(0.07),
);
List getSubtleShadow(BuildContext context) => [kSubtleShadow];
BoxShadow kHighlightShadow = BoxShadow(
    blurRadius: 38,
    spreadRadius: -3,
    offset: const Offset(0, 9),
    color: const Color(0xff4898B1).withOpacity(0.75));

const double kSpacingHeight = 8.0;
const double kBorderRadius = 25.0;
const double kBottomNavbarHeight = 58;
const Color kSecondaryColor = Color(0xff4898B1);
const Color kDisabledSecondaryColor = Color(0xffB8DCE7);
Color kSeperatorColor =
    const Color.fromARGB(255, 142, 142, 142).withOpacity(0.2);
const Color kAccentColor = Color(0xffFFDB9C);
const Color kPrimaryColor = Color.fromARGB(255, 255, 255, 255);
const Color kDarkPrimaryColor = Color.fromARGB(255, 7, 7, 7);
