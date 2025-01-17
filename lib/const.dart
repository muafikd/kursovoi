import 'package:flutter/material.dart';

const kPimaryColor = Color(0xffF7BB0E);
const kActionColor = Color(0xffF00000);
const kBackgroundColor = Color(0xff29282C);

const kMovieNameStyle =
    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white);

final kMainTextStyle = const TextStyle(
    color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold);

final kSmallMainTextStyle = const TextStyle(
    color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold);

final kPromaryColorTextStyle =
    const TextStyle(color: kPimaryColor, fontSize: 18.0, fontWeight: FontWeight.bold);

final BoxDecoration kRoundedFadedBorder = BoxDecoration(
    border: Border.all(color: Colors.white54, width: .5),
    borderRadius: BorderRadius.circular(15.0));

final ThemeData theme = ThemeData.dark().copyWith(
  textTheme: const TextTheme(
    // headline6: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold), // used for titles
    bodyLarge: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold), // larger body text
    bodyMedium: TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.normal), // medium body text
    bodySmall: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.normal), // smaller body text
  ),
);
