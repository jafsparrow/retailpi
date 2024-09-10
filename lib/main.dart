import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:retailpi/core/providers/product_provider.dart';
import 'package:retailpi/core/providers/realm_provider.dart';
import 'package:retailpi/core/realm_models/product_related.dart';
import 'package:retailpi/core/utils/excel_upload.dart';
import 'package:retailpi/features/category/presentation/pages/category_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: CategoryPage());
  }
}

class Home2 extends ConsumerWidget {
  late var test_hello;
  Home2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsyncValue = ref.watch(productssProvider);

    final realm = ref.watch(realmProvider);
    final products = ref.watch(productStateNotifierProvider);

    // print(productsAsyncValue);
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Items'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onChanged: (query) {
                ref
                    .read(productStateNotifierProvider.notifier)
                    .searchProduct(query);
              },
              decoration: InputDecoration(
                hintText: 'Search by name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ),
      body: products.isEmpty
          ? Center(child: Text('No Products found'))
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text('product name if loaded correctly'),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // realm.write(() {
          //   realm.add(Product('name', 'sdjdd'));
          // });

          realm.write(() {
            realm.deleteAll<Product>();
          });

          FilePickerResult? result = await FilePicker.platform.pickFiles();

          if (result != null) {
            print(result?.files[0].path);
            var path = result?.files[0].path;
            var data = await readExcelFile(path!);
            ref.read(productsProvider.notifier).uploadProducts(data);
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late Realm realm;

  _MyHomePageState() {
    print('consturctioncalled....');
    final config = Configuration.local([Product.schema]);
    realm = Realm(config);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
