import 'package:eco_locator/core/enums/filter_status.dart';
import 'package:eco_locator/presentation/widgets/eco_point_info.dart';
import 'package:eco_locator/presentation/widgets/floating_app_bar.dart';
import 'package:eco_locator/presentation/widgets/recycle_status_filter_widget.dart';
import 'package:eco_locator/presentation/widgets/simple_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EcoMapPage extends StatelessWidget {
  const EcoMapPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  );
                },
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.lightGreen,
                  child: Text("Lugar do MAPP"),
                ),
              ),
              FloatingAppBar(),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(right: 24, bottom: 24),
            child: ClipOval(
              child: GestureDetector(
                onTap: () => openModalFilter(context),
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

  void openModalFilter(BuildContext context) {
    showModalBottomSheet(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.3),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(48)),
      ),
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
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
                          color: Color(0xFFE2E4EA),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    SizedBox(height: 19),
                    Center(
                      child: const Text(
                        "Filtrar Reciclagem",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF191D31),
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
                            isActive: isFilterActive(
                              recyclingType: RecyclingType.all,
                            ),
                            onTap: () =>
                                changeFilter(currentFilter: RecyclingType.all),
                          ),
                          SizedBox(height: 12),
                          RecycleStatusFilterWidget(
                            status: "Vidro",
                            isActive: isFilterActive(
                              recyclingType: RecyclingType.glass,
                            ),
                            onTap: () => changeFilter(
                              currentFilter: RecyclingType.glass,
                            ),
                          ),
                          SizedBox(height: 12),
                          RecycleStatusFilterWidget(
                            status: "Plástico",
                            isActive: isFilterActive(
                              recyclingType: RecyclingType.plastic,
                            ),
                            onTap: () => changeFilter(
                              currentFilter: RecyclingType.plastic,
                            ),
                          ),
                          RecycleStatusFilterWidget(
                            status: "Papel",
                            isActive: isFilterActive(
                              recyclingType: RecyclingType.paper,
                            ),
                            onTap: () => changeFilter(
                              currentFilter: RecyclingType.paper,
                            ),
                          ),
                          RecycleStatusFilterWidget(
                            status: "Metal",
                            isActive: isFilterActive(
                              recyclingType: RecyclingType.metal,
                            ),
                            onTap: () => changeFilter(
                              currentFilter: RecyclingType.metal,
                            ),
                          ),
                          RecycleStatusFilterWidget(
                            status: "Pilhas e baterias",
                            isActive: isFilterActive(
                              recyclingType: RecyclingType.batteries,
                            ),
                            onTap: () => changeFilter(
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
                            closeFilterModal(context: context),
                        label: "Aplicar filtro",
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void closeFilterModal({required BuildContext context}) {
    Navigator.pop(context);
  }

  bool isFilterActive({required RecyclingType recyclingType}) {
    return true;
  }

  void changeFilter({required RecyclingType currentFilter}) {}
}
