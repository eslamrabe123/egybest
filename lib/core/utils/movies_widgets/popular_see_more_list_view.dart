import 'package:egybest/core/utils/enums.dart';
import 'package:egybest/core/utils/movies_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../movies_module/presentation/controller/movies_bloc.dart';
import '../../../movies_module/presentation/controller/movies_state.dart';
import 'see_more_item.dart';

class PopularSeeMoreListView extends StatelessWidget {
  const PopularSeeMoreListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        switch (state.popularMoviesState) {
          case RequestState.loading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.loaded:
            return ListView.builder(
                shrinkWrap: true,
                itemCount: state.popularMovies.length,
                itemBuilder: (context, index) {
                  return SeeMoreItem(
                    model: state.popularMovies[index],
                  );
                });
          case RequestState.error:
            return Center(
                child: TextWidget(text: state.popularMessage.toString()));
        }
      },
    );
  }
}
