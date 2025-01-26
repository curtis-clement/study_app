import 'package:flutter/material.dart';

class LoginButtons extends StatelessWidget {
  final String primaryButtonText;
  final String secondaryButtonText;
  final VoidCallback onConfirm;
  final VoidCallback onSecondaryButton;

  const LoginButtons({
    super.key,
    required this.onConfirm,
    required this.primaryButtonText,
    required this.secondaryButtonText,
    required this.onSecondaryButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              elevation: WidgetStateProperty.all(0),
              backgroundColor: WidgetStateProperty.all(Colors.transparent),
              foregroundColor: WidgetStateProperty.all(
                Theme.of(context).colorScheme.primary,
              ),
            ),
            onPressed: onSecondaryButton,
            child: Text(secondaryButtonText),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                Theme.of(context).colorScheme.primary,
              ),
              foregroundColor: WidgetStateProperty.all(
                Colors.white,
              ),
            ),
            onPressed: onConfirm,
            child: Text(primaryButtonText),
          ),
        ],
      ),
    );
  }
}
