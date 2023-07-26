import 'package:dio/dio.dart';

class ApiServices{
  ApiServices(this.dio);
  static const String baseUrl='http://api.themoviedb.org/3/movie/';
  static const String apiKey="6ef7ef2de9abba7f43f417733b4310a1";
  final Dio dio;

  Future<Map<String,dynamic>> getMovies({
    required String endPoint,
}) async{
    var response=await dio.get('$baseUrl$endPoint?api_key=$apiKey');
    return response.data;
    
  }
}