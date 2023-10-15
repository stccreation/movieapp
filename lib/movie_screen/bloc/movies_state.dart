part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();
  
  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}


class MoviesLoading extends MoviesState {}


class MoviesLoaded extends MoviesState {
  final List<MovieModel> movies;
  const MoviesLoaded(this.movies);
}


class MoviesError extends MoviesState {
  final String error;
  const MoviesError(this.error);

  @override
  List<String> get props => [error];
}
