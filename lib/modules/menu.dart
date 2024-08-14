import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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

    return Container(
      height: height,
      width: width,
      alignment: Alignment.topCenter,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _archivoMenu(width, height, Icons.desktop_mac_rounded),
                _archivoMenu(width, height, Icons.phone_android_outlined),
                _archivoMenu(width, height, Icons.memory),
                _archivoMenu(width, height, Icons.code),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _archivoMenu(width, height, Icons.phone_android_outlined),
                _archivoMenu(width, height, Icons.phone_android_outlined),
                _archivoMenu(width, height, Icons.phone_android_outlined),
                _archivoMenu(width, height, Icons.phone_android_outlined),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _archivoMenu(width, height, Icons.disc_full_rounded),
                _archivoMenu(width, height, Icons.disc_full_rounded),
                _archivoMenu(width, height, Icons.disc_full_rounded),
                _archivoMenu(width, height, Icons.disc_full_rounded),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

_archivoMenu(width, height, icono) {
  return Container(
    margin: EdgeInsets.all(height * .005),
    width: width * .19,
    height: height * .19,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: const Color.fromARGB(255, 162, 162, 162),
        width: height * .004,
      ),
      borderRadius: BorderRadius.circular(height * .04),
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(255, 181, 181, 181),
          blurRadius: 6,
          blurStyle: BlurStyle.outer,
        ),
      ],
    ),
    child: InkResponse(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        child: Icon(
          icono,
          color: Colors.white,
          size: height * .1,
          shadows: const [
            Shadow(
              color: Color.fromARGB(255, 216, 216, 216),
              blurRadius: 2,
            )
          ],
        ),
      ),
    ),
  );
}
