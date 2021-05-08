import 'package:findnumber_app/components/CustomButton.dart';
import 'package:flutter/material.dart';

import 'components/textFieldCustom.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String numberCollection = "";
  String numberValue = "0";
  String numberChoose = "0";
  String numberDigit = "0";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  generateNumber(int findNumber) {
    numberCollection = "";

    int i = 0;
    bool loop = true;
    // if (findNumber % 2 == 0) {
    //   findNumber = findNumber;
    // } else {
    //   findNumber += 1;
    // }
    print("findNumber $findNumber");
    while (loop) {
      if (findNumber > numberCollection.length) {
        loop = true;
        i++;
        numberCollection += i.toString();
      } else {
        loop = false;
        print("number => $numberCollection");
      }
    }

    var splitNumber = numberCollection.split("");
    if (findNumber < 10) {
      numberValue = splitNumber[findNumber - 1];
    } else {
      String angka1 = splitNumber[numberCollection.length - 2];
      String angka2 = splitNumber[numberCollection.length - 1];
      print("angka1 = > ${splitNumber[numberCollection.length - 2]}");
      print("angka2 = > ${splitNumber[numberCollection.length - 1]}");
      if (numberCollection.length > int.parse(numberChoose)) {
        numberDigit = angka1;
      } else {
        numberDigit = angka2;
      }
      numberValue = splitNumber[numberCollection.length - 2] +
          splitNumber[numberCollection.length - 1];
    }
    print("# number length => ${numberCollection.length}");
    print("# numberValue => $numberValue");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Number"),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "DIGIT",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            TextFieldCustom(
              onChanged: (value) {
                numberChoose = value;
                print("value $value");
              },
            ),
            SizedBox(height: 50),
            Text(
              "OUTPUT",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: numberChoose,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: " digit number is ",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: numberDigit,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: " lies on number ",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: numberValue,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            CustomButton(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                "Looking for Numbers",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                setState(() {
                  generateNumber(int.parse(numberChoose));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
