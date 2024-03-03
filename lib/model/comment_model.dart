import 'dart:convert';

class CommentModel {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  CommentModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return {
      "postId": postId,
      "id": id,
      "name": name,
      "email": email,
      "body": body,
    };
  }

  String toJSON() => jsonEncode(toMap());

  factory CommentModel.fromMap(Map<String, dynamic> json) {
    return CommentModel(
      postId: json["postId"],
      id: json["id"],
      name: json["name"],
      email: json["email"],
      body: json["body"],
    );
  }

  factory CommentModel.fromJSON(String json) {
    return CommentModel.fromMap(jsonDecode(json));
  }
}
