import 'package:injectable/injectable.dart';
import 'package:granio_dart_api/entities/wallet.dart';
import 'package:granio_dart_api/modules/wallet/repository/i_wallet_repository.dart';

import './i_wallet_service.dart';


@Injectable(as: IWalletService)

class WalletService implements IWalletService {
  final IWalletRepository walletRepository;
  WalletService({
    required this.walletRepository,
  });
  @override
  Future<void> addWallet(Wallet wallet, int userId) => walletRepository.addWallet(wallet, userId);

  @override
  Future<List<Wallet>> getWalletByUserId(int userId) {
    // TODO: implement getWalletByUserId
    throw UnimplementedError();
  }

}