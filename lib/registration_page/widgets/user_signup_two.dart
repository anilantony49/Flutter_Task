// import 'package:flutter/material.dart';
// import 'package:flutter_task/registration_page/widgets/signup_two_field_widget.dart';
// import 'package:flutter_task/registration_page/widgets/signup_widget.dart';
// import 'package:flutter_task/widgets/custom_appbar.dart';

// class UserSignUpPageTwo extends StatefulWidget {
//   const UserSignUpPageTwo({
//     super.key,
//     required this.email,
//     required this.fullName,
//     required this.password,
//     required this.confirmPassword,
//   });

//   final String email;
//   final String fullName;
//   final String password;
//   final String confirmPassword;

//   @override
//   State<UserSignUpPageTwo> createState() => _UserSignUpPageTwoState();
// }

// class _UserSignUpPageTwoState extends State<UserSignUpPageTwo> {
//   @override
//   Widget build(BuildContext context) {
//     final mediaHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       extendBodyBehindAppBar: true,
//       appBar: CustomAppbar.show(context, true),
//       body: SingleChildScrollView(
//         child: Container(
//           constraints: BoxConstraints(minHeight: mediaHeight),
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(0, 40, 0, 30),
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 SignUpTwoFieldWidget(
//                   email: widget.email,
//                   phoneNo: widget.phoneNo,
//                   fullName: widget.fullName,
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   child: SignUpWidgets.signInNavigate(context),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
