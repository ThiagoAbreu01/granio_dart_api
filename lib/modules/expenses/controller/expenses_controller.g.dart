// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_controller.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$ExpensesControllerRouter(ExpensesController service) {
  final router = Router();
  router.add(
    'GET',
    r'/wallet/<walletId>',
    service.getExpensesByWalletId,
  );
  router.add(
    'POST',
    r'/add',
    service.addExpense,
  );
  return router;
}
