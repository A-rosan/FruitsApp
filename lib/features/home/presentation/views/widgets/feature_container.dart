import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/feature_button.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
// import 'package:fruits_app/generated/l10n.dart';

class FeatureContainer extends StatelessWidget {
  const FeatureContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 32;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: width,
        // height: 200,
        child: AspectRatio(
          aspectRatio: 342 / 150,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                right: width * 0.4,
                top: 0,
                child: Image.asset(
                  "assets/images/watermelon.png",
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: width * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: svg.Svg("assets/images/container_shape.svg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "عروض العيد",
                        style: AppTextStyle.regular13
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        "خصم 25%",
                        style:
                            AppTextStyle.bold19.copyWith(color: Colors.white),
                      ),
                      FeatureButton(
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
