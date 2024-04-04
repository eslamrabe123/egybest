import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:egybest/all_module/presntaion/controller/all_bloc.dart';
import 'package:egybest/all_module/presntaion/controller/all_state.dart';
import 'package:egybest/core/utils/app_string.dart';
import 'package:egybest/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constance.dart';
import '../../../movies_module/presentation/screens/another/movie_detail_screen.dart';

class AllComponent extends StatelessWidget {
  const AllComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllBloc, AllState>(
      buildWhen: (previous, current) => previous.allState != current.allState,
      builder: (context, state) {
        print(state.allState);
        //print("NOW PLAYING MOVIES STATE >>>>");
        switch (state.allState) {
          case RequestState.loading:
            return SliverToBoxAdapter(
              child: const SizedBox(
                height: 400.0,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          case RequestState.loaded:
            return SliverToBoxAdapter(
              child: FadeIn(
                duration: const Duration(milliseconds: 500),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 400.0,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {},
                  ),
                  items: state.all.map(
                    (item) {
                      return GestureDetector(
                        key: const Key('openMovieMinimalDetail'),
                        onTap: () {
                          print(item.id.toString());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetailScreen(
                                        id: item.id,
                                      )));
                        },
                        child: Stack(
                          children: [
                            ShaderMask(
                              shaderCallback: (rect) {
                                return const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    // fromLTRB
                                    Colors.transparent,
                                    Colors.black,
                                    Colors.black,
                                    Colors.transparent,
                                  ],
                                  stops: [0, 0.3, 0.5, 1],
                                ).createShader(
                                  Rect.fromLTRB(0, 0, rect.width, rect.height),
                                );
                              },
                              blendMode: BlendMode.dstIn,
                              child: CachedNetworkImage(
                                height: 560.0,
                                imageUrl:
                                    ApiConstance.imageUrl(item.backdropPath),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.circle,
                                          color: Colors.redAccent,
                                          size: 16.0,
                                        ),
                                        const SizedBox(width: 4.0),
                                        Text(
                                          AppString.trending,
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.cyanAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 16.0, left: 15, right: 15),
                                    child: Text(
                                      item.title,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            );
          case RequestState.error:
            return SliverToBoxAdapter(
                child: const Center(child: Text("Error")));
        }
      },
    );
  }
}
