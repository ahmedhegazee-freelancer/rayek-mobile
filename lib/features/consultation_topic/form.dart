import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:rayik/widgets/custom_button.dart';
import 'package:rayik/widgets/custom_text_field.dart';
import '../../core/constants/color_manager.dart';
import '../../core/constants/icon_manager.dart';
import '../../core/constants/strings.dart';
import '../../core/router/router.dart';
import '../../core/theme/fonts_style.dart';
import '../../widgets/back_button.dart';
import '../consultant_page/form.dart';

part 'utils/title.dart';
part 'utils/consultant_data.dart';
part 'utils/upload_file_form.dart';

class ConsultationTopicForm extends StatelessWidget {
  const ConsultationTopicForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Dimensions.defaultPadding),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            const _Title(),
            Expanded(
              child: Stack(
                children: [
                  ListView(children: [
                    const _ConsultantData(),
                    const _UploadFileForm(),
                    SizedBox(height: 40.h),
                  ]),
                  Positioned(
                    bottom: 0,
                    child: Column(
                      children: [
                        CustomButton(
                          onTap: () {},
                          width: .91.sw,
                          text: Strings.continueText.tr(),
                          isGap: true,
                          iconData: const BackIconInButton(),
                        ),
                      ],
                    ),
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
