import 'dart:io';

import 'package:employee_directory/core/viewmodel/homeViewModel.dart';
import 'package:employee_directory/core/viewmodel/splashViewModel.dart';
import 'package:employee_directory/views/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:path_provider_android/path_provider_android.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) PathProviderAndroid.registerWith();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SplashViewModel()
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel()
        ),
      ],
      child: MaterialApp(
        title: 'Employee Directory',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
