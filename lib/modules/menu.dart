import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_portfolio/modules/project.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List items = [];

  @override
  void initState() {
    super.initState();
  }

  verifySendProject(int numGrupo, numProject) {
    if (items[numGrupo]["projects"].length <= numProject) {
      return null;
    }
    return items[numGrupo]["projects"][numProject];
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

    Future<List> readJson() async {
      final response = await rootBundle.loadString("json/proyectos.json");
      return json.decode(response);
    }

    return Container(
      alignment: Alignment.center,
      child: FutureBuilder<List?>(
        future: readJson(),
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return const Center(
          //     child: SizedBox(
          //       width: 200,
          //       height: 200,
          //       child: CircularProgressIndicator(),
          //     ),
          //   );
          // }
          if (snapshot.hasData) {
            items = snapshot.data!;

            return Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _archivoMenu(
                          width, height, context, verifySendProject(0, 0)),
                      _archivoMenu(
                          width, height, context, verifySendProject(0, 1)),
                      _archivoMenu(
                          width, height, context, verifySendProject(0, 2)),
                      _archivoMenu(
                          width, height, context, verifySendProject(0, 3)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _archivoMenu(
                          width, height, context, verifySendProject(0, 4)),
                      _archivoMenu(
                          width, height, context, verifySendProject(0, 5)),
                      _archivoMenu(
                          width, height, context, verifySendProject(0, 6)),
                      _archivoMenu(
                          width, height, context, verifySendProject(0, 7)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _archivoMenu(
                          width, height, context, verifySendProject(0, 8)),
                      _archivoMenu(
                          width, height, context, verifySendProject(0, 9)),
                      _archivoMenu(
                          width, height, context, verifySendProject(0, 10)),
                      _archivoMenu(
                          width, height, context, verifySendProject(0, 11)),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Error'));
          }
        },
      ),
    );
  }
}

_archivoMenu(width, height, context, project) {
  print(project);
  String imagen = "";
  String hero = "";
  if (project != null) {
    imagen = project["imagenes"][0]!;
    hero = project["titulo"];
  }
  print(imagen);
  print(hero);
  return GestureDetector(
    onTap: () {
      if (hero != "") {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (BuildContext context, _, __) {
              return Project(
                project: project,
              );
            },
          ),
        );
      }
    },
    child: Hero(
      tag: hero,
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
          image: imagen != ""
              ? DecorationImage(
                  image: AssetImage(imagen),
                  fit: BoxFit.fill,
                )
              : null,
        ),
      ),
    ),
  );
}
