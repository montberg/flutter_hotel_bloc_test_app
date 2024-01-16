import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_test_app/apartaments_page/bloc/room_bloc.dart';
import '../checkout_page/checkout_page.dart';
import '../reusable_widgets/title_widget.dart';
import '../service/api_service.dart';
import 'widgets/room_card.dart';

class ApartamentsPage extends StatelessWidget {
  const ApartamentsPage({super.key, required this.hotelName});

  final String hotelName;

  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            leading: CupertinoNavigationBarBackButton(
              color: Colors.black,
            ),
            centerTitle: true,
            title: TitleWidget(
              title: hotelName,
            ),
            backgroundColor: Colors.white),
        body: BlocProvider(
          create: (_) => RoomBloc(ApiService(dio))..add(RoomFetched()),
          child: BlocBuilder<RoomBloc, RoomState>(
            builder: (context, state) {
              switch (state.status) {
                case RoomStatus.success:
                  return Scaffold(
                    body: ListView.builder(
                      itemCount: state.room!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => RoomCard(
                        name: state.room![index].name,
                        price: state.room![index].price,
                        priceForIt: state.room![index].price_per,
                        peculiarities: state.room![index].peculiarities,
                        imageUrls: state.room![index].image_urls,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CheckoutPage()),
                          );
                        },
                      ),
                    ),
                  );
                case RoomStatus.initial:
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                case RoomStatus.loading:
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                case RoomStatus.failure:
                  return Center(
                      child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(state.errorText!),
                  ));
              }
            },
          ),
        ),
      ),
    );
  }
}
