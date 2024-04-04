import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:egybest/all_module/presntaion/controller/all_bloc.dart';
import 'package:egybest/all_module/presntaion/controller/all_event.dart';
import 'package:egybest/all_module/presntaion/controller/all_state.dart';
import 'package:egybest/all_module/presntaion/screens/search_screen.dart';
import 'package:egybest/core/services/services_locator.dart';
import 'package:egybest/core/utils/movies_widgets/text_widget.dart';
import 'package:egybest/movies_module/presentation/screens/another/movie_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constance.dart';
import '../../../movies_module/presentation/screens/movies_screen.dart';
import '../../../movies_module/presentation/screens/search/search_screen.dart';
import '../../../tv_module/presentation/screens/tv_screen.dart';
import '../component/all_component.dart';

class AllScreen extends StatelessWidget {
  const AllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<AllBloc>()..add(GetAllEvent()),
      child: Scaffold(
        body: Center(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.all(5),
                sliver: SearchIcon(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  onSubmit: (movieName) {
                    if (movieName.isNotEmpty) {
                      return Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(
                            movieName: movieName,
                          ),
                        ),
                      );
                    } else {
                      return "NOT FOUND";
                    }
                  },
                ),
              ),
              const AllComponent(),
              SliverPadding(
                padding: EdgeInsets.all(10),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Spacer(),
                      TogelButton(
                        text: "Movies",
                        color: Colors.red,
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MoviesScreen(),
                            ),
                          );
                        },
                      ),
                      Spacer(),
                      TogelButton(
                        text: "TVs",
                        color: Colors.amber,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TVScreen(),
                            ),
                          );
                        },
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(child: const SizedBox(height: 50.0)),
              SliverPadding(
                padding: const EdgeInsets.all(10),
                sliver: _showRecommendations(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showRecommendations() {
    return BlocBuilder<AllBloc, AllState>(
      builder: (context, state) {
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final recommendation = state.all[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailScreen(
                        id: recommendation.id,
                      ),
                    ),
                  );
                },
                child: FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    child: CachedNetworkImage(
                      imageUrl:
                          ApiConstance.imageUrl(recommendation.backdropPath!),
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
                      height: 180.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
            childCount: state.all.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 7.0,
            crossAxisSpacing: 7.0,
            childAspectRatio: 0.6,
            crossAxisCount: 3,
          ),
        );
      },
    );
  }
}

class TogelButton extends StatelessWidget {
  const TogelButton({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
  });

  final String text;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      height: MediaQuery.of(context).size.height / 10,
      child: TextButton(
        onPressed:onTap,
        child: TextWidget(
          text: text,
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
      ),
    );
  }
}
