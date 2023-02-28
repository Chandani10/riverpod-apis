import 'package:riverpod_apis/constant/export.dart';

final searchProvider = StateNotifierProvider.autoDispose<SearchNotifier, SearchState>((ref) {
  // whenOrNull works like maybe when
  final searchState = ref.watch(charactersDataProviders).whenOrNull(data: (data) => data);

  final characterModelList = searchState?.characterList ?? [];

  return SearchNotifier()
    ..mapEventsToState(
      UpdateListItems(
        characterModelList: characterModelList,
      ),
    );
});