import 'package:freezed_annotation/freezed_annotation.dart';

part 'charcter_model.freezed.dart';

@freezed
class CharacterModel with _$CharacterModel {
  factory CharacterModel({
    required String characterName,
    required String characterImgUrl,
  }) = _CharacterModel;
  const CharacterModel._();

  factory CharacterModel.empty() => CharacterModel(characterName: "", characterImgUrl: "");
  factory CharacterModel.fromJson(Map<String, dynamic> json)
    => CharacterModel(characterName: json['name'],characterImgUrl: json['image']);
}
