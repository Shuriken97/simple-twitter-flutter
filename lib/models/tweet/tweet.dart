// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'tweet.g.dart';

@JsonSerializable()
class Tweet {
  Tweet({
    this.id,
    this.authorId,
    this.authorName,
    this.content,
    this.createdAt,
  });

  factory Tweet.fromJson(Map<String, dynamic> json) => _$TweetFromJson(json);
  Map<String, dynamic> toJson() => _$TweetToJson(this);

  final String? id;
  final String? authorId;
  final String? authorName;
  final DateTime? createdAt;
  String? content;
}
