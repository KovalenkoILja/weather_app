import 'package:flutter/material.dart';

class LoadingWeather extends StatelessWidget {
  const LoadingWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      //height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
