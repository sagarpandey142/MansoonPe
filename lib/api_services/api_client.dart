import 'package:dio/dio.dart';
import 'package:projects/modals/otp_req.dart';
import 'package:projects/modals/otp_res.dart';
import 'package:projects/modals/upload_res.dart';
import 'package:projects/modals/verify_otp_req.dart';
import 'package:projects/modals/verify_otp_res.dart';
import 'package:retrofit/retrofit.dart';
import '../modals/create_project_req.dart';
import '../modals/create_project_res.dart';
import '../modals/modal.dart';
import '../modals/reg_profile_req.dart';
import '../modals/reg_profile_res.dart';
import 'apis.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: Apis.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST(Apis.knowledgeCenterApi)
  Future<KnowledgeRes> getKnowledgeCenter(@Body() KnowledgeReq kr);

  @POST(Apis.generateOTPApi)
  Future<OtpRes> generateOtp(@Body() OtpReq kr);

  @POST(Apis.verifyOTPApi)
  Future<VerifyOtpRes> verifyOtp(@Body() VerifyOtpReq kr);

  @POST(Apis.registerProfileApi)
  Future<RegProfileRes> registerProfile(@Body() RegProfileReq kr);

  @POST(Apis.createProjectApi)
  Future<CreateProjectRes> createProject(@Body() CreateProjectReq kr);

  @POST(Apis.uploadApi)
  Future<UploadRes> upload(@Body() FormData kr);

}
