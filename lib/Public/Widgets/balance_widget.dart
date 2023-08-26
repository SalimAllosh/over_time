import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BalanceWidget extends StatefulWidget {
  const BalanceWidget({super.key, required this.balance});
  final double balance;

  @override
  State<BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  NumberFormat formatter = NumberFormat("#,##0.00 'AED'");
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("asdasdasdasd");
        show = !show;
        setState(() {});
      },
      child: Center(
        child: SizedBox(
          width: 280,
          child: Chip(
            elevation: 5,
            label: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Balance :  ",
                    style: Theme.of(context).textTheme.displaySmall,
                    children: <TextSpan>[
                      show
                          ? TextSpan(
                              text: formatter.format(widget.balance),
                              style: Theme.of(context).textTheme.labelSmall)
                          : TextSpan(
                              text: maskNumber(widget.balance),
                              style: Theme.of(context).textTheme.labelSmall)
                    ],
                  ),
                ),
                show
                    ? Icon(Icons.remove_red_eye_outlined,
                        color: Theme.of(context).colorScheme.secondary)
                    : const Icon(
                        Icons.remove_red_eye_outlined,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String maskNumber(double number) {
    String numberString = number.toString();
    int decimalSeparatorIndex = numberString.indexOf('.');
    int decimalDigits = decimalSeparatorIndex != -1
        ? numberString.length - decimalSeparatorIndex - 1
        : 0;
    String maskedFormat = '${'*' * (numberString.length - decimalDigits)}';
    if (decimalDigits > 0) {
      maskedFormat += '.' + '*' * decimalDigits;
    }

    return maskedFormat;
  }
}
