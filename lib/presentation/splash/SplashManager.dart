import 'package:gomla/model/adsBaseModel.dart';
import 'package:gomla/network/apiCall.dart';
import 'package:rxdart/rxdart.dart';

class SplashManager {
  ApiCall _apiCall = ApiCall();


  // 1- create controller
  PublishSubject<AdsBaseModel> _adsSubject = PublishSubject<AdsBaseModel>();

  // 2- create stream to get the response from the controller
  // Stream<AdsBaseModel> get ads$ => _adsSubject.stream;

  // 3- create a function to call your api
  Stream<AdsBaseModel> callGetAds() {
      Stream.fromFuture(_apiCall.getAds()).listen((response) {
        _adsSubject.add(response);
      });
      return _adsSubject.stream;
  }
}
