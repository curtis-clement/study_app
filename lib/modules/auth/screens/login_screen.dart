import 'package:flutter/material.dart';
import 'package:study_app/modules/auth/widgets/login_form.dart';
import 'package:study_app/modules/auth/widgets/login_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onConfirm() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      print('LOGIN');
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
              children: [
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
                // Container(
                //   margin: EdgeInsets.only(top: 12),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       ElevatedButton(
                //         style: ButtonStyle(
                //           elevation: WidgetStateProperty.all(0),
                //           backgroundColor:
                //               WidgetStateProperty.all(Colors.transparent),
                //         ),
                //         onPressed: () {
                //           Navigator.pop(context);
                //         },
                //         child: Text('I don\'t have an account'),
                //       ),
                //       ElevatedButton(
                //         style: ButtonStyle(
                //           backgroundColor: WidgetStateProperty.all(
                //             Theme.of(context).colorScheme.primary,
                //           ),
                //           foregroundColor: WidgetStateProperty.all(
                //             Colors.white,
                //           ),
                //         ),
                //         onPressed: () {
                //           if (_formKey.currentState!.validate()) {
                //             ScaffoldMessenger.of(context).showSnackBar(
                //               SnackBar(
                //                 content: Text('Logging you in!'),
                //               ),
                              
                //             );
                //           }
                //         },
                //         child: Text('Login'),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
