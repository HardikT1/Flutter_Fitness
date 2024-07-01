import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension DoubleExtension on int {
  /// Vertical Spaced SizedBox
  Widget get toVSB {
    return SizedBox(height: toDouble());
  }

  /// Horizontal Spaced SizedBox
  Widget get toHSB {
    return SizedBox(width: toDouble());
  }

  /// Vertical EdgeInsets
  EdgeInsets get toVertical {
    return EdgeInsets.symmetric(vertical: toDouble());
  }

  /// Horizontal EdgeInsets
  EdgeInsets get toHorizontal {
    return EdgeInsets.symmetric(horizontal: toDouble());
  }

  /// All Circular BorderRadius
  BorderRadius get toAllBorderRadius {
    return BorderRadius.all(Radius.circular(toDouble()));
  }

  /// Horizontal EdgeInsets
  Radius get toRadius {
    return Radius.circular(toDouble());
  }
}

class MaxLengthFormatter extends TextInputFormatter {
  final int maxLength;

  MaxLengthFormatter(this.maxLength);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      int value = int.tryParse(newValue.text) ?? 0;
      if (value > maxLength) {
        return TextEditingValue(
          text: maxLength.toString(),
          selection:
              TextSelection.collapsed(offset: maxLength.toString().length),
        );
      }
    }
    return newValue;
  }
}
