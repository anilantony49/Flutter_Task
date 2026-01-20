// ignore_for_file: deprecated_member_use

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/login_page/login_page.dart';
import 'package:flutter_task/utils/alerts_and_navigators.dart';
 import 'package:flutter_task/widgets/custom_button_widget.dart';
 
class SignUpWidgets {
  static FadeInUp signInNavigate(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 1000),
      child: InkWell(
        onTap: () {
          nextScreenRemoveUntil(context, const LoginPage());
        },
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Already have an account? ",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              TextSpan(
                text: 'Sign In.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //   static Future<dynamic> validateEmail({
  //     BuildContext? context,
  //     String? email,
  //     String? phoneNo,
  //     String? fullName,
  //     String? accountType,
  //     String? password,
  //     String? username,
  //     TextEditingController? otpController,
  //   }) {
  //     final GlobalKey<FormState> formKey = GlobalKey();
  //     changeSystemThemeOnPopup(
  //       context: context!,
  //       color: Theme.of(context).colorScheme.surfaceVariant,
  //     );
  //     return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           backgroundColor: Theme.of(context).colorScheme.surface,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           title: Text(
  //             'Verification',
  //             style: TextStyle(
  //               fontVariations: fontWeightW600,
  //               color: Theme.of(context).colorScheme.primary,
  //             ),
  //           ),
  //           content: const Text(
  //             'A 6 - Digit OTP has been sent to your email address, enter it below to continue',
  //           ),
  //           actions: [

  //                 // if (state is UserSignUpSuccessState) {
  //                 //   context.read<ProfileBloc>().add(ProfileInitialFetchEvent());
  //                 //   context.read<UserBloc>().add(FetchAllUserEvent());
  //                 //   context.read<PostBloc>().add(PostInitialFetchEvent());
  //                 //   nextScreenRemoveUntil(context, const LoginPage());
  //                 //   mySystemTheme(context);
  //                 //   // context.read<TogglePasswordCubit>().reset();
  //                 // }
  //                 // if (state is UsernameExistsErrorState) {
  //                 //   debugPrint('Username already exists');
  //                 //   Navigator.pop(context);
  //                 //   customSnackbar(
  //                 //     context,
  //                 //     'Username already exists',
  //                 //     leading: Ktweel.user_remove,
  //                 //     trailing: 'OK',
  //                 //   );
  //                 // }
  //                 // if (state is EmailExistsErrorState) {
  //                 //   debugPrint('Email already exists');
  //                 //   Navigator.pop(context);
  //                 //   customSnackbar(
  //                 //     context,
  //                 //     'Email already exists',
  //                 //     leading: Ktweel.info_circle,
  //                 //     trailing: 'OK',
  //                 //   );
  //                 // }
  //                 // if (state is PhonenoExistsErrorState) {
  //                 //   Navigator.pop(context);
  //                 //   customSnackbar(
  //                 //     context,
  //                 //     'Phone number already exists',
  //                 //     leading: Ktweel.info_circle,
  //                 //     trailing: 'OK',
  //                 //   );
  //                 // }

  //              Column(
  //                   children: [
  //                     Form(
  //                       key: formKey,
  //                       child: CustomTxtFormField(
  //                         hintText: 'OTP',
  //                         controller: otpController,
  //                         validator: (val) {
  //                           // if (state is UserOtpErrorState ||
  //                           //     state is UsernameExistsErrorState) {
  //                           //   return "Please enter a valid OTP";
  //                           // }
  //                           if (val!.length < 2) {
  //                             return "Please enter a valid OTP";
  //                           }
  //                           return null;
  //                         },
  //                       ),
  //                     ),
  //                   ],
  //           ),

  //             kHeight(20)
  //             // signUpButton(
  //             //   formKey,
  //             //   otpController,
  //             //   accountType,
  //             //   username,
  //             //   password,
  //             //   email,
  //             //   fullName,
  //             //   phoneNo,
  //             //   context,
  //             // ),

  //  ] }

  static Widget signUpButton(
    GlobalKey<FormState> formKey,
    TextEditingController? otpController,
    String? accountType,
    String? username,
    String? password,
    String? email,
    String? fullName,
    String? phoneNo,
    BuildContext context,
  ) {
    return CustomButton(
      buttonText: 'Sign Up',
      onPressed: () {
        // if (formKey.currentState!.validate()) {
        //   final user = UserModel(
        //     accountType: accountType,
        //     username: username,
        //     password: password,
        //     email: email,
        //     fullName: fullName,
        //     phoneNumber: int.parse(phoneNo ?? '0'),
        //     otp: otpController!.text,
        //   );
        //   context.read<SignUpBloc>().add(UserSignUpEvent(user: user));
        // }
      },
    );
  }
}
