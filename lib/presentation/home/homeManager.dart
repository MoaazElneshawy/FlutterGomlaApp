import 'package:gomla/model/homeBaseModel.dart';
import 'package:gomla/network/apiCall.dart';
import 'package:rxdart/rxdart.dart';

class HomeManager {

  ApiCall _apiCall = ApiCall();

  // home data

  Future<HomeBaseModel> getHomeScreenData(String lang) async{
    return await _apiCall.getHomeScreen(lang);
  }

  PublishSubject<HomeBaseModel> _homeSubject = PublishSubject();

  Stream<HomeBaseModel> callGetHomeScreenData(String lang) {
    Stream.fromFuture(_apiCall.getHomeScreen(lang)).listen((response) {
      _homeSubject.add(response);
    });
    return _homeSubject.stream;
  }

}
