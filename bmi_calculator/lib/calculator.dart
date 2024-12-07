import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  Color myColor = Colors.transparent;
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String result = "0.0";

  void calculateBMI(String weight, String height) {
    double weightValue = double.tryParse(weight) ?? 0;
    double heightValue = double.tryParse(height) ?? 0;

    if (heightValue == 0 || weightValue == 0) {
      setState(() {
        result = "Invalid input";
        myColor = Colors.transparent;
      });
      return;
    }

    double bmi = weightValue / (heightValue * heightValue);

    setState(() {
      result = bmi.toStringAsFixed(2);
      if (bmi < 18.5) {
        myColor = const Color(0xFF87B1D9);
      } else if (bmi >= 18.5 && bmi <= 24.9) {
        myColor = const Color(0xFF3DD365);
      } else if (bmi >= 25 && bmi <= 29.9) {
        myColor = const Color(0xFFEEE133);
      } else if (bmi >= 30 && bmi <= 34.9) {
        myColor = const Color(0xFFFD802E);
      } else if (bmi >= 35) {
        myColor = const Color(0xFFF95353);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF6DD5ED),
                  Color(0xFF2193B0),
                ]),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      "BMI Calculator",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0038FF),
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: weightController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Enter your weight (kg)",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: heightController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Enter your height (m)",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 180,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          calculateBMI(
                              weightController.text, heightController.text);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(const Color(0xFF0038FF)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Calculate",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: width * 0.8,
                      height: 100,
                      decoration: BoxDecoration(
                        color: myColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "BMI: $result",
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildInfoBox(const Color(0xFF87B1D9), "Underweight"),
                        _buildInfoBox(const Color(0xFF3DD365), "Normal"),
                        _buildInfoBox(const Color(0xFFEEE133), "Overweight"),
                        _buildInfoBox(const Color(0xFFFD802E), "Obese"),
                        _buildInfoBox(const Color(0xFFF95353), "Extreme"),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox(Color color, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 15)),
      ],
    );
  }
}
