import 'package:egybest/core/utils/movies_widgets/text_widget.dart';
import 'package:egybest/movies_module/presentation/controller/movies_bloc.dart';
import 'package:egybest/movies_module/presentation/controller/movies_state.dart';
import 'package:egybest/movies_module/presentation/screens/search/search_iten.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums.dart';



class SearchListView extends StatelessWidget {
  const SearchListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        print(state.searchMoviesState);
        switch (state.searchMoviesState) {
          case RequestState.loading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.loaded:
            return ListView.builder(
                shrinkWrap: true,
                itemCount: state.searchMoviesRequest.length,
                itemBuilder: (context, index) {
                  return SearchItem(
                    model: state.searchMoviesRequest[index],
                  );
                });
          case RequestState.error:
            return Center(
                child: TextWidget(text: state.searchMoviesErrorMessage.toString()));
        }

      },
    );
  }
}
