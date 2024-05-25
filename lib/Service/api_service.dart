import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "http://api.brainshop.ai")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/get")
  Future<String> sendMessage(@Query('bid') String bid, @Query('key') String key, @Query('uid') String uid, @Query('msg') String message);
}
