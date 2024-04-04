import 'package:dio/dio.dart';
import 'package:egybest/core/error/exceptions.dart';

import '../../../core/network/error_message_model.dart';
import '../../../movies_module/data/models/movies_model.dart';

abstract class BaseAllRemoteDataSource {
  Future<List<MoviesModel>> getAll();
}

class AllRemoteDataSource extends BaseAllRemoteDataSource {
  Dio dio = Dio();

  @override
  Future<List<MoviesModel>> getAll() async {
    final response = await dio.get("https://api.themoviedb.org/3/trending/all/day?api_key=4c5565d2163dc02e65587a209bbd07ab");
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
          (response.data["results"] as List).map(
                  (e) => MoviesModel.fromjson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }
}
