// import 'package:area_api/models/wilayah_model.dart';
// import 'package:equatable/equatable.dart';

part of 'wilayah_bloc.dart';


abstract class WilayahState extends Equatable {
  const WilayahState();

  @override
  List<Object?> get props => [];
}
// response
class WilayahInitial extends WilayahState {}

class WilayahLoading extends WilayahState {}

class WilayahLoaded extends WilayahState {
  final WilayahModel wilayahModel;
  const WilayahLoaded(this.wilayahModel);
}

class WilayahError extends WilayahState {
  final String? message;
  const WilayahError(this.message);
}
