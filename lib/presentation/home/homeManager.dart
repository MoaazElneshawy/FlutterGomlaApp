import 'package:gomla/model/homeBaseModel.dart';
import 'package:gomla/network/apiCall.dart';

class HomeManager {

  ApiCall _apiCall = ApiCall();

  Future<HomeBaseModel> getHomeScreenData() async{
    return await _apiCall.getHomeScreen();
  }

}
