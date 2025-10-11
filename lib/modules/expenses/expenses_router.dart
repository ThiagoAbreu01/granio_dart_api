import 'package:get_it/get_it.dart';
import 'package:shelf_router/src/router.dart';
import 'package:granio_dart_api/application/routers/i_router.dart';
import 'package:granio_dart_api/modules/expenses/controller/expenses_controller.dart';

class ExpensesRouter extends IRouter {
  @override
  void configure(Router router) {
    final controller = GetIt.I.get<ExpensesController>();

    router.mount('/expenses/', controller.router);
  }
}
