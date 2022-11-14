import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quoteApp/providers/counters.dart';
import 'package:quoteApp/providers/searchService.dart';
// import 'package:provider_example/providers/counter_provider.dart';
// import 'package:provider_example/providers/shopping_cart_provider.dart';
// import 'package:provider_example/screens/home_screen.dart';
// import 'package:provider_example/screens/second_screen.dart';
import 'package:quoteApp/routes.dart';
// void main() {
//   runApp(MyApp());
// }


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => searchService()),
        ChangeNotifierProvider(create: (_) => Counter()),
        // ChangeNotifierProvider(create: (_) => ShoppingCart()),
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  // const MyApp({super.key});


  static const primaryColor = Colors.white;
  static const accentColor = Colors.amber;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Quotes',
      theme: ThemeData( 
        primaryColor: primaryColor,
        accentColor: accentColor,
        fontFamily: 'Aeonik',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Aeonik',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontFamily: 'Aeonik',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}