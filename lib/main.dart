import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loginstrapi/routes/my_router.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: MyRoutes.instance.onGenerateRoute,
      initialRoute: "/login",
    );
  }
}
