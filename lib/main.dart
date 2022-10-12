import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restoran_dicoding/src/bloc/restaurant/restaurant_bloc.dart';
import 'package:restoran_dicoding/src/ui/restaurant_page.dart';
import 'package:restoran_dicoding/src/ui/splashscreen_page.dart';

Future<void> main() async {
  runApp(const InitApp());
}

class InitApp extends StatefulWidget {
  const InitApp({Key? key}) : super(key: key);

  @override
  State<InitApp> createState() => _InitAppState();
}

class _InitAppState extends State<InitApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RestaurantBloc>(
          create: (BuildContext context) => RestaurantBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          appBarTheme: Theme.of(context).appBarTheme.copyWith(
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.dark,
                  statusBarIconBrightness: Brightness.dark,
                  systemNavigationBarIconBrightness: Brightness.dark)),
        ),
        routes: {
          '/': (context) => const SplashscreenPage(),
          '/restaurant': (context) => const RestaurantPage(),
        },
      ),
    );
  }
}
