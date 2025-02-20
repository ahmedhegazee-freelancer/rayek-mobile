import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rayik/core/constants/dimensions.dart';
import '../../../widgets/consultant_container.dart';

class TopConsultantsListView extends StatelessWidget {
  const TopConsultantsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .37.sh,
      width: 1.sw,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            // index = = 0?
            return index == 0
                ? SizedBox(
                    width: Dimensions.defaultPadding,
                  )
                : ConsultantContainer(
                    consultantImage: index == 2
                        ? "https://entail-assets.com/mayple/social_media_consutant-1701329397518.jpg"
                        : null,
                  );
          }),
    );
  }
}
