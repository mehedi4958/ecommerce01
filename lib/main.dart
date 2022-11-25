import 'package:e_commerce_01/firebase_options.dart';
import 'package:e_commerce_01/provider/products.dart';
import 'package:e_commerce_01/views/screens/bottom_navbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Products()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // theme: ThemeData.dark().copyWith(
        //   scaffoldBackgroundColor: backgroundColor,
        // ),
        home: BottomNavBar(),
      ),
    );
  }
}
