import 'package:e_wallet/controller/dashboard_controller.dart';
import 'package:e_wallet/controller/homepage_controller.dart';
import 'package:e_wallet/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomePageController()),
        ChangeNotifierProvider(create: (context) => DashboardController()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Wallet App',
          theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
          home: const SplashScreen()),
    );
  }
}
