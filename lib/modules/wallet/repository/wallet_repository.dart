import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';
import 'package:granio_dart_api/application/database/i_database_connection.dart';
import 'package:granio_dart_api/application/exceptions/database_exception.dart';
import 'package:granio_dart_api/entities/wallet.dart';
import 'package:granio_dart_api/logger/i_logger.dart';

import './i_wallet_repository.dart';

@Injectable(as: IWalletRepository)
class WalletRepository implements IWalletRepository {
  final IDatabaseConnection connection;
  final ILogger log;
  WalletRepository({
    required this.connection,
    required this.log,
  });
  @override
  Future<void> addWallet(Wallet wallet, int userId) async {
    MySqlConnection? conn;
    try {
      conn = await connection.openConnection();

      conn.transaction((conn) async {
        var results = await conn.query(
          'INSERT INTO wallet VALUES (?, ?, ?, ?, ?)',
          [
            null,
            wallet.name,
            wallet.amount,
            DateTime.now().toUtc().subtract(const Duration(hours: 3)),
            DateTime.now().toUtc().subtract(const Duration(hours: 3)),
          ],
        );

        var walletId = results.insertId;

        await conn.query(
          'INSERT INTO user_wallet VALUES (?, ?, ?)',
          [
            null,
            userId,
            walletId,
          ],
        );
      });
      log.info('Wallet added successfully: ${wallet.name}');
    } on MySqlException catch (e) {
      log.error('MySQL Error: ${e.message}');
      throw DatabaseException(message: e.message);
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<List<Wallet>> getWalletByUserId(int userId) {
    // TODO: implement getWalletByUserId
    throw UnimplementedError();
  }
}
