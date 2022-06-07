part of 'home_cubit.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoaded extends HomeState {
  final List<HomeModel> data;

  HomeLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class HomeError extends HomeState {
  @override
  List<Object?> get props => [];
}
