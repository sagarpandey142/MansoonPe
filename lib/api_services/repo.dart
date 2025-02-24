import 'package:projects/modals/otp_req.dart';
import 'package:projects/modals/otp_res.dart';
import 'package:projects/modals/reg_profile_req.dart';
import 'package:projects/modals/verify_otp_req.dart';
import 'package:projects/modals/verify_otp_res.dart';

import '../modals/modal.dart';
import '../modals/reg_profile_res.dart';
import 'api_client.dart';
import 'dio_config.dart';

class Repository {
  late ApiClient _apiReq;

  Repository({String token='',bool isRequestTypeMultipart=false}) {
    _apiReq = isRequestTypeMultipart
        ? ApiClient(DioConfig.getInstance().getMultipartDio(token: token))
    : ApiClient(DioConfig.getInstance().getDio(token: token));
  }

  Future<KnowledgeRes> getKnowledgeCenter(KnowledgeReq kr) async {
    return await _apiReq.getKnowledgeCenter(kr);
  }
  Future<OtpRes> generateOTP(OtpReq kr) async {
    return await _apiReq.generateOtp(kr);
  }
  Future<VerifyOtpRes> verifyOTP(VerifyOtpReq kr) async {
    return await _apiReq.verifyOtp(kr);
  }
  Future<RegProfileRes> registerProfile(RegProfileReq kr) async {
    return await _apiReq.registerProfile(kr);
  }

}