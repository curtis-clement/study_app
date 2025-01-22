import 'package:flutter/material.dart';
import 'package:study_app/modules/auth/screens/login_screen.dart';
import 'package:study_app/modules/auth/widgets/sign_up_form.dart';
import 'package:study_app/modules/auth/widgets/login_buttons.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign Up',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SignUpForm(
                  emailController: _emailController,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                ),
                LoginButtons(
                  formKey: _formKey,
                  primaryButtonText: 'Sign Up',
                  secondaryButtonText: 'I already have an account',
                  onConfirm: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Form is valid - you signed up!'),
                      ),
                    );
                  },
                  onSecondaryButton: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
