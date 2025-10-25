import "package:eco_locator/presentation/pages/eco_map_page/widgets/filter_bottom_sheet_content.dart";
import "package:eco_locator/presentation/pages/eco_map_page/widgets/map_skeleton.dart";
import "package:eco_locator/presentation/pages/eco_map_page/widgets/map_widget.dart";
import "package:eco_locator/presentation/providers/eco_locator_provider.dart";
import "package:eco_locator/presentation/providers/theme_provider.dart";
import "package:eco_locator/presentation/widgets/floating_app_bar.dart";
import "package:eco_locator/presentation/widgets/simple_text_button.dart";
import "package:flutter/material.dart";
import "package:flutter_map/flutter_map.dart";
import "package:flutter_svg/svg.dart";
import "package:latlong2/latlong.dart";
import "package:provider/provider.dart";

class EcoMapPage extends StatefulWidget {
  const EcoMapPage({super.key});

  @override
  State<EcoMapPage> createState() => _EcoMapPageState();
}

class _EcoMapPageState extends State<EcoMapPage> {
  final MapController _mapController = MapController();
  static const LatLng _initialCenter = LatLng(-8.838333, 13.234444);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<EcoLocatorProvider>(context, listen: false);
      if (provider.currentLocation != null) {
        _mapController.move(provider.currentLocation!, 13.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      body: Consumer<EcoLocatorProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return MapSkeleton();
          }

          if (provider.errorMessage != null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      provider.errorMessage!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, color: Colors.red),
                    ),
                    const SizedBox(height: 20),
                    SimpleTextButton(
                      label: "Tentar Novamente",
                      onPressed: () => provider.initializeApp(),
                    ),
                    if (provider.errorMessage!.contains(
                      "Permissão de localização negada",
                    ))
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Implementar navegação para configurações do app.",
                              ),
                            ),
                          );
                        },
                        child: const Text("Abrir Configurações"),
                      ),
                  ],
                ),
              ),
            );
          }

          final LatLng center = provider.currentLocation ?? _initialCenter;

          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: MapWidget(
                      center: center,
                      provider: provider,
                      mapController: _mapController,
                    ),
                  ),
                  FloatingAppBar(themeStatus: themeProvider.currentThemeStatus),
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
                        "assets/icons/Property 1=linear.svg",
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
          );
        },
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
        return FilterBottomSheetContent(themeProvider: themeProvider);
      },
    );
  }
}
