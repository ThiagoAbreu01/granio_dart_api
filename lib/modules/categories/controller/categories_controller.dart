import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:granio_dart_api/application/exceptions/categories_not_found_exception.dart';
import 'package:granio_dart_api/entities/category.dart';
import 'package:granio_dart_api/logger/i_logger.dart';
import 'package:granio_dart_api/modules/categories/service/i_categories_service.dart';

part 'categories_controller.g.dart';

@Injectable()
class CategoriesController {
  final ICategoriesService categoriesService;
  final ILogger log;
  CategoriesController({
    required this.categoriesService,
    required this.log,
  });

  @Route.post('/add')
  Future<Response> addCategory(Request request) async {
    try {
      final category =
          Category.fromJson(jsonDecode(await request.readAsString()));
      await categoriesService.addCategory(category);

      return Response.ok('Categoria adicionada com sucesso');
    } on CategoriesNotFoundException catch (e) {
      log.error('Erro ao buscar categorias.', e);
      return Response.forbidden(
        jsonEncode({'message': 'Erro ao buscar categorias.'}),
      );
    }
  }

  Router get router => _$CategoriesControllerRouter(this);
}
