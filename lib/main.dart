import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

Future<void> main()
 async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(/*DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) =>*/ const MyApp(), // Wrap your app
  );
}

  class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
  return const MaterialApp(
    debugShowCheckedModeBanner: false,
  //useInheritedMediaQuery: true,
  //locale: DevicePreview.locale(context),
  //builder: DevicePreview.appBuilder,
  title: "Organ donation & Transportation System",
  home: LoginScreen(),
  );
  }
  }


