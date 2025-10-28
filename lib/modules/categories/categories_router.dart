import 'package:get_it/get_it.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:granio_dart_api/application/routers/i_router.dart';
import 'package:granio_dart_api/modules/categories/controller/categories_controller.dart';

class CategoriesRouter extends IRouter {
  @override
  void configure(Router router) {
    final controller = GetIt.I.get<CategoriesController>();

    router.mount('/categories/', controller.router);
  }
}
