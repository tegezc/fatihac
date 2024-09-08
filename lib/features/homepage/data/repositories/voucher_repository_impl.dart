import 'package:dartz/dartz.dart';
import 'package:fatihac/core/errors/failures.dart';
import 'package:fatihac/features/homepage/domain/entities/voucher_entity.dart';
import 'package:fatihac/features/homepage/domain/repositories/voucher_repository.dart';
import 'package:injectable/injectable.dart';

import '../datasources/local/voucher_local_datasource.dart';

@LazySingleton(as:VoucherRepository)
class VoucherRepositoryImpl implements VoucherRepository{
  final VoucherLocalDatasource voucherRepository;

  VoucherRepositoryImpl({required this.voucherRepository});
  @override
  Future<Either<Failure, List<VoucherEntity>>> getAllVoucher() async{
   return await voucherRepository.getAllVoucher();
  }

}