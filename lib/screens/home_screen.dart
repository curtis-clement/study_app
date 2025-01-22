import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, Object>> tabs = [
    {
      'title': 'Home',
      'icon': Icons.home,
    },
    {
      'title': 'Decks',
      'icon': Icons.book,
    },
    {
      'title': 'Cards',
      'icon': Icons.card_giftcard,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Row(
              children: [
                Expanded(
                  child: TabBar(
                    tabs: tabs.map((tab) => Tab(text: tab['title'] as String)).toList(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[300],
                    child: Text(
                      'A',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
