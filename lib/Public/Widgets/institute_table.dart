import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Entities/institute_entity.dart';

class InstetuteTable extends StatefulWidget {
  const InstetuteTable({super.key, required this.institutes});
  final List<InstituteEntity> institutes;

  @override
  State<InstetuteTable> createState() => _InstetuteTableState();
}

class _InstetuteTableState extends State<InstetuteTable> {
  final List<InstituteEntity> selectedInstitute = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.9,
        child: DataTable2(
            columnSpacing: MediaQuery.of(context).size.width * 0.05,
            horizontalMargin: 20,
            columns: const [
              DataColumn2(label: Center(child: Text("ID")), size: ColumnSize.S),
              DataColumn2(
                label: Center(child: Text('Name')),
                size: ColumnSize.M,
              ),
              DataColumn2(
                  label: Center(child: Text('Balance')), size: ColumnSize.M),
            ],
            rows: widget.institutes
                .map((institute) => DataRow(
                        selected: selectedInstitute.contains(institute),
                        onSelectChanged: (isSelected) {
                          final isAdding = isSelected != null && isSelected;
                          isAdding
                              ? selectedInstitute.add(institute)
                              : selectedInstitute.remove(institute);

                          setState(() {});
                        },
                        cells: [
                          DataCell(Center(
                              child: Text(institute.instituteID.toString(),
                                  overflow: TextOverflow.ellipsis))),
                          DataCell(Center(
                              child: Text(institute.instituteName.toString(),
                                  overflow: TextOverflow.ellipsis))),
                          DataCell(Center(
                              child: Text(institute.instituteBalance.toString(),
                                  overflow: TextOverflow.ellipsis))),
                        ]))
                .toList()));
  }
}
