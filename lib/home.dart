import 'package:flutter/material.dart';
import 'package:flutter_payment_stripe/services/payment.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    super.initState();
    StripeServices.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Payment Stripe'),
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  await StripeServices.payNowHandler(
                          amount: '1000', currency: 'USD')
                      .then((value) => {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(value.message)))
                          });
                },
                child: const Text('Pay \$1000'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
