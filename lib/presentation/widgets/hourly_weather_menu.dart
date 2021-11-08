import 'package:flutter/material.dart';
import 'package:weather_app/domain/services/repository_service.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/internal/dependency_injection.dart';

class WeatherMenu extends StatefulWidget {
  final bool show;

  const WeatherMenu({
    Key? key,
    required this.show,
  }) : super(key: key);

  @override
  _WeatherMenuState createState() => _WeatherMenuState();
}

class _WeatherMenuState extends State<WeatherMenu> {
  @override
  Widget build(BuildContext context) {
    final double? _height = widget.show ? 120 : 0.0;
    final RepositoryService _rs = getIt<RepositoryService>();
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListView(
        children: [
          CheckboxListTile(
            title: Text(S.of(context).by_days),
            value: _rs.isDaily,
            onChanged: (value) => _rs.setDaily(value),
          ),
          CheckboxListTile(
              title: Text(S.of(context).by_the_hour),
              value: _rs.isHourly,
              onChanged: (value) => _rs.setHourly(value)),
        ],
      ),
    );
  }
}
