import 'package:injectable/injectable.dart';
import 'package:granio_dart_api/application/database/i_database_connection.dart';
import 'package:granio_dart_api/entities/category.dart';
import 'package:granio_dart_api/logger/i_logger.dart';
import 'package:granio_dart_api/modules/categories/repository/i_categories_repository.dart';

@Injectable(as: ICategoriesRepository)
class CategoriesRepository implements ICategoriesRepository {
  final IDatabaseConnection connection;
  final ILogger log;

  CategoriesRepository({
    required this.connection,
    required this.log,
  });

  @override
  Future<List<String>> getCategoriesByWalletId(int walletId) async {
    try {
      final conn = await connection.openConnection();
      final result = await conn.query(
        'SELECT name FROM categories WHERE user_id = ?',
        [walletId],
      );
      
      return result.map((row) => row['name'] as String).toList();
    } catch (e) {
      log.error('Erro ao buscar categorias por user_id: $walletId', e);
      rethrow;
    }
  }

  @override
  Future<void> addCategory(Category category) async {
    try {
      final conn = await connection.openConnection();
      await conn.query(
        'INSERT INTO categories (name, user_id, created_at) VALUES (?, ?, ?)',
        [category.name, category.userId, DateTime.now()],
      );
    } catch (e) {
      log.error('Erro ao adicionar categoria: ${category.name}', e);
      rethrow;
    }
  }
}