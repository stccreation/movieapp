part of 'movieinfo_bloc.dart';

abstract class MovieinfoEvent extends Equatable {
  const MovieinfoEvent();

  @override
  List<Object> get props => [];
}

class MovieinfoLoad extends MovieinfoEvent {
  final String api;
  const MovieinfoLoad(this.api);
}
