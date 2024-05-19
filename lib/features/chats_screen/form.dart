import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rayik/core/constants/dimensions.dart';

import '../../core/constants/color_manager.dart';
import '../../core/constants/icon_manager.dart';
import '../../core/constants/strings.dart';
import '../../core/router/router.dart';
import '../../core/theme/fonts_style.dart';
import '../../core/theme/theme.dart';
import '../../widgets/custom_button.dart';
import '../consultant_page/form.dart';
import '../mian_home/page.dart';
import '../single_chat_view/form.dart';

part 'utils/title.dart';
part 'utils/emptyChats.dart';
part 'utils/chat_item.dart';

class ChatsForm extends StatelessWidget {
  const ChatsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 150.h,
              backgroundColor: ColorManager.primaryColor,
              flexibleSpace: const FlexibleSpaceBar(
                background: _Title(),
                collapseMode: CollapseMode.parallax,
              ),
              pinned: true,
              automaticallyImplyLeading: false,
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                    left: Dimensions.defaultPadding,
                    right: Dimensions.defaultPadding,
                  ),
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: ColorManager.primaryColor.withOpacity(.45),
                    child: Center(
                      child: SvgPicture.asset(
                        IconManager.notification,
                        width: 22.w,
                        height: 22.h,
                        colorFilter: const ColorFilter.mode(
                          ColorManager.whiteTextColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ];
        },
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return const _ChatItem();
          },
        ),
      ),
    );
  }
}
