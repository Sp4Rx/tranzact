import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranzact/core/storage.dart';
import 'package:tranzact/models/user_model.dart';
import 'package:tranzact/repositories/auth_repository.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthRepository _authRepository;
  StreamSubscription<User>? _userSubscription;

  AppBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(
          authRepository.currentUser.isNotEmpty
              ? AppState.home(authRepository.currentUser)
              : const AppState.splash(),
        ) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    on<SplashEnded>(_onSplashEnded);

    _userSubscription = _authRepository.user.listen(
      (user) => add(AppUserChanged(user)),
    );
  }

  void _onUserChanged(
    AppUserChanged event,
    Emitter<AppState> emit,
  ) {
    emit(
      event.user.isNotEmpty
          ? AppState.home(event.user)
          : const AppState.splash(),
    );
  }

  void _onLogoutRequested(
    AppLogoutRequested event,
    Emitter<AppState> emit,
  ) {
    unawaited(_authRepository.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }

  Future<FutureOr<void>> _onSplashEnded(
      SplashEnded event, Emitter<AppState> emit) async {
    if ((await Storage.isOnBoardingDone)) {
      emit(const AppState.login());
    } else {
      emit(const AppState.onBoarding());
    }
  }
}
