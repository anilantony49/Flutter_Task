import 'package:flutter/material.dart';
import 'package:flutter_task/login_page/widgets/signin_widgets.dart';
import 'package:flutter_task/widgets/custom_appbar.dart';
import 'package:flutter_task/widgets/signin_field_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar.show(context, false),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 30),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const SignInFieldWidget(),
                Positioned(
                  bottom: 0,
                  child: SignInWidgets.signUpNavigate(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_task/widgets/custom_appbar.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController emailController = TextEditingController();
//     final TextEditingController passwordController = TextEditingController();

//     return Scaffold(
//       // backgroundColor: Theme.of(context).colorScheme.surface,
//       extendBodyBehindAppBar: true,
//       appBar: CustomAppbar.show(context, false),
//       body: SingleChildScrollView(
//         // padding: const EdgeInsets.all(24),
//         child: Container(
//           constraints: BoxConstraints(
//             minHeight: MediaQuery.of(context).size.height,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(0, 40, 0, 30),
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                  const SignInFieldWidget(),
//               ],
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Login",
//                     style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 32),

//                   /// Email / Username
//                   TextField(
//                     controller: emailController,
//                     decoration: const InputDecoration(
//                       labelText: "Email or Username",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   /// Password
//                   TextField(
//                     controller: passwordController,
//                     obscureText: true,
//                     decoration: const InputDecoration(
//                       labelText: "Password",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   const SizedBox(height: 12),

//                   /// Forgot Password
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: TextButton(
//                       onPressed: () {
//                         // No functionality required
//                       },
//                       child: const Text("Forgot Password?"),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   /// Login Button
//                   SizedBox(
//                     width: double.infinity,
//                     height: 48,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Login logic can be added later
//                       },
//                       child: const Text("Login"),
//                     ),
//                   ),
//                   const SizedBox(height: 24),

//                   /// Register Link
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text("Don’t have an account? "),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context, '/register');
//                         },
//                         child: const Text("Register"),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
