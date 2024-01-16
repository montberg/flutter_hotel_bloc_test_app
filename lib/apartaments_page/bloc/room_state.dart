part of 'room_bloc.dart';

enum RoomStatus { initial, loading, success, failure }

@immutable
final class RoomState {
  const RoomState({
    this.status = RoomStatus.initial,
    this.room,
    this.errorText
  });
  final RoomStatus status;
  final List<RoomModel>? room;
  final String? errorText;

  RoomState copyWith({
    RoomStatus? status,
    List<RoomModel>? room,
    String? errorText
  }) {
    return RoomState(
        room: room ?? this.room, status: status ?? this.status, errorText: errorText ?? this.errorText);
  }
}