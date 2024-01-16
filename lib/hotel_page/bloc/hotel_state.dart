part of 'hotel_bloc.dart';

enum HotelStatus { initial, loading, success, failure }

@immutable
final class HotelState {
  const HotelState({
    this.status = HotelStatus.initial,
    this.hotel,
    this.errorText
  });
  final HotelStatus status;
  final HotelModel? hotel;
  final String? errorText;

  HotelState copyWith({
    HotelStatus? status,
    HotelModel? hotel,
    String? errorText
  }) {
    return HotelState(
        hotel: hotel ?? this.hotel, status: status ?? this.status, errorText: errorText ?? this.errorText);
  }
}
