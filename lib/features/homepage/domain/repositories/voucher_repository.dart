import 'package:dartz/dartz.dart';
import 'package:fatihac/features/homepage/domain/entities/voucher_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class VoucherRepository{
  Future<Either<Failure, List<VoucherEntity>>> getAllVoucher();
}