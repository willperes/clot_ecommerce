import 'package:clot/screens/home_screen.dart';
import 'package:clot/widgets/default_back_button.dart';
import 'package:clot/widgets/default_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInSecondStepScreen extends StatefulWidget {
  const SignInSecondStepScreen({super.key});

  static const routeName = "sign_in_second_step";

  @override
  State<SignInSecondStepScreen> createState() => _SignInSecondStepScreenState();
}

class _SignInSecondStepScreenState extends State<SignInSecondStepScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  void _handleSubmitForm(String email) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        HomeScreen.routeName,
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        leading: const DefaultBackButton(),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        children: [
          Text(
            "Sign In",
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 32),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DefaultTextField(
                  hintText: "Password",
                  controller: _passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your password";
                    }

                    return null;
                  },
                  onFieldSubmitted: (value) {
                    _handleSubmitForm(email);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    bottom: 16,
                  ),
                  child: TextButton(
                    onPressed: () {
                      _handleSubmitForm(email);
                    },
                    child: const Text("Continue"),
                  ),
                ),
                const _ClickableText(
                  initialText: "Forgot your password? ",
                  boldText: "Reset",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ClickableText extends StatelessWidget {
  const _ClickableText({required this.initialText, required this.boldText});

  final String initialText;
  final String boldText;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      style: Theme.of(context).textTheme.labelMedium,
      TextSpan(
        text: initialText,
        children: [
          TextSpan(
            text: boldText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }
}
