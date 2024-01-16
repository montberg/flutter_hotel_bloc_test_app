import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hotel_test_app/hotel_page/first_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'apartaments_page/apartaments_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, //top status bar
            systemNavigationBarColor: Colors
                .white, // navigation bar color, the one Im looking for //navigation bar icons' color
          ),
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              fontFamily: 'sf_pro_display',
              colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff0D72FF)),
              useMaterial3: false,
            ),
            home: child,
          ),
        );
      },
      child: const Scaffold(
        //body: ApartamentsPage(hotelName: '123',),
        body: MainPage(),
        backgroundColor: Color(0xffF6F6F9),
      ),
    );
  }
}
