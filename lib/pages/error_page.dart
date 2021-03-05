import 'package:flutter/material.dart';
import 'package:flutter_kos/config/config.dart';
import 'package:flutter_kos/screens/home_screen.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/error.png',
                width: 300,
              ),
              SizedBox(height: 70),
              Text(
                'Where are you going?',
                style: blackTextSyle.copyWith(fontSize: 24),
              ),
              Text(
                'Seems like the page that you were \nrequested is already gone',
                style: greyTextSyle.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              Container(
                height: 50,
                width: 210,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                        (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: purpleColor,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17))),
                  child: Text(
                    'Back to Home',
                    style: whiteTextSyle.copyWith(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
