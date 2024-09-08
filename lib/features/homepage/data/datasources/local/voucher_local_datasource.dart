import 'package:dartz/dartz.dart';
import 'package:fatihac/core/errors/failures.dart';
import 'package:fatihac/features/homepage/domain/entities/voucher_entity.dart';

abstract class VoucherLocalDatasource{
  Future<Either<Failure,List<VoucherEntity>>> getAllVoucher();
}