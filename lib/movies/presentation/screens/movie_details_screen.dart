import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movie_app/movies/presentation/controller/movies_events.dart';
import 'package:movie_app/movies/presentation/widgets/movie_poster_item_widget.dart';
import 'package:movie_app/movies/presentation/widgets/movie_recommendations_widget.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/utils/dummy.dart';

class MovieDetailsScreen extends StatelessWidget {
  MovieDetailsScreen({super.key});
  final Movie movie = moviesList[0];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> sL<MoviesBloc>()..add(GetMovieRecommendations(106174)),
      child: Scaffold(
        backgroundColor: Color(0xff1E1E29),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    FadeIn(
                      duration: Duration(milliseconds: 500),
                      child: SizedBox(
                        width: double.infinity,
                        height: 245,
                        child: CachedNetworkImage(
                          imageUrl: Constants.imageUrl(movie.backdropPath!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: TextStyle(
                              fontFamily: GoogleFonts.inter.toString(),
                              fontSize: 20,
                              color: Color(0xffCECED0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xff424242),
                                  borderRadius: BorderRadius.circular(2.5),
                                  border: Border.all(color: Color(0xff36363A)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 4,
                                  ),
                                  child: Text(
                                    '2022',
                                    style: TextStyle(
                                      fontSize: 12.5,
                                      fontFamily: GoogleFonts.inter.toString(),
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xffC5C5C5),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color(0xffFFC100),
                                    size: 20,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '4.5',
                                    style: TextStyle(
                                      fontSize: 12.5,
                                      fontFamily: GoogleFonts.inter.toString(),
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xffC5C5C5),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 24),
                              Text(
                                '1h 40m',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  fontFamily: GoogleFonts.inter.toString(),
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff949499),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            movie.overview,
                            style: TextStyle(
                              fontSize: 14.1,
                              fontFamily: GoogleFonts.inter.toString(),
                              fontWeight: FontWeight.w400,
                              color: Color(0xffA7A7AB),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Genres: Animation, Family, Comedy, Fantasy',
                            style: TextStyle(
                              fontSize: 10.5,
                              fontFamily: GoogleFonts.inter.toString(),
                              fontWeight: FontWeight.w400,
                              color: Color(0xff939398),
                            ),
                          ),
                          SizedBox(height: 30),

                        ],
                      ),
                    ),


                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                sliver: SliverToBoxAdapter(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'MORE LIKE THIS',
                      style: TextStyle(
                        fontSize: 13.5,
                        fontFamily: GoogleFonts.inter.toString(),
                        fontWeight: FontWeight.w400,
                        color: Color(0xffB6B6BA),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                sliver: MovieRecommendationsWidget()
              )
            ],

          ),
        ),
      ),
    );
  }
}
