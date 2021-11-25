import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tapped_test_project/common/constants/app_text_colors.dart';
import 'package:tapped_test_project/common/extensions/num_responsiveness_extension.dart';
import 'package:tapped_test_project/features/stories/domain/entities/story.dart';

class StoryItem extends StatelessWidget {
  final Story story;
  final int index;

  const StoryItem({
    Key? key,
    required this.story,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    {
      final isLive = Random().nextInt(4) != 0;
      return Container(
        margin: EdgeInsets.only(
          left: index == 0 ? 0 : 8.wp(context),
        ),
        width: 114.wp(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 170.hp(context),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    story.imageUrl,
                    maxWidth: 300,
                    maxHeight: 600,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      right: 6.wp(context),
                      left: 6.wp(context),
                      bottom: 5.hp(context),
                      top: 3.hp(context),
                    ),
                    margin: EdgeInsets.only(
                      right: 6.wp(context),
                      left: 8.wp(context),
                      top: 8.hp(context),
                      bottom: 8.hp(context),
                    ),
                    decoration: BoxDecoration(
                      color: isLive ? Colors.black : const Color(0xFFE54947),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      isLive ? 'Live' : 'Premiere',
                      style: TextStyle(
                        color: AppTextColors.white87,
                        fontSize: 12.sp(context),
                      ),
                    ),
                  ),
                  if (isLive)
                    Text(
                      '20k',
                      style: TextStyle(
                        color: AppTextColors.white70,
                        fontSize: 12.sp(context),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.hp(context), left: 2.wp(context)),
              child: Row(
                children: [
                  AutoSizeText(
                    story.author.split(' ').first,
                    maxLines: 1,
                    style: TextStyle(
                        color: AppTextColors.white70,
                        fontSize: 12.sp(context),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 3.wp(context)),
                  Icon(
                    Icons.check_circle,
                    size: 12.sp(context),
                    color: const Color(0xFFBBFC06),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
