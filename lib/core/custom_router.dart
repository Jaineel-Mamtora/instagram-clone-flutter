import 'package:go_router/go_router.dart';

import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/features/home/presentation/screens/home_page.dart';
import 'package:instagram_clone/features/login/view/login_page.dart';
import 'package:instagram_clone/features/signup/views/signup_page_1.dart';
import 'package:instagram_clone/features/signup/views/signup_page_2.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: isLoggedIn ? HomePage.routeName : LoginPage.routeName,
    routes: [
      GoRoute(
        path: HomePage.routeName,
        builder: (_, __) => HomePage(),
        // pageBuilder: (_, __) {
        //   return CustomTransitionPage(
        //     child: HomePage(),
        //     transitionsBuilder:
        //         (context, animation, secondaryAnimation, child) =>
        //             SlideTransition(
        //       position: Tween<Offset>(
        //         begin: const Offset(1, 0), // Right to left
        //         end: Offset.zero,
        //       ).animate(animation),
        //       child: child,
        //     ),
        //   );
        // },
      ),
      GoRoute(path: LoginPage.routeName, builder: (_, __) => LoginPage()),
      GoRoute(path: SignUpPage1.routeName, builder: (_, __) => SignUpPage1()),
      GoRoute(path: SignUpPage2.routeName, builder: (_, __) => SignUpPage2()),
    ],
  );
}
