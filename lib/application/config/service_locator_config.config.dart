// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:granio_dart_api/application/config/database_connect_configuration.dart'
    as _i542;
import 'package:granio_dart_api/application/database/database_connection.dart'
    as _i126;
import 'package:granio_dart_api/application/database/i_database_connection.dart'
    as _i117;
import 'package:granio_dart_api/logger/i_logger.dart' as _i691;
import 'package:granio_dart_api/logger/logger.dart' as _i769;
import 'package:granio_dart_api/modules/categories/controller/categories_controller.dart'
    as _i216;
import 'package:granio_dart_api/modules/categories/repository/categories_repository.dart'
    as _i704;
import 'package:granio_dart_api/modules/categories/repository/i_categories_repository.dart'
    as _i517;
import 'package:granio_dart_api/modules/categories/service/categories_service.dart'
    as _i467;
import 'package:granio_dart_api/modules/categories/service/i_categories_service.dart'
    as _i240;
import 'package:granio_dart_api/modules/expenses/controller/expenses_controller.dart'
    as _i642;
import 'package:granio_dart_api/modules/expenses/repository/expenses_repository.dart'
    as _i312;
import 'package:granio_dart_api/modules/expenses/repository/i_expenses_repository.dart'
    as _i6;
import 'package:granio_dart_api/modules/expenses/service/expenses_service.dart'
    as _i647;
import 'package:granio_dart_api/modules/expenses/service/i_expenses_service.dart'
    as _i676;
import 'package:granio_dart_api/modules/user/controller/auth_controller.dart'
    as _i196;
import 'package:granio_dart_api/modules/user/controller/user_controller.dart'
    as _i880;
import 'package:granio_dart_api/modules/user/repository/i_user_repository.dart'
    as _i895;
import 'package:granio_dart_api/modules/user/repository/user_repository.dart'
    as _i848;
import 'package:granio_dart_api/modules/user/service/i_user_service.dart'
    as _i996;
import 'package:granio_dart_api/modules/user/service/user_service.dart' as _i1;
import 'package:granio_dart_api/modules/wallet/controller/wallet_controller.dart'
    as _i587;
import 'package:granio_dart_api/modules/wallet/repository/i_wallet_repository.dart'
    as _i508;
import 'package:granio_dart_api/modules/wallet/repository/wallet_repository.dart'
    as _i525;
import 'package:granio_dart_api/modules/wallet/service/i_wallet_service.dart'
    as _i754;
import 'package:granio_dart_api/modules/wallet/service/wallet_service.dart'
    as _i339;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i769.Logger>(() => _i769.Logger());
  gh.factory<_i6.IExpensesRepository>(() => _i312.ExpensesRepository());
  gh.factory<_i676.IExpensesService>(() => _i647.ExpensesService());
  gh.lazySingleton<_i117.IDatabaseConnection>(
      () => _i126.DatabaseConnection(gh<_i542.DatabaseConnectConfiguration>()));
  gh.factory<_i642.ExpensesController>(() => _i642.ExpensesController(
        expensesService: gh<_i676.IExpensesService>(),
        log: gh<_i691.ILogger>(),
      ));
  gh.factory<_i508.IWalletRepository>(() => _i525.WalletRepository(
        connection: gh<_i117.IDatabaseConnection>(),
        log: gh<_i691.ILogger>(),
      ));
  gh.factory<_i517.ICategoriesRepository>(() => _i704.CategoriesRepository(
        connection: gh<_i117.IDatabaseConnection>(),
        log: gh<_i691.ILogger>(),
      ));
  gh.factory<_i895.IUserRepository>(() => _i848.UserRepository(
        connection: gh<_i117.IDatabaseConnection>(),
        log: gh<_i691.ILogger>(),
      ));
  gh.factory<_i996.IUserService>(() => _i1.UserService(
        userRepository: gh<_i895.IUserRepository>(),
        log: gh<_i691.ILogger>(),
      ));
  gh.factory<_i240.ICategoriesService>(() => _i467.CategoriesService(
        categoriesRepository: gh<_i517.ICategoriesRepository>(),
        log: gh<_i691.ILogger>(),
      ));
  gh.factory<_i754.IWalletService>(() =>
      _i339.WalletService(walletRepository: gh<_i508.IWalletRepository>()));
  gh.factory<_i587.WalletController>(() => _i587.WalletController(
        walletService: gh<_i754.IWalletService>(),
        log: gh<_i691.ILogger>(),
      ));
  gh.factory<_i216.CategoriesController>(() => _i216.CategoriesController(
        categoriesService: gh<_i240.ICategoriesService>(),
        log: gh<_i691.ILogger>(),
      ));
  gh.factory<_i880.UserController>(() => _i880.UserController(
        userService: gh<_i996.IUserService>(),
        log: gh<_i691.ILogger>(),
      ));
  gh.factory<_i196.AuthController>(() => _i196.AuthController(
        userService: gh<_i996.IUserService>(),
        log: gh<_i691.ILogger>(),
      ));
  return getIt;
}
