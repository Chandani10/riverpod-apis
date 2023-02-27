import 'package:riverpod_apis/constant/export.dart';
import 'package:riverpod_apis/constant/strings.dart';
import 'package:riverpod_apis/domain/models/charcter_model.dart';
import 'package:riverpod_apis/presentation/providers/search_provider.dart';

class CartoonListScreen  extends ConsumerStatefulWidget {

  @override
  ConsumerState<CartoonListScreen> createState() => _CartoonListScreenState();
}

class _CartoonListScreenState extends ConsumerState<CartoonListScreen> {
  @override
  Widget build(BuildContext context) {
    final List<CharacterModel> characterList = ref.watch(searchProvider).characterList;

    return characterList.isEmpty
        ? const Center(
      child: Padding(
        padding: EdgeInsets.only(top: 150, left: 8, right: 8),
        child: Text(
          noCharacter,
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
      ),
    )
        : SizedBox(
      width: 100,
      height: 60,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: characterList.length,
        itemBuilder: (context, int index) {
          return Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            width: 20,
            height: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  height: 18,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.network(
                       characterList[index].characterImgUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    characterList[index].characterName,
                    style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                    textAlign: TextAlign.start,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
