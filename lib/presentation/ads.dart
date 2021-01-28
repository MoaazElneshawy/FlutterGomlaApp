import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gomla/data/constants.dart';
import 'package:gomla/model/adsBaseModel.dart';

class AdsScreen extends StatefulWidget {

  Ads ads;
  AdsScreen({this.ads});

  @override
  _AdsScreenState createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: CachedNetworkImage(
          imageUrl: widget.ads.image,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Image.network(
              'https://cloud.netlifyusercontent.com/assets/344dbf88-fdf9-42bb-adb4-46f01eedd629/893434c4-d6a8-4fc0-ab32-64c1e0d2668d/error-state-image21-opt-1.png'),
        ),
      ),
    );
  }
}
