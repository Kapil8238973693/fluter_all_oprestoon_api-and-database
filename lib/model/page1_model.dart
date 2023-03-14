import 'dart:convert';
/// imageUrl : "https://loremflickr.com/640/480"
/// title : "Walter, Morar and Waters"
/// Star_number : 48
/// hotel_name : "hotel_name 1"
/// due : 1677297558
/// id : "1"

Page1Model page1ModelFromJson(String str) => Page1Model.fromJson(json.decode(str));
String page1ModelToJson(Page1Model data) => json.encode(data.toJson());
class Page1Model {
  Page1Model({
      String? imageUrl, 
      String? title, 
      num? starNumber, 
      String? hotelName, 
      num? due, 
      String? id,}){
    _imageUrl = imageUrl;
    _title = title;
    _starNumber = starNumber;
    _hotelName = hotelName;
    _due = due;
    _id = id;
}

  Page1Model.fromJson(dynamic json) {
    _imageUrl = json['imageUrl'];
    _title = json['title'];
    _starNumber = json['Star_number'];
    _hotelName = json['hotel_name'];
    _due = json['due'];
    _id = json['id'];
  }
  String? _imageUrl;
  String? _title;
  num? _starNumber;
  String? _hotelName;
  num? _due;
  String? _id;
Page1Model copyWith({  String? imageUrl,
  String? title,
  num? starNumber,
  String? hotelName,
  num? due,
  String? id,
}) => Page1Model(  imageUrl: imageUrl ?? _imageUrl,
  title: title ?? _title,
  starNumber: starNumber ?? _starNumber,
  hotelName: hotelName ?? _hotelName,
  due: due ?? _due,
  id: id ?? _id,
);
  String? get imageUrl => _imageUrl;
  String? get title => _title;
  num? get starNumber => _starNumber;
  String? get hotelName => _hotelName;
  num? get due => _due;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['imageUrl'] = _imageUrl;
    map['title'] = _title;
    map['Star_number'] = _starNumber;
    map['hotel_name'] = _hotelName;
    map['due'] = _due;
    map['id'] = _id;
    return map;
  }

}