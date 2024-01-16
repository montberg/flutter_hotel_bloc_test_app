import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../service/api_service.dart';
import '../models/hotel_model.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final ApiService apiService;

  HotelBloc(this.apiService) : super(const HotelState()) {
    on<HotelFetched>(_onHotelFetched);
  }

  FutureOr<void> _onHotelFetched(
      HotelFetched event, Emitter<HotelState> emit) async {
    if (state.status == HotelStatus.initial) {
      emit(state.copyWith(status: HotelStatus.loading));
      try {
        HotelModel hotelInfo = await apiService.readHotelData();
        emit(state.copyWith(hotel: hotelInfo, status: HotelStatus.success));
      } catch (e) {
        emit(state.copyWith(status: HotelStatus.failure, errorText: e.toString()));
      }
    }
  }
}
