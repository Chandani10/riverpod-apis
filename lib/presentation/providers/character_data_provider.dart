import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_apis/domain/models/charcter_model.dart';
import 'package:riverpod_apis/main.dart';



final charactersDataProvider = FutureProvider.autoDispose<List<CharacterModel>>(
      (ref) {
    return ref.read(apiProvider).getCharactersData().then(
          (characters) {
        final List<CharacterModel> characterList = [];
        for (var i = 0; i < 10; i++) {
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
