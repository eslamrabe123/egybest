import 'package:egybest/core/services/services_locator.dart';
import 'package:egybest/core/utils/app_string.dart';
import 'package:egybest/movies_module/presentation/controller/movies_events.dart';
import 'package:egybest/movies_module/presentation/screens/popular_see_more_screen.dart';
import 'package:egybest/movies_module/presentation/screens/search/search_screen.dart';
import 'package:egybest/movies_module/presentation/screens/top_rated_see_more_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/sheared/model/text_field_widget.dart';
import '../../../core/utils/movies_widgets/text_widget.dart';
import '../component/now_playing_movies_component.dart';
import '../component/popular_movies_component.dart';
import '../component/top_rated_movies_component.dart';
import '../controller/movies_bloc.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: Scaffold(

        // backgroundColor: const Color(0xff2C3E50),
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircularTextFormField(
                controller: TextEditingController(),

                labelText: 'Search',
                hintText: 'Enter movie name',
                keyboardType: TextInputType.text,
                onSubmit: (movieName) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(
                        movieName: movieName,
                      ),
                    ),
                  );
                },
              ),
              const NowPlayingComponent(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextWidget(
                      text: AppString.popular,
                      color: Colors.white,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SeeMorePopularMovies(),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(AppString.seeMore),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const PopularMoviesComponent(),
              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  24.0,
                  16.0,
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.topRated,
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TopRatedSeeMoreScreen(),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(AppString.seeMore),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TopRatedMoviesComponent(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
