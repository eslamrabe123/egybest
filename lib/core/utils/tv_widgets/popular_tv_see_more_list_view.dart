import 'package:egybest/core/utils/enums.dart';
import 'package:egybest/core/utils/movies_widgets/text_widget.dart';
import 'package:egybest/core/utils/tv_widgets/see_more_tv_item.dart';
import 'package:egybest/tv_module/presentation/controller/tv_bloc.dart';
import 'package:egybest/tv_module/presentation/controller/tv_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularTVSeeMoreListView extends StatelessWidget {
  const PopularTVSeeMoreListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TVStates>(
      builder: (context, state) {
        switch (state.popularTVState) {
          case RequestState.loading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.loaded:
            return ListView.builder(
                shrinkWrap: true,
                itemCount: state.popularTV.length,
                itemBuilder: (context, index) {
                  return SeeMoreTVItem(
                    model: state.popularTV[index],
                  );
                });
          case RequestState.error:
            return Center(
                child: TextWidget(text: state.popularTVErrorMessage.toString()));
        }
      },
    );
  }
}
