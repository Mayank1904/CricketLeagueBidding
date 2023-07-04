import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../resources/constants/colors.dart';
import '../components/skipper_scaffold.dart';
import '../components/skipper_text.dart';

/// Example without a datasource
class DataTable2SimpleDemo extends StatelessWidget {
  const DataTable2SimpleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SkipperScaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Column(children: [
            SkipperText.titleBold(
              "Choose your Captain and Vice Captain",
              color: AppColors.backgroundColor,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SkipperText.textSmall(
                "Captain get 2X points, Vice Captain",
                color: AppColors.backgroundColor,
                textAlign: TextAlign.center,
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(16),
            child: DataTable2(
                sortColumnIndex: 1,
                fixedTopRows: 2,
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 600,
                columns: const [
                  DataColumn2(
                    label: Text('Column A'),
                    size: ColumnSize.L,
                  ),
                  DataColumn(
                    label: Text('Column B'),
                  ),
                  DataColumn(
                    label: Text('Column C'),
                  ),
                  DataColumn(
                    label: Text('Column D'),
                  ),
                  DataColumn(
                    label: Text('Column NUMBERS'),
                    numeric: true,
                  ),
                ],
                rows: List<DataRow>.generate(
                    100,
                    (index) => DataRow(cells: [
                          DataCell(Text('A' * (10 - index % 10))),
                          DataCell(Text('B' * (10 - (index + 5) % 10))),
                          DataCell(Text('C' * (15 - (index + 5) % 10))),
                          DataCell(Text('D' * (15 - (index + 10) % 10))),
                          DataCell(Text(((index + 0.1) * 25.4).toString()))
                        ]))),
          ),
        ],
      ),
    );
  }
}
