import 'package:employee_directory/core/viewmodel/splashViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
        Duration.zero,
        () =>
            Provider.of<SplashViewModel>(context,listen: false).fetchDataFromServer(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 15,
            ),
            Text("Loading initial data")
          ],
        ),
      ),
    );
  }
}
