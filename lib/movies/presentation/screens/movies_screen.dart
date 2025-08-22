import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movie_app/movies/presentation/controller/movies_events.dart';
import 'package:movie_app/movies/presentation/widgets/now_playing_movies.dart';
import 'package:movie_app/movies/presentation/widgets/popular_movies_widget.dart';
import 'package:movie_app/movies/presentation/widgets/top_rated_movies_widget.dart';

import 'package:shimmer/shimmer.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/utils/dummy.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sL<MoviesBloc>()
        ..add(GetNowPlayingMovies())
        ..add(GetPopularMovies())
        ..add(GetTopRatedMovies()),

      child: Scaffold(
        backgroundColor: Color(0xff1E1E29),
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NowPlayingMovies(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                        color: Colors.white
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO POPULAR SCREEN
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text('See More',style: TextStyle(color: Colors.white),),
                            Icon(Icons.arrow_forward_ios, size: 16.0,color: Colors.white,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              PopularMoviesWidget(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(

                      "Top Rated",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO Top Rated Movies Screen
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text('See More',style: TextStyle(color: Colors.white),),
                            Icon(Icons.arrow_forward_ios, size: 16.0,color: Colors.white,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TopRatedMoviesWidget(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
