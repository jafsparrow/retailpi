import 'dart:convert';

import 'package:retailpi/features/cart/domain/entities/cart_state.dart';
import 'package:retailpi/features/cart/domain/repositories/cart_persistance_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPersistenceRepsitoryImpl implements CartPersistenceRepository {
  static const _cartStateKey = 'cart_state';

  @override
  Future<void> saveCartState(CartState cartState) async {
    final prefs = await SharedPreferences.getInstance();
    final cartStateJson = jsonEncode(cartState.toJson());
    await prefs.setString(_cartStateKey, cartStateJson);
  }

  @override
  Future<CartState?> loadCartState() async {
    final prefs = await SharedPreferences.getInstance();
    final cartStateJson = prefs.getString(_cartStateKey);
    if (cartStateJson == null) return null;
    return CartState.fromJson(jsonDecode(cartStateJson));
  }
}
