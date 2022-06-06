part of 'signup_cubit.dart';

enum SignupStatus { initial, submitting, success, error }

class SignupState extends Equatable {
  final String email;
  final String password;
  final SignupStatus status;

  final bool isValid;

  const SignupState({
    required this.email,
    required this.password,
    required this.status,
    required this.isValid,
  });

  factory SignupState.initial() {
    return const SignupState(
      email: '',
      password: '',
      status: SignupStatus.initial,
      isValid: false,
    );
  }

  SignupState copyWith({
    String? email,
    String? password,
    SignupStatus? status,
    bool? isValid,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [email, password, status, isValid];
}
