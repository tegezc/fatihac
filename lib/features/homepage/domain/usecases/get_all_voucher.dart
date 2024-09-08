import 'package:dartz/dartz.dart';
import 'package:fatihac/core/errors/failures.dart';
import 'package:fatihac/core/usecases/usecase.dart';
import 'package:fatihac/features/homepage/domain/entities/voucher_entity.dart';
import 'package:injectable/injectable.dart';

import '../repositories/voucher_repository.dart';

@injectable
class GetAllVoucher implements UseCase<List<VoucherEntity>?,NoParams>{
  final VoucherRepository voucherRepository;

  GetAllVoucher(this.voucherRepository);

  @override
  Future<Either<Failure, List<VoucherEntity>?>> call(NoParams params) async{
   return await voucherRepository.getAllVoucher();
  }

}