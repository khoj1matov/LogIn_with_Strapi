import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loginstrapi/core/context/navigation/navigation_service.dart';
import 'package:loginstrapi/service/get_storage_service.dart';
import 'package:loginstrapi/views/home/home_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Sign in"),
              onPressed: () async {
                try {
                  Response res = await Dio().post(
                    'http://localhost:1337/api/auth/local',
                    data: {
                      {
                        "identifier": "user1@strapi.io",
                        "password": "112233"
                      }
                    },
                  );
                  if (res.statusCode == HttpStatus.ok) {
                    await GetStorageService.instace.box.write(
                      "token",
                      res.data['jwt'],
                    );
                    NavigationService.instace.navigateTo(const HomeView());
                  } else {
                    debugPrint("ERORR WHILE LOGIN!!!");
                  }
                } catch (e) {
                  debugPrint("ERORR WHILE LOGIN !!!");
                }
              },
            ),
            ElevatedButton(
              child: const Text("Sign Up"),
              onPressed: () async {
                try {
                  Response res = await Dio().post(
                    'http://localhost:1337/api/auth/local/register',
                    data: {
                      {
                        "username": "Strapi user",
                        "email": "user1@strapi.io",
                        "password": "112233"
                      }
                    },
                  );
                  if (res.statusCode == HttpStatus.ok) {
                    await GetStorageService.instace.box.write(
                      "token",
                      res.data['jwt'],
                    );
                    NavigationService.instace.navigateTo(const HomeView());
                  } else {
                    debugPrint("ERORR WHILE REGISTERING!!!");
                  }
                } catch (e) {
                  debugPrint("ERORR WHILE REGISTERING !!!");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
