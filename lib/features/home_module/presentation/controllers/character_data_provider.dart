import 'package:riverpod_apis/constant/export.dart';


typedef Reader = T Function<T>(ProviderBase<T> provider);

final apiProvider = Provider<ApiRepositoryApi>((ref) {
  return ApiRepositoryApi(ref.read(dioClientProvider));
});

final charactersDataProviders = StateNotifierProvider<CharactersDataController, AsyncValue<SearchState>>((ref) {
  return CharactersDataController(ref.read);
});

class CharactersDataController extends StateNotifier<AsyncValue<SearchState>> {
  final Reader read;

  CharactersDataController(this.read) : super(const AsyncValue.loading()) {
    _getAllData();
  }

  _getAllData() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => read(apiProvider).getCharactersData());
  }
}
