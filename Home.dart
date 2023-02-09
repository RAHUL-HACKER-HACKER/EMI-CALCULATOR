import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var pController = TextEditingController();
  var dController = TextEditingController();
  var iController = TextEditingController();
  var tController = TextEditingController();
  var eController = TextEditingController();
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Card(
          child: Column(children: [
            Image.asset(
              "assets/images/pic1.jpg",
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Inter Details",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: pController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "enter here",
                    labelText: "Principal"),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: dController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "enter here",
                    labelText: "Down Payment"),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: iController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "enter here",
                    labelText: "Interest(p.a)"),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: tController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "enter here",
                    labelText: "Tenor(In Month)"),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: eController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "enter here",
                    labelText: "EMI"),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                var p = pController.text.toString();
                var d = dController.text.toString();
                var i = iController.text.toString();
                var t = tController.text.toString();
                var e = eController.text.toString();

                if (p != "" && d != "" && i != "" && t != "" && e == "") {
                  var np = double.parse(p);
                  var nd = double.parse(d);
                  var ni = double.parse(i);
                  var nt = double.parse(t);

                  var principal = np - nd;
                  var interest = ni / 1200;
                  var tenor = nt;
                  var emi = (principal * interest * pow((interest + 1), nt)) /
                      ((pow(interest + 1, tenor)) - 1);
                  eController.text = "$emi";
                  result = "";
                } else if (p != "" &&
                    d != "" &&
                    i != "" &&
                    t == "" &&
                    e != "") {
                  var np = double.parse(p);
                  var nd = double.parse(d);
                  var ni = double.parse(i);
                  var ne = double.parse(e);

                  var principal = np - nd;
                  var interest = ni / 1200;
                  var emi = ne;
                  var tenor = (log(emi) - log(emi - (principal * interest))) /
                      log(interest + 1);
                  tController.text = "$tenor";
                  result = "";
                } else if (p != "" &&
                    d != "" &&
                    i == "" &&
                    t != "" &&
                    e != "") {
                  var np = double.parse(p);
                  var nd = double.parse(d);
                  var nt = double.parse(t);
                  var ne = double.parse(e);

                  var principal = np - nd;
                  var tenor = nt;
                  //var interest = ni / 1200;
                  var emi = ne;

                  double temp = 0.0;
                  double interest = 0.0;
                  double tempemi = 0.0;
                  while (tempemi < emi) {
                    temp = temp + 1;
                    interest = temp / 1200;
                    tempemi = (principal * interest * pow((interest + 1), nt)) /
                        ((pow(interest + 1, tenor)) - 1);
                  }

                  iController.text = "$temp";
                  result = "";
                } else if (p != "" &&
                    d == "" &&
                    i != "" &&
                    t != "" &&
                    e != "") {
                  var np = double.parse(p);
                  var nt = double.parse(t);
                  var ni = double.parse(i);
                  var ne = double.parse(e);

                  var principal = np;
                  var tenor = nt;
                  var interest = ni / 1200;
                  var emi = ne;
                  var downpayment = principal -
                      ((emi * (pow(interest + 1, tenor) - 1)) /
                          (pow(interest + 1, tenor) * interest));
                  dController.text = "$downpayment";
                  result = "";
                } else if (p == "" &&
                    d != "" &&
                    i != "" &&
                    t != "" &&
                    e != "") {
                  var nd = double.parse(d);
                  var nt = double.parse(t);
                  var ni = double.parse(i);
                  var ne = double.parse(e);

                  var downpayment = nd;
                  var tenor = nt;
                  var interest = ni / 1200;
                  var emi = ne;
                  var principal = downpayment +
                      ((emi * (pow(interest + 1, tenor) - 1)) /
                          (pow(interest + 1, tenor) * interest));
                  pController.text = "$principal";

                  result = "";
                } else {
                  setState(() {
                    result = "Please Enter any four value!";
                  });
                }
              },
              style: ElevatedButton.styleFrom(foregroundColor: Colors.black),
              child: const Text(
                "CALCULATE",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Text(
              result,
              style: TextStyle(fontSize: 20, color: Colors.red),
            )
          ]),
        ),
      ),
    );
  }
}
