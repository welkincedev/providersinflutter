import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/providerdemo/api_provider_five/providers/post_providers.dart';
import 'package:statemanagement/providerdemo/api_provider_five/screens/posts_screen.dart';

import 'package:statemanagement/providerdemo/multiprovider/provider/auth_provider.dart';
import 'package:statemanagement/providerdemo/multiprovider/provider/cart_Provider.dart';
import 'package:statemanagement/providerdemo/multiprovider/provider/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PostProvider(),
        ),

      ],

      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {

          return MaterialApp(
            debugShowCheckedModeBanner: false,

            title: 'Session 3 – Multiple Provider',

            themeMode: themeProvider.themeMode,

            theme: ThemeData(
              primarySwatch: themeProvider.selectedSwatch,
              brightness: Brightness.light,
              useMaterial3: true,
            ),

            darkTheme: ThemeData(
              primarySwatch: themeProvider.selectedSwatch,
              brightness: Brightness.dark,
              useMaterial3: true,
            ),

            home: const PostScreen(),
          );
        },
      ),
    );
  }
}