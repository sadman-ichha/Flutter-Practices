// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDemo extends StatefulWidget {
  @override
  State<SharedPreferencesDemo> createState() => _SharedPreferencesDemoState();
}

class _SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  int counter = 0;

 void increment() async {
    SharedPreferences sharedPre = await SharedPreferences.getInstance();
    setState(() {
      counter++;
      sharedPre.setInt("count", counter);
    });
  }

  decrement() async {
    SharedPreferences sharedPre = await SharedPreferences.getInstance();
    setState(() {
      counter--;
      sharedPre.setInt("count", counter);
    });
  }

  @override
  void initState() {
    loadCounter();
    super.initState();
  }

  loadCounter() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    setState(() {
      counter = sharedPref.getInt("count") ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 5,
          title: Text("Shared Preferences Demo",
              style: Theme.of(context).textTheme.bodyMedium)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "You have Clicked $counter Times",
            style: TextStyle(fontSize: 20),
          )),
          SizedBox(height: 30.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  increment();
                },
                child: Text("+"),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(width: 35.0),
              ElevatedButton(
                onPressed: () {
                  decrement();
                },
                child: Text("-"),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
