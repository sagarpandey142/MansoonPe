class Apis {
  static const String baseUrl =
      'http://ec2-13-127-91-221.ap-south-1.compute.amazonaws.com:8080/';

  static const String generateOTPApi = 'api/auth/send-otp';
  static const String verifyOTPApi = 'api/auth/verify-otp';
  static const String registerProfileApi = 'api/profile';
  static const String createProjectApi = 'api/project';
  static const String uploadApi = 'api/upload';
  static const String downloadApi = 'api/download';
  static const String orderApi = 'order';
  static const String allOrderApi = 'api/order';
}