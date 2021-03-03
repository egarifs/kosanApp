import 'package:flutter/material.dart';
import 'package:flutter_kos/config/config.dart';
import 'package:flutter_kos/screens/home_screen.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              bottom: -100,
              child: Image.asset(
                'assets/splash_image.png',
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 50,
                left: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Find Cozy House\nto Stay and Happy',
                    style: blackTextSyle.copyWith(fontSize: 24),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Stop membuang banyak waktu\npada tempat yang tidak habitable',
                    style: greyTextSyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: 210,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        onSurface: purpleColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                      child: Text(
                        'Explore Now',
                        style: whiteTextSyle.copyWith(fontSize: 18),
                      ),
                    ),
                    //
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
