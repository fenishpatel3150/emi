import 'package:flutter/material.dart';
import 'dart:math';
class Emi extends StatefulWidget {
  const Emi({super.key});

  @override
  State<Emi> createState() => _EmiCalculatorState();
}

double EMIAmt = 0;
double loanAmt = 100000;
double interestRate = 1;
double tenure = 24;

class _EmiCalculatorState extends State<Emi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff172255),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xff172255),
          leading: const Icon(
            Icons.window_outlined,
            color: Colors.white,
          ),
          title: const Text(
            'EMI Calculator',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const Text(
                'Your Loan EMI is',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: '₹ ${EMIAmt.toStringAsFixed(2)}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(
                      text: '/month',
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),
                  ])),
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                      color: Colors.black54,
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Loan Amount',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          Text(
                            loanAmt.toStringAsFixed(0),
                            style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Slider(
                            value: loanAmt,
                            min: 5000,
                            max: 200000,
                            divisions: 100,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              loanAmt = value;
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Interest Rate',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          Text(
                            '${interestRate.toStringAsFixed(0)}%',
                            style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Slider(
                            value: interestRate,
                            min: 1,
                            max: 100,
                            divisions: 100,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              interestRate = value;
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Loan Tenure',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          Text(
                            '${tenure.toStringAsFixed(0)} months',
                            style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Slider(
                            value: tenure,
                            min: 6,
                            max: 120,
                            divisions: 60,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              tenure = value;
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {

                            EMIAmt =  emi(loanAmt, interestRate, tenure);

                            setState(() {

                            });
                          },
                          child: const Text(
                            'Calculate',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff172255)),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

double emi(double a, double b, double c)
{
  double emi;
  // one month interest
  b = b / 100 / 12;
  // Calculate EMI as per formula
  emi = ((a * b * pow(1 + b, c)) /
      (pow(1 + b, c) -1));
  return (emi);
}