part of 'app_bloc.dart';

enum AppStatus { home, login, splash, onBoarding }

class AppState extends Equatable {
  final AppStatus status;
  final User user;

  const AppState._({
    required this.status,
    this.user = User.empty,
  });

  const AppState.home(User user)
      : this._(
          status: AppStatus.home,
          user: user,
        );

  const AppState.login() : this._(status: AppStatus.login);

  const AppState.splash() : this._(status: AppStatus.splash);

  const AppState.onBoarding() : this._(status: AppStatus.onBoarding);

  @override
  List<Object> get props => [status, user];
}
