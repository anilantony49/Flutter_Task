// // ignore_for_file: use_build_context_synchronously

// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_task/utils/alerts_and_navigators.dart';
// import 'package:flutter_task/utils/constants.dart';
// import 'package:flutter_task/widgets/custom_button_widget.dart';
// import 'package:flutter_task/widgets/custom_text_form_fields_widget.dart';
// import 'package:social_book/core/theme/theme.dart';
// import 'package:social_book/core/utils/alerts_and_navigators.dart';
// import 'package:social_book/core/utils/constants.dart';
// import 'package:social_book/core/utils/ktweel_icons.dart';
// import 'package:social_book/presentation/bloc/post/post_bloc.dart';
// import 'package:social_book/presentation/bloc/profile/profile_bloc.dart';
// import 'package:social_book/presentation/bloc/user/user_bloc.dart';
// import 'package:social_book/presentation/bloc/user_sign_in/sign_in_bloc.dart';
// import 'package:social_book/presentation/cubit/toggle_password/toggle_password_cubit.dart';
// import 'package:social_book/presentation/pages/forgot_password/forget_password_page.dart';
// import 'package:social_book/presentation/pages/main/main_page.dart';
// import 'package:social_book/presentation/widgets/custom_btn.dart';
// import 'package:social_book/presentation/widgets/custom_txt_form_field.dart';

// class SignInFieldWidget extends StatefulWidget {
//   const SignInFieldWidget({super.key});

//   @override
//   State<SignInFieldWidget> createState() => _SignInFieldWidgetState();
// }

// class _SignInFieldWidgetState extends State<SignInFieldWidget> {
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();
//   final GlobalKey<FormState> formKey = GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     return  FadeInDown(
//           delay: const Duration(milliseconds: 400),
//           duration: const Duration(milliseconds: 1000),
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(40, 40, 40, 30),
//             child: Form(
//               key: formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Welcome back!',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontVariations: fontWeightW700,
//                           ),
//                         ),
//                         kHeight(10),
//                         const Text(
//                           "Enter your login details to continue.",
//                           style: TextStyle(fontSize: 15),
//                         ),
//                       ],
//                     ),
//                   ),
//                   kHeight(25),
//                   // Username field
//                   CustomTxtFormField(
//                     controller: usernameController,
//                     hintText: 'Username',
//                     validator: (value) {
//                      if (value == null || value.length < 4) {
//                     return 'Username should not be empty';
//                   }
//                       return null;
//                     },
//                   ),
//                   kHeight(20),

//                   // Password field
//                 CustomTxtFormField(
//                         controller: passwordController,
//                         hintText: 'Password',
//                         suffix: GestureDetector(
//                           onTap: () {
//                     setState(() {
//                       // isPasswordHidden = !isPasswordHidden;
//                     });
//                   },
//                           // child: Icon(
//                           //   state ? Ktweel.eye_slash : Ktweel.eye,
//                           //   size: 20,
//                           //   color: Theme.of(context).colorScheme.secondary,
//                           // ),
//                         ),
//                         // obscureText: state,
//                         validator: (value) {
//                   if (value == null || value.length < 4) {
//                     return 'Password should not be empty';
//                   }
//                           return null;

//                   kHeight(25)

//                   // Sign in button
//                   CustomButton(
//                     buttonText: 'Sign In',
//                     onPressed: () {
//                       if (formKey.currentState!.validate()) {
//                         context.read<SignInBloc>().add(
//                           UserSignInEvent(
//                             username: usernameController.text,
//                             password: passwordController.text,
//                           ),
//                         );
//                       }
//                     },
//                   ),
//                   kHeight(10),
//                   InkWell(
//                     onTap: () {
//                       nextScreen(context, const ForgotPasswordPage());
//                     },
//                     child: const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text('Forget Password?'),
//                     ),

//   }

//   void signInListener(BuildContext context, SignInState state) {
//     if (state is InvalidUsernameErrorState) {
//       customSnackbar(
//         context,
//         "Username doesn't exist",
//         leading: Ktweel.user_remove,
//         trailing: 'OK',
//       );
//     }
//     if (state is InvalidPasswordErrorState) {
//       customSnackbar(
//         context,
//         "Incorrect password",
//         leading: Ktweel.shield_cross,
//         trailing: 'OK',
//       );
//     }
//     if (state is BlockedbyAdminErrorState) {
//       customSnackbar(
//         context,
//         'You have by blocked by tweel',
//         leading: Ktweel.info_rugged,
//         trailing: 'OK',
//       );
//     }
//     if (state is UserSignInSuccessState) {
//       context.read<ProfileBloc>().add(ProfileInitialFetchEvent());
//       context.read<UserBloc>().add(FetchAllUserEvent());
//       context.read<PostBloc>().add(PostInitialFetchEvent());
//       nextScreenRemoveUntil(context, const MainPage());
//       mySystemTheme(context);
//       context.read<TogglePasswordCubit>().reset();
//     }
//     if (state is UserSignInErrorState) {
//       customSnackbar(
//         context,
//         'Please try again after some times',
//         leading: Ktweel.close_circle,
//         trailing: 'OK',
//       );
//     }
//   }
// }

// ignore_for_file: use_build_context_synchronously

import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/home_page.dart';
import 'package:flutter_task/utils/alerts_and_navigators.dart';
import 'package:flutter_task/utils/constants.dart';
import 'package:flutter_task/utils/validations.dart';
import 'package:flutter_task/widgets/custom_button_widget.dart';
import 'package:flutter_task/widgets/custom_text_form_fields_widget.dart';

class SignInFieldWidget extends StatefulWidget {
  const SignInFieldWidget({super.key});

  @override
  State<SignInFieldWidget> createState() => _SignInFieldWidgetState();
}

class _SignInFieldWidgetState extends State<SignInFieldWidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  bool isPasswordHidden = true;

  Future<void> loginUser() async {
    if (!formKey.currentState!.validate()) return;

    try {
      setState(() => isLoading = true);

      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      nextScreenRemoveUntil(context, const HomePage());
    } on FirebaseAuthException {
      customSnackbar(context, 'Invalid email or password.');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 1000),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 40, 40, 30),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome back!',
                      style: TextStyle(
                        fontSize: 20,
                        fontVariations: fontWeightW700,
                      ),
                    ),
                    kHeight(10),
                    const Text(
                      "Enter your login details to continue.",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),

              kHeight(25),

              // Email address field
              CustomTxtFormField(
                hintText: 'Email address',
                controller: emailController,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Email is required';
                  }
                  if (!RegExp(emailRegexPattern).hasMatch(val) || val.isEmpty) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),

              kHeight(20),

              /// Password
              CustomTxtFormField(
                controller: passwordController,
                hintText: 'Password',
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),

              kHeight(25),

              /// Sign In Button
              CustomButton(
                buttonText: 'Login',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    isLoading ? null : loginUser();

                    //   nextScreenRemoveUntil(context, const MainPage());
                    //   mySystemTheme(context);

                    //   setState(() {
                    //     isPasswordHidden = true;
                    //   });
                  }
                },
              ),

              kHeight(10),

              /// Forgot Password (Link only – no functionality)
              InkWell(
                onTap: () {
                  // No functionality required
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
