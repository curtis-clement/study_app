import 'package:flutter/material.dart';
import 'package:study_app/services/auth_service.dart';

class ConfirmLogout extends StatelessWidget {
  const ConfirmLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Logout'),
      content: Text('Are you sure you want to logout?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            AuthService().signOut();
            Navigator.of(context).pop();
          },
          child: Text('Logout'),
        ),
      ],
    );
  }
}
