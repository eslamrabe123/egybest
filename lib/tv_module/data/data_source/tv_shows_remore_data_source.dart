import 'dart:core';

import 'package:dio/dio.dart';
import 'package:egybest/core/network/api_constance.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/error_message_model.dart';
import '../models/tv_model.dart';

abstract class BaseTVRemoteDataSource {
  Future<List<TVModel>> getPopularTV();

  Future<List<TVModel>> getTopRatedTV();
  Future<List<TVModel>> trendingRatedTV();
}

class TVRemoteDataSource implements BaseTVRemoteDataSource {
  Dio dio = Dio();
  TVModel? tvModel;

  @override
  Future<List<TVModel>> getPopularTV() async {
    final response = await dio.get(ApiConstance.popularTVShows);
    if (response.statusCode == 200) {
      final data = List<TVModel>.from(
        (response.data["results"] as List).map(
          (e) => TVModel.fromjson(e),
        ),
      );
      // print("DATA IS ::: $data");
      return data;
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromjson(response.data),
      );
    }
  }

  @override
  Future<List<TVModel>> getTopRatedTV() async {
    final response = await dio.get(ApiConstance.topRatedTVApiPath);
    if (response.statusCode == 200) {
      final data = List<TVModel>.from(
        (response.data["results"] as List).map(
              (e) => TVModel.fromjson(e),
        ),
      );
      return data;
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromjson(response.data),
      );
    }

  }

  @override
  Future<List<TVModel>> trendingRatedTV() async{
    final response = await dio.get(ApiConstance.trendingTVApiPath);
    if(response.statusCode == 200){
      final data = List<TVModel>.from(
        (response.data["results"] as List).map(
              (e) => TVModel.fromjson(e),
        ),
      );
      return data;
    }else{
      throw ServerExceptions(errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }
}
