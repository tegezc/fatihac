import 'package:dartz/dartz.dart';
import 'package:fatihac/core/errors/failures.dart';
import 'package:fatihac/features/homepage/data/datasources/local/voucher_local_datasource.dart';
import 'package:fatihac/features/homepage/domain/entities/voucher_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../../core/database/database_helper.dart';

@LazySingleton(as:VoucherLocalDatasource)
class VoucherLocalDatasourceImpl implements VoucherLocalDatasource{
    final DatabaseHelper databaseHelper;

  VoucherLocalDatasourceImpl(this.databaseHelper);
  @override
  Future<Either<Failure, List<VoucherEntity>>> getAllVoucher() async{
    try{
      final db = await databaseHelper.database;
      final result = await db!.query('vouchers');
      return right(result.map((json) => VoucherEntity.fromMap(json)).toList());
    }catch(e){
      return left(DatabaseFailure(e.toString()));
    }

  }

    Future<void> insertVoucher(VoucherEntity voucher) async {
      final db = await databaseHelper.database;
      await db!.insert('vouchers', voucher.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    Future<void> insertDummyVouchers() async {
      List<VoucherEntity> dummyVouchers = [
        VoucherEntity(
          id: '1',
          title: 'Indomart Discunt Rp. 20.000',
          basePrice: '100000',
          afterDiscPrice: '90000',
          discountPercentage: '10%',
          imagePath: 'assets/indomart.png',
        ),
        VoucherEntity(
          id: '2',
          title: 'Voucher Grab Transport Rp. 10.000',
          basePrice: '200000',
          afterDiscPrice: '170000',
          discountPercentage: '15%',
          imagePath: 'assets/grab.png',
        ),
        VoucherEntity(
          id: '3',
          title: 'Voucher Indomart Rp 5000',
          basePrice: '150000',
          afterDiscPrice: '120000',
          discountPercentage: '20%',
          imagePath: 'assets/indomart.png',
        ),
        VoucherEntity(
          id: '4',
          title: 'Alfamart Discount 25%',
          basePrice: '250000',
          afterDiscPrice: '187500',
          discountPercentage: '25%',
          imagePath: 'assets/alfamart.png',
        ),
        VoucherEntity(
          id: '5',
          title: 'Voucher XL Rp 50.000',
          basePrice: '300000',
          afterDiscPrice: '210000',
          discountPercentage: '30%',
          imagePath: 'assets/xl.png',
        ),
        VoucherEntity(
          id: '6',
          title: 'Voucher XL Rp 5000',
          basePrice: '350000',
          afterDiscPrice: '227500',
          discountPercentage: '35%',
          imagePath: 'assets/xl.png',
        ),
        VoucherEntity(
          id: '7',
          title: 'Voucher Grab Rp 15.000',
          basePrice: '400000',
          afterDiscPrice: '240000',
          discountPercentage: '40%',
          imagePath: 'assets/grab.png',
        ),
        VoucherEntity(
          id: '8',
          title: 'Voucher XL Discount 50%',
          basePrice: '500000',
          afterDiscPrice: '250000',
          discountPercentage: '50%',
          imagePath: 'assets/xl.png',
        ),
      ];

      for (var voucher in dummyVouchers) {
        await insertVoucher(voucher);
      }
    }
}

