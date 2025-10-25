import 'package:eco_locator/domain/repositories/i_recycling_point_repository.dart';
import 'package:eco_locator/domain/usecases/calculate_distance.dart';
import 'package:eco_locator/domain/usecases/get_recycling_points.dart';
import 'package:eco_locator/presentation/pages/eco_map_page/eco_map_page.dart';
import 'package:eco_locator/presentation/providers/eco_locator_provider.dart';
import 'package:eco_locator/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => EcoLocatorProvider(
            getAllRecyclingPoints: context.read<GetRecyclingPointsUseCase>(),
            calculateDistance: context.read<CalculateDistanceUseCase>(),
          )..initializeApp(),
        ),
        Provider<GetRecyclingPointsUseCase>(
          create: (context) => GetRecyclingPointsUseCase(
            context.read<IRecyclingPointRepository>(),
          ),
        ),
        Provider<CalculateDistanceUseCase>(
          create: (_) => CalculateDistanceUseCase(
            context.read<IRecyclingPointRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Eco Locator',
        theme: themeProvider.themeData,
        home: EcoMapPage(),
      ),
    );
  }
}
