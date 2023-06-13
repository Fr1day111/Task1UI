import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class NormalText extends StatelessWidget{
  final String data;
  final double size;

  const NormalText({super.key, required this.data, required this.size});
  Widget build(BuildContext context){
    return Text(data,
      style: GoogleFonts.aboreto(fontSize: size),
    );
  }
}