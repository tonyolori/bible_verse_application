import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData kdarkTheme = ThemeData.dark().copyWith(
  primaryColor: Color(0xFF0A0E21),
  scaffoldBackgroundColor: Color(0xFF0A0E21),
  textTheme: Typography.whiteRedwoodCity,
);

const kActiveCardColour = Color(0xFF1D1E33);
const kInactiveCardColour = Color(0xFF111328);
const ktextstyle = TextStyle(
  fontSize: 22, //fontWeight: FontWeight.bold
);
const kIconSize = 36.0;

const kfavoriteRounded = Icon(
  Icons.favorite_rounded,
  color: Colors.red,
  size: kIconSize,
);
const kFavouriteOutlined = Icon(
  Icons.favorite_outline,
  size: kIconSize,
);

                             
// ThemeData(
//         colorScheme: const ColorScheme.dark().copyWith(
//           primary: Colors.white,
//         ),
//         textTheme: const TextTheme(
          
//         ),
//         primarySwatch: Colors.blue,
//       );

      