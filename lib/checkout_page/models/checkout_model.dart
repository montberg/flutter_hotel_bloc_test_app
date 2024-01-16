// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'checkout_model.g.dart';

@JsonSerializable()
class CheckoutModel {
  final int id;
  
  final String hotel_name;
  
  final String hotel_adress;
  
  final int horating;
  
  final String rating_name;
  
  final String departure;
  
  final String arrival_country;
  
  final String tour_date_start;
  
  final String tour_date_stop;
  
  final int number_of_nights;
  
  final String room;
  
  final String nutrition;
  
  final int tour_price;
  
  final int fuel_charge;
  
  final int service_charge;

  CheckoutModel({
    required this.id,
    required this.hotel_name,
    required this.hotel_adress,
    required this.horating,
    required this.rating_name,
    required this.departure,
    required this.arrival_country,
    required this.tour_date_start,
    required this.tour_date_stop,
    required this.number_of_nights,
    required this.room,
    required this.nutrition,
    required this.tour_price,
    required this.fuel_charge,
    required this.service_charge,
  });
  
  factory CheckoutModel.fromJson(Map<String, dynamic> json) => _$CheckoutModelFromJson(json);
  //Map<String, dynamic> toJson() => _$CheckoutModelToJson(this);
}
