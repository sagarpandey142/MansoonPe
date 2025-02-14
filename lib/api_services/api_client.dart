import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../modals/modal.dart';
import 'apis.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: Apis.baseUrl)
abstract class ApiClient{
  factory ApiClient(Dio dio,{String baseUrl}) = _ApiClient;

  @POST(Apis.knowledgeCenterApi)
  Future<KnowledgeRes> getKnowledgeCenter(@Body() KnowledgeReq kr);

}