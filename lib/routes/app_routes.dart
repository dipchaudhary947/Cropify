import 'package:cropify_app/features/auth/views/screens/login_screen.dart';
import 'package:cropify_app/features/auth/views/screens/register_screen.dart';
import 'package:cropify_app/features/roles/customer/home/views/widgets/home_screen.dart';
import 'package:cropify_app/features/onboarding/views/screens/onboarding_screen.dart';
import 'package:cropify_app/features/roles/farmer/dashboard/views/screens/dashbord_screen.dart';
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
        path: RoutePaths.login,
        name: RouteNames.login,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: RoutePaths.regsiter,
        name: RouteNames.regsiter,
        builder: (context, state) => RegisterScreen(),
      ),

      // CUSTOMER ROUTES
      GoRoute(
        path: RoutePaths.home,
        name: RouteNames.home,
        builder: (context, state) => HomeScreen(),
      ),

      // FARMERS ROUTES
      GoRoute(
        path: RoutePaths.dashboard,
        name: RouteNames.dashboard,
        builder: (context, state) => DashbordScreen(),
      ),
    ],
  );
}
