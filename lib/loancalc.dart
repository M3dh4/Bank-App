import 'package:flutter/material.dart';

class LoanCalcPage extends StatefulWidget {
  const LoanCalcPage({super.key});

  @override
  State<LoanCalcPage> createState() => _LoanCalcPageState();
}

class _LoanCalcPageState extends State<LoanCalcPage> {
  TextEditingController _princet = TextEditingController();
  TextEditingController _ratet = TextEditingController();
  TextEditingController _yeart = TextEditingController();
  double _loan = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loan Calculator"),
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
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 75),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(5, 7, 150, .4),
                        blurRadius: 10,
                        offset: Offset(0, 10))
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                      child: TextField(
                        controller: _princet,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Principal Amount",
                          labelStyle: TextStyle(color: Colors.grey),
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                      child: TextField(
                        controller: _ratet,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Rate Of Interest",
                          labelStyle: TextStyle(color: Colors.grey),
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                      child: TextField(
                        controller: _yeart,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "No. of Years",
                          labelStyle: TextStyle(color: Colors.grey),
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[500],
                    ),
                    onPressed: () {
                      String principalText = _princet.text;
                      String rateText = _ratet.text;
                      String yearsText = _yeart.text;
                      if (principalText.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Container(
                                      padding: const EdgeInsets.all(5),
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.check_circle_outline,color: Colors.white,),
                                          SizedBox(width: 5),
                                          Text("Principle amount is required."),
                                        ],
                                      )
                                    ),
                                    backgroundColor: Colors.transparent,
                                    elevation: 10,
                                  ),
                                );
                                return;
                      }
                      if (double.tryParse(principalText) == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Container(
                                      padding: const EdgeInsets.all(5),
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.check_circle_outline,color: Colors.white,),
                                          SizedBox(width: 5),
                                          Text("Principle Amount must be valid number"),
                                        ],
                                      )
                                    ),
                                    backgroundColor: Colors.transparent,
                                    elevation: 10,
                                  ),
                                );
                                return;
                      }

                      if (rateText.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Container(
                                      padding: const EdgeInsets.all(5),
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.check_circle_outline,color: Colors.white,),
                                          SizedBox(width: 5),
                                          Text("Rate of Interest is required."),
                                        ],
                                      )
                                    ),
                                    backgroundColor: Colors.transparent,
                                    elevation: 10,
                                  ),
                                );
                                return;
                      }
                      if (double.tryParse(rateText) == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Container(
                                      padding: const EdgeInsets.all(5),
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.check_circle_outline,color: Colors.white,),
                                          SizedBox(width: 5),
                                          Text("Rate of Interest must be valid number"),
                                        ],
                                      )
                                    ),
                                    backgroundColor: Colors.transparent,
                                    elevation: 10,
                                  ),
                                );
                                return;
                      }

                      if (yearsText.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Container(
                                      padding: const EdgeInsets.all(5),
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.check_circle_outline,color: Colors.white,),
                                          SizedBox(width: 5),
                                          Text("No. of Years is required."),
                                        ],
                                      )
                                    ),
                                    backgroundColor: Colors.transparent,
                                    elevation: 10,
                                  ),
                                );
                                return;
                      }
                      if (int.tryParse(yearsText) == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Container(
                                      padding: const EdgeInsets.all(5),
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.check_circle_outline,color: Colors.white,),
                                          SizedBox(width: 5),
                                          Text("No. of Years must be a valid number"),
                                        ],
                                      )
                                    ),
                                    backgroundColor: Colors.transparent,
                                    elevation: 10,
                                  ),
                                );
                                return;
                      }

                      // Calculate loan
                      double principal = double.parse(principalText);
                      double rate = double.parse(rateText);
                      int years = int.parse(yearsText);

                      setState(() {
                        double interest = (principal * rate * years) / 100;
                        _loan = principal + interest;
                      });
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(5, 7, 150, .4),
                        blurRadius: 10,
                        offset: Offset(0, 10))
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Loan Amount: $_loan",
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
