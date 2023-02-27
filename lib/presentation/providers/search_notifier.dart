import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_apis/domain/models/search_event.dart';
import 'package:riverpod_apis/domain/models/search_model.dart';

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(SearchState.empty());

  void mapEventsToState(SearchEvent event) {
    event.map(
      searchedTextChanged: (searchedTextChangedEvent) {
        final characterList = [...state.characterList];
        final searchedCharacterList = characterList
            .where((characterModel) => characterModel.characterName
            .toLowerCase()
            .contains(searchedTextChangedEvent.text.toLowerCase().trimLeft()))
            .toList();

        state = state.copyWith(characterList: searchedCharacterList);
      },
      updateListItems: (updateListItemsEvent) {
        state = state.copyWith(
          characterList: updateListItemsEvent.characterModelList,
        );
      },
    );
  }
}