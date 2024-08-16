import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
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
      body: SafeArea(
        child: Stack(
          children: [
            _footerBackground(width, height),
            _circuloWii(height, width),
            _circuloNotificacion(height, width),
            Positioned(
              top: height * .7,
              left: width * .47,
              child: Container(
                alignment: Alignment.center,
                width: width * .5,
                height: height * .3,
                child: _fechaHora(height),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_footerBackground(width, height) {
  return Positioned(
    left: (width / 4.5),
    child: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffe6e6e6), Color(0xffffffff)],
          stops: [0.25, 0.75],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      width: width,
      height: height,
      child: CustomPaint(
        size: Size(height, width),
        painter: _HeaderPaintDiagonal(),
      ),
    ),
  );
}

class _HeaderPaintDiagonal extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 226, 226, 226)
      ..style = PaintingStyle.fill //una vez dibujado cambiar por .fill
      ..isAntiAlias = true
      ..maskFilter = const MaskFilter.blur(BlurStyle.inner, 3.0);
    final path = Path();
    path.moveTo(0, size.height); // punto inicial
    path.lineTo(0, size.height * .75);
    path.lineTo(size.width * .16, size.height * .75);
    path.cubicTo(
      size.width * .16,
      size.height * .75,
      size.width * .20,
      size.height * .75,
      size.width * .3,
      size.height * .84,
    ); // linea circular
    path.lineTo(size.width * .6, size.height * .84);
    path.lineTo(size.width * .68, size.height * .84);
    path.cubicTo(
      size.width * .68,
      size.height * .84,
      size.width * .80,
      size.height * .75,
      size.width * .84,
      size.height * .75,
    );
    path.lineTo(size.width * 1, size.height * .75);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    //
    // Dibujar contorno de figura
    final paint2 = Paint()
      ..color = const Color.fromARGB(255, 1, 130, 170)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.height * .01
      ..isAntiAlias = true
      ..maskFilter = const MaskFilter.blur(BlurStyle.inner, 3.0);
    final path2 = Path();
    path2.moveTo(0, size.height * .75); // Punto inicial
    path2.lineTo(size.width * .16, size.height * .75);
    path2.cubicTo(
      size.width * .16,
      size.height * .75,
      size.width * .20,
      size.height * .75,
      size.width * .3,
      size.height * .84,
    ); // linea circular
    path2.lineTo(size.width * .6, size.height * .84);
    path2.lineTo(size.width * .68, size.height * .84);
    path2.cubicTo(
      size.width * .68,
      size.height * .84,
      size.width * .80,
      size.height * .75,
      size.width * .84,
      size.height * .75,
    );
    path2.lineTo(size.width * 1, size.height * .75);

    // Dibujar contorno de figura
    final paintCirculo1 = Paint()
      ..color = const Color.fromARGB(255, 190, 190, 190)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.height * .012
      ..isAntiAlias = true
      ..maskFilter = const MaskFilter.blur(BlurStyle.inner, 3.0);
    final pathCirculos = Path();
    pathCirculos.moveTo(0, size.height * .79); // Punto inicial
    pathCirculos.lineTo(size.width * .15, size.height * .79);
    pathCirculos.cubicTo(
      size.width * .15,
      size.height * .79,
      size.width * .23,
      size.height * .86,
      size.width * .15,
      size.height * .94,
    );
    pathCirculos.lineTo(0, size.height * .94);

    pathCirculos.moveTo(size.width, size.height * .79); // Punto inicial
    pathCirculos.lineTo(size.width * .85, size.height * .79);
    pathCirculos.cubicTo(
      size.width * .85,
      size.height * .79,
      size.width * .77,
      size.height * .86,
      size.width * .85,
      size.height * .94,
    );
    pathCirculos.lineTo(size.width, size.height * .94);
    //Dibujar todo
    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint2);
    canvas.drawPath(pathCirculos, paintCirculo1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

_circuloWii(height, width) {
  return Positioned(
      child: _circle(
        () {
          print("Hola Wii");
        },
        height,
        Text(
          "CV",
          style: TextStyle(
            color: const Color.fromARGB(255, 139, 139, 139),
            fontSize: height * .04,
            fontWeight: FontWeight.bold,
            shadows: const [
              Shadow(
                color: Color.fromARGB(255, 156, 155, 155),
                blurRadius: 2,
              )
            ],
          ),
        ),
      ),
      top: height * .80,
      left: width * .30);
}

_circuloNotificacion(height, width) {
  return Positioned(
      child: _circle(
        () {
          print("Hola Noti");
        },
        height,
        Icon(
          Icons.person,
          color: const Color.fromARGB(255, 139, 139, 139),
          size: height * .06,
          shadows: const [
            Shadow(
              color: Color.fromARGB(255, 156, 155, 155),
              blurRadius: 2,
            )
          ],
        ),
      ),
      top: height * .80,
      left: width * 1.05);
}

_circle(onTap, height, child) {
  return InkResponse(
    onTap: onTap,
    child: Container(
      width: height * .13,
      height: height * .13,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 1, 130, 170),
            blurRadius: 3,
            blurStyle: BlurStyle.outer,
          ),
        ],
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color.fromARGB(255, 0, 154, 199),
          width: height * .005,
        ),
      ),
      child: child,
    ),
  );
}

_fechaHora(height) {
  return StreamBuilder(
    stream: Stream.periodic(const Duration(seconds: 1)),
    builder: (context, snapshot) {
      // Text(DateFormat('hh:mm').format(DateTime.now()))
      return Column(
        children: [
          Text(
            DateFormat('hh:mm').format(DateTime.now()),
            style: TextStyle(
                color: const Color.fromARGB(255, 139, 139, 139),
                fontSize: height * .11,
                fontFamily: 'Alarm'),
          ),
          Text(
            DateFormat('E MM/dd').format(DateTime.now()),
            style: TextStyle(
                color: const Color.fromARGB(255, 139, 139, 139),
                fontSize: height * .065,
                fontWeight: FontWeight.bold),
          ),
        ],
      );
    },
  );
}
