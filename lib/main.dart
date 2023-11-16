import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:student_maintenance/dao/apiprovider.dart';
import 'package:student_maintenance/views/search.dart';
import 'database/database.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton<AppDatabase>(await $FloorAppDatabase.databaseBuilder('local_app_db.db').build()).loadInitialData();
  GetIt.I.registerSingleton<Client>(Client());
  GetIt.I.registerSingleton<ApiProvider>(ApiProvider());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mantenimiento de Alumnos',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: SearchStudent(),
    );
  }
}