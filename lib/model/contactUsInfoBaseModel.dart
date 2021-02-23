class ContactInfoBaseModel {
  int status;
  String message;
  Data data;

  ContactInfoBaseModel({this.status, this.message, this.data});

  ContactInfoBaseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  Info info;
  Page page;

  Data({this.info, this.page});

  Data.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    if (this.page != null) {
      data['page'] = this.page.toJson();
    }
    return data;
  }
}

class Info {
  String phone;
  String mobile;
  String instagram;
  String lat;
  String lng;

  Info({this.phone, this.mobile, this.instagram, this.lat, this.lng});

  Info.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    mobile = json['mobile'];
    instagram = json['instagram'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['mobile'] = this.mobile;
    data['instagram'] = this.instagram;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class Page {
  String title;
  String content;

  Page({this.title, this.content});

  Page.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    return data;
  }
}
