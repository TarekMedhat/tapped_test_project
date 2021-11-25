import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tapped_test_project/common/constants/app_dimensions.dart';
import 'package:tapped_test_project/common/constants/app_icon_colors.dart';
import 'package:tapped_test_project/common/constants/app_text_colors.dart';
import 'package:tapped_test_project/common/extensions/num_responsiveness_extension.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      titleSpacing: 0,
      collapsedHeight: 70.hp(context),
      toolbarHeight: 70.hp(context),
      pinned: true,
      shadowColor: Colors.white12,
      elevation: 1.5,
      title: Padding(
        padding: EdgeInsets.only(
          top: 8.hp(context),
          left: AppDimensions.horizontalPadding(context),
          right: AppDimensions.horizontalPadding(context),
        ),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(180),
                  child: Image.asset(
                    'assets/images/home/dummy_avatar2.jpg',
                    height: 32.hp(context),
                    width: 32.hp(context),
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 1.hp(context), right: 1.wp(context)),
                  height: 7.hp(context),
                  width: 7.hp(context),
                  decoration: BoxDecoration(
                      color: const Color(0xFFC7403F),
                      shape: BoxShape.circle,
                      border: Border.all(width: 1.hp(context), color: Colors.black54)),
                ),
              ],
            ),
            SizedBox(
              width: 8.wp(context),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'Sajon Islam',
                    style: TextStyle(
                      fontSize: 17.sp(context),
                      color: AppTextColors.white87,
                    ),
                  ),
                  AutoSizeText(
                    '@sajon.co',
                    style: TextStyle(
                      fontSize: 13.sp(context),
                      color: AppTextColors.white38,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(180),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(180)),
                padding: EdgeInsets.all(8.hp(context)),
                child: Icon(
                  CupertinoIcons.search,
                  color: AppIconColors.white60,
                  size: 20.sp(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
