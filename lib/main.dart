import 'package:flutter/material.dart';

import 'package:faculty_research/pages/conferenceRegistration.dart';
import 'package:faculty_research/pages/workshopRegistration.dart';
import 'package:faculty_research/pages/journalRegistration.dart';
import 'package:faculty_research/pages/home.dart';
import 'package:faculty_research/pages/adminLogin.dart';
import 'package:faculty_research/pages/success.dart';
import 'package:faculty_research/pages/adminHome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (context) => HomePage(),
        '/adminLogin': (context) => AdminLoginPage(title: 'Admin Page',),
        '/adminHome': (context) => AdminHome(),
        '/researchRegistration': (context) => WorkshopRegistrationPage(title: 'Workshop Registration'),
        '/journalRegistration' : (context) => JournalRegistrationPage(title: 'Journal Registration'),
        '/conferenceRegistration': (context) => ConferenceRegistrationPage(title: 'Conference Registration'),
        '/success': (context) => SuccessPage(),
      },
      initialRoute: '/',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.black),
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}