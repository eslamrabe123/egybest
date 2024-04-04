import 'package:egybest/core/services/services_locator.dart';
import 'package:egybest/movies_module/presentation/controller/movies_bloc.dart';
import 'package:egybest/movies_module/presentation/screens/search/search_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/movies_widgets/text_widget.dart';
import '../../controller/movies_events.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.movieName});

  final String movieName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          serviceLocator<MoviesBloc>()..add(SearchMovieByNameEvent(movieName)),
      child: Scaffold(
        appBar: AppBar(
          title: TextWidget(
            text: movieName,
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
        body: const SearchListView(),
      ),
    );
  }
}
