import 'package:app_forage/pages/home_page.dart';
import 'package:app_forage/provider/create_forage_provider.dart';
import 'package:app_forage/provider/forage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CreateForageProvider>(
          create: (context) => CreateForageProvider(),
        ),
        ChangeNotifierProvider<ForageProvider>(
          create: (context) => ForageProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        title: 'Material App',
        home: const HomePage(),
      ),
    );
  }
}
