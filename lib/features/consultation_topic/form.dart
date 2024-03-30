import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:rayik/widgets/custom_button.dart';
import 'package:rayik/widgets/custom_text_field.dart';
import '../../core/constants/color_manager.dart';
import '../../core/constants/icon_manager.dart';
import '../../core/constants/strings.dart';
import '../../core/theme/fonts_style.dart';
import '../../widgets/back_button.dart';

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
        child: ListView(
          children:[
            SizedBox(height: 20.h),
            const _Title(),
            const _ConsultantData(),
            const _UploadFileForm(),



          ]
        ),
      ),
    );
  }
}

