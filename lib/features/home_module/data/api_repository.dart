
import 'package:riverpod_apis/constant/export.dart';

class ApiRepositoryApi {
  final DioClient _dioClient;

  // injecting dio instance
  ApiRepositoryApi(this._dioClient);

  Future getCharactersData() async {
    try {
      final res = await _dioClient.get(Endpoints.baseUrl+Endpoints.characterEndPoint);
      return res.data["results"];
    } on DioError catch (error) {
      debugPrint('******exceptionErrorDio $error');
      throw DioExceptions.fromDioError(error);

    }
  }
}