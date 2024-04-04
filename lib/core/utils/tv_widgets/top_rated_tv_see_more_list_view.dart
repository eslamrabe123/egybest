import 'package:egybest/core/utils/movies_widgets/text_widget.dart';
import 'package:egybest/core/utils/tv_widgets/see_more_tv_item.dart';
import 'package:egybest/tv_module/presentation/controller/tv_bloc.dart';
import 'package:egybest/tv_module/presentation/controller/tv_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../enums.dart';

class TopRatedTVSeeMoreListView extends StatelessWidget {
  const TopRatedTVSeeMoreListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TVStates>(
      builder: (context, state) {
        switch (state.topRatedTVState) {
          case RequestState.loading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.loaded:
            return ListView.builder(
                shrinkWrap: true,
                itemCount: state.topRatedTV.length,
                itemBuilder: (context, index) {
                  return SeeMoreTVItem(
                    model: state.topRatedTV[index],
                  );
                });
          case RequestState.error:
            return Center(
                child: TextWidget(text: state.topRatedTVErrorMessage.toString()));
        }
      },
    );
  }
}
