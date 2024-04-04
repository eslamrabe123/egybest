import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:egybest/tv_module/presentation/controller/tv_bloc.dart';
import 'package:egybest/tv_module/presentation/controller/tv_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constance.dart';
import '../../../movies_module/presentation/screens/another/movie_detail_screen.dart';


class PopularTVComponent extends StatelessWidget {
  const PopularTVComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TVStates>(
      buildWhen: (previous, current) =>
      previous.popularTVState != current.popularTVState,
      builder: (context, state) {
        print(state.trendingTVState);

        return FadeIn(
          duration: const Duration(milliseconds: 500),
          child: SizedBox(
            height: 170.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: state.popularTV.length,
              itemBuilder: (context, index) {
                final movie = state.popularTV[index];
                return Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) =>  MovieDetailScreen(id:movie.id,)));
                    },
                    child: ClipRRect(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(8.0)),
                      child: CachedNetworkImage(
                        width: 120.0,
                        fit: BoxFit.cover,
                        imageUrl: ApiConstance.imageUrl(movie.backdropPath),
                        placeholder: (context, url) =>
                            Shimmer.fromColors(
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
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
