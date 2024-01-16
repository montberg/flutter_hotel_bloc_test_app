import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../apartaments_page/models/room_model.dart';
import '../../strings.dart';
import '../checkout_page/models/checkout_model.dart';
import '../hotel_page/models/hotel_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: API_URL)
abstract class ApiService {

  factory ApiService(Dio dio) = _ApiService;

  @GET(GET_HOTEL_INFO_URL)
  Future<HotelModel> readHotelData();

  @GET(GET_ROOMS_INFO_URL)
  Future<Map<String, List<RoomModel>>> readRoomsData();

  @GET(GET_CHECKOUT_INFO_URL)
  Future<CheckoutModel> readCheckoutData();
}