import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

import '../../../core/utils/dummy.dart';
class MovieDetailsScreen extends StatelessWidget {
   MovieDetailsScreen({super.key});
final Movie movie =moviesList[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1E29),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeIn(
              duration: Duration(milliseconds: 500),
              child: SizedBox(
                width: double.infinity,
                height: 245,
               child:  CachedNetworkImage(
                 imageUrl: Constants.imageUrl(movie.backdropPath),
                 fit: BoxFit.cover,
               ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
