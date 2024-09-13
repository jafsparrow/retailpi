import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductSearchQueryStateNotifier extends StateNotifier<String> {
  ProductSearchQueryStateNotifier() : super('');
  void setQuery(String query) {
    state = query;
  }
}
