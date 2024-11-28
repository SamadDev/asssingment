import 'package:flutter/material.dart';
import 'package:flutter_dashboard/core/responsive.dart';
import 'package:flutter_dashboard/core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SfDataGridWidget extends StatefulWidget {
  final List<GridColumn> headers;
  final DataGridSource source;
  final int count;
  const SfDataGridWidget({
    super.key,
    required this.headers,
    required this.source,
    required this.count,
  });

  @override
  State<SfDataGridWidget> createState() => _SfDataGridWidgetState();
}

class _SfDataGridWidgetState extends State<SfDataGridWidget> {
  int _rowsPerPage = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Column(
                children: [
                  Expanded(
                    child: SfDataGrid(
                      gridLinesVisibility: GridLinesVisibility.none,
                      headerGridLinesVisibility: GridLinesVisibility.none,
                      headerRowHeight: 40,
                      columns: widget.headers,
                      source: widget.source,
                      columnWidthMode: isSm(context) ? ColumnWidthMode.auto : ColumnWidthMode.fill,
                      rowsPerPage: _rowsPerPage,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(
                      border: Border(top: BorderSide(color: kcDarkGrey)),
                    ),
                    child: Align(
                      child: Row(
                        children: [
                          Expanded(
                            child: Builder(builder: (context) {
                              double pageCountCalculate = (widget.count / _rowsPerPage).ceilToDouble();
                              return SfDataPager(
                                firstPageItemVisible: false,
                                lastPageItemVisible: false,
                                itemHeight: 40,
                                navigationItemHeight: 40,
                                availableRowsPerPage: const <int>[1, 25, 50, 100],
                                delegate: widget.source,
                                pageCount: pageCountCalculate >= 1 ? pageCountCalculate : 1,
                                onRowsPerPageChanged: (int? rowsPerPage) => setState(
                                  () => _rowsPerPage = rowsPerPage ?? 25,
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
