part of 'checkout_bloc.dart';

enum CheckoutStatus { initial, loading, success, failure }

@immutable
final class CheckoutState {
  const CheckoutState({
    this.status = CheckoutStatus.initial,
    this.checkout,
    this.errorText
  });
  final CheckoutStatus status;
  final CheckoutModel? checkout;
  final String? errorText;

  CheckoutState copyWith({
    CheckoutStatus? status,
    CheckoutModel? checkout,
    String? errorText
  }) {
    return CheckoutState(
        checkout: checkout ?? this.checkout, status: status ?? this.status, errorText: errorText ?? this.errorText);
  }
}

