import 'package:flutter/material.dart';

class CurrencyConverterCupertinoApp extends StatefulWidget {
  const CurrencyConverterCupertinoApp({super.key});

  @override
  State<CurrencyConverterCupertinoApp> createState() =>
      _CurrencyConverterCupertinoAppState();
}

class _CurrencyConverterCupertinoAppState
    extends State<CurrencyConverterCupertinoApp> {
  double result = 0;
  String errorMessage = "";
  @override
  Widget build(BuildContext context) {
    print("built");

    final TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      // scaffold provides structure to the app
      appBar: AppBar(elevation: 0, title: const Text("Currency Converter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .center, // center the column contents  vertically
          children: [
            Text(
              "NPR ${result.toString()}", //text to diaplay
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ), // styling the text
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: textEditingController,
                // keyboard type for num input
                decoration: InputDecoration(
                  hintText: "Please enter a amount in USD ",
                  suffixIcon: Icon(Icons.monetization_on), //icon at the end
                  errorText: errorMessage.isEmpty
                      ? null
                      : errorMessage, //error text to display
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (errorMessage.isEmpty) {
                      errorMessage = "please enter a value";
                      result = 0;
                    } else {
                      errorMessage = "converted";
                      result = double.parse(textEditingController.text) * 133;
                    }
                  });
                },
                child: const Text('Convert'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
