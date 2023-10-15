import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../movies_data.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {

  MoviesBloc() : super(MoviesInitial()) {
    on<MoviesLoad>((event, emit) async {
      var api=event.site;
      
      emit(MoviesLoading());
      final movies= await MovieRep.getdata(api: api);
      if ((movies[0].year==0) & (movies[0].id == 0) ){
        emit(MoviesError(movies[0].title));
      }
      else{
      emit(MoviesLoaded(movies));
      }
    });
  }
}
