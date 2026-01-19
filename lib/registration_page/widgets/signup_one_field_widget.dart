import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/home_page.dart';
 import 'package:flutter_task/utils/alerts_and_navigators.dart';
import 'package:flutter_task/utils/constants.dart';
import 'package:flutter_task/utils/validations.dart';
import 'package:flutter_task/widgets/custom_button_widget.dart';
import 'package:flutter_task/widgets/custom_text_form_fields_widget.dart';

class SignUpOneFieldWidget extends StatefulWidget {
  const SignUpOneFieldWidget({super.key});

  @override
  State<SignUpOneFieldWidget> createState() => _SignUpOneFieldWidgetState();
}

class _SignUpOneFieldWidgetState extends State<SignUpOneFieldWidget> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 1000),
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Create an account',
                    style: TextStyle(
                      fontSize: 20,
                      fontVariations: fontWeightW700,
                    ),
                  ),
                  kHeight(10),
                  const Text(
                    "Please enter you information and create your account.",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              kHeight(25),
              // Full name field
              CustomTxtFormField(
                hintText: 'Full name',
                controller: fullnameController,
                validator: (val) {
                  if (val!.length < 3) {
                    return 'Please enter a valid name';
                  }
                  return null;
                },
              ),
              kHeight(20),

              // Email address field
              CustomTxtFormField(
                hintText: 'Email address',
                controller: emailController,
                validator: (val) {
                  if (!RegExp(emailRegexPattern).hasMatch(val!) ||
                      val.isEmpty) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              kHeight(20),

              // Password field
              CustomTxtFormField(
                hintText: 'Password',
                controller: passwordController,
                validator: (val) {
                  if (!RegExp(passowrdRegexPattern).hasMatch(val!)) {
                    return 'Passwords should be 8 characters, at least one number and one special character';
                  }
                  return null;
                },
                obscureText: false,
                suffix: GestureDetector(
                  onTap: () {
                    // context.read<TogglePasswordCubit>().toggle();
                  },
                  child: Icon(
                    Icons.visibility,
                    size: 20,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              kHeight(20),

              // Confirm passowrd field
              CustomTxtFormField(
                hintText: 'Confirm password',
                controller: confirmPasswordController,
                validator: (val) {
                  if (!RegExp(passowrdRegexPattern).hasMatch(val!)) {
                    return 'Passwords should be 8 characters, at least one number and one special character';
                  }
                  return null;
                },
                obscureText: false,
                suffix: GestureDetector(
                  onTap: () {
                    // context.read<TogglePasswordCubit>().toggle();
                  },
                  child: Icon(
                    Icons.visibility,
                    size: 20,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              kHeight(25),

              // Register button
              CustomButton(
                buttonText: 'Register',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    nextScreen(context, HomePage());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
