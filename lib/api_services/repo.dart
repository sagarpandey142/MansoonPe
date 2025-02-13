import '../modals/modal.dart';
import 'api_client.dart';
import 'dio_config.dart';

class Repository{
  late ApiClient _apiReq;

  Repository(){
    _apiReq = ApiClient(DioConfig.getInstance().getDio());
  }

  Future<KnowledgeRes> getKnowledgeCenter(KnowledgeReq kr) async{
    return await _apiReq.getKnowledgeCenter(kr);
  }
}