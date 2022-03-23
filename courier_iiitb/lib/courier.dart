import 'package:flutter/material.dart';

class Courier {
  String senderName;
  String recieverName;
  String sendingAddress;
  String destinationAddress;
  double amountPaid;

  Courier(this.senderName, this.recieverName, this.sendingAddress,
      this.destinationAddress, this.amountPaid);

  get onChanged => null;

  getCourierWidget() {
    return Padding(
        padding: const EdgeInsets.all(50.0),
        child: Container(
          child: Padding(
            child:
                Row(children: [Checkbox(value: false, onChanged: onChanged)]),
            padding: const EdgeInsets.all(10.0),
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
            color: Colors.blueGrey,
          ),
        ));
  }
}
