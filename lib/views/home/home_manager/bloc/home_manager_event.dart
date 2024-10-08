part of 'home_manager_bloc.dart';

sealed class HomeManagerEvent extends Equatable {
  const HomeManagerEvent();

  @override
  List<Object> get props => [];
}

class AddHotelButtonTapEvent extends HomeManagerEvent {
  const AddHotelButtonTapEvent();
}

class FetchHotelsEvent extends HomeManagerEvent {
  const FetchHotelsEvent();
}


class OnTapHotelItemEvent extends HomeManagerEvent {
  final HotelModel model;
  const OnTapHotelItemEvent(this.model);
}