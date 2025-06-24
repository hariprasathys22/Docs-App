import 'package:flutter/material.dart';
import 'package:docs_ui/constants/roundedLogo/rounded_logo.dart';

class NavigationPages {
  static final List<Widget> pages = <Widget>[
    // Home Page
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedLogo(),
          SizedBox(height: 10),
          Text(
            "How may i assist you today?",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
        ],
      ),
    ),

    // Messages Page
    const Center(
      child: Text(
        'Messages Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
      ),
    ),

    // Voice Page
    const Center(
      child: Text(
        'Voice Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
      ),
    ),

    // Saved Page
    const Center(
      child: Text(
        'Saved Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
      ),
    ),

    // Profile Page
    const Center(
      child: Text(
        'Profile Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
      ),
    ),
  ];
}
