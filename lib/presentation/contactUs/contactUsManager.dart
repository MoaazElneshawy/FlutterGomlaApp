import 'package:gomla/model/contactUsInfoBaseModel.dart';
import 'package:gomla/model/dafultResponse.dart';
import 'package:gomla/network/apiCall.dart';
import 'package:rxdart/rxdart.dart';

class ContactUsManager {
  ApiCall _call = ApiCall();

  PublishSubject<ContactInfoBaseModel> _getInfo =
      PublishSubject<ContactInfoBaseModel>();

  Stream getInfo() {
    Stream.fromFuture(_call.getContactInfo()).listen((event) {
      _getInfo.add(event);
    });
    return _getInfo.stream;
  }

  PublishSubject<DefaultResponse> _sendMessage =
      PublishSubject<DefaultResponse>();

  BehaviorSubject<bool> isLoading = BehaviorSubject<bool>.seeded(false);

  // Sink<Map> get message => _sendMessage.sink;

  Stream sendMessage(Map body) {
    Stream.fromFuture(_call.sendContactUsMessage(body)).listen((event) {
      _sendMessage.add(event);
    });
    return _sendMessage.stream;
  }

/*

1- call service
2- Stream controller >> return from service
3- sink.add the response to stream controller
4- get stream from Stream controller
5- create stream builder to build the steam



 */

}
