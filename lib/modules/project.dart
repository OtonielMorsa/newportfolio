import 'package:flutter/material.dart';

class Project extends StatefulWidget {
  const Project({super.key});

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    double height = 0;
    double width = 0;
    if (mq.width > mq.height) {
      height = mq.height;
      width = (mq.height / 3) * 4;
    } else {
      height = (mq.width / 4) * 3;
      width = mq.width;
    }
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: (width / 4.5),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffe6e6e6),
              ),
              alignment: Alignment.center,
              width: width,
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width,
                    height: height * .8,
                    child: Hero(
                      tag: "project",
                      child: Image.asset(
                        "assets/images/mathbomb.png",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _boton(() {}, height, "See more images"),
                      _boton(() {}, height, "See more Info"),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_boton(onTap, height, texto) {
  return InkResponse(
    onTap: onTap,
    child: Container(
      width: height * .4,
      height: height * .09,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(height * 0.1),
        border: Border.all(
          color: const Color.fromARGB(255, 0, 154, 199),
          width: height * .0055,
        ),
        gradient: const LinearGradient(
          colors: [
            Color(0xffffffff),
            Color.fromARGB(255, 225, 225, 225),
          ],
          stops: [0.25, 0.75],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Text(
        texto,
        style: TextStyle(
          color: const Color.fromARGB(255, 116, 116, 116),
          fontSize: height * .04,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
