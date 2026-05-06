import 'package:cropify_app/core/services/preferences_service.dart';
import 'package:cropify_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PreferencesService.instance.init();
  bool? isOnboardingDone = await PreferencesService.instance.getBool(
    'onboardingDone',
  );
  runApp(MyApp(isOnboardingDone: isOnboardingDone ?? false));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isOnboardingDone});

  final bool isOnboardingDone;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Cropify',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      routerConfig: AppRouter.router,
    );
  }
}
