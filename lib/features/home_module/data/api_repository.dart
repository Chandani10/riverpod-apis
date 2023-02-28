
import 'package:riverpod_apis/constant/export.dart';

class ApiRepositoryApi {
  final DioClient _dioClient;

  // injecting dio instance
  ApiRepositoryApi(this._dioClient);

  Future <SearchState> getCharactersData() async {
    try {
      final res = await _dioClient.get(Endpoints.baseUrl+Endpoints.characterEndPoint);
      final characterList = (res.data["results"] as List<dynamic>)
          .map((character) => CharacterModel.fromJson(character))
          .toList();
      return SearchState(characterList: characterList);
    } on DioError catch (error) {
      debugPrint('******exceptionErrorDio $error');
      throw DioExceptions.fromDioError(error);

    }
  }
}
