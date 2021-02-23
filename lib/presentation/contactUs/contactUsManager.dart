import 'package:gomla/model/contactUsInfoBaseModel.dart';
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
}
