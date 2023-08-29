import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: "All",
      onChanged: (value) {},
      items: const [],
    );
  }
}
