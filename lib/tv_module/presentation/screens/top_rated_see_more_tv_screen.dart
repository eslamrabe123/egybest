import 'package:egybest/core/services/services_locator.dart';
import 'package:egybest/core/utils/app_string.dart';
import 'package:egybest/tv_module/presentation/controller/tv_bloc.dart';
import 'package:egybest/tv_module/presentation/controller/tv_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/movies_widgets/text_widget.dart';
import '../../../core/utils/tv_widgets/top_rated_tv_see_more_list_view.dart';


class TopRatedTVSeeMoreScreen extends StatelessWidget {
  const TopRatedTVSeeMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      serviceLocator<TvBloc>()..add(GetTopRatedTVEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const TextWidget(
            text: AppString.topRatedTVs,
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
        body: const TopRatedTVSeeMoreListView(),
      ),
    );
  }
}
