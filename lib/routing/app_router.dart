import 'package:go_router/go_router.dart';
import 'package:gpt_chat/core/features/chat/home.dart';
import 'package:gpt_chat/core/features/start/started.dart';
import 'package:gpt_chat/routing/routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.startingScreen,
    routes: [
      GoRoute(
        path: Routes.startingScreen,
        builder: (context, state) => const Starting(),
      ),
      GoRoute(
        path: Routes.homeScreen,
        builder: (context, state) => const Home(),
      ),
    ],
  );
}
