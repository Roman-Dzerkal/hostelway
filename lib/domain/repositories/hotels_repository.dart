import 'package:hostelway/domain/models/hotel_model.dart';
import 'package:hostelway/data/data_sources/hotel_service.dart';

class HotelsRepository {
  final HotelService service;
  HotelsRepository(this.service);

  List getHotels() {
    return [];
  }

  Future<String> createHotel(Map<String, dynamic> data) async {
    return await service.createHotel(data);
  }

  Future<List<HotelModel>> fetchHotels({String userId = '', String query=''}) async {
    return await service.fetchHotels(userId: userId, query:query);
  }

  void addFavorites(String id) async {
    service.addFavorites(id);
  }

  Future<List<HotelModel>> fetchFavoriteHotels() async {
    return await service.fetchFavoriteHotels();
  }

}
