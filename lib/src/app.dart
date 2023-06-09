import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mentz/src/accessories/color_pallette.dart';
import 'screens/main_screen.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Mentz',
        theme: ThemeData(primaryColor: Colors.white),
        home: 
        // Container(
          // decoration: const BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: [Colors.blue, Colors.white],
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //   ),
          // ),
          // child: 
          Scaffold(
            resizeToAvoidBottomInset: false,
            // backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: ColorPallette.primaryColor,
              title: const Text('Mentz'),
            ),
            body: const SingleChildScrollView(child: MainScreen()),
          ),
        // ),
      );
    });
  }
}
