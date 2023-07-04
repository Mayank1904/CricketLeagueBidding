import 'package:flutter/material.dart';

import '../../../resources/constants/colors.dart';
import '../../components/skipper_text.dart';

class DatatableRowWidget extends StatelessWidget {
  final Function? onCaptainSelected;
  // final Function? onViceCaptainSelected;
  final bool? isCaptainSelected;
  final bool? isViceCaptainSelected;
  const DatatableRowWidget({
    super.key,
    this.onCaptainSelected,
    // this.onViceCaptainSelected,
    this.isCaptainSelected,
    this.isViceCaptainSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(18.0)),
                border: Border.all(
                  color: isCaptainSelected == false
                      ? AppColors.greyCB
                      : AppColors.blackTwo,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  onCaptainSelected!();
                },
                child: CircleAvatar(
                  backgroundColor: isCaptainSelected == false
                      ? AppColors.white
                      : AppColors.blackTwo,
                  foregroundColor: isCaptainSelected == false
                      ? AppColors.blackTwo
                      : AppColors.white,
                  radius: 18.0,
                  child: SkipperText.titleBold(
                      isCaptainSelected == false ? 'C' : '2X'),
                ),
              ),
            ),
            const Spacer(),
            SkipperText.textExtraSmall(
              "56%",
              color: AppColors.brownishGrey,
            )
          ],
        ),
      ),
    );
  }
}
