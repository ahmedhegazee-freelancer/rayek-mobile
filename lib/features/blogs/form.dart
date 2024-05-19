import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:rayik/core/router/router.dart';
import 'package:rayik/features/blog_screen/form.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/constants/color_manager.dart';
import '../../core/constants/icon_manager.dart';
import '../../core/constants/strings.dart';
import '../../core/theme/fonts_style.dart';
import '../../widgets/back_button.dart';

part 'utils/tilte.dart';
part 'utils/most_popular_articles.dart';
part 'utils/categories_taps.dart';

class BlogsForm extends StatelessWidget {
  const BlogsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children:  [
           _BlogsTitle(),
          _MostPopular(),
          _Categories(),
        ],
      ),
    );
  }
}
