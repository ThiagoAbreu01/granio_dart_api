
import 'package:granio_dart_api/entities/category.dart';

abstract interface class ICategoriesService {
  Future<List<String>> getCategoriesByWalletId(int walletId);
  Future<void> addCategory(Category category);
}