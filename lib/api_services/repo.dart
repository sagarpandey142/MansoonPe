import 'package:projects/modals/otp_req.dart';
import 'package:projects/modals/reg_profile_req.dart';
import 'package:projects/modals/verify_otp_req.dart';
import 'package:projects/modals/verify_otp_res.dart';

import '../modals/modal.dart';
import 'api_client.dart';
import 'dio_config.dart';

class Repository {
  late ApiClient _apiReq;

  Repository({String token=''}) {
    _apiReq = ApiClient(DioConfig.getInstance().getDio(token: token));
  }

  Future<KnowledgeRes> getKnowledgeCenter(KnowledgeReq kr) async {
    return await _apiReq.getKnowledgeCenter(kr);
  }
  Future<dynamic> generateOTP(OtpReq kr) async {
    return await _apiReq.generateOtp(kr);
  }
  Future<dynamic> verifyOTP(VerifyOtpReq kr) async {
    return await _apiReq.verifyOtp(kr);
  }
  Future<RegProfileRes> registerProfile(RegProfileReq kr) async {
    return await _apiReq.registerProfile(kr);
  }

}