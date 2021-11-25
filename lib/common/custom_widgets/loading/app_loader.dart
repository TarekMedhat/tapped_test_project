import 'package:flutter/material.dart';
import 'package:tapped_test_project/common/extensions/num_responsiveness_extension.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 35.hp(context),
        width: 35.hp(context),
        child: CircularProgressIndicator(
          strokeWidth: 3.wp(context),
          color: Colors.white,
        ),
      ),
    );
  }
}
