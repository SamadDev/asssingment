import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dashboard/features/contact/blocs/bloc/contact_bloc.dart';
import 'package:flutter_dashboard/features/share/widgets/datatable/sf_data_grid_widget.dart';
import 'package:flutter_dashboard/features/share/widgets/text_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../core/theme.dart';
import '../../share/widgets/datatable/data_grid_source.dart';
import 'add_edit_contact_popup.dart';

const _headers = [
  'Name',
  'Mobile',
  'Start Date',
  'End Date',
  'Current Status',
  'Block List',
  '',
];

class ContactSectionWidget extends StatelessWidget {
  const ContactSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kcLightPrimary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: BlocBuilder<ContactBloc, ContactState>(
        bloc: contactBloc,
        builder: (context, state) => SfDataGridWidget(
          headers: _headers
              .map<GridColumn>(
                (header) => GridColumn(
                  columnName: header,
                  label: Container(
                    decoration: const BoxDecoration(color: kcDarkPrimary),
                    padding: const EdgeInsets.all(12),
                    alignment: Alignment.centerLeft,
                    child: TextWidget(header, color: kcWhite),
                  ),
                ),
              )
              .toList(),
          source: MyDataGridSource(contactBloc.contacts.mapIndexed((index, contact) {
            return DataGridRow(cells: [
              DataGridCell<Widget>(
                columnName: 'Name',
                value: _CellWidget(contact['name'], index),
              ),
              DataGridCell<Widget>(columnName: 'Mobile', value: _CellWidget(contact['mobile1'], index)),
              DataGridCell<Widget>(columnName: 'Start Date', value: _buildDateChip("2022-20-2", Colors.red)),
              DataGridCell<Widget>(columnName: 'End Date', value: _buildDateChip("2024-20-2", Colors.green)),
              DataGridCell<Widget>(columnName: 'Current Status', value: _buildStatusChip(true)),
              DataGridCell<Widget>(columnName: 'Block List', value: _buildStatusChip(false)),
              DataGridCell<Widget>(
                  columnName: '',
                  value: Container(
                    decoration: BoxDecoration(color: index.floor().isEven ? kcDarkGrey.withOpacity(0.1) : null),
                    child: Row(
                      children: [
                        _IconButtonWidget(
                            iconSvg: "edit.svg",
                            onTap: () {
                              showAddEditContactPopUp(context, contact);
                            }),
                        _IconButtonWidget(
                            iconSvg: "delete.svg",
                            onTap: () {
                              contactBloc.contacts.removeAt(index);
                              contactBloc.add(UpdateContactUIEvent());
                            }),
                        _IconButtonWidget(
                            iconSvg: "view.svg",
                            onTap: () {
                              showAddEditContactPopUp(context, contact);
                            }),
                      ],
                    ),
                  )),
            ]);
          }).toList()),
          count: contactBloc.contacts.length,
        ),
      ),
    );
  }
}

class _CellWidget extends StatelessWidget {
  final String text;
  final int index;
  const _CellWidget(this.text, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: index.floor().isEven ? kcDarkGrey.withOpacity(0.1) : null),
      padding: const EdgeInsets.all(15),
      child: TextWidget(text, color: kcWhite),
    );
  }
}

class _IconButtonWidget extends StatelessWidget {
  final String iconSvg;
  final onTap;
  const _IconButtonWidget({super.key, required this.onTap, required this.iconSvg});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: SvgPicture.asset('assets/icons/$iconSvg'),
    );
  }
}

Widget _buildDateChip(String date, Color color) {
  return Expanded(
    flex: 1,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextWidget(date, color: kcWhite),
    ),
  );
}

Widget _buildStatusChip(bool status) {
  return Expanded(
    flex: 1,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: status ? kcGreen.withOpacity(0.37) :kcRed,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(
        status ? Icons.check : Icons.close,
        color: Colors.white,
      ),
    ),
  );
}
