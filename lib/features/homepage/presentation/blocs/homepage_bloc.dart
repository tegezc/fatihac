import 'package:bloc/bloc.dart';
import 'package:fatihac/core/usecases/usecase.dart';
import 'package:fatihac/features/homepage/presentation/blocs/homepage_event.dart';
import 'package:fatihac/features/homepage/presentation/blocs/homepage_state.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_all_voucher.dart';

@injectable
class HomepageBloc extends Bloc<HomepageEvent,HomepageState>{
  final GetAllVoucher getAllVoucher;

  HomepageBloc({required this.getAllVoucher}):
        super(HomepageState.initial()){
    on<GetAllVoucherEvent>(_getAllVoucher);
  }

  void _getAllVoucher(GetAllVoucherEvent event,Emitter<HomepageState> emit) async{
    final result = await getAllVoucher(NoParams());
   result.fold((error){
     emit(state.copyWith());
   }, (lVoucher){
     emit(state.copyWith(allVoucher: lVoucher));
   });

  }
}