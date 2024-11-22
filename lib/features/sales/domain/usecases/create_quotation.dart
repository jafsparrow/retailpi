import 'package:retailpi/features/sales/domain/entities/sales_quotation.dart';
import 'package:retailpi/features/sales/domain/repositories/sales_quotation_repository.dart';

class CreateQuotationUseCase {
  final SalesQuotationRepository repository;

  CreateQuotationUseCase(this.repository);

  Future<void> execute(SalesQuotation quotation) async {
    await repository.createQuotation(quotation);
  }
}



// // domain/use_cases/cart_use_cases.dart
// class AddCartItemUseCase {
//   // Logic for adding an item to a cart
// }

// class SwitchCartUseCase {
//   // Logic for switching between active carts
// }

// class SaveCartStateUseCase {
//   // Logic for persisting cart state to shared_preferences
// }
