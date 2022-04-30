import 'package:flutter/material.dart';

const bgExpand = Color(0xffD3ffbf);
const bgThanksLight = Color(0x78adebad);
const bgThanks = Color(0xffadebad);
const fgThanks = Color(0xff1f7a1f);
const lavendar = Color(0xffEDE3FF);
const mustard = Color(0xffffdb58);
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
const black = Color(0xff000000);

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

class HeaderPlayfairBig extends StatelessWidget {
  const HeaderPlayfairBig(this.heading);
  final String heading;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          heading,
          style: const TextStyle(
              color: pineGreen,
              fontSize: 28,
              fontFamily: 'Playfair',
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

class HeaderMontserratWarning extends StatelessWidget {
  const HeaderMontserratWarning(this.heading);
  final String heading;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          heading,
          style: const TextStyle(
              fontSize: 24,
              fontFamily: 'Montserrat',
              color: red,
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

class ParagraphMontserratLarger extends StatelessWidget {
  const ParagraphMontserratLarger(this.content);
  final String content;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          content,
          style: const TextStyle(
              fontSize: 22,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold),
        ),
      );
}

class ParagraphMontserratLarger2 extends StatelessWidget {
  const ParagraphMontserratLarger2(this.content);
  final String content;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          content,
          style: const TextStyle(
              fontSize: 28,
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

class TitleMonterrsat extends StatelessWidget {
  const TitleMonterrsat(this.content);
  final String content;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          content,
          style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Monterrsat',
              color: lightGreen,
              fontWeight: FontWeight.bold),
        ),
      );
}

class MindsBehindAvatar extends StatelessWidget {
  const MindsBehindAvatar(this.content);
  final String content;
  @override
  Widget build(BuildContext context) => CircleAvatar(
        backgroundColor: Colors.black,
        radius: 91.0,
        child: CircleAvatar(
          backgroundImage: AssetImage(content),
          radius: 90,
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
          style: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: apricotWhite),
        ),
      );
}

class StyledButtonMonterrsatBig extends StatelessWidget {
  const StyledButtonMonterrsatBig(
      {required this.text, required this.onPressed});
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
          style: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: apricotWhite),
        ),
      );
}

class FoodImage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const FoodImage({required this.location});
  final String location;
  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center, // use aligment
        child:
            Image.asset(location, height: 110, width: 110, fit: BoxFit.cover),
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
