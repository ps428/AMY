import 'package:flutter/material.dart';

const pista = Color(0xffBEDDD7);
const hawkesBlue = Color(0xffCFE5FD);
const monteCarlo = Color(0xffABD8D8);
const japanBlush = Color(0xffE2D6F3);
const green = Color(0xffC0D8C0);
const apricotWhite = Color(0xffF5EEDC);
const red = Color(0xffDD4A48);
const norway = Color(0xffA2B29F);
const cavernPink = Color(0xffE2BCB7);
const bottleGreen = Color(0xff072227);
const stromboli = Color(0xff2E5E4E);
const coriander = Color(0xffC1DEAE);
const militantVegan = Color(0xff219F94);
const pistaLite = Color(0xffE8F6EF);
const parchmentPaper = Color(0xffF0E5D8);
const wildWatermelon = Color(0xffFF577F);
const babyPink = Color(0xffFCD1D1);
const conifer = Color(0xffA3D344);
const brown = Color(0xff5D373D);
const pineGreen = Color(0xff008080);
// const pineGreen = Color(0xff15717E);
const bottleGreen2 = Color(0xff006A4E);
const pistaliter = Color(0xffECF9F2);
const lightGreen = Color(0xffF1FFDB);
const greenAmy = Color(0xffA1D444);
const bar = Color(0xffE10032);

class Header extends StatelessWidget {
  const Header(this.heading);
  final String heading;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          heading,
          style: const TextStyle(fontSize: 24, fontFamily: 'Playfair'),
        ),
      );
}

class HeaderPlayfair extends StatelessWidget {
  const HeaderPlayfair(this.heading);
  final String heading;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          heading,
          style: const TextStyle(
              color: pineGreen,
              fontSize: 24,
              fontFamily: 'Playfair',
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      );
}

class HeaderOpenSans extends StatelessWidget {
  const HeaderOpenSans(this.heading);
  final String heading;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          heading,
          style: const TextStyle(
              fontSize: 24,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold),
        ),
      );
}

class HeaderMontserrat extends StatelessWidget {
  const HeaderMontserrat(this.heading);
  final String heading;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          heading,
          style: const TextStyle(
              fontSize: 24,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold),
        ),
      );
}

class Paragraph extends StatelessWidget {
  const Paragraph(this.content);
  final String content;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          content,
          style: const TextStyle(fontSize: 18, fontFamily: 'Caveat'),
        ),
      );
}

class ParagraphPlayfair extends StatelessWidget {
  const ParagraphPlayfair(this.content);
  final String content;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          content,
          style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Playfair',
              fontWeight: FontWeight.bold),
        ),
      );
}

class ParagraphMontserrat extends StatelessWidget {
  const ParagraphMontserrat(this.content);
  final String content;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          content,
          style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold),
        ),
      );
}

class ParagraphOpenSans extends StatelessWidget {
  const ParagraphOpenSans(this.content);
  final String content;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          content,
          style: const TextStyle(
              fontSize: 18,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold),
        ),
      );
}

class StyledButton extends StatelessWidget {
  const StyledButton({required this.child, required this.onPressed});
  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: pineGreen, // background (button) color
          onPrimary: apricotWhite, // foreground (text) color
        ),
        onPressed: onPressed,
        child: child,
      );
}

class StyledButtonOpenSans extends StatelessWidget {
  const StyledButtonOpenSans({required this.text, required this.onPressed});
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: pineGreen, // background (button) color
          onPrimary: apricotWhite, // foreground (text) color
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontFamily: 'OpenSans', color: apricotWhite),
        ),
      );
}

class StyledButtonPlayfair extends StatelessWidget {
  const StyledButtonPlayfair({required this.text, required this.onPressed});
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: pineGreen, // background (button) color
          onPrimary: apricotWhite, // foreground (text) color
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontFamily: 'Playfair', color: apricotWhite),
        ),
      );
}

class StyledButtonMonterrsat extends StatelessWidget {
  const StyledButtonMonterrsat({required this.text, required this.onPressed});
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: pineGreen, // background (button) color
          onPrimary: apricotWhite, // foreground (text) color
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontFamily: 'Montserrat', color: apricotWhite),
        ),
      );
}

// ignore_for_file: must_be_immutable

class ProgressBar extends StatelessWidget {
  final double size;
  final Color inActiveColor;
  final Color? activeColor;
  final double value;
  final int counts;
  final int total;

  ProgressBar(
      {Key? key,
      this.inActiveColor = Colors.black12,
      this.activeColor,
      // this.height = 25,
      this.size = 72,
      this.value = 0,
      this.total = 0,
      this.counts = 0})
      : assert(value >= 0 && value <= 100, 'Value must be between (0 to 100)%'),
        super(key: key);

  late double _height, _cellWidth;

  @override
  Widget build(BuildContext context) {
    _height = 20.0;
    _cellWidth = 100 - (100 / 2.88) / (2 * 2 * 3) - _height / (2 * 2.5);

    return SizedBox(
      height: _height,
      width: size,
      // + (size / 2.88) / (2 * 2 * 3) + _height / (2 * 2.5)
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100 / 18.5),
            child: Column(children: [
              Stack(
                children: [
                  Container(
                    height: _height,
                    width: _cellWidth,
                    decoration: BoxDecoration(
                      color: inActiveColor,
                    ),
                  ),
                  SizedBox(
                    height: _height,
                    width: value / 100 * _cellWidth,
                    child: Container(
                      height: _height,
                      width: value,
                      decoration: BoxDecoration(
                        color: activeColor ?? _batteryColor(value),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
          SizedBox(width: (size / 2.88) / (2 * 2 * 3)),
        ],
      ),
    );
  }

  Color _batteryColor(double value) {
    if (value >= 70) {
      return const Color(0xff43C2AE);
    } else if (value >= 45) {
      return const Color(0xffF2C445);
    } else if (value >= 25) {
      return const Color(0xffF28247);
    } else {
      return const Color(0xffF25147);
    }
  }
}
