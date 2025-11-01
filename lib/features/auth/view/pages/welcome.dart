import 'package:condin/features/auth/view/pages/login.dart';
import 'package:condin/features/auth/view/pages/register.dart';
import 'package:flutter/material.dart';
import 'dart:ui'; // For ImageFilter

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              child: Stack(
                alignment: Alignment.bottomCenter,
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    "img/welcomeimage.jpg",
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter,
                  ),
                  ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: ShaderMask(
                      shaderCallback: (rect){
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black,
                            Colors.black.withOpacity(0),
                          ],
                          stops: [
                            0.5,
                            0.75
                          ]
                        ).createShader(rect);
                      },
                      blendMode: BlendMode.dstOut,
                      child: Image.asset(
                        "img/welcomeimage.jpg",
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    left: 15,
                    child: Image.asset("img/green_logo.png", width: 80),
                  ),
                  Positioned(
                    top: 40,
                    right: 15,
                    child: Icon(Icons.settings, color: Colors.white, size: 30),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 15,
                    right: 15,
                    child: Column(
                          children: [
                            Text(
                              "Todas as suas despesas em um só lugar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 15),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromRGBO(0, 200, 74, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    fixedSize: Size(
                                      MediaQuery.of(context).size.width,
                                      45,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                                  },
                                  child: Text(
                                    "Entrar",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    side: BorderSide(
                                      color: Color.fromRGBO(0, 200, 74, 1),
                                      width: 3,
                                    ),
                                  ),
                                  fixedSize: Size(
                                    MediaQuery.of(context).size.width,
                                    45,
                                  ),
                                  shadowColor: Colors.transparent
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Register()));
                                },
                                child: Text(
                                  "Criar conta",
                                  style: TextStyle(
                                    color: Color.fromRGBO(0, 200, 74, 1),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
