import 'package:flutter/material.dart';
import 'package:flutter_task/login_page/login_page.dart';
import 'package:flutter_task/utils/alerts_and_navigators.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Logout',
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Navigate back to Login page
              nextScreenRemoveUntil(context, LoginPage());
            },
          ),
        ],
      ),

      body: const Center(
        child: Text('Home Page', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
