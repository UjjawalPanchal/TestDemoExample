/*
* Created by ujjawal on 30/01/26.
*/
abstract class PaymentMethod {
  void addPayment(double payment);
}

class PaymentOption extends PaymentMethod {
  @override
  void addPayment(double payment) {
    print("Payment Option: $payment");
  }
}

class DebitCard extends PaymentMethod {
  @override
  void addPayment(double payment) {
    // TODO: implement addPayment
  }
}

enum Payment { online, cash, creditCard }

enum AppState { initial, loading, success, error }
