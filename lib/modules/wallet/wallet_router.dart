import 'package:get_it/get_it.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:granio_dart_api/application/routers/i_router.dart';
import 'package:granio_dart_api/modules/wallet/controller/wallet_controller.dart';

class WalletRouter extends IRouter {
  @override
  void configure(Router router) {
    final controller = GetIt.I.get<WalletController>();

    router.mount('/wallet/', controller.router);
  }
}
