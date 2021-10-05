part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomePageLoadingState extends HomeState {}

class HomePageLoadedState extends HomeState {}
