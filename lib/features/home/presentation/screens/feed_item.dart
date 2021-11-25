import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tapped_test_project/common/constants/app_colors.dart';
import 'package:tapped_test_project/common/constants/app_text_colors.dart';
import 'package:tapped_test_project/common/extensions/num_responsiveness_extension.dart';
import 'package:tapped_test_project/features/feeds/domain/entities/feed.dart';

class FeedItem extends StatelessWidget {
  final Feed feed;

  const FeedItem({Key? key, required this.feed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.hp(context)),
      padding: EdgeInsets.only(
        left: 20.wp(context),
        right: 20.wp(context),
        top: 18.hp(context),
        bottom: 20.hp(context),
      ),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(21),
            child: Container(
              alignment: Alignment.bottomRight,
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    feed.imageUrl,
                    maxHeight: 400,
                    maxWidth: 700,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(
                  left: 20.wp(context),
                  right: 20.wp(context),
                  top: 10.hp(context),
                  bottom: 10.hp(context),
                ),
                decoration: BoxDecoration(
                    color: const Color(0xFFFECE00),
                    boxShadow: const [
                      BoxShadow(color: Color(0xFFFECE00), blurRadius: 3, offset: Offset(-1, -1))
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(6),
                    ),
                    border: Border.all(width: 0, color: Colors.transparent)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi),
                      child: Icon(
                        Icons.thumb_up_alt_outlined,
                        size: 13.sp(context),
                      ),
                    ),
                    SizedBox(
                      width: 4.wp(context),
                    ),
                    Text(
                      'Like',
                      style: TextStyle(fontSize: 12.sp(context), fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 8.hp(context)),
          Row(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/home/dummy_avatar.jpg',
                      width: 35.wp(context),
                    ),
                  ),
                  Container(
                    height: 8.hp(context),
                    width: 8.hp(context),
                    decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        shape: BoxShape.circle,
                        border: Border.all(width: 1.5.hp(context), color: Colors.black54)),
                  ),
                ],
              ),
              SizedBox(width: 6.wp(context)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    feed.author,
                    style: TextStyle(
                        fontSize: 14.sp(context),
                        color: AppTextColors.white87,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '2 min ago',
                    style: TextStyle(
                      fontSize: 11.sp(context),
                      color: AppTextColors.white38,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.hp(context)),
          Text(
            'Hello my friends, Today I did skydiving for the first time it was a crazy experience.',
            style: TextStyle(fontSize: 13.sp(context), color: AppTextColors.white87),
          ),
          SizedBox(height: 8.hp(context)),
          Text(
            '#travel #time #skydiving #firstime #viral',
            style: TextStyle(fontSize: 12.sp(context), color: AppTextColors.white60),
          ),
        ],
      ),
    );
  }
}
