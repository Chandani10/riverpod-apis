import 'package:riverpod_apis/constant/export.dart';
import 'package:riverpod_apis/domain/models/search_event.dart';
import 'package:riverpod_apis/domain/models/search_model.dart';
import 'package:riverpod_apis/presentation/providers/character_data_provider.dart';
import 'package:riverpod_apis/presentation/providers/search_notifier.dart';

final searchProvider = StateNotifierProvider.autoDispose<SearchNotifier, SearchState>(
      (ref) {
    final characterModelList = ref.watch(charactersDataProvider).whenOrNull(data: (data) => data);

    return SearchNotifier()
      ..mapEventsToState(
        UpdateListItems(
          characterModelList: characterModelList ?? [],
        ),
      );
  },
);
