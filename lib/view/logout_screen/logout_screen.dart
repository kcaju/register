import 'package:flutter/material.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Text(
            "Logged out Successfully !!!",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w900, fontSize: 50),
          ),
        ),
      ),
    );
  }
}
