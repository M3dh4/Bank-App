import 'package:flutter/material.dart';

class Location_Page extends StatefulWidget {
  final String city;
  final List<String> locations;
  final List<String> address;
  const Location_Page({
    super.key,
    required this.city,
    required this.locations,
    required this.address,
  });

  @override
  State<Location_Page> createState() => _Location_PageState();
}

class _Location_PageState extends State<Location_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bank Locations of ${widget.city}"),
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(width:5),
            Expanded(
              child: ListView.builder(
                itemCount: widget.locations.length,
                itemBuilder: (context,index)=> Card(
                  key: ValueKey(widget.locations[index]),
                  color: Colors.grey[400],
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    title:Text(
                      widget.locations[index],
                      style: const TextStyle(color:Colors.black,fontWeight: FontWeight.bold),
                      ),
                    subtitle: Text(widget.address[index],
                    style: TextStyle(color:Colors.black),),
                  )
                ),
              ),
            ),
          ],
        ),
      )
      ),
    );
  }
}
