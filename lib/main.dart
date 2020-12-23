import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginflutterapp/constants.dart';
import 'package:loginflutterapp/models/user_model.dart';
import 'package:loginflutterapp/screens/firstpage_screen.dart';
import 'package:loginflutterapp/screens/presentation_screen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,// transparent status bar
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarIconBrightness: Brightness.dark, // status bar icons' color
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(MyApp());
  
  QuerySnapshot snapshot = await Firestore.instance.collection('mensagens').getDocuments();
  snapshot.documents.forEach((d){
    print(d.data);
  });
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child:  MaterialApp(
        title: 'Retomba',
        theme: ThemeData(
          fontFamily: 'Montserrat',
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            bodyText1: TextStyle(color: kDarkBlue),
            bodyText2: TextStyle(color: kDarkBlue),
          ),
          primaryColor: kDarkBlue,
          //textTheme: Theme.of(context).textTheme.apply(bodyColor: kDarkBlue),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Presentation1(),//LoginScreen(),// Container(),
        debugShowCheckedModeBanner: false,
      ));
  }
}
