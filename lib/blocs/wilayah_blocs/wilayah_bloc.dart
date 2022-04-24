import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:area_api/models/wilayah_model.dart';
import 'package:area_api/resources/wilayah_repository.dart';

part 'wilayah_event.dart';
part 'wilayah_state.dart';

// import model class, repository class
// put all logics here
class WilayahBloc extends Bloc<WilayahEvent, WilayahState> {
  WilayahBloc() : super(WilayahInitial()) {
    final WilayahRepository _wilayahRepository = WilayahRepository();

    // event/input from wilayah_event
    on<GetWilayahList>((event, emit) async {
      try {
        emit(WilayahLoading());
        final mList = await _wilayahRepository.fetchWilayahList();
        emit(WilayahLoaded(mList));
        if (mList.error != null) {
          emit(WilayahError(mList.error));
        }
      } on WilayahError {
        emit(WilayahError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
