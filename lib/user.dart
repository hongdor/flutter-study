import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User{
  User(this.name, this.email, this.address);

  String name;
  String email;
  Address address;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Address{
  String street;
  String city;

  Address(this.street, this.city);

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

void main(){
  // json to  class
  Map<String, dynamic> userMap = jsonDecode('{"name" : "1", "email": "2", "address": {"city": "seoul", "street":"gangnam"}}');
  var user = User.fromJson(userMap);

  print(user.toJson());
  // class to json
  Address address = Address('My st.', 'New York');
  User user2 = User('John', 'John@naver.com', address);
  print(user2.toJson());
}