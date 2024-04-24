import 'dart:convert';

class ChatModel {
  List<String>? users;
  List<Message>? messages;

  ChatModel({
    this.users,
    this.messages,
  });

  ChatModel copyWith({
    List<String>? users,
    List<Message>? messages,
  }) =>
      ChatModel(
        users: users ?? this.users,
        messages: messages ?? this.messages,
      );

  factory ChatModel.fromRawJson(String str) => ChatModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
    users: json["users"] == null ? [] : List<String>.from(json["users"]!.map((x) => x)),
    messages: json["messages"] == null ? [] : List<Message>.from(json["messages"]!.map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "users": users == null ? [] : List<dynamic>.from(users!.map((x) => x)),
    "messages": messages == null ? [] : List<dynamic>.from(messages!.map((x) => x.toJson())),
  };
}

class Message {
  String? text;
  String? date;
  String? owner;
  bool? read;

  Message({
    this.text,
    this.date,
    this.owner,
    this.read,
  });

  Message copyWith({
    String? text,
    String? date,
    String? owner,
    bool? read,
  }) =>
      Message(
        text: text ?? this.text,
        date: date ?? this.date,
        owner: owner ?? this.owner,
        read: read ?? this.read,
      );

  factory Message.fromRawJson(String str) => Message.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    text: json["text"],
    date: json["date"],
    owner: json["owner"],
    read: json["read"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "date": date,
    "owner": owner,
    "read": read,
  };
}
