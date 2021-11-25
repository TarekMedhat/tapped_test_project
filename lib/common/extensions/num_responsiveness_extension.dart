import 'package:flutter/material.dart';

// ignore: avoid_multiple_declarations_per_line
int? hp, wp, sp, heightPercentage, widthPercentage;

extension NumResponsivenessExtension on num {
  //region Constants
  ///Reduce scale up percentage to 35% only
  static const double scaleUpReductionFactor = .35; //35%
  static const double scaleDownReductionFactor = 1; //100%

  ///The reference screen is the iphone 8 (375*667 LogicalPixels)
  static const Size referenceScreenSize = Size(375, 667);
  //endregion

  //region Public Methods
  double sp(BuildContext context) => _calculateWP(context);

  double widthPercentage(BuildContext context) => _calculateWidthPercentage(context);

  double heightPercentage(BuildContext context) => _calculateHeightPercentage(context);

  double wp(BuildContext context) => _calculateWP(context);

  double hp(BuildContext context) => _calculateHP(context);
  //endregion

  //region Private Methods
  double _calculateWidthPercentage(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return this / 100 * screenWidth;
  }

  double _calculateHeightPercentage(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return this / 100 * screenHeight;
  }

  double _calculateWP(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final refScreenWidth = _getRefScreenWidth(context);
    final scaleReductionFactor =
        screenWidth > refScreenWidth ? scaleUpReductionFactor : scaleDownReductionFactor;
    return this * (1 + (screenWidth / refScreenWidth - 1) * scaleReductionFactor);
  }

  ///if current [screenHeight] is less than the [referenceScreenSize.height] ->
  ///reduce the height by the same ratio percentage between them (scaleReductionFactor = 100%).
  ///but if [screenHeight] is greater than ReferenceScreenHeight [referenceScreenSize.height] ->
  ///increase the height by only scaleReductionFactor(35%) of the ratio percentage between them.
  double _calculateHP(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final refScreenHeight = _getRefScreenHeight(context);
    final scaleReductionFactor =
        screenHeight > refScreenHeight ? scaleUpReductionFactor : scaleDownReductionFactor;
    return this * (1 + (screenHeight / refScreenHeight - 1) * scaleReductionFactor);
  }

  double _getRefScreenWidth(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait
        ? referenceScreenSize.shortestSide
        : referenceScreenSize.longestSide;
  }

  double _getRefScreenHeight(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait
        ? referenceScreenSize.longestSide
        : referenceScreenSize.shortestSide;
  }
//endregion
}
