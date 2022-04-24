// import 'package:equatable/equatable.dart';
part of 'wilayah_bloc.dart';

abstract class WilayahEvent extends Equatable {
  const WilayahEvent();

  @override
  List<Object> get props => [];
}

// event (input)
class GetWilayahList extends WilayahEvent {}
