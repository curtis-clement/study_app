import 'package:flutter/material.dart';
import 'package:study_app/modules/auth/widgets/login_form.dart';
import 'package:study_app/modules/auth/widgets/login_buttons.dart';
import 'package:study_app/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _isAuthenticating = false;

  void _onConfirm() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    setState(() {
      _isAuthenticating = true;
    });

    try {
      await AuthService().signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Authentication failed. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isAuthenticating = false;
        });
      }
    }
  }

  void _onSecondaryButton() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
              children: _isAuthenticating
                  ? [
                      Text('Authenticating...'),
                      CircularProgressIndicator(),
                    ]
                  : [
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      LoginForm(
                        formKey: _formKey,
                        emailController: _emailController,
                        passwordController: _passwordController,
                      ),
                      LoginButtons(
                        primaryButtonText: 'Login',
                        secondaryButtonText: 'I don\'t have an account',
                        onConfirm: _onConfirm,
                        onSecondaryButton: _onSecondaryButton,
                      ),
                    ],
            ),
          ),
        ),
      ),
    );
  }
}
