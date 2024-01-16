// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'room_model.g.dart';


@JsonSerializable()
class RoomModel {
  int id;
  String name;
  int price;
  String price_per;
  List<String> peculiarities;
  List<String> image_urls;

  RoomModel({
    required this.id,
    required this.name,
    required this.price,
    required this.price_per,
    required this.peculiarities,
    required this.image_urls,
  });
  
  factory RoomModel.fromJson(Map<String, dynamic> json) => _$RoomModelFromJson(json);
  //Map<String, dynamic> toJson() => _$RoomModelToJson(this);
}
