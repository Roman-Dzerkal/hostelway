import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hostelway/models/hotel_model.dart';
import 'package:hostelway/repositories/hotels_repository.dart';
import 'package:hostelway/views/home/navigation/home_manager_navigator.dart';
import 'package:hostelway/repositories/hotels_repository.dart';
part 'home_manager_event.dart';
part 'home_manager_state.dart';

class HomeManagerBloc extends Bloc<HomeManagerEvent, HomeManagerState> {
  final HomeManagerNavigator navigator;
  final HotelsRepository repository;

  HomeManagerBloc({required this.navigator, required this.repository})
      : super(HomeManagerInitial(hotels: List.empty(growable: true))) {
    on<HomeManagerEvent>((event, emit) {});

    on<AddHotelButtonTapEvent>((event, emit) {
      debugPrint('AddHotelButtonTapEvent');
      navigator.goToCreateHotelPage();
    });

    on<FetchHotelsEvent>((event, emit) async {
      emit(state.copyWith(isBusy: true));

      List<HotelModel> hotels = await repository.fetchHotels();
      emit(state.copyWith(hotels: hotels, isBusy: false));
    });
  }
}
