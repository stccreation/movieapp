import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/movie_info_screen/movie_info_data.dart';

part 'movieinfo_event.dart';
part 'movieinfo_state.dart';

class MovieinfoBloc extends Bloc<MovieinfoEvent, MovieinfoState> {
  MovieinfoBloc() : super(MovieinfoInitial()) {
    on<MovieinfoLoad>((event, emit) async {
      emit(MovieinfoLoading());
      var api= event.api;
      final movies= await MovieInfoRep.getmovieinfo(api: api);
      if (movies.movie==null ){
        emit(MovieinfoError());
      }
      else{
      emit(MovieinfoLoaded(movies));
      }
    });
  }
}
