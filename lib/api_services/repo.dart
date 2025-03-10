import 'package:projects/modals/add_material_req.dart';
import 'package:projects/modals/add_material_res.dart';
import 'package:projects/modals/all_order_res.dart';
import 'package:projects/modals/create_project_req.dart';
import 'package:dio/dio.dart';
import 'package:projects/modals/download_res.dart';
import 'package:projects/modals/otp_req.dart';
import 'package:projects/modals/otp_res.dart';
import 'package:projects/modals/profile_res.dart';
import 'package:projects/modals/project_res.dart';
import 'package:projects/modals/reg_profile_req.dart';
import 'package:projects/modals/upload_res.dart';
import 'package:projects/modals/verify_otp_req.dart';
import 'package:projects/modals/verify_otp_res.dart';

import '../modals/create_project_res.dart';
import '../modals/modal.dart';
import '../modals/order_res.dart';
import '../modals/reg_profile_res.dart';
import 'api_client.dart';
import 'dio_config.dart';

class Repository {
  late ApiClient _apiReq;

  Repository({String token = '', bool isRequestTypeMultipart = false}) {
    _apiReq = isRequestTypeMultipart
        ? ApiClient(DioConfig.getInstance().getMultipartDio(token: token))
        : ApiClient(DioConfig.getInstance().getDio(token: token));
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

  Future<UploadRes> uploadFile(FormData kr) async {
    return await _apiReq.upload(kr);
  }

  Future<CreateProjectRes> createProject(CreateProjectReq kr) async {
    return await _apiReq.createProject(kr);
  }

  Future<ProfileRes> getProfile(dynamic kr) async {
    return await _apiReq.getProfile(kr);
  }

  Future<ProjectRes> getProjects(dynamic kr) async {
    return await _apiReq.getProjects(kr);
  }

  Future<DownloadRes> downloadApi(String endpoint, dynamic kr) async {
    return await _apiReq.downloadFile(endpoint, kr);
  }

  Future<AddMaterialRes> addMaterialAPI(
      String endpoint, AddMaterialReq kr) async {
    return await _apiReq.addMaterial(endpoint, kr);
  }

  Future<OrdersRes> getOrders(String endpoint,dynamic kr) async {
    return await _apiReq.getOrders(endpoint,kr);
  }
  Future<AllOrdersRes> getAllOrders(dynamic kr) async {
    return await _apiReq.getAllOrders(kr);
  }
}