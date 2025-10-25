import 'package:eco_locator/core/enums/filter_status.dart';
import 'package:eco_locator/core/enums/theme_status.dart';
import 'package:eco_locator/presentation/providers/eco_locator_provider.dart';
import 'package:eco_locator/presentation/providers/theme_provider.dart';
import 'package:eco_locator/presentation/widgets/recycle_status_filter_widget.dart';
import 'package:eco_locator/presentation/widgets/simple_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterBottomSheetContent extends StatelessWidget {
  final ThemeProvider themeProvider;

  FilterBottomSheetContent({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    EcoLocatorProvider ecoLocatorProvider = context.watch<EcoLocatorProvider>();

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).bottomSheetTheme.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 40, top: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 60,
                    height: 5,
                    decoration: BoxDecoration(
                      color:
                          themeProvider.currentThemeStatus == ThemeStatus.dark
                          ? Colors.grey[400]
                          : Color(0xFFE2E4EA),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                SizedBox(height: 19),
                Center(
                  child: Text(
                    "Filtrar Reciclagem",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color:
                          themeProvider.currentThemeStatus == ThemeStatus.dark
                          ? Colors.white
                          : Color(0xFF191D31),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                SizedBox(
                  height: 45,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(width: 20),
                      RecycleStatusFilterWidget(
                        status: "Todos",
                        isActive: ecoLocatorProvider.isFilterActive(
                          recyclingType: RecyclingType.all,
                        ),
                        onTap: () => ecoLocatorProvider.changeFilter(
                          currentFilter: RecyclingType.all,
                        ),
                      ),
                      SizedBox(height: 12),
                      RecycleStatusFilterWidget(
                        status: "Vidro",
                        isActive: ecoLocatorProvider.isFilterActive(
                          recyclingType: RecyclingType.glass,
                        ),
                        onTap: () => ecoLocatorProvider.changeFilter(
                          currentFilter: RecyclingType.glass,
                        ),
                      ),
                      SizedBox(height: 12),
                      RecycleStatusFilterWidget(
                        status: "Plástico",
                        isActive: ecoLocatorProvider.isFilterActive(
                          recyclingType: RecyclingType.plastic,
                        ),
                        onTap: () => ecoLocatorProvider.changeFilter(
                          currentFilter: RecyclingType.plastic,
                        ),
                      ),
                      RecycleStatusFilterWidget(
                        status: "Papel",
                        isActive: ecoLocatorProvider.isFilterActive(
                          recyclingType: RecyclingType.paper,
                        ),
                        onTap: () => ecoLocatorProvider.changeFilter(
                          currentFilter: RecyclingType.paper,
                        ),
                      ),
                      RecycleStatusFilterWidget(
                        status: "Metal",
                        isActive: ecoLocatorProvider.isFilterActive(
                          recyclingType: RecyclingType.metal,
                        ),
                        onTap: () => ecoLocatorProvider.changeFilter(
                          currentFilter: RecyclingType.metal,
                        ),
                      ),
                      RecycleStatusFilterWidget(
                        status: "Pilhas e baterias",
                        isActive: ecoLocatorProvider.isFilterActive(
                          recyclingType: RecyclingType.batteries,
                        ),
                        onTap: () => ecoLocatorProvider.changeFilter(
                          currentFilter: RecyclingType.batteries,
                        ),
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                ),
                SizedBox(height: 42),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SimpleTextButton(
                    isEnabled: true,
                    isExpanded: true,
                    onPressed: () async =>
                        ecoLocatorProvider.closeFilterModal(context: context),
                    label: "Aplicar filtro",
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
