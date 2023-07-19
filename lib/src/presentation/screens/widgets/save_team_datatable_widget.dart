import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../resources/constants/colors.dart';
import '../../../utils/extensions/extensions.dart';
import '../../components/skipper_text.dart';
import 'datatable_row_widget.dart';

class DatatableWidget extends StatelessWidget {
  final Function? onCaptainSelected;
  final Function? onViceCaptainSelected;
  final bool? isCaptainSelected;
  final bool? isViceCaptainSelected;
  final int? selectedCaptainPosition;
  final int? selectedViceCaptainPosition;

  const DatatableWidget({
    Key? key,
    this.isCaptainSelected,
    this.isViceCaptainSelected,
    required this.selectedCaptainPosition,
    required this.selectedViceCaptainPosition,
    this.onCaptainSelected,
    this.onViceCaptainSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tempList = [
      1,
      2,
      3,
      4,
      4,
      5,
      6,
      7,
      8,
      9,
    ];
    return DataTable2(
      sortColumnIndex: 1,
      columnSpacing: 10.0,
      isVerticalScrollBarVisible: false,
      isHorizontalScrollBarVisible: false,
      dataRowHeight: 70.0,
      columns: <DataColumn>[
        DataColumn2(
          fixedWidth: 80,
          label: SkipperText.textSmall(
            'TYPE',
            color: AppColors.brownishGrey,
          ),
        ),
        DataColumn2(
          fixedWidth: 100,
          label: SkipperText.textSmall(
            'POINTS',
            color: AppColors.brownishGrey,
          ),
        ),
        DataColumn2(
          fixedWidth: 60.0,
          label: SkipperText.textSmall(
            '% C BY',
            color: AppColors.brownishGrey,
          ),
        ),
        DataColumn2(
          label: SkipperText.textSmall(
            '% VC BY',
            color: AppColors.brownishGrey,
          ),
        ),
      ],
      rows: tempList
          .mapIndexed<DataRow>(
            (e, i) => DataRow(
              cells: [
                DataCell(
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(left: 2.0, bottom: 2.0),
                            child: Image.asset(
                              'assets/images/player.jpg',
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              alignment: Alignment.center,
                              height: 13,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(2),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color(0x29000000),
                                      offset: Offset(0, 3),
                                      blurRadius: 25.0)
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SkipperText.textExtraSmall(
                                      'MUM',
                                      color: AppColors.black,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(2.0),
                                    color: AppColors.black,
                                    child: SkipperText.textExtraSmall(
                                      'WK',
                                      color: AppColors.white,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                DataCell(
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkipperText.textSmallBold("Alyssa Healy"),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: SkipperText.textSmall("116 pts"),
                        ),
                      ],
                    ),
                  ),
                ),
                DataCell(
                  DatatableRowWidget(
                    isCaptainSelected: isCaptainSelected,
                    isViceCaptainSelected: isViceCaptainSelected,
                    onCaptainSelected: () {
                      onCaptainSelected!(i);
                    },
                  ),
                ),
                DataCell(
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(18.0)),
                            border: Border.all(
                              color: AppColors.greyCB,
                            ),
                          ),
                          child: const CircleAvatar(
                            backgroundColor: AppColors.white,
                            foregroundColor: AppColors.black,
                            radius: 18.0,
                            child: Text('VC'),
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
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
