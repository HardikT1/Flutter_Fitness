import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_strings.dart';
import '../../../utils/base_constants/text_style.dart';
import '../home/Home_components/stepper/stepper_data.dart';

class StepperDetails {
  static List<StepperData> stepperData = [
    {
      "title": BaseStrings.exerciseStapperTitle1,
      "sub_title": BaseStrings.exerciseStapperSubTitle1
    },
    {
      "title": BaseStrings.exerciseStapperTitle2,
      "sub_title": BaseStrings.exerciseStapperSubTitle2
    },
    {
      "title": BaseStrings.exerciseStapperTitle3,
      "sub_title": BaseStrings.exerciseStapperSubTitle3
    },
    {
      "title": BaseStrings.exerciseStapperTitle4,
      "sub_title": BaseStrings.exerciseStapperSubTitle4
    },
  ].map((e) {
    return StepperData(
      title: StepperText("${e["title"]}",
          textStyle: BaseTextStyles.textFieldStyle
              .copyWith(color: BaseColors.blackColor, fontSize: 14.sp)),
      subtitle: StepperText("${e["sub_title"]}",
          textStyle: BaseTextStyles.textFieldStyle
              .copyWith(color: BaseColors.primaryGreyColor, fontSize: 12.sp)),
    );
  }).toList();
}
