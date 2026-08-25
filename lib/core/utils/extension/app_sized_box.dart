import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension AppSizedBoxX on num {
  SizedBox get heightBox => SizedBox(height: h);

  SizedBox get widthBox => SizedBox(width: w);
}

extension MediaQueryValues on BuildContext {
  double get mWidth => MediaQuery.of(this).size.width;
  double get mHeight => MediaQuery.of(this).size.height;
}
