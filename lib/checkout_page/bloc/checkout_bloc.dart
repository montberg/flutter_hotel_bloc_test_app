import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_hotel_test_app/service/api_service.dart';
import 'package:meta/meta.dart';

import '../models/checkout_model.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final ApiService apiService;
  
  CheckoutBloc(this.apiService) : super(const CheckoutState()) {
    on<CheckoutEvent>(_onCheckoutFetched);
  }

  FutureOr<void> _onCheckoutFetched(CheckoutEvent event, Emitter<CheckoutState> emit) async {
  if(state.status == CheckoutStatus.initial){
    emit(state.copyWith(status: CheckoutStatus.loading));
          try {
        CheckoutModel checkoutInfo = await apiService.readCheckoutData();
        emit(state.copyWith(checkout: checkoutInfo, status: CheckoutStatus.success));
      } catch (e) {
        emit(state.copyWith(status: CheckoutStatus.failure, errorText: e.toString()));
      }
  }
  
  }
}
