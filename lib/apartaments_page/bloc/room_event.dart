part of 'room_bloc.dart';




@immutable
sealed class RoomEvent {}


final class RoomFetched extends RoomEvent {}