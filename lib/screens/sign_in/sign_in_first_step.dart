import 'package:clot/screens/sign_in/sign_in_second_step.dart';
import 'package:clot/widgets/default_text_form_field.dart';
import 'package:clot/widgets/sign_in/socials_sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInFirstStep extends StatefulWidget {
  const SignInFirstStep({super.key});

  static const routeName = "sign_in_first_step";

  @override
  State<SignInFirstStep> createState() => _SignInFirstStepState();
}

class _SignInFirstStepState extends State<SignInFirstStep> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  void _handleSubmitForm() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      Navigator.pushNamed(
        context,
        SignInSecondStep.routeName,
        arguments: _emailController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        children: [
          Text(
            "Sign In",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 32),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DefaultTextField(
                  hintText: "Email Address",
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a valid email";
                    }

                    return null;
                  },
                  onFieldSubmitted: (value) {
                    _handleSubmitForm();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    bottom: 16,
                  ),
                  child: TextButton(
                    onPressed: () {
                      _handleSubmitForm();
                    },
                    child: const Text("Continue"),
                  ),
                ),
                const _ClickableText(
                  initialText: "Dont have an Account? ",
                  boldText: "Create One",
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 70),
                  child: SocialsSignIn(),
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
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print("Clicked");
              },
          ),
        ],
      ),
    );
  }
}
