import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/main.dart';
import 'package:movieapp/movie_info_screen/movie_info_screen.dart';
import 'package:movieapp/movie_screen/bloc/movies_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  
 final TextEditingController _searchcontroller=TextEditingController();
  final MoviesBloc _moviesBloc =MoviesBloc();
  
  void updatelist(){
    var text= _searchcontroller.text;
    
    if (text != ''){
    var site="${siteurl}/search?s=${text}";
    _moviesBloc.add(MoviesLoad(site));
    }
    else{
      _moviesBloc.add(MoviesLoad(''));
    }
  }

  @override
  void initState(){
    _searchcontroller.addListener(updatelist);
    updatelist();
    super.initState();
  }
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child:Container(
              
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                  color: const Color.fromARGB(255, 37, 37, 37),
                ),
                
                height: 40,
                child: TextField(
                    controller: _searchcontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "  Search....",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.search,color: Colors.grey,)
                      
                                ),
                      style: TextStyle(color: const Color.fromARGB(255, 194, 193, 193)),
                      
                              ),

              ),
              
            
          ),
        BlocProvider(create: (context)=> _moviesBloc,
      child: BlocListener<MoviesBloc,MoviesState>(
        listener: (context, state) {
          if (state is MoviesError){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
          }        
        },
        child: BlocBuilder<MoviesBloc,MoviesState>(
          builder: (context, state) {

           if (_searchcontroller.text == ''){
            return Container();
           } 
            else{
            if (state is MoviesLoading){
              return Center(child: CircularProgressIndicator(),);
            }
            if (state is MoviesLoaded){
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: _buildsMovies(context, state.movies),
            );
            }
        
            else{
              return Center(child: Text("error"),);
            }
          }
  
          }
          
          
          

          
        ),
      ),
      )
          
        ],

      )
                  
      
      );


  
    
  }
  Widget _buildsMovies(BuildContext context,movies){
    return GridView.builder(
      
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing:5,mainAxisSpacing: 5,mainAxisExtent: 204),
      itemCount: movies.length, 
      itemBuilder: (_,index){
        return InkWell(

          onTap:(){ iid=movies[index].id;Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieinfoScreen()));},
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