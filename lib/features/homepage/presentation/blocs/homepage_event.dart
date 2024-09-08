import 'package:equatable/equatable.dart';

abstract class HomepageEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class GetAllVoucherEvent extends HomepageEvent{}