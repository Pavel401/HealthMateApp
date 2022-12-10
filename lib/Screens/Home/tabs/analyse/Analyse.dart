import 'package:flutter/material.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/constants/health_mate_theme.dart';
import 'package:medica/helper/components/BloodPreasureGraph.dart';
import 'package:medica/helper/components/GlucoseGraph.dart';
import 'package:sizer/sizer.dart';

class Analyse extends StatefulWidget {
  const Analyse({super.key});

  @override
  State<Analyse> createState() => _AnalyseState();
}

class _AnalyseState extends State<Analyse> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        NumericAxisWithLableFormatGraph(),
        BPGraph(),
      ],
    );
  }
}
