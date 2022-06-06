part of 'login_cubit.dart';

enum LoginStatus { initial, submitting, success, error }

class LoginState extends Equatable {
  final String email;
  final String password;
  final LoginStatus status;
  final bool isValid;

  const LoginState({
    required this.email,
    required this.password,
    required this.status,
    required this.isValid,
  });

  factory LoginState.initial() {
    return const LoginState(
      email: '',
      password: '',
      status: LoginStatus.initial,
      isValid: false,
    );
  }

  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? status,
    bool? isValid,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [email, password, status, isValid];
}
