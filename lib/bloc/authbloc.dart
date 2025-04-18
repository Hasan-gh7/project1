

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_management_system/bloc/events.dart';
import 'package:property_management_system/bloc/state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignUpRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await Future.delayed(Duration(seconds: 2)); // محاكاة عملية التسجيل
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}