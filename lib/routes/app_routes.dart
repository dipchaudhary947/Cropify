import 'package:cropify_app/features/auth/views/screens/login_screen.dart';
import 'package:cropify_app/features/auth/views/screens/register_screen.dart';

import 'package:cropify_app/features/onboarding/views/screens/onboarding_screen.dart';
import 'package:cropify_app/features/roles/customer/customer_bottom_nav/home/model/category_model.dart';
import 'package:cropify_app/features/roles/customer/customer_bottom_nav/home/views/screens/all_categories_screen.dart';
import 'package:cropify_app/features/roles/customer/products/views/screens/all_products_screen.dart';
import 'package:cropify_app/features/splash/views/screens/splash_screen.dart';

import 'package:cropify_app/features/roles/customer/customer_bottom_nav/customer_nav_bar/customer_bottom_screen.dart';
import 'package:cropify_app/features/roles/customer/customer_bottom_nav/home/views/screens/home_screen.dart';
import 'package:cropify_app/features/roles/customer/customer_bottom_nav/customer_order/views/screens/customer_orders_screen.dart';
import 'package:cropify_app/features/roles/customer/customer_bottom_nav/cart/views/screens/cart_screen.dart';
import 'package:cropify_app/features/roles/customer/customer_bottom_nav/customer_profile/views/screens/customer_profile_screen.dart';

import 'package:cropify_app/features/roles/farmer/farmer_bottom_nav/farmer_nav_bar/farmer_bottom_screen.dart';
import 'package:cropify_app/features/roles/farmer/farmer_bottom_nav/dashboard/views/screens/dashbord_screen.dart';
import 'package:cropify_app/features/roles/farmer/farmer_bottom_nav/products/views/screens/products_screen.dart';
import 'package:cropify_app/features/roles/farmer/farmer_bottom_nav/add_products/views/screens/add_products_screen.dart';
import 'package:cropify_app/features/roles/farmer/farmer_bottom_nav/farmer_order/views/screens/farmer_orders_screen.dart';
import 'package:cropify_app/features/roles/farmer/farmer_bottom_nav/farmer_profile/views/screens/farmer_profile_screen.dart';

import 'package:go_router/go_router.dart';

import 'route_names.dart';
import 'route_paths.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RoutePaths.splash,

    routes: [
      // SPLASH
      GoRoute(
        path: RoutePaths.splash,
        name: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      // ONBOARDING
      GoRoute(
        path: RoutePaths.onboarding,
        name: RouteNames.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),

      // LOGIN
      GoRoute(
        path: RoutePaths.login,
        name: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),

      // REGISTER
      GoRoute(
        path: RoutePaths.register,
        name: RouteNames.regsiter,
        builder: (context, state) => RegisterScreen(),
      ),

      // =========================
      // CUSTOMER BOTTOM NAVIGATION
      // =========================
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return CustomerBottomScreen(navigationShell: navigationShell);
        },

        branches: [
          // HOME
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.home,
                name: RouteNames.home,
                builder: (context, state) => HomeScreen(),
              ),
            ],
          ),

          // CUSTOMER ORDERS
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.customerOrders,
                name: RouteNames.customerOrders,
                builder: (context, state) => const CustomerOrdersScreen(),
              ),
            ],
          ),

          // CART
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.cart,
                name: RouteNames.cart,
                builder: (context, state) => const CartScreen(),
              ),
            ],
          ),

          // CUSTOMER PROFILE
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.customerProfile,
                name: RouteNames.customerProfile,
                builder: (context, state) => const CustomerProfileScreen(),
              ),
            ],
          ),
        ],
      ),

      // ALL CATEGORIES
      // ALL CATEGORIES
      GoRoute(
        path: RoutePaths.allCategories,
        name: RouteNames.allCategories,
        builder: (context, state) {
          final categories = state.extra as List<CategoryModel>;

          return AllCategoriesScreen(categories: categories);
        },
      ),
      GoRoute(
        path: RoutePaths.allProducts,
        name: RouteNames.allProducts,
        builder: (context, state) => const AllProductsScreen(),
      ),

      // =========================
      // FARMER BOTTOM NAVIGATION
      // =========================
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return FarmerBottomScreen(navigationShell: navigationShell);
        },

        branches: [
          // DASHBOARD
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.dashboard,
                name: RouteNames.dashboard,
                builder: (context, state) => const DashbordScreen(),
              ),
            ],
          ),

          // PRODUCTS
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.products,
                name: RouteNames.products,
                builder: (context, state) => const ProductsScreen(),
              ),
            ],
          ),

          // ADD PRODUCTS
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.addProducts,
                name: RouteNames.addProducts,
                builder: (context, state) => const AddProductsScreen(),
              ),
            ],
          ),

          // FARMER ORDERS
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.farmerOrders,
                name: RouteNames.farmerOrders,
                builder: (context, state) => const FarmerOrdersScreen(),
              ),
            ],
          ),

          // FARMER PROFILE
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.farmerProfile,
                name: RouteNames.farmerProfile,
                builder: (context, state) => const FarmerProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
