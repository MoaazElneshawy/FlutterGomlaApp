class HomeBaseModel {
  int _status;
  String _message;
  Data _data;

  HomeBaseModel({int status, String message, Data data}) {
    this._status = status;
    this._message = message;
    this._data = data;
  }

  int get status => _status;
  set status(int status) => _status = status;
  String get message => _message;
  set message(String message) => _message = message;
  Data get data => _data;
  set data(Data data) => _data = data;

  HomeBaseModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data.toJson();
    }
    return data;
  }
}

class Data {
  Restaurant _restaurant;

  Data({Restaurant restaurant}) {
    this._restaurant = restaurant;
  }

  Restaurant get restaurant => _restaurant;
  set restaurant(Restaurant restaurant) => _restaurant = restaurant;

  Data.fromJson(Map<String, dynamic> json) {
    _restaurant = json['restaurant'] != null
        ? new Restaurant.fromJson(json['restaurant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._restaurant != null) {
      data['restaurant'] = this._restaurant.toJson();
    }
    return data;
  }
}

class Restaurant {
  String _name;
  String _desc;
  String _deliveryTime;
  String _deliveryFee;
  String _logo;
  String _cover;
  String _currency;
  String _status;
  List<Menu> _menu;

  Restaurant(
      {String name,
        String desc,
        String deliveryTime,
        String deliveryFee,
        String logo,
        String cover,
        String currency,
        String status,
        List<Menu> menu}) {
    this._name = name;
    this._desc = desc;
    this._deliveryTime = deliveryTime;
    this._deliveryFee = deliveryFee;
    this._logo = logo;
    this._cover = cover;
    this._currency = currency;
    this._status = status;
    this._menu = menu;
  }

  String get name => _name;
  set name(String name) => _name = name;
  String get desc => _desc;
  set desc(String desc) => _desc = desc;
  String get deliveryTime => _deliveryTime;
  set deliveryTime(String deliveryTime) => _deliveryTime = deliveryTime;
  String get deliveryFee => _deliveryFee;
  set deliveryFee(String deliveryFee) => _deliveryFee = deliveryFee;
  String get logo => _logo;
  set logo(String logo) => _logo = logo;
  String get cover => _cover;
  set cover(String cover) => _cover = cover;
  String get currency => _currency;
  set currency(String currency) => _currency = currency;
  String get status => _status;
  set status(String status) => _status = status;
  List<Menu> get menu => _menu;
  set menu(List<Menu> menu) => _menu = menu;

  Restaurant.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _desc = json['desc'];
    _deliveryTime = json['delivery_time'];
    _deliveryFee = json['delivery_fee'];
    _logo = json['logo'];
    _cover = json['cover'];
    _currency = json['currency'];
    _status = json['status'];
    if (json['menu'] != null) {
      _menu = new List<Menu>();
      json['menu'].forEach((v) {
        _menu.add(new Menu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['desc'] = this._desc;
    data['delivery_time'] = this._deliveryTime;
    data['delivery_fee'] = this._deliveryFee;
    data['logo'] = this._logo;
    data['cover'] = this._cover;
    data['currency'] = this._currency;
    data['status'] = this._status;
    if (this._menu != null) {
      data['menu'] = this._menu.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Menu {
  int _id;
  String _name;
  List<Meals> _meals;

  Menu({int id, String name, List<Meals> meals}) {
    this._id = id;
    this._name = name;
    this._meals = meals;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  List<Meals> get meals => _meals;
  set meals(List<Meals> meals) => _meals = meals;

  Menu.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    if (json['meals'] != null) {
      _meals = new List<Meals>();
      json['meals'].forEach((v) {
        _meals.add(new Meals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    if (this._meals != null) {
      data['meals'] = this._meals.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meals {
  int _id;
  String _name;
  String _desc;
  int _max;
  String _image;
  String _currency;
  String _price;
  String _priceAfter;
  String _offer;
  String _offerType;
  String _offerTypeLabel;
  List<Null> _options;

  Meals(
      {int id,
        String name,
        String desc,
        int max,
        String image,
        String currency,
        String price,
        String priceAfter,
        String offer,
        String offerType,
        String offerTypeLabel,
        List<Null> options}) {
    this._id = id;
    this._name = name;
    this._desc = desc;
    this._max = max;
    this._image = image;
    this._currency = currency;
    this._price = price;
    this._priceAfter = priceAfter;
    this._offer = offer;
    this._offerType = offerType;
    this._offerTypeLabel = offerTypeLabel;
    this._options = options;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get desc => _desc;
  set desc(String desc) => _desc = desc;
  int get max => _max;
  set max(int max) => _max = max;
  String get image => _image;
  set image(String image) => _image = image;
  String get currency => _currency;
  set currency(String currency) => _currency = currency;
  String get price => _price;
  set price(String price) => _price = price;
  String get priceAfter => _priceAfter;
  set priceAfter(String priceAfter) => _priceAfter = priceAfter;
  String get offer => _offer;
  set offer(String offer) => _offer = offer;
  String get offerType => _offerType;
  set offerType(String offerType) => _offerType = offerType;
  String get offerTypeLabel => _offerTypeLabel;
  set offerTypeLabel(String offerTypeLabel) => _offerTypeLabel = offerTypeLabel;
  List<Null> get options => _options;
  set options(List<Null> options) => _options = options;

  Meals.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _desc = json['desc'];
    _max = json['max'];
    _image = json['image'];
    _currency = json['currency'];
    _price = json['price'];
    _priceAfter = json['price_after'];
    _offer = json['offer'];
    _offerType = json['offer_type'];
    _offerTypeLabel = json['offer_type_label'];
    // if (json['options'] != null) {
    //   _options = new List<Null>();
    //   json['options'].forEach((v) {
    //     _options.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['desc'] = this._desc;
    data['max'] = this._max;
    data['image'] = this._image;
    data['currency'] = this._currency;
    data['price'] = this._price;
    data['price_after'] = this._priceAfter;
    data['offer'] = this._offer;
    data['offer_type'] = this._offerType;
    data['offer_type_label'] = this._offerTypeLabel;
    // if (this._options != null) {
      // data['options'] = this._options.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
