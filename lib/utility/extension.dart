import 'dart:ui';
import 'package:my_first_project/utility/utilities.dart';

extension StringExtensions on String {
  Color getColor() {
    return getColorFromHex(this);
  }
}
