import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_test_app/apartaments_page/apartaments_page.dart';
import 'package:flutter_hotel_test_app/reusable_widgets/blue_button.dart';
import 'package:flutter_hotel_test_app/hotel_page/widgets/hotel_additional_info.dart';
import 'package:flutter_hotel_test_app/hotel_page/widgets/hotel_main_info.dart';
import 'package:flutter_hotel_test_app/reusable_widgets/photo_carousel.dart';
import 'package:flutter_hotel_test_app/reusable_widgets/title_widget.dart';

import '../reusable_widgets/card.dart';
import '../service/api_service.dart';
import 'bloc/hotel_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    return SafeArea(
      child: BlocProvider(
        create: (_) => HotelBloc(ApiService(dio))..add(HotelFetched()),
        child: BlocBuilder<HotelBloc, HotelState>(
          builder: (context, state) {
            switch (state.status) {
              case HotelStatus.success:
                return Scaffold(
                  appBar: const CupertinoNavigationBar(
                    automaticallyImplyLeading: false,
                    middle: TitleWidget(
                      title: "Отель",
                    ),
                    border: null,
                    backgroundColor: Colors.white,
                  ),
                  bottomNavigationBar: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(top: BorderSide(color: Color(0xffE8E9EC))),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: BlueButton(
                        text: "К выбору номера",
                        onPressed: () {
                          print("pushed");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ApartamentsPage(
                                      hotelName: state.hotel!.name,
                                    )),
                          );
                        },
                      ),
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        BackgroundCardWidget(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              PhotoCarousel(urls: state.hotel!.imageUrls),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 10),
                                child: HotelMainInfo(
                                  name: state.hotel!.name,
                                  address: state.hotel!.address,
                                  rating: state.hotel!.rating.toString(),
                                  price: state.hotel!.minimalPrice.toString(),
                                  priceForIt: state.hotel!.priceForIt,
                                  ratingName: state.hotel!.ratingName,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        BackgroundCardWidget(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: HotelAdditionalInfo(
                              peculiarities:
                                  state.hotel!.aboutTheHotel.peculiarities,
                              description:
                                  state.hotel!.aboutTheHotel.description,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              case HotelStatus.initial:
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              case HotelStatus.loading:
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              case HotelStatus.failure:
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(state.errorText!),
                ));
            }
          },
        ),
      ),
    );
  }
}
