import 'package:flutter/material.dart';
import 'location.dart';

class BanklocPage extends StatefulWidget {
  const BanklocPage({super.key});

  @override
  State<BanklocPage> createState() => _BanklocPageState();
}

class _BanklocPageState extends State<BanklocPage> {
  List<Map<String, dynamic>> _cities = [
  {
    "id": 1,
    "city": "Mumbai",
    "locations": ["Thane", "Kandivali", "Colaba", "Versova", "Andheri"],
    "address": [
      "Area 2, 123 Main Street, Thane, Mumbai-PIN4321",
      "Area 4, 456 Elm Street, Kandivali, Mumbai-PIN8765",
      "Area 1, 789 Maple Avenue, Colaba, Mumbai-PIN3412",
      "Area 3, 456 Oak Lane, Versova, Mumbai-PIN5678",
      "Area 5, 123 Pine Road, Andheri, Mumbai-PIN9876"
    ]
  },
  {
    "id": 2,
    "city": "Delhi",
    "locations": ["Defence Colony", "Shreshtha Vihar", "Kirti Nagar", "Punjabi Bagh", "Vasant Vihar"],
    "address": [
      "Area 3, 101 Oak Drive, Defence Colony, Delhi-PIN2345",
      "Area 5, 202 Pine Road, Shreshtha Vihar, Delhi-PIN6789",
      "Area 2, 303 Birch Lane, Kirti Nagar, Delhi-PIN1234",
      "Area 4, 789 Maple Avenue, Punjabi Bagh, Delhi-PIN4321",
      "Area 1, 123 Main Street, Vasant Vihar, Delhi-PIN5432"
    ]
  },
  {
    "id": 3,
    "city": "Bengaluru",
    "locations": ["Koramangala", "Electronic City", "Malleshwaram", "Whitefield", "Indiranagar"],
    "address": [
      "Area 4, 456 Elm Street, Koramangala, Bengaluru-PIN5678",
      "Area 1, 789 Maple Avenue, Electronic City, Bengaluru-PIN9102",
      "Area 5, 123 Main Street, Malleshwaram, Bengaluru-PIN3456",
      "Area 2, 303 Birch Lane, Whitefield, Bengaluru-PIN6789",
      "Area 3, 101 Oak Drive, Indiranagar, Bengaluru-PIN2345"
    ]
  },
  {
    "id": 4,
    "city": "Chennai",
    "locations": ["Anna Nagar", "Besant Nagar", "Kilpauk", "T Nagar", "Adyar"],
    "address": [
      "Area 3, 202 Pine Road, Anna Nagar, Chennai-PIN8765",
      "Area 2, 101 Oak Drive, Besant Nagar, Chennai-PIN5432",
      "Area 4, 303 Birch Lane, Kilpauk, Chennai-PIN2341",
      "Area 5, 789 Maple Avenue, T Nagar, Chennai-PIN5678",
      "Area 1, 123 Main Street, Adyar, Chennai-PIN4321"
    ]
  },
  {
    "id": 5,
    "city": "Kolkata",
    "locations": ["Salt Lake", "New Town", "Park Street", "Alambazar", "Ballygunge"],
    "address": [
      "Area 1, 123 Main Street, Salt Lake, Kolkata-PIN6789",
      "Area 5, 789 Maple Avenue, New Town, Kolkata-PIN3456",
      "Area 3, 456 Elm Street, Park Street, Kolkata-PIN9102",
      "Area 2, 303 Birch Lane, Alambazar, Kolkata-PIN2345",
      "Area 4, 101 Oak Drive, Ballygunge, Kolkata-PIN5678"
    ]
  },
  {
    "id": 6,
    "city": "Hyderabad",
    "locations": ["Area 4", "Area 1", "Area 5", "Banjara Hills", "Hitech City"],
    "address": [
      "Area 4, 456 Elm Street, Area 4, Hyderabad-PIN5678",
      "Area 1, 789 Maple Avenue, Area 1, Hyderabad-PIN4321",
      "Area 5, 123 Main Street, Area 5, Hyderabad-PIN1234",
      "Area 2, 303 Birch Lane, Banjara Hills, Hyderabad-PIN9102",
      "Area 3, 101 Oak Drive, Hitech City, Hyderabad-PIN6789"
    ]
  },
  {
    "id": 7,
    "city": "Pune",
    "locations": ["Area 3", "Area 2", "Area 1", "Kothrud", "Hinjewadi"],
    "address": [
      "Area 3, 303 Birch Lane, Area 3, Pune-PIN8765",
      "Area 2, 101 Oak Drive, Area 2, Pune-PIN5432",
      "Area 1, 202 Pine Road, Area 1, Pune-PIN2341",
      "Area 4, 456 Elm Street, Kothrud, Pune-PIN3456",
      "Area 5, 789 Maple Avenue, Hinjewadi, Pune-PIN5678"
    ]
  },
  {
    "id": 8,
    "city": "Ahmedabad",
    "locations": ["Gandhinagar", "Satellite", "Maninagar", "Naranpura", "Vastrapur"],
    "address": [
      "Area 1, 123 Main Street, Gandhinagar, Ahmedabad-PIN9876",
      "Area 2, 456 Elm Street, Satellite, Ahmedabad-PIN5432",
      "Area 3, 789 Maple Avenue, Maninagar, Ahmedabad-PIN3456",
      "Area 4, 303 Birch Lane, Naranpura, Ahmedabad-PIN6789",
      "Area 5, 101 Oak Drive, Vastrapur, Ahmedabad-PIN2345"
    ]
  },
  {
    "id": 9,
    "city": "Jaipur",
    "locations": ["C-Scheme", "Bani Park", "Malviya Nagar", "Vaishali Nagar", "Jagatpura"],
    "address": [
      "Area 4, 101 Oak Drive, C-Scheme, Jaipur-PIN5678",
      "Area 2, 303 Birch Lane, Bani Park, Jaipur-PIN2345",
      "Area 1, 789 Maple Avenue, Malviya Nagar, Jaipur-PIN6789",
      "Area 3, 123 Main Street, Vaishali Nagar, Jaipur-PIN4321",
      "Area 5, 456 Elm Street, Jagatpura, Jaipur-PIN9102"
    ]
  },
  {
    "id": 10,
    "city": "Lucknow",
    "locations": ["Hazratganj", "Gomti Nagar", "Indira Nagar", "Aliganj", "Chinhat"],
    "address": [
      "Area 1, 202 Pine Road, Hazratganj, Lucknow-PIN1234",
      "Area 3, 789 Maple Avenue, Gomti Nagar, Lucknow-PIN5678",
      "Area 2, 101 Oak Drive, Indira Nagar, Lucknow-PIN9102",
      "Area 4, 303 Birch Lane, Aliganj, Lucknow-PIN2345",
      "Area 5, 456 Elm Street, Chinhat, Lucknow-PIN6789"
    ]
  },
  {
    "id": 11,
    "city": "Surat",
    "locations": ["Adajan", "Vesu", "Nanpura", "Udhna", "Olpad"],
    "address": [
      "Area 3, 456 Elm Street, Adajan, Surat-PIN8765",
      "Area 1, 789 Maple Avenue, Vesu, Surat-PIN2341",
      "Area 4, 101 Oak Drive, Nanpura, Surat-PIN6789",
      "Area 2, 303 Birch Lane, Udhna, Surat-PIN5432",
      "Area 5, 123 Main Street, Olpad, Surat-PIN9102"
    ]
  },
  {
    "id": 12,
    "city": "Chandigarh",
    "locations": ["Sector 17", "Sector 35", "Mohali", "Panchkula", "Zirakpur"],
    "address": [
      "Area 2, 123 Main Street, Sector 17, Chandigarh-PIN4321",
      "Area 5, 789 Maple Avenue, Sector 35, Chandigarh-PIN8765",
      "Area 3, 456 Elm Street, Mohali, Chandigarh-PIN9102",
      "Area 4, 101 Oak Drive, Panchkula, Chandigarh-PIN5678",
      "Area 1, 303 Birch Lane, Zirakpur, Chandigarh-PIN2345"
    ]
  }
];

  List<Map<String, dynamic>> _searched = [];

  @override
  @override
  void initState() {
    _searched = _cities;
    super.initState();
  }

  void _runFilter(String enteredword) {
    List<Map<String, dynamic>> _result = [];
    if (enteredword.isEmpty) {
      _result = _cities;
    } else {
      _result = _cities
          .where((user) =>
              user["city"].toLowerCase().contains(enteredword.toLowerCase()))
          .toList();
    }

    setState(() {
      _searched = _result;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bank Locator"),
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
            children: [
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Search your city",
                  labelStyle: TextStyle(color: Colors.black),
                  suffixIcon: const Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _searched.length,
                  itemBuilder: (context, index) => Padding(
                    key: ValueKey(_searched[index]["id"]),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        backgroundColor: Colors.red[400],
                        elevation: 4,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Location_Page(
                              city: _cities[index]["city"],
                              locations: _cities[index]["locations"],
                              address: _cities[index]["address"],
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            _searched[index]["id"].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Text(
                            _searched[index]["city"],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
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
