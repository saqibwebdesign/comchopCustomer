import 'package:flutter/material.dart';
import 'package:Comchop/Tabbar_screens/dashboard.dart';
import 'package:Comchop/checkout_screens/order_complete_screen.dart';
import 'package:Comchop/checkout_screens/thankyou_screen.dart';
import 'package:Comchop/provider/api_calls.dart';
import 'package:provider/provider.dart';

import 'add_your_payment _screen.dart';
import 'checkout_order_screen.dart';

class StepperDemo extends StatefulWidget {
  final id;
  final userid;
  final resturent_id;
  final subtotal;
  final vat_value;
  final total_price;
  final paymentmethod;

  const StepperDemo(
      {Key? key,
      this.id,
      this.userid,
      this.resturent_id,
      this.subtotal,
      this.vat_value,
      this.total_price,
      this.paymentmethod})
      : super(key: key);

  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;
  final TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final checkout = Provider.of<api_calls>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.home_outlined,
                size: 30,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: Theme(
                data: ThemeData(
                    scaffoldBackgroundColor: Colors.white,
                    accentColor: Color.fromRGBO(252, 186, 24, 1),
                    cardColor: Colors.white,
                    colorScheme: ColorScheme.light(
                        primary: Color.fromRGBO(252, 186, 24, 1))),
                child: Stepper(
                  controlsBuilder:
                      (BuildContext context, ControlsDetails controls) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        children: <Widget>[
                          TextButton(
                            onPressed: controls.onStepCancel,
                            child: const Text(
                              '',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          if (_currentStep != 0)
                            TextButton(
                              onPressed: controls.onStepCancel,
                              child: const Text(
                                '',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                  physics: ScrollPhysics(),
                  type: stepperType,
                  currentStep: _currentStep,
                  onStepContinue: null,
                  onStepCancel: null,

                  steps: <Step>[
                    Step(
                      title: new Text('Payment'),
                      content: Container(
                          height: 400, child: add_your_payment_screen()),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 0
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Order'),
                      content: Container(
                          height: 480,
                          child: order_complete_screen(
                            editingcontroller: text,
                            orderid: widget.id,
                            totalincvat: widget.total_price,
                          )),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 1
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Checkout'),
                      content: Container(height: 530, child: thankyou_screen()),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 2
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: _currentStep >= 2
                  ? null
                  : Container(
                      height: 50,
                      width: 290,
                      child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Color.fromRGBO(252, 186, 24, 1),
                          child: Text(
                            _currentStep >= 1 ? 'Confirm order' : 'Continued',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            continued();
                            if (_currentStep == 2) {
                              print(text.text);
                              checkout.checkout_screen(
                                  widget.vat_value,
                                  'cod',
                                  widget.subtotal,
                                  widget.vat_value,
                                  widget.total_price,
                                  'cod',
                                  widget.resturent_id,
                                  text.text);
                            }
                          })),
            ),
          ],
        ),
      ),
    );
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
