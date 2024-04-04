import 'package:egybest/core/services/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/movies_widgets/text_widget.dart';
import '../../../core/utils/movies_widgets/top_rated_movies_see_more_list_view.dart';
import '../controller/movies_bloc.dart';
import '../controller/movies_events.dart';

class TopRatedSeeMoreScreen extends StatelessWidget {
  const TopRatedSeeMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          serviceLocator<MoviesBloc>()..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const TextWidget(
            text: "Top Rated Movies",
            color: Colors.white,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        body: const TopRatedMoviesSeeMoreListView(),
      ),
    );
  }
}
