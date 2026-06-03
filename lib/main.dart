// import 'package:converter/curr_convert_cuppertino.dart';
import 'package:converter/curr_converter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// for stateless widget and material app
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: CurrencyConverterApp(),
    );
  }
}

// for cupportino app
// class MyCuppertinoApp extends StatelessWidget {
//   const MyCuppertinoApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: CurrencyConverterCupertinoApp());
//   }
// }
