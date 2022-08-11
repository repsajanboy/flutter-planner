
import 'package:flutter/material.dart';

import '../style/app_typography.dart';

extension ContextExtensions on BuildContext {
  AppTextStyle get typo => AppTextStyle();
}

extension StfulContextExtensions on State {
  AppTextStyle get typo => AppTextStyle();
}