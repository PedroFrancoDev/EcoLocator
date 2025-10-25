import 'package:eco_locator/presentation/pages/eco_map_page/widgets/filter_bottom_sheet_content.dart';
import 'package:eco_locator/presentation/providers/recycle_filter_provider.dart';
import 'package:eco_locator/presentation/providers/theme_provider.dart';
import 'package:eco_locator/presentation/widgets/eco_point_info.dart';
import 'package:eco_locator/presentation/widgets/floating_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class EcoMapPage extends StatelessWidget {
  const EcoMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  showEcoPointInfo(
                    context,
                    nomePonto: "Ponto Verde Central",
                    tipoMaterial: "Plástico, Vidro, Papel",
                    distanciaKm: 1.8,
                    themeStatus: themeProvider.currentThemeStatus,
                  );
                },
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.lightGreen,
                  child: Text("Lugar do MAPP"),
                ),
              ),
              FloatingAppBar(
                themeStatus: themeProvider.currentThemeStatus,
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(right: 24, bottom: 24),
            child: ClipOval(
              child: GestureDetector(
                onTap: () => openBottomSheetFilter(
                  context: context,
                  themeProvider: themeProvider,
                ),
                child: Container(
                  padding: EdgeInsets.all(11),
                  color: Color(0XFF2E7D32),
                  child: SvgPicture.asset(
                    "lib/assets/icons/Property 1=linear.svg",
                    height: 25,
                    width: 25,
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void openBottomSheetFilter({
    required BuildContext context,
    required ThemeProvider themeProvider,
  }) {
    showModalBottomSheet(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.3),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(48)),
      ),
      builder: (context) {
        return ChangeNotifierProvider(
          create: (context) => RecycleFilterProvider(),
          child: FilterBottomSheetContent(themeProvider: themeProvider),
        );
      },
    );
  }
}
