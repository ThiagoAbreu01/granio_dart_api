import 'package:granio_dart_api/entities/wallet.dart';

abstract interface class IWalletRepository {
  Future<List<Wallet>> getWalletByUserId(int userId);
  Future<void> addWallet(Wallet wallet, int userId);
}