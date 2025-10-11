// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_controller.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$WalletControllerRouter(WalletController service) {
  final router = Router();
  router.add(
    'POST',
    r'/add/<userId>',
    service.addCategory,
  );
  return router;
}
