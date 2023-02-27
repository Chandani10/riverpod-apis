
import 'package:dio/dio.dart';
import 'package:riverpod_apis/data/end_points.dart';
import 'package:riverpod_apis/data/networks/dio_client.dart';



class ApiRepositoryApi {


  Future getCharactersData() async {
    try {
      final res = await Dio().get(Endpoints.baseUrl+Endpoints.characterEndPoint);
      return res.data["results"];
    } catch (e) {
      rethrow;
    }
  }
}