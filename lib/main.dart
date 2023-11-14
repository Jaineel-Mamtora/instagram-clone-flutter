import 'package:flutter/material.dart';

import 'package:instagram_clone/my_theme.dart';
import 'package:instagram_clone/pages/home_page.dart';
import 'package:instagram_clone/pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'Instagram Clone',
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: LoginPage.routeName,
        routes: {
          LoginPage.routeName: (_) => LoginPage(),
          HomePage.routeName: (_) => HomePage(),
        },
      ),
    );
  }
}
