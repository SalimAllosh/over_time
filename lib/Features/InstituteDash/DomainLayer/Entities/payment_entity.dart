import 'package:equatable/equatable.dart';

class PaymentEntity extends Equatable {
  final int paymentID;
  final int instituteID;
  final DateTime paymentDate;
  final double paymentAmmount;

  PaymentEntity(
      {required this.paymentID,
      required this.instituteID,
      required this.paymentDate,
      required this.paymentAmmount});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [paymentID, instituteID, paymentDate, paymentAmmount];
}
