


import 'package:riverpod_apis/constant/export.dart';

final apiProvider = Provider<ApiRepositoryApi>((ref) {
  return ApiRepositoryApi(ref.read(dioClientProvider));
});

final charactersDataProvider = FutureProvider.autoDispose<List<CharacterModel>>(
      (ref) {
    return ref.read(apiProvider).getCharactersData().then(
          (characters) {
        final List<CharacterModel> characterList = [];
        for (var i = 0; i < characters.length; i++) {
          characterList.add(
            CharacterModel(
              characterName: characters[i]["name"],
              characterImgUrl: characters[i]["image"],
            ),
          );
        }
        return characterList;
      },
    );
  },
);
