import 'package:flutter/material.dart';
import 'package:study_app/modules/auth/widgets/confirm_logout.dart';
import 'package:study_app/screens/cards_screen.dart';
import 'package:study_app/screens/decks_screen.dart';
import 'package:study_app/screens/home_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Map<String, Object>> tabs = [
    {
      'title': 'Home',
      'icon': Icons.home,
      'screen': HomeScreen(),
    },
    {
      'title': 'Decks',
      'icon': Icons.book,
      'screen': DecksScreen(),
    },
    {
      'title': 'Cards',
      'icon': Icons.file_copy,
      'screen': CardsScreen(),
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
                    tabs: tabs
                        .map((tab) => Tab(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(tab['icon'] as IconData),
                                  SizedBox(width: 4),
                                  Text(tab['title'] as String),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ConfirmLogout();
                        },
                      );
                    },
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
                ),
              ],
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: TabBarView(
          children: tabs.map((tab) => tab['screen'] as Widget).toList(),
        ),
      ),
    );
  }
}
