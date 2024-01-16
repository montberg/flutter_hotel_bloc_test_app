import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../service/api_service.dart';
import '../models/room_model.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  final ApiService apiService;

  RoomBloc(this.apiService) : super(const RoomState()) {
    on<RoomFetched>(_onRoomFetched);
  }

  FutureOr<void> _onRoomFetched(
      RoomFetched event, Emitter<RoomState> emit) async {
    if (state.status == RoomStatus.initial) {
      emit(state.copyWith(status: RoomStatus.loading));
      try {
        var roomInfo = await apiService.readRoomsData();
        var roomsInfo = roomInfo['rooms'];
        emit(state.copyWith(room: roomsInfo, status: RoomStatus.success));
      } catch (e) {
        emit(state.copyWith(status: RoomStatus.failure, errorText: e.toString()));
        rethrow;
      }
    }
  }
}
