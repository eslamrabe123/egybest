import 'package:egybest/movies_module/domain/entity/genres.dart';

class GenresModel extends Genres {
  const GenresModel({
    required super.id,
    required super.name,
  });

  factory GenresModel.fromjson(Map<String,dynamic>json){
    return GenresModel(
      id: json["id"],
      name: json["name"],
    );
  }
}
