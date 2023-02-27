

import 'package:riverpod_apis/constant/export.dart';
import 'package:riverpod_apis/data/api_repository.dart';
final apiProvider = Provider((ref) => ApiRepositoryApi());

void main() {

  runApp( ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CartoonListScreen(),
    );
  }
}

