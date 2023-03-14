import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/modules/verify_code/verify_view.dart';
import 'package:pennywise_app/app/routes/route_names.dart';
import 'package:pennywise_app/app/routes/route_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: dashBoard,
      getPages: AppPages.pages,
    );
  }
}
