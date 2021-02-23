import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gomla/base/app_localization.dart';
import 'package:gomla/data/Provider.dart';
import 'package:gomla/data/constants.dart';
import 'package:gomla/model/contactUsInfoBaseModel.dart';
import 'package:gomla/network/observer.dart';
import 'package:gomla/presentation/contactUs/contactUsManager.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _stateKey = GlobalKey<FormState>();
  String _name;
  String _mobile;
  String _email;
  String _message;

  @override
  Widget build(BuildContext context) {
    ContactUsManager _manager = Provider.of(context).contactUsManager;
    AppLocalization locale = AppLocalization.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text('${locale.translate("contact_us_title")}',
            style:
                TextStyle(color: Colors.grey[800], fontFamily: Constants.FONT)),
      ),
      body: Observer(
        stream: _manager.getInfo(),
        onSuccess: (context, ContactInfoBaseModel snapshot) {
          var _info = snapshot.data.info;
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // whatsapp
                      Column(
                        children: [
                          IconButton(
                            icon: Image.asset('assets/ic_whatsapp.png'),
                            onPressed: () {
                              print('${_info.mobile}');
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${locale.translate("contact_us_whatsapp")}',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      // call
                      Column(
                        children: [
                          IconButton(
                            icon: Image.asset('assets/ic_call.png'),
                            onPressed: () {
                              print('${_info.phone}');
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${locale.translate("contact_us_call")}',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      // directoins
                      Column(
                        children: [
                          IconButton(
                            icon: Image.asset('assets/ic_location.png'),
                            onPressed: () {
                              print('${_info.lat}');
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${locale.translate("contact_us_directions")}',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      // follow us
                      Column(
                        children: [
                          IconButton(
                            icon: Image.asset('assets/ic_instagram.png'),
                            onPressed: () {
                              print('${_info.instagram}');
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${locale.translate("contact_us_follow_us")}',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                  child: Container(color: Colors.grey[200]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Form(
                    key: _stateKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${locale.translate("contact_us_send_message")}',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          inputFormatters: [
                            FilteringTextInputFormatter.singleLineFormatter
                          ],
                          decoration: InputDecoration(
                              labelText:
                                  "${locale.translate("contact_us_name")}",
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                              )),
                          onSaved: (String value) {
                            _name = value;
                          },
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "${locale.translate("contact_us_name_error")}";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              labelText:
                                  "${locale.translate("contact_us_mobile")}",
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                              )),
                          onSaved: (String value) {
                            _mobile = value;
                          },
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "${locale.translate("contact_us_mobile_error")}";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          inputFormatters: [
                            FilteringTextInputFormatter.singleLineFormatter,
                          ],
                          decoration: InputDecoration(
                              labelText:
                                  "${locale.translate("contact_us_email")}",
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                              )),
                          onSaved: (String value) {
                            _email = value;
                          },
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "${locale.translate("contact_us_email_error")}";
                            }
                            RegExp regex = new RegExp(
                                "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$");
                            if (!regex.hasMatch(value)) {
                              return "${locale.translate("contact_us_email_format_error")}";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          inputFormatters: [
                            FilteringTextInputFormatter.singleLineFormatter
                          ],
                          decoration: InputDecoration(
                              labelText:
                                  "${locale.translate("contact_us_message")}",
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                              )),
                          onSaved: (String value) {
                            _message = value;
                          },
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "${locale.translate("contact_us_message_error")}";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: RaisedButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: () {
                      if (_stateKey.currentState.validate()) {
                        _stateKey.currentState.save();
                        print('$_name , $_email , $_mobile , $_message');
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Text('${locale.translate("contact_us_send")}'),
                    ),
                  ),
                ),
                SizedBox(height: 50)
              ],
            ),
          );
        },
      ),
    );
  }
}
