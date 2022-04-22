// import 'package:equatable/equatable.dart';
part of 'wilayah_bloc.dart';

abstract class WilayahEvent extends Equatable {
  const WilayahEvent();

  @override
  List<Object> get props => [];
}

class GetWilayahList extends WilayahEvent {}
