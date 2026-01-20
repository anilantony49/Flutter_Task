import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLoading = false;
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  Future<void> registerUser() async {
    if (!formKey.currentState!.validate()) return;

    if (passwordController.text != confirmPasswordController.text) {
      customSnackbar(context, 'Passwords do not match');
      return;
    }

    try {
      setState(() => isLoading = true);

      await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      nextScreenRemoveUntil(context, const HomePage());
    } on FirebaseAuthException {
      customSnackbar(context, 'Unable to create account. Please try again.');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 1000),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  if (val == null || val.isEmpty) {
                    return 'Name is required';
                  }
                  if (val.length < 2) {
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
                  if (val == null || val.isEmpty) {
                    return 'Email is required';
                  }
                  if (!RegExp(emailRegexPattern).hasMatch(val)) {
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
                  if (val == null || val.isEmpty) {
                    return 'Password is required';
                  }
                  if (!RegExp(passowrdRegexPattern).hasMatch(val)) {
                    return 'Passwords should be 8 characters, at least one number and one special character';
                  }
                  return null;
                },
                obscureText: isPasswordHidden,
                suffix: GestureDetector(
                  onTap: () {
                    setState(() {
                      isPasswordHidden = !isPasswordHidden;
                    });
                  },
                  child: Icon(
                    isPasswordHidden ? Icons.visibility_off : Icons.visibility,
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
                  if (val == null || val.isEmpty) {
                    return 'Password is required';
                  }
                  if (!RegExp(passowrdRegexPattern).hasMatch(val)) {
                    return 'Passwords should be 8 characters, at least one number and one special character';
                  }
                  return null;
                },
                obscureText: isConfirmPasswordHidden,
                suffix: GestureDetector(
                  onTap: () {
                    setState(() {
                      isConfirmPasswordHidden = !isConfirmPasswordHidden;
                    });
                  },
                  child: Icon(
                    isConfirmPasswordHidden
                        ? Icons.visibility_off
                        : Icons.visibility,
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
                    isLoading ? null : registerUser();
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
