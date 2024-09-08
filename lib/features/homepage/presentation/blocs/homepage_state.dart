import 'package:equatable/equatable.dart';
import 'package:fatihac/features/homepage/domain/entities/voucher_entity.dart';

class HomepageState extends Equatable{
  final List<VoucherEntity> allVoucher;

  HomepageState({required this.allVoucher});

  factory HomepageState.initial() => HomepageState(allVoucher: const []);

  HomepageState copyWith({List<VoucherEntity>? allVoucher}){
    return HomepageState(allVoucher: allVoucher ?? this.allVoucher);
  }

  List<List<VoucherEntity>> getAllVoucherForHomepage(){

    // Mengelompokkan array1 menjadi sub-array berisi 2 elemen setiap grup
    List<List<VoucherEntity>> array2 = [];
    for (int i = 0; i < allVoucher.length; i += 2) {
      int end = (i + 2 < allVoucher.length) ? i + 2 : allVoucher.length;
      array2.add(allVoucher.sublist(i, end));
    }

    return array2;
  }

  @override
  List<Object?> get props => [];

}