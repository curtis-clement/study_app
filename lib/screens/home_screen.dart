import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Study App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Text(
                'Aa',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ),
          ),
        ],
        
      ),
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}
