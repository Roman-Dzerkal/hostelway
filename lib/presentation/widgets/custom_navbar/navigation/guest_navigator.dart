import 'package:hostelway/utils/role_navigator.dart';
import 'package:hostelway/presentation/views/bookings/navigation/bookings_route.dart';
import 'package:hostelway/presentation/views/favorites/navigation/favotites_route.dart';
import 'package:hostelway/presentation/views/home/navigation/home_guest_route.dart';
import 'package:hostelway/presentation/views/profile/navigation/profile_route.dart';

class GuestBottomNavigator extends RoleNavigator {
  GuestBottomNavigator(super.context);

  void goToSearch() {
    navigator.pushAndRemoveUntil(HomeGuestRoute(), (route) => false);
  }

  void goToFavorite() {
    navigator.pushAndRemoveUntil(FavoritesRoute(), (route) => false);
  }

  void goToProfile() {
    navigator.push(ProfileRoute());
  }

  void goToBookings() {
    
    navigator.pushAndRemoveUntil(BookingsRoute(), (route) => false);
  }
}
