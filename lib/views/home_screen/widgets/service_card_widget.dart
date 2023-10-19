import 'package:flutter/material.dart';
import 'package:payoll/views/all_products_screen/views/all_products_screen.dart';
import '../../pulsa_data_screen/views/pulsa_data_screen.dart';
import 'feature_alert_dialog.dart';
import 'feature_icon_widget.dart';

class ServiceCardWidget extends StatelessWidget {
  const ServiceCardWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size.width * 0.92,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                  color: Color(0x29292914),
                  blurRadius: 15.0,
                  blurStyle: BlurStyle.normal,
                  offset: Offset(0.0, 0.75) // shadow direction: bottom right
                  )
            ]),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FeatureIconWidget(
                    size: size,
                    text: 'Pulsa & Data',
                    icon: 'assets/icons/pulsa-and-data.png',
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PulsaDataScreen())),
                  ),
                  FeatureIconWidget(
                    size: size,
                    text: 'Uang Elektronik',
                    icon: 'assets/icons/uang-elektronik.png',
                    onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return FeatureAlertDialog(
                            size: size,
                          );
                        }),
                  ),
                  FeatureIconWidget(
                    size: size,
                    text: 'Games',
                    icon: 'assets/icons/games.png',
                    onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return FeatureAlertDialog(
                            size: size,
                          );
                        }),
                  ),
                  FeatureIconWidget(
                    size: size,
                    text: 'Air',
                    icon: 'assets/icons/air.png',
                    onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return FeatureAlertDialog(
                            size: size,
                          );
                        }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FeatureIconWidget(
                    size: size,
                    text: 'Listrik PLN',
                    icon: 'assets/icons/listrik.png',
                    onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return FeatureAlertDialog(
                            size: size,
                          );
                        }),
                  ),
                  FeatureIconWidget(
                    size: size,
                    text: 'Internet & TV Kabel',
                    icon: 'assets/icons/wifi.png',
                    onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return FeatureAlertDialog(
                            size: size,
                          );
                        }),
                  ),
                  FeatureIconWidget(
                    size: size,
                    text: 'Pendidikan',
                    icon: 'assets/icons/pendidikan.png',
                    onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return FeatureAlertDialog(
                            size: size,
                          );
                        }),
                  ),
                  FeatureIconWidget(
                    size: size,
                    text: 'Lainnya',
                    icon: 'assets/icons/lainnya.png',
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AllProductsScreen())),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
