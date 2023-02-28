import 'package:riverpod_apis/constant/export.dart';


class CartoonListScreen  extends ConsumerStatefulWidget {

  @override
  ConsumerState<CartoonListScreen> createState() => _CartoonListScreenState();
}

class _CartoonListScreenState extends ConsumerState<CartoonListScreen> {
 TextEditingController textFieldController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              searchTextField(),
              gridViewWidget(),
            ],
          ),
        ),
      );
  }

Widget  searchTextField(){
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Container(
          margin: const EdgeInsets.all(20),
          padding:  EdgeInsets.only(top: 20.0),
          child: TextField(

              controller: textFieldController,
              style: const TextStyle(),
              decoration:  InputDecoration(

                suffixIcon: InkWell(
                    onTap: (){
                      // if (textFieldController.text.isEmpty) {
                      //   ref.refresh(searchProvider);
                      // } else {
                      //   ref.refresh(searchProvider);
                      //   ref.read(searchProvider.notifier).mapEventsToState(
                      //     SearchedTextChanged(
                      //       text: textFieldController.text,
                      //     ),
                      //   );
                      // }
                    },
                    child: Icon(Icons.search_rounded)),
                border: UnderlineInputBorder(),
                focusedBorder: UnderlineInputBorder(),
                enabledBorder: UnderlineInputBorder(),
                hintText: searchCharactersText,
                hintStyle: TextStyle(color: Colors.black),
              )),
        );
      },

    );
  }

 Widget gridViewWidget(){
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
       // final List<CharacterModel> characterList = ref.watch(charactersDataProviders);
        return ref.watch(charactersDataProviders).when(
          data: (content) =>GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.0
            ),
            itemCount: content.characterList.length,
            itemBuilder: (context, int index) {
              return Container(
                color: Colors.grey.shade200,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                          child: Image.network(
                            content.characterList[index].characterImgUrl,
                            fit: BoxFit.cover,
                            scale: 2.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 10.0, top: 10.0,bottom: 10.0),
                      child: Text(
                        content.characterList[index].characterName,
                        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                        textAlign: TextAlign.start,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          error: (error,_) =>  Center(child: Text(error.toString(),)),
          loading: () => Center(child:   CircularProgressIndicator()),
        );
      },

    );
  }
}
