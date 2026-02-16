/*
* Created by ujjawal on 30/01/26.
*/
import 'package:test_project/payment_method.dart';

class BankAccount {
  double _balance = 0;

  double get balance => _balance;

  void deposit(double amount) {
    _balance = _balance + amount;
  }

  void processTransaction(PaymentMethod method, PaymentType payment) {
    // This function doesn't care IF it's a card or PayPal.
    // It just knows that any "PaymentMethod" can "pay".
    // method.addPayment(amount);

    switch (payment.pType) {
      case Payment.online:
      case Payment.cash:
      case Payment.creditCard:
        method.addPayment(payment.amount);
        break;
      default:
        return;
    }
  }
}

class PaymentType {
  double amount;
  Payment? pType;

  PaymentType(this.amount, this.pType);

  PaymentType.online(this.amount) {
    pType = Payment.online;
  }

  PaymentType.cash(this.amount) {
    pType = Payment.cash;
  }
}
