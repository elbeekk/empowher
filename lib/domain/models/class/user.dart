import 'dart:convert';

class UserModel {
  String? firstName;
  String? lastName;
  String? image;
  String? bio;

  UserModel({
    this.firstName,
    this.lastName,
    this.image,
    this.bio,
  });

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? image,
    String? bio,
  }) =>
      UserModel(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        image: image ?? this.image,
        bio: bio ?? this.bio,
      );

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    firstName: json["firstName"],
    lastName: json["lastName"],
    image: json["image"],
    bio: json["bio"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "image": image,
    "bio": bio,
  };
}
