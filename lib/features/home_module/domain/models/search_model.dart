import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_apis/features/home_module/domain/models/charcter_model.dart';
part 'search_model.freezed.dart';

@freezed
class SearchState with _$SearchState {
  factory SearchState({
    required List<CharacterModel> characterList,
  }) = _SearchState;
  const SearchState._();

  factory SearchState.empty() => SearchState(
    characterList: [],
  );
}
