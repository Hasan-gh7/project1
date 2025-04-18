import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_management_system/bloc/authbloc.dart';
import 'package:property_management_system/pages/SignUpPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'تطبيق تسجيل الحساب',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignUpPage(), // الصفحة الأولى عند تشغيل التطبيق
      ),
    );
  }
}