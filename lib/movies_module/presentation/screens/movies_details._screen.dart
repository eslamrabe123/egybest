// import 'package:egybest/core/services/services_locator.dart';
// import 'package:egybest/core/utils/widgets/text_widget.dart';
// import 'package:egybest/movies_module/domain/entity/movies.dart';
// import 'package:egybest/movies_module/presentation/controller/movies_events.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../controller/movies_bloc.dart';
// import '../controller/movies_state.dart';
//
// class MoviesDetailsScreen extends StatelessWidget {
//   const MoviesDetailsScreen({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>
//           serviceLocator<MoviesBloc>()..add(GetPopularMoviesEvent()),
//       child: BlocBuilder<MoviesBloc, MoviesState>(
//         builder: (context, state) {
//           return Scaffold(
//             body: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     width: double.infinity,
//                     child: Image.network(
//                       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQexV7cN2Ev3Gj5g_h33c3eI5WSRongwQ6m0w&usqp=CAU',
//                       fit: BoxFit.fitWidth,
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Column(
//                       children: [
//                         TextWidget(
//                           text: "Movie Name",
//                           color: Colors.white,
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         TextWidget(
//                           textOverflow: TextOverflow.ellipsis,
//                           fontSize: 12,
//                           text: "model.overview",
//                           color: Colors.white,
//                           maxLines: 2,
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         TextWidget(
//                           text: "MORE LIKE THIS",
//                           color: Colors.white,
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                       ],
//                     ),
//                   ),
//                   GridView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3, // number of items in each row
//                       mainAxisSpacing: 8.0, // spacing between rows
//                       crossAxisSpacing: 8.0, // spacing between columns
//                     ),
//                     padding: const EdgeInsets.all(8.0),
//                     // padding around the grid
//                     itemCount: state.popularMovies.length,
//                     // total number of items
//                     itemBuilder: (context, index) {
//                       return MoreLikeThisWidget(
//                         moviesModel: state.popularMovies[index],
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class MoreLikeThisWidget extends StatelessWidget {
//   const MoreLikeThisWidget({
//     super.key,
//     required this.moviesModel,
//   });
//
//   final Movies moviesModel;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.blue, // color of grid items
//       height: 50,
//       width: 100,
//      // child: Image.network("https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA5L3Jhd3BpeGVsX29mZmljZV8yOF9mZW1hbGVfbWluaW1hbF9yb2JvdF9mYWNlX29uX2RhcmtfYmFja2dyb3VuZF81ZDM3YjhlNy04MjRkLTQ0NWUtYjZjYy1hZmJkMDI3ZTE1NmYucG5n.png"),
//     );
//   }
// }
