



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/main.dart';
import 'package:movieapp/movie_info_screen/bloc/movieinfo_bloc.dart';
import 'package:movieapp/video_player/video_player.dart';


int? iid;
class MovieinfoScreen extends StatefulWidget {
  


  const MovieinfoScreen({super.key});

  @override
  State<MovieinfoScreen> createState() => _MovieinfoScreenState();
}

class _MovieinfoScreenState extends State<MovieinfoScreen> {
  
  MovieinfoBloc _movieinfoBloc=MovieinfoBloc();

  checkaudio(movie,index){
    if((movie.files[index].audiolan=='')|(movie.files[index].audiolan==null)){
      return movie.languages[0].toString();
    }
    else{
      return movie.files[index].audiolan;
    }
  }

  checkd(height){
    if(height==480){ return "SD";}
    if(height==720){return "HD";}
    if(height==1080){return "FHD";}
    if(height==2160){return "UHD";}
    else{return "";}
  }

  @override
  void initState(){
    var api="${siteurl}/info/${iid}";
    _movieinfoBloc.add(MovieinfoLoad(api));
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.transparent,
        
      ),
      body: BlocProvider(
        create: (context) => _movieinfoBloc,
        child: BlocBuilder<MovieinfoBloc,MovieinfoState>(
          builder: (context, state) {
            if (state is MovieinfoLoading){
              return Center(child: CircularProgressIndicator(),);
            }
            if (state is MovieinfoLoaded){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: _movieinfopage(context, state.movie),
              );
            }
            if (state is MovieinfoError){
              return Center(child: Text("Something went wrong"),);
            }
            else {
              return Center(child: Text("Movie not Found"),);
            }
          },
        )),
      );
    
  }
  
  
    Widget _movieinfopage(BuildContext context,movies){
    
    return SingleChildScrollView(
      
        child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
              padding: const EdgeInsets.only(left:10),
              child: Image.network(movies.movie.fullcoverurl,height:550,),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(movies.movie.title,style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text("${movies.movie.year.toString()} ,  ${movies.languages[0].toString()}",style: TextStyle(
                    color: Color.fromARGB(255, 212, 212, 212),
                    fontSize: 20,
                    ),),
                    Text("Genres: ${movies.genres.join(', ')}",style: TextStyle(
                    color: Color.fromARGB(255, 173, 173, 173),
                    fontSize: 15,
                    ),),
                    SizedBox(height: 50,),
                    Text("${movies.movie.plot}",style: TextStyle(color: Color.fromARGB(255, 173, 173, 173),),),
                    SizedBox(height: 50,),
                    Text("Files:",style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                  Container(
                    height: 196,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.files.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8,left: 8),
                          child: InkWell(
                            onTap: () {
                              fileid =movies.files[index].fileId;
                              Navigator.of(context).push(MaterialPageRoute(builder:(context) => VideoPlayerm(),));
                            },
                            child: Container(
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color.fromARGB(255, 29, 29, 29),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    Text("Video:",style: TextStyle(color: Color.fromARGB(255, 173, 173, 173),fontWeight: FontWeight.bold),),
                                    Text("${checkd(movies.files[index].height)}(${movies.files[index].height.toString()}X${movies.files[index].width.toString()})",style: TextStyle(color: Color.fromARGB(255, 173, 173, 173)),),
                                    Text("Size:${movies.files[index].size}",style: TextStyle(color: Color.fromARGB(255, 173, 173, 173)),),
                                    Text("Audio:",style: TextStyle(color: Color.fromARGB(255, 173, 173, 173),fontWeight: FontWeight.bold),),
                                    Text("${checkaudio(movies, index)}",style: TextStyle(color: Color.fromARGB(255, 173, 173, 173),),),
                                    
                                    
                                                        
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                  
                    
                ],
              ),
            )
              ]
          
        ),
      
    );

  }
}