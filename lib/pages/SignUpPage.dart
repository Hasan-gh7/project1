import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_management_system/bloc/authbloc.dart';
import 'package:property_management_system/bloc/events.dart';
import 'package:property_management_system/bloc/state.dart';
import 'package:property_management_system/pages/HomePage.dart';
import 'package:property_management_system/pages/LoginPage.dart';


class SignUpPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text('إنشاء حساب')),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('خطأ: ${state.error}')));
            }
          },
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(controller: emailController, decoration: InputDecoration(labelText: 'البريد الإلكتروني')),
                TextField(controller: passwordController, obscureText: true, decoration: InputDecoration(labelText: 'كلمة المرور')),
                SizedBox(height: 20),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return CircularProgressIndicator();
                    }
                    return ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(SignUpRequested(emailController.text, passwordController.text));
                      },
                      child: Text('تسجيل'),
                    );
                  },
                ),
                TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage())),
                  child: Text('لديك حساب؟ تسجيل الدخول'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}