import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostelway/app/my_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DebugBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint(event.toString());
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint(transition.toString());
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint(error.toString());
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const supabaseUrl =
      String.fromEnvironment('SUPABASE_URL', defaultValue: 'aboba2');
  const supabaseAnonKey =
      String.fromEnvironment('SUPABASE_ANON_TOKEN', defaultValue: 'aboba3');

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );

  if (kDebugMode) {
    Bloc.observer = DebugBlocObserver();
  }

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
  ));

  runApp(MyApp(
    navigatorKey: navigatorKey,
  ));
}

Size get size => MediaQuery.of(navigatorKey.currentContext!).size;

GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
