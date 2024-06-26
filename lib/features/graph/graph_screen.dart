import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/features/datails/widgets/custom_paint.dart';
import 'package:smart_home/features/home/controller/controller.dart';
import 'package:smart_home/features/home/widgets/custom_card.dart';
import 'package:smart_home/features/home/widgets/scale_fadeanimation.dart';
import 'package:smart_home/router/router.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: MasterPainter1(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height -
                      140, // Ekran yüksekliğine göre ayarla
                  width: MediaQuery.of(context).size.width -
                      24, // Ekran genişliğine göre ayarla
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: Controller().model_list.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // İki sütunlu grid
                            mainAxisSpacing: 10, // Dikey boşluk
                            crossAxisSpacing: 10, // Yatay boşluk
                            childAspectRatio: 1.2), // Hücrelerin en-boy oranı
                    itemBuilder: (context, index) {
                      var data = Controller().model_list[index];
                      return ScaleFadeAnimation(
                        delay: 2.5,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: GestureDetector(
                              onTap: () {
                                GoRouter.of(context).push(
                                    Routes.detailsscreen.path,
                                    extra: data.model);
                              },
                              child: CustomCardView(model: data)),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
