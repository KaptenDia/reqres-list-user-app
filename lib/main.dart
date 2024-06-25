import 'package:list_users_app/module/user/provider/user_provider.dart';
import 'package:list_users_app/module/user/view/user_view.dart';
import 'package:list_users_app/state_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: Get.navigatorKey,
        home: const UserView(),
      ),
    );
  }
}
