import 'package:flutter/material.dart';

class SocialsSignIn extends StatelessWidget {
  const SocialsSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SocialButton(
          text: "Continue With Apple",
          iconValue: "Apple",
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 12,
          ),
          child: _SocialButton(
            text: "Continue With Google",
            iconValue: "Google",
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 12,
          ),
          child: _SocialButton(
            text: "Continue With Facebook",
            iconValue: "Facebook",
          ),
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({required this.text, required this.iconValue});

  final String text;
  final String iconValue;

  @override
  Widget build(BuildContext context) {
    final Widget icon = (() {
      switch (iconValue) {
        case "Apple":
          return const Icon(Icons.apple, size: 24);
        case "Facebook":
          return const Icon(Icons.facebook, size: 24);
        case "Google":
          return Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Image.asset("assets/icons/google_logo.png"),
          );
        default:
          return Container();
      }
    })();

    return Ink(
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(100),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(100),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon,
              Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 25,
                width: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
