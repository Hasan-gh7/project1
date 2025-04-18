abstract class AuthState {}

class AuthInitial extends AuthState {}  // حالة البداية
class AuthLoading extends AuthState {}  // حالة التحميل
class AuthSuccess extends AuthState {}  // نجاح التسجيل
class AuthFailure extends AuthState {   // فشل التسجيل
  final String error;
  AuthFailure(this.error);
}