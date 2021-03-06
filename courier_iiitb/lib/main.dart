import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Courier IIITB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Courier @ IIITB'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var senderNameController = TextEditingController();
  var recieverNameController = TextEditingController();
  var sendingAddressController = TextEditingController();
  var destinationAddressController = TextEditingController();
  var amountPaidController = TextEditingController();

  String senderName = "default";
  String recieverName = "default";
  String sendingAddress = "default";
  String destinationAddress = "IIITB";
  bool checked = false;
  String amountPaid = "default";

  final listOfText = <Widget>[];

  // setState((){});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              SizedBox(
                width: width,
                // height: height,
                child: const Text(
                  "Enter New Package Details",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 32),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: senderNameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Sender's Name",
                      hintText: "Enter Sender's Name"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: recieverNameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Reciever's Name",
                      hintText: "Enter Sender's Name"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: sendingAddressController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Sending Address",
                      hintText: "Enter Sending Address"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: destinationAddressController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Destination Address",
                      hintText: "Enter Destination Address"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: amountPaidController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Amount",
                      hintText: "Enter Amount"),
                ),
              ),
              ElevatedButton(
                  onPressed: onPressed, child: const Text("Add Details")),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: listOfText,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void onPressed() {
    setState(() {
      senderName = senderNameController.text;
      recieverName = recieverNameController.text;
      sendingAddress = sendingAddressController.text;
      destinationAddress = destinationAddressController.text;
      amountPaid = amountPaidController.text;
      checked = false;
      listOfText.add(getCourierWidget());
    });
  }

  getCourierWidget() {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              child: Padding(
                child: Row(children: [
                  Checkbox(
                      value: checked,
                      onChanged: (_) {
                        setState(() {
                          checked = checked == false ? true : false;
                        });
                      }),
                  getText(senderName),
                  getText(recieverName),
                  getText(sendingAddress),
                  getText(destinationAddress),
                  getText(amountPaid),
                ]),
                padding: const EdgeInsets.all(10.0),
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
                color: Colors.grey,
              ),
            )));
  }

  getText(data) {
    return Text(
      "     " + data + "        ",
      textAlign: TextAlign.left,
      style: const TextStyle(color: Colors.blue, fontSize: 16),
    );
  }
}
