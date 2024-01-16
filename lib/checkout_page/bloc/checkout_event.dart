part of 'checkout_bloc.dart';

@immutable
sealed class CheckoutEvent {}

final class CheckoutFetched extends CheckoutEvent {}