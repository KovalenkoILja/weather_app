import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/blocs/home_bloc.dart';
import 'package:weather_app/presentation/style/colors.dart';

import '../../const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(ShowSplashWithDelayEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: WeatherAppColors.primary,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Image.asset(Const.imgLogo),
          ),
        ));
  }
}
