import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Convpage extends StatefulWidget {
  const Convpage({super.key});

  @override
  State<Convpage> createState() => _ConvpageState();
}

class _ConvpageState extends State<Convpage> {
  String fromcurrency = "USD";
  String tocurrency = "EUR";
  double rate = 0.0;
  double total = 0.0;
  TextEditingController amtc = TextEditingController();
  List<String> currencies = [];

  @override
  void initState() {
    super.initState();
    _getCurrency();
  }

  Future<void> _getCurrency() async {
    try {
      var response = await http
          .get(Uri.parse("https://api.exchangerate-api.com/v4/latest/USD"));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          currencies = (data['rates'] as Map<String, dynamic>).keys.toList();
          rate = data['rates'][tocurrency] ?? 1.0;
        });
      } else {
        print("Failed to fetch currencies: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching currencies: $e");
    }
  }

  Future<void> _getRate() async {
    try {
      var response = await http.get(Uri.parse(
          "https://api.exchangerate-api.com/v4/latest/$fromcurrency"));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          rate = data['rates'][tocurrency] ?? 1.0;
          _updateTotal();
        });
      } else {
        print("Failed to fetch rate: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching rate: $e");
    }
  }

  void _updateTotal() {
    setState(() {
      double amount = double.tryParse(amtc.text) ?? 0.0;
      total = amount * rate;
    });
  }

  void _swapCurrency() {
    setState(() {
      String temp = fromcurrency;
      fromcurrency = tocurrency;
      tocurrency = temp;
      _getRate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency Converter"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade900,
              Colors.blue.shade500,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Image.asset(
                    "images/conver.png",
                    width: MediaQuery.of(context).size.width / 3,
                  ),
                ),
                
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: TextField(
                    controller: amtc,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      labelText: "Amount",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelStyle: const TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      _updateTotal();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 100,
                        child: DropdownButton(
                          value: fromcurrency,
                          isExpanded: true,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          dropdownColor: const Color(0xFF1d2630),
                          items: currencies.map(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                          onChanged: (newValue) {
                            setState(
                              () {
                                fromcurrency = newValue!;
                                _getRate();
                              },
                            );
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: _swapCurrency,
                        icon: const Icon(
                          Icons.swap_horiz,
                          size: 40,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: DropdownButton(
                          value: tocurrency,
                          isExpanded: true,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          dropdownColor: const Color(0xFF1d2630),
                          items: currencies.map(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                          onChanged: (newValue) {
                            setState(
                              () {
                                tocurrency = newValue!;
                                _getRate();
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Rate: $rate",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    total == 0.0 ? "Enter amount" : total.toStringAsFixed(3),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
