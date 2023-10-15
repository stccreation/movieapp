

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/main.dart';
import 'package:movieapp/movie_info_screen/movie_info_screen.dart';
import 'package:movieapp/movie_screen/bloc/movies_bloc.dart';



class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});


  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final MoviesBloc _moviesBloc =MoviesBloc();

  @override
  void initState(){
    _moviesBloc.add(MoviesLoad(siteurl));
    super.initState();
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
      body:BlocProvider(create: (context)=> _moviesBloc,
      child: BlocListener<MoviesBloc,MoviesState>(
        listener: (context, state) {
          if (state is MoviesError){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
          }        
        },
        child: BlocBuilder<MoviesBloc,MoviesState>(
          builder: (context, state) {
            if (state is MoviesLoading){
              return Center(child: CircularProgressIndicator(),);
            }
            if (state is MoviesLoaded){
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: _buildMovies(context,state.movies),
            );
            }
        
            else{
              return Center(child: Text("error"),);
            }
          },

          
        ),
      ),
      )
    );
  }
  Widget _buildMovies(BuildContext context,movies){
    return GridView.builder(
      
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing:5,mainAxisSpacing: 5,mainAxisExtent: 204),
      itemCount: movies.length, 
      itemBuilder: (_,index){
        return InkWell(
          onTap: () {iid=movies[index].id;
            Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieinfoScreen()));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color.fromARGB(255, 29, 29, 29),
              
            ),
            child: Column(
              children: [
                ClipRRect(
                  
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
                  child: Image.network(movies[index].coverurl,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  )
                  ),
                  Padding(padding: const EdgeInsets.all(5),
                  child: Column(
                    
                    children: [
                      Text(movies[index].title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                      ),
                      SizedBox(height: 8,),
                      Text(movies[index].year.toString(),
                        style: TextStyle(
                        color: const Color.fromARGB(255, 216, 216, 216),
                        
                      ),
                      )
                    ],
                  ),
                  )
              ],
            ),
          ),
        );
      }
      );

  }
}





  
