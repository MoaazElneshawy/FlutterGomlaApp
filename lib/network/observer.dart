import 'package:flutter/material.dart';

class Observer<T> extends StatelessWidget {

  @required
  final Stream stream;

  @required
  final Function onSuccess;

  final Function onLoading;

  final Function onError;

  const Observer({this.stream, this.onSuccess, this.onError, this.onLoading});

  Function get _defaultError => (context, error) => Center(child: Text(error));

  Function get _defaultLoading => (context) => Center(child: CircularProgressIndicator());


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return onError == null
                ? _defaultError(context, snapshot.error)
                : onError(
                context, snapshot.error);
          }
          if (snapshot.hasData) {
            return onSuccess(context, snapshot.data);
          } else {
            return onLoading != null ? onLoading(context) : _defaultLoading(context);
          }
        });
  }
}
