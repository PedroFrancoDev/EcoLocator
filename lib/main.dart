import 'package:eco_locator/app.dart';
import 'package:eco_locator/data/datasources/i_recycling_point_datasource.dart';
import 'package:eco_locator/data/datasources/local_recycling_point_data_source.dart';
import 'package:eco_locator/data/repositories/Impl_recycling_point_repository.dart';
import 'package:eco_locator/domain/repositories/i_recycling_point_repository.dart';
import 'package:eco_locator/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  
  runApp(
    MultiProvider(
      providers: [
        Provider<IRecyclingPoingDatasource>(
          create: (_) => LocalRecyclingPointDatasource(),
        ),
        Provider<IRecyclingPointRepository>(
          create: (context) => ImplRecyclingPoingRepository(
            context.read<IRecyclingPoingDatasource>(),
          ),
        ),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: App(),
    ),
  );
}
