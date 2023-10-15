part of 'movieinfo_bloc.dart';

abstract class MovieinfoState extends Equatable {
  const MovieinfoState();
  
  @override
  List<Object> get props => [];
}

class MovieinfoInitial extends MovieinfoState {}


class MovieinfoLoading extends MovieinfoState {}


class MovieinfoLoaded extends MovieinfoState {
  final MovieInfoModel movie;
  const MovieinfoLoaded(this.movie);

}


class MovieinfoError extends MovieinfoState {}
