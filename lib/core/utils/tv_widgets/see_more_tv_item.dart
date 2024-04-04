import 'package:animate_do/animate_do.dart';
import 'package:egybest/core/network/api_constance.dart';
import 'package:egybest/core/utils/movies_widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../movies_module/presentation/screens/another/movie_detail_screen.dart';
import '../../../tv_module/domain/entity/tv.dart';

class SeeMoreTVItem extends StatelessWidget {
  const SeeMoreTVItem({
    super.key,
    required this.model,
  });

  final TV model;


  @override
  Widget build(BuildContext context) {
    // DateTime formattedDate1= model.releaseDate ;
    // String formattedDate = DateFormat(' yyyy',).format(formattedDate1);
    // print(formattedDate);  // Example output: "3 juillet 2023"

    return GestureDetector(
      onTap: (){
        //Navigator.push(context, MaterialPageRoute(builder: (context) =>  MovieDetailScreen(id:model.id,)));

      },
      child: FadeIn(
        duration: const Duration(milliseconds: 500),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff1B1212),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(ApiConstance.imageUrl(model.backdropPath)),
                          )),
                      width: 100,
                      height: 150,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 210,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            textOverflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            text: model.title,
                            color: Colors.white,
                            fontSize: 17,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.red,
                                width: 35,
                                height: 15,
                                child: Center(
                                  child: TextWidget(
                                    text: model.releaseDate,
                                    fontSize: 10.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              TextWidget(
                                text: model.voteAverage.toString(),
                                fontSize: 11,
                                maxLines: 2,
                                color: Colors.white,

                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextWidget(
                            textOverflow: TextOverflow.ellipsis,
                            fontSize: 12,
                            text: model.overview,
                            color: Colors.white,

                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
