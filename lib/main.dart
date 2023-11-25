import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/firebase_options.dart';
import 'package:instagram_clone/my_theme.dart';
import 'package:instagram_clone/pages/home_page.dart';
import 'package:instagram_clone/pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    initialLocation: LoginPage.routeName,
    routes: [
      GoRoute(
        path: HomePage.routeName,
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: LoginPage.routeName,
        builder: (context, state) => LoginPage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp.router(
        title: 'Instagram Clone',
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
      ),
    );
  }
}
