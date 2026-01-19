import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonText, this.onPressed});

  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
        color: theme.colorScheme.primary,
        onPressed: onPressed,
        child: FadeInUp(
          delay: const Duration(milliseconds: 400),
          duration: const Duration(milliseconds: 1000),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 16,
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
        ),
      ),
    );
  }
}
