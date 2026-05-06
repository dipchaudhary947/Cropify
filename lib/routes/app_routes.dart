import 'package:cropify_app/features/home/views/widgets/home_screen.dart';
import 'package:cropify_app/features/onboarding/views/screens/onboarding_screen.dart';
import 'package:go_router/go_router.dart';
import 'route_paths.dart';
import 'route_names.dart';
import 'package:cropify_app/features/splash/views/screens/splash_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RoutePaths.splash,

    routes: [
      GoRoute(
        path: RoutePaths.splash,
        name: RouteNames.splash,
        builder: (context, state) => SplashScreen(),
      ),

      GoRoute(
        path: RoutePaths.onboarding,
        name: RouteNames.onboarding,
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(
        path: RoutePaths.home,
        name: RouteNames.home,
        builder: (context, state) => HomeScreen(),
      ),
    ],
  );
}
