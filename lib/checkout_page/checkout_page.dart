import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hotel_test_app/checkout_page/bloc/checkout_bloc.dart';
import 'package:flutter_hotel_test_app/reusable_widgets/card.dart';
import 'package:flutter_hotel_test_app/reusable_widgets/short_main_info.dart';

import '../reusable_widgets/blue_button.dart';
import '../reusable_widgets/title_widget.dart';
import '../service/api_service.dart';
import '../success_page/success_page.dart';
import 'widgets/buyer_info_widget.dart';
import 'widgets/checkout_price_widget.dart';
import 'widgets/reservation_info_widget.dart';
import 'widgets/tourist_card.dart';

String getOrdinal(int value) {
  switch (value) {
    case 1:
      return "Первый";
    case 2:
      return "Второй";
    case 3:
      return "Третий";
    case 4:
      return "Четвертый";
    case 5:
      return "Пятый";
    case 6:
      return "Шестой";
    case 7:
      return "Седьмой";
    case 8:
      return "Восьмой";
    case 9:
      return "Девятый";
    case 10:
      return "Десятый";
  }
  return "";
}

final _formKey = GlobalKey<FormState>();

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final Map<String, TextEditingController> controllers = {
    "emailController": TextEditingController(),
    "phoneController": TextEditingController(),
    "nameController1": TextEditingController(),
    "surnameController1": TextEditingController(),
    "birthdayController1": TextEditingController(),
    "countryController1": TextEditingController(),
    "passportNumberController1": TextEditingController(),
    "passportDateController1": TextEditingController(),
  };
  final Map<String, GlobalKey<FormFieldState>> formKeys = {
    "emailKey": GlobalKey<FormFieldState>(),
    "phoneKey": GlobalKey<FormFieldState>(),
    "nameKey1": GlobalKey<FormFieldState>(),
    "surnameKey1": GlobalKey<FormFieldState>(),
    "birthdayKey1": GlobalKey<FormFieldState>(),
    "countryKey1": GlobalKey<FormFieldState>(),
    "passportKey1": GlobalKey<FormFieldState>(),
    "passportDateKey1": GlobalKey<FormFieldState>(),
  };
  int count = 0;
  final List<Widget> touristCardList = [];

  void _addCard() {
    count++;
    controllers["nameController$count"] = TextEditingController();
    controllers["surnameController$count"] = TextEditingController();
    controllers["birthdayController$count"] = TextEditingController();
    controllers["countryController$count"] = TextEditingController();
    controllers["passportNumberController$count"] = TextEditingController();
    controllers["passportDateController$count"] = TextEditingController();
    formKeys["nameKey$count"] = GlobalKey<FormFieldState>();
    formKeys["surnameKey$count"] = GlobalKey<FormFieldState>();
    formKeys["birthdayKey$count"] = GlobalKey<FormFieldState>();
    formKeys["countryKey$count"] = GlobalKey<FormFieldState>();
    formKeys["passportKey$count"] = GlobalKey<FormFieldState>();
    formKeys["passportDateKey$count"] = GlobalKey<FormFieldState>();
    touristCardList.add(BackgroundCardWidget(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TouristCard(
              cardName: "${getOrdinal(count)} турист",
              nameController: controllers["nameController$count"]!,
              surnameController: controllers["surnameController$count"]!,
              birthdayController: controllers["birthdayController$count"]!,
              countryController: controllers["countryController$count"]!,
              passportNumberController:
                  controllers["passportNumberController$count"]!,
              passportDateController:
                  controllers["passportDateController$count"]!,
              nameKey: formKeys["nameKey$count"]!,
              surnameKey: formKeys["surnameKey$count"]!,
              birthdayKey: formKeys["birthdayKey$count"]!,
              countryKey: formKeys["countryKey$count"]!,
              passportKey: formKeys["passportKey$count"]!,
              passportDateKey: formKeys["passportDateKey$count"]!,
            ))));
  }

  @override
  void initState() {
    _addCard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            leading: const CupertinoNavigationBarBackButton(
              color: Colors.black,
            ),
            centerTitle: true,
            title: const TitleWidget(
              title: "Бронирование",
            ),
            backgroundColor: Colors.white),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) =>
                  CheckoutBloc(ApiService(dio))..add(CheckoutFetched()),
            ),
          ],
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              switch (state.status) {
                case CheckoutStatus.success:
                  return Form(
                    key: _formKey,
                    child: Scaffold(
                      bottomNavigationBar: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border:
                              Border(top: BorderSide(color: Color(0xffE8E9EC))),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: BlueButton(
                            text:
                                "Оплатить ${state.checkout!.tour_price + state.checkout!.fuel_charge + state.checkout!.service_charge} ₽",
                            onPressed: () {
                              //setState(() {});
                              //_formKey.currentState!.validate();
                              //var valid = true;
                              //controllers.forEach((key, controller) {
                              //  print(controller.text);
                              //   if (controller.text.isEmpty) valid = false;
                              // });
                              //print(valid);
                              if ((_formKey.currentState!.validate())) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SuccessPage()),
                                );
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                      
                                  content: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Text("Поля заполенны неверно, либо пусты"),
                                  ),
                                ));
                              }
                            },
                          ),
                        ),
                      ),
                      body: SingleChildScrollView(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BackgroundCardWidget(
                              child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ShortMainInfoWidget(
                                rating: state.checkout!.horating.toString(),
                                ratingName:
                                    state.checkout!.rating_name.toString(),
                                name: state.checkout!.hotel_name.toString(),
                                address:
                                    state.checkout!.hotel_adress.toString()),
                          )),
                          BackgroundCardWidget(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ReservationInfoWidget(
                                departure: state.checkout!.departure,
                                arrival_country:
                                    state.checkout!.arrival_country,
                                date_start: state.checkout!.tour_date_start,
                                date_stop: state.checkout!.tour_date_stop,
                                number_of_nights:
                                    state.checkout!.number_of_nights,
                                room: state.checkout!.room,
                                nutrition: state.checkout!.nutrition,
                                hotel_name: state.checkout!.hotel_name,
                              ),
                            ),
                          ),
                          BackgroundCardWidget(
                              child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ByuerInfoWidget(
                              emailKey: formKeys["emailKey"]!,
                              phoneKey: formKeys["phoneKey"]!,
                              emailController: controllers["emailController"]!,
                              phoneNumberController:
                                  controllers["phoneController"]!,
                            ),
                          )),
                          Column(
                            children: touristCardList,
                          ),
                          BackgroundCardWidget(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: ListTile(
                              title: const Text(
                                "Добавить туриста",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    try {
                                      _addCard();
                                    } catch (e) {
                                      print(e);
                                      rethrow;
                                    }
                                    print(touristCardList.length);
                                  });
                                },
                              ),
                            ),
                          )),
                          BackgroundCardWidget(
                              child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: CheckoutPriceWidget(
                              tour_price: state.checkout!.tour_price,
                              fuel_charge: state.checkout!.fuel_charge,
                              service_charge: state.checkout!.service_charge,
                            ),
                          ))
                        ],
                      )),
                    ),
                  );
                case CheckoutStatus.initial:
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                case CheckoutStatus.loading:
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                case CheckoutStatus.failure:
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
