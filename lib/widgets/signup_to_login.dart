import 'package:flutter/material.dart';

class SignUpToLogin extends StatelessWidget {
  final String account;
  final VoidCallback onTap;
  final String name;

  SignUpToLogin({required this.account,  required this.onTap, required this.name,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(account),
        GestureDetector(
          onTap: onTap,
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
