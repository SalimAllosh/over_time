import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:over_time/Features/OverTime/DomainLayer/Entities/Payment_entity.dart';

abstract class PaymentRepository {
  Future<Either<Failure, List<PaymentEntity>>> getAllPayments();
  Future<Either<Failure, Unit>> insertPayment(PaymentEntity paymentEntity);
  Future<Either<Failure, PaymentEntity>> getPaymentByID(int paymentID);
}
