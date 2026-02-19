import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nimbus/core/di/di.dart'; // Import the DI setup

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator(); // Call DI setup asynchronously
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Scaffold(
          body: Center(
            child: Text('List Screen Placeholder'),
          ),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const Scaffold(
              body: Center(
                child: Text('Detail Screen Placeholder'),
              ),
            );
          },
        ),
      ],
    ),
  ],
);
