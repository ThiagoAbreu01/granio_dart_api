import 'package:injectable/injectable.dart';
import 'package:granio_dart_api/entities/category.dart';
import 'package:granio_dart_api/logger/i_logger.dart';
import 'package:granio_dart_api/modules/categories/repository/i_categories_repository.dart';
import 'package:granio_dart_api/modules/categories/service/i_categories_service.dart';

@Injectable(as: ICategoriesService)
class CategoriesService implements ICategoriesService {
  final ICategoriesRepository categoriesRepository;
  final ILogger log;

  CategoriesService({
    required this.categoriesRepository,
    required this.log,
  });

  @override
  Future<List<String>> getCategoriesByWalletId(int walletId) async {
    try {
      log.info('Buscando categorias para o wallet/user ID: $walletId');
      return await categoriesRepository.getCategoriesByWalletId(walletId);
    } catch (e) {
      log.error('Erro no service ao buscar categorias para wallet/user ID: $walletId', e);
      rethrow;
    }
  }

  @override
  Future<void> addCategory(Category category) async {
    try {
      log.info('Adicionando categoria: ${category.name} para user ID: ${category.userId}');
      await categoriesRepository.addCategory(category);
      log.info('Categoria ${category.name} adicionada com sucesso');
    } catch (e) {
      log.error('Erro no service ao adicionar categoria: ${category.name}', e);
      rethrow;
    }
  }
}