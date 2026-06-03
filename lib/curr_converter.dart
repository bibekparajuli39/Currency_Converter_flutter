import 'package:flutter/material.dart';

class CurrencyConverterApp extends StatefulWidget {
  const CurrencyConverterApp({super.key});

  @override
  State<CurrencyConverterApp> createState() => _CurrencyConverterMaterialPage();
}

class _CurrencyConverterMaterialPage extends State<CurrencyConverterApp> {
  String errorMessage = "";
  double result = 0;

  final TextEditingController textEditingController = TextEditingController();

  // Currency rates
  final Map<String, double> currencyRates = {
    "NPR": 150,
    "INR": 83,
    "EUR": 0.92,
    "GBP": 0.79,
    "JPY": 157,
  };

  String selectedCurrency = "NPR";

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void convertCurrency() {
    setState(() {
      final text = textEditingController.text.trim();
      double? value = double.tryParse(text);

      if (text.isEmpty) {
        errorMessage = "Please enter amount";
        result = 0;
      } else if (value == null) {
        errorMessage = "Enter valid number";
        result = 0;
      } else {
        errorMessage = "";
        result = value * (currencyRates[selectedCurrency] ?? 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Currency Converter"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          width: width > 600 ? 400 : width * 1.2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: const [BoxShadow(blurRadius: 8, color: Colors.black12)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: const Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.currency_exchange,
                        size: 40,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Currency Converter",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Convert USD to selected currency",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Result
              Text(
                "$selectedCurrency ${result.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // Currency Dropdown
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: DropdownButtonFormField<String>(
                  initialValue: selectedCurrency,
                  decoration: InputDecoration(
                    labelText: "Select Currency",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  items: currencyRates.keys.map((currency) {
                    return DropdownMenuItem(
                      value: currency,
                      child: Text(currency),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedCurrency = value;
                      });
                    }
                  },
                ),
              ),

              const SizedBox(height: 15),

              // TextField
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: textEditingController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter amount in USD",
                    prefixIcon: const Icon(Icons.attach_money),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorText: errorMessage.isEmpty ? null : errorMessage,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
                onPressed: convertCurrency,
                child: const Text("Convert"),
              ),
              const Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  "Note: The conversion rate is based on the current exchange rate and may vary.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 59, 59, 59),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
