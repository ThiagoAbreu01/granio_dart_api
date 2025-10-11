import 'package:granio_dart_api/modules/expenses/expenses_router.dart';
import 'package:granio_dart_api/modules/user/user_router.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:granio_dart_api/application/routers/i_router.dart';
import 'package:granio_dart_api/modules/wallet/wallet_router.dart';

import '../../modules/categories/categories_router.dart';

class RouterConfigure {
  final Router _router;

  final List<IRouter> _routers = [
    UserRouter(),
    ExpensesRouter(),
    CategoriesRouter(),
    WalletRouter(),
  ];

  RouterConfigure(this._router);

  void configure() => _routers.forEach((route) {
        return route.configure(_router);
      });
}
