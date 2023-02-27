import 'package:riverpod_apis/constant/export.dart';



final searchProvider = StateNotifierProvider.autoDispose<SearchNotifier, SearchState>((ref) {
  // whenOrNull works like may be when
    final characterModelList = ref.watch(charactersDataProvider).whenOrNull(data: (data) => data);

    return SearchNotifier()
      ..mapEventsToState(
        UpdateListItems(
          characterModelList: characterModelList ?? [],
        ),
      );
  },
);
