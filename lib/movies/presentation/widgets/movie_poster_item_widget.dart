import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/presentation/screens/movie_details_screen.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/constants.dart';
class MoviePosterItemWidget extends StatelessWidget {
  const MoviePosterItemWidget({super.key,required this.movie});
final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () {
       Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetailsScreen()));
        },
        child: ClipRRect(
          borderRadius:
          const BorderRadius.all(Radius.circular(5.0)),
          child: CachedNetworkImage(
            width: 120.0,
            fit: BoxFit.cover,
            imageUrl: Constants.imageUrl(movie.backdropPath!),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[800]!,
              child: Container(
                height: 170.0,
                width: 120.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            errorWidget: (context, url, error) =>
            const Icon(Icons.error),
          )
        ),
      ),
    );
  }
}
