import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text("Sign in"),
              onPressed: () async {
                Response res = await Dio().get(
                  'http://localhost:1337/api/auth/local',
                );
              },
            ),
            ElevatedButton(
              child: const Text("Sign Up"),
              onPressed: () async {
                Response res = await Dio().get(
                  'http://localhost:1337/api/auth/local/register',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
