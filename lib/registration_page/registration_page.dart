import 'package:flutter/material.dart';
import 'package:flutter_task/registration_page/widgets/signup_one_field_widget.dart';
import 'package:flutter_task/registration_page/widgets/signup_widget.dart';
import 'package:flutter_task/widgets/custom_appbar.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar.show(context, true, 'Register'),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: mediaHeight),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 30),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const SignUpOneFieldWidget(),
                Positioned(
                  bottom: 0,
                  child: SignUpWidgets.signInNavigate(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
