import 'package:hostelway/models/hotel_model.dart';
import 'package:hostelway/services/hotel_service.dart';

class HotelsRepository {
  final HotelService service;
  HotelsRepository(this.service);

  List getHotels() {
    return [];
  }

  Future<String> createHotel(Map<String, dynamic> data) async {
    return await service.createHotel(data);
  }

  Future<List<HotelModel>> fetchHotels() async {
    return await service.fetchHotels();
  }
}
