import 'dart:convert';

import 'package:demo6/api/notification.dart';
import 'package:demo6/data/data.dart';
import 'package:demo6/detail_category/profile.dart';
import 'package:demo6/models/product.dart';
import 'package:demo6/models/type.dart';
import 'package:demo6/screens/signin_screen.dart';
import 'package:demo6/screens/signup_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:demo6/home/homescreen.dart';
import 'package:demo6/data/type.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

  // print(type[0]);

  // List<Type1> attraction = [];
  // attraction.add(Type1(
  //   name: (type1[1].name) as String,
  //   status: (type1[1].status) as String,
  //   iconPath: (type1[1].iconPath) as String,
  // ));
  // // attraction.add(Attractive(name: "Colorado", type: "river"));
  // // attraction.add(Attractive(name: "Kilimanjaro", type: "mountain"));
  // // attraction.add(Attractive(name: "Yellowstone", type: "park"));

  // Set<String> types = {"UPCOMING", "DIOR"};

  // var listAttractive =
  //     attraction.where((element) => types.contains(element.name));
  // listAttractive.forEach((item) {
  //   item.name;
  // });
  // // print(type1[1].menu![0].name as String);
  // print(listAttractive);
}

class MyApp extends StatelessWidget {
  static final String title = 'Midterm';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
            appBarTheme: AppBarTheme(color: Colors.black),
            scaffoldBackgroundColor: Colors.black),
        home: SignInScreen(),
      ),
      providers: [ChangeNotifierProvider(create: (_) => NotificationService())],
    );
  }

  // debugShowCheckedModeBanner: false,
  // title: title,
  // theme: ThemeData(
  //     appBarTheme: AppBarTheme(color: Colors.black),
  //     scaffoldBackgroundColor: Colors.black),
  // home: HomeScreen(),

}
