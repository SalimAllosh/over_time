import 'package:dartz/dartz.dart';
import 'package:over_time/Core/Failures/failure.dart';
import 'package:over_time/Features/OverTime/DomainLayer/Entities/Payment_entity.dart';
import 'package:over_time/Features/OverTime/DomainLayer/Repositories/payment_repository.dart';

class InsertPaymentUsecase {
  final PaymentRepository paymentRepository;

  InsertPaymentUsecase({required this.paymentRepository});

  Future<Either<Failure, Unit>> call(PaymentEntity paymentEntity) async {
    return paymentRepository.insertPayment(paymentEntity);
  }
}
