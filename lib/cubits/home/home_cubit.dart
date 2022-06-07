import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranzact/models/home_model.dart';
import 'package:tranzact/repositories/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository = HomeRepository();

  HomeCubit() : super(HomeInitial());

  Future<void> loadHomeScreenData() async {
    try {
      emit(HomeLoading());
      final data = await _homeRepository.getHomeData();
      emit(HomeLoaded(data));
    } catch (_) {
      emit(HomeError());
      //Report to crawshlytics
    }
  }
}
