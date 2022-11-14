import 'package:flutter/material.dart';
import '../main.dart';
import '../providers/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  // const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: 0,
      backgroundColor: MyApp.primaryColor,
      title: const Text('Quotes'),
    );
    return Scaffold(
      appBar: appBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(
            color: Colors.black,
            height: 20,
            thickness: 0.2,
            indent: 20,
            endIndent: 20,
          ),
          Button("Author Quotes", "Author", 14.0, FontWeight.bold),
          SizedBox(
            height: 20.0,
          ),
          Button("Search Quotes", "Search", 14.0, FontWeight.bold),
          SizedBox(
            height: 20.0,
          ),
          Button("Favourite Quotes", "Fav", 14.0, FontWeight.bold),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
