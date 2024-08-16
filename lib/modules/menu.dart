import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/modules/project.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late List items;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  Future<void> readJson() async {
    var data = await rootBundle.loadString("json/proyectos.json");
    setState(() {
      items = json.decode(data);
    });
  }

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
                _archivoMenu(width, height, Icons.desktop_mac_rounded, context,
                    "project"),
                _archivoMenu(
                    width, height, Icons.phone_android_outlined, context, "1"),
                _archivoMenu(width, height, Icons.memory, context, "2"),
                _archivoMenu(width, height, Icons.code, context, "3"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _archivoMenu(
                    width, height, Icons.phone_android_outlined, context, "4"),
                _archivoMenu(
                    width, height, Icons.phone_android_outlined, context, "5"),
                _archivoMenu(
                    width, height, Icons.phone_android_outlined, context, "6"),
                _archivoMenu(
                    width, height, Icons.phone_android_outlined, context, "7"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _archivoMenu(
                    width, height, Icons.disc_full_rounded, context, "8"),
                _archivoMenu(
                    width, height, Icons.disc_full_rounded, context, "9"),
                _archivoMenu(
                    width, height, Icons.disc_full_rounded, context, "10"),
                _archivoMenu(
                    width, height, Icons.disc_full_rounded, context, "11"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

_archivoMenu(width, height, icono, context, tagHero) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return const Project();
          },
        ),
      );
    },
    child: Hero(
      tag: tagHero,
      child: Container(
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
          image: const DecorationImage(
            image: AssetImage('assets/images/mathbomb.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    ),
  );
}
