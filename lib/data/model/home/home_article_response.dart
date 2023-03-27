// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:loginandsignup/domain/model/data/home/home_article_data.dart';

part 'home_article_response.g.dart';

abstract class HomeArticleResponseMapper {
  HomeArticleData toHomeArticleData();
}

@JsonSerializable()
class HomeArticleResponse implements HomeArticleResponseMapper {
  String? newImage;
  String? title;
  String? content;
  HomeArticleResponse({
    this.newImage,
    this.title,
    this.content,
  });

  factory HomeArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeArticleResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HomeArticleResponseToJson(this);

  @override
  HomeArticleData toHomeArticleData() {
    return HomeArticleData(newImage ?? "", title ?? "", content ?? "");
  }
}
