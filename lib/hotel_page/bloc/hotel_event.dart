part of 'hotel_bloc.dart';

@immutable
sealed class HotelEvent {}


final class HotelFetched extends HotelEvent {}