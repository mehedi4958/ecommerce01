import 'package:e_commerce_01/firebase_options.dart';
import 'package:e_commerce_01/provider/cart_provider.dart';
import 'package:e_commerce_01/provider/products.dart';
import 'package:e_commerce_01/views/screens/auth/login_screen.dart';
import 'package:e_commerce_01/views/screens/bottom_navbar.dart';
import 'package:e_commerce_01/views/screens/detail/detail_screen.dart';
import 'package:e_commerce_01/views/screens/feeds_category.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // theme: ThemeData.dark().copyWith(
        //   scaffoldBackgroundColor: backgroundColor,
        // ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, userSnapShot) {
              if (userSnapShot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (userSnapShot.connectionState ==
                  ConnectionState.active) {
                if (userSnapShot.hasData) {
                  return const BottomNavBar();
                } else {
                  return const LoginScreen();
                }
              } else if (userSnapShot.hasError) {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }
              return Container();
            }),
        routes: {
          DetailScreen.id: (context) => const DetailScreen(),
          FeedsCategory.id: (context) => const FeedsCategory(),
        },
      ),
    );
  }
}
