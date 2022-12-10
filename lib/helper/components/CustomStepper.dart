import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/constants/health_mate_theme.dart';

import 'package:sizer/sizer.dart';

const double MARGIN_NORMAL = 16;
const double CHIP_BORDER_RADIUS = 32;
const double MARGIN_SMALL = 8;
const double PADDING_SMALL = 8;

//states
enum ProgressStepperWidgetState { SELECTED, UNSELECTED, COMPLETED }

//stper position type
enum Type { TOP, BOTTOM }

//Stepper class
class ProgressStepWidget {
  final String title;

  final Widget widget;
  bool isValid;
  ProgressStepperWidgetState state;
  final String ProgressStepWidgetIndex;

  ProgressStepWidget({
    required this.title,
    required this.ProgressStepWidgetIndex,
    required this.widget,
    this.state = ProgressStepperWidgetState.UNSELECTED,
    required this.isValid,
  });
}

class ProgressStepper extends StatefulWidget {
  final List<ProgressStepWidget> steps;
  final Color selectedColor;
  final double circleRadius;
  final Color unSelectedColor;
  final Color outerCircleColor = HealthMateColors.dullGrey;
  final TextStyle textStyle;
  final Color leftBtnColor = Colors.white;
  final Color rightBtnColor = Colors.white;
  final Type ProgressStepperType;
  final VoidCallback onDone;
  final Color btnTextColor;

  ProgressStepper({
    required this.steps,
    required this.selectedColor,
    required this.circleRadius,
    required this.unSelectedColor,
    required this.textStyle,
    this.ProgressStepperType = Type.TOP,
    required this.btnTextColor,
    required this.onDone,
  });

  @override
  State<StatefulWidget> createState() => ProgressStepperState(
        steps: this.steps,
        selectedColor: selectedColor,
        unSelectedColor: unSelectedColor,
        circleRadius: circleRadius,
        outerCircleColor: outerCircleColor,
        textStyle: textStyle,
        type: ProgressStepperType,
        leftBtnColor: leftBtnColor,
        rightBtnColor: rightBtnColor,
        onComplete: onDone,
        btnTextColor: btnTextColor,
      );
}

class ProgressStepperState extends State<StatefulWidget> {
  static PageController _controller = PageController();

// //to move to next page
//   void goToNextPage() {
//     if (_isLast(currentStep)) {
//       onComplete.call();
//     }
//     if (currentStep < steps.length - 1) {
//       currentStep++;
//       setState(() {});
//       _controller.jumpToPage(currentStep);
//     }
//   }

//to move to next page
  static nextPage() {
    if (_controller.page != null) {
      _controller.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
  }

//to move to previous page
  static goToPreviousPage() {
    if (_controller.page != null) {
      _controller.previousPage(
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
  }

  final List<ProgressStepWidget> steps;
  final Color selectedColor;
  final Color unSelectedColor;
  final double circleRadius;
  final TextStyle textStyle;
  final Type type;
  final Color leftBtnColor;
  final Color rightBtnColor;
  final VoidCallback onComplete;
  final Color btnTextColor;

  bool _isLast(int index) {
    return steps.length - 1 == index;
  }

  bool isForward(int index) {
    return index > currentStep;
  }

  Color outerCircleColor = HealthMateColors.dullGrey;
  static int currentStep = 0;

  ProgressStepperState({
    required this.steps,
    required this.selectedColor,
    required this.circleRadius,
    required this.unSelectedColor,
    required this.outerCircleColor,
    required this.textStyle,
    required this.type,
    required this.leftBtnColor,
    required this.rightBtnColor,
    required this.onComplete,
    required this.btnTextColor,
  });

  @override
  void initState() {
    _controller = PageController();
    _controller.addListener(() {
      if (!steps[currentStep].isValid) {
        _controller.jumpToPage(currentStep);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: type == Type.TOP
          ? _getTopTypeWidget(width)
          : _getBottomTypeWidget(width),
    );
  }

  List<Widget> _getTopTypeWidget(double width) {
    return [
      SizedBox(height: 5.h),
      _getIndicatorWidgets(width),
      SizedBox(
        height: MARGIN_SMALL,
      ),
      _getTitleWidgets(),
      _getPageWidgets(),

      ///SP - buttons should be part of the page to perform form validations..
      //_getButtons()
    ];
  }

  List<Widget> _getBottomTypeWidget(double width) {
    return [
      _getPageWidgets(),
      _getIndicatorWidgets(width),
      SizedBox(
        height: MARGIN_SMALL,
      ),
      _getTitleWidgets(),
      // _getButtons()
    ];
  }

  void changeStatus(int index) {
    if (isForward(index)) {
      markAsCompletedForPrecedingSteps();
    } else {
      markAsUnselectedToSucceedingSteps();
    }
    setState(() {
      currentStep = index;
      steps[index].state = ProgressStepperWidgetState.SELECTED;
    });
  }

  Widget _getTitleWidgets() {
    final ProgressStepWidget step;

    return Padding(
      padding: EdgeInsets.only(
          left: 6.w, //approx 30 pixels in Figma
          right: 6.w,
          top: 0.5.h,
          bottom: 2.h),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: getTitles()),
    );
  }

  // List<Widget> getTitles() {
  //   return steps
  //       .map((e) => InkWell(
  //             onTap: () {
  //               HorizontalStepperState._controller.animateToPage(
  //                   int.parse(step.stepIndex) - 1,
  //                   duration: Duration(milliseconds: 500),
  //                   curve: Curves.easeIn);
  //             },
  //             child: Flexible(
  //               child: Text(
  //                 e.title,
  //                 textAlign: TextAlign.center,
  //                 style: Theme.of(context).textTheme.caption,
  //               ),
  //             ),
  //           ))
  //       .toList();
  // }
  List<Widget> getTitles() {
    return steps
        .map((e) => InkWell(
              onTap: () {
                if (steps[int.parse(e.ProgressStepWidgetIndex) - 1].state ==
                    ProgressStepperWidgetState.UNSELECTED) {
                } else {
                  ProgressStepperState._controller.animateToPage(
                      int.parse(e.ProgressStepWidgetIndex) - 1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                  print("after" + e.ProgressStepWidgetIndex);
                }
              },
              child: Text(
                e.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption,
              ),
            ))
        .toList();
  }

  List<Widget> _getStepCircles() {
    List<Widget> widgets = [];
    steps.asMap().forEach((key, value) {
      widgets.add(_StepCircle(value, circleRadius, selectedColor,
          unSelectedColor, outerCircleColor));
      if (key != steps.length - 1) {
        widgets.add(_StepLine(
          steps[key + 1],
          selectedColor,
          unSelectedColor,
        ));
      }
    });
    return widgets;
  }

  //Displays status indicators at the top..
  Widget _getIndicatorWidgets(double width) {
    return Container(
      width: width,
      padding: EdgeInsets.only(
        left: 8.w, //approx 30 pixels in Fima
        right: 8.w,
        top: PADDING_SMALL,
      ),
      child: Container(
          child: Column(
        children: <Widget>[
          Row(
            children: _getStepCircles(),
          )
        ],
      )),
    );
  }

  Widget _getPageWidgets() {
    return Expanded(
      child: PageView(
        //it will prevent the pageview to scroll
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        onPageChanged: (index) => setState(() {
          changeStatus(index);
        }),
        children: _getPages(),
      ),
    );
  }

  List<Widget> _getPages() {
    return steps.map((e) => e.widget).toList();
  }

  /*Widget _getButtons() {
    return Container(
      padding: EdgeInsets.only(
          left: 1.w, right: 3.w, top: PADDING_SMALL, bottom: PADDING_SMALL),
      child: Row(
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ShadowBorderButton(
              height: 8.h,
              width: 40.w,
              title: "Save Draft",
              buttonColor: FeatsColors.white,
              style: context.body2,
              borderColor: FeatsColors.black,
              onPressed: () {
                goToPreviousPage();
              },
              shadowColor: FeatsColors.black,
              isShadowEnabled: true,
              splashColor: Colors.black),
          ShadowBorderButton(
              height: 8.h,
              width: 40.w,
              title: "Next",
              buttonColor: FeatsColors.deepPurple,
              style: context.body1,
              borderColor: FeatsColors.black,
              onPressed: () {
                nextPage();
              },
              shadowColor: FeatsColors.black,
              isShadowEnabled: true,
              splashColor: Colors.black)
        ],
      ),
    );
  }*/

  void markAsUnselectedToSucceedingSteps() {
    for (int i = steps.length - 1; i >= currentStep; i--) {
      steps[i].state = ProgressStepperWidgetState.UNSELECTED;
    }
  }

  void markAsCompletedForPrecedingSteps() {
    for (int i = 0; i <= currentStep; i++) {
      steps[i].state = ProgressStepperWidgetState.SELECTED;
    }
  }
}

//This is the line that connects the progress indicator circles
class _StepLine extends StatelessWidget {
  final ProgressStepWidget step;
  final Color selectedColor;
  final Color unSelectedColor;

  _StepLine(
    this.step,
    this.selectedColor,
    this.unSelectedColor,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: const EdgeInsets.only(
              left: 4,
              right: 4,
            ),
            height: 2,
            color: HealthMateColors
                .shyGrey /*step.state == HorizontalStepState.SELECTED
          ? selectedColor
          : unSelectedColor,*/
            ));
  }
}

class _StepCircle extends StatelessWidget {
  final ProgressStepWidget step;
  final double circleRadius;
  final Color selectedColor;
  final Color unSelectedColor;
  final Color outerCircleColor;

  _StepCircle(
    this.step,
    this.circleRadius,
    this.selectedColor,
    this.unSelectedColor,
    this.outerCircleColor,
  );

  @override
  Widget build(BuildContext context) {
    return step.state == ProgressStepperWidgetState.COMPLETED
        ? Container(
            height: circleRadius,
            width: circleRadius,
            decoration: BoxDecoration(
              color: HealthMateColors.happyGreen,
              border: Border.all(
                width: 2,
                color: HealthMateColors.happyGreen,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(circleRadius),
              ),
            ),
            child: Center(child: Icon(Icons.done, color: Colors.white)))
        : step.state == ProgressStepperWidgetState.SELECTED
            ? InkWell(
                onTap: () {
                  //when the user clicks on a completed cohort stepper indicator then the pagecontroller will
                  //move to that particular page
                  //For now user can only go back to completed pages.
                  ProgressStepperState._controller.animateToPage(
                      int.parse(step.ProgressStepWidgetIndex) - 1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                child: SvgPicture.asset("assets/svgs/done.svg"))
            : Container(
                height: circleRadius,
                width: circleRadius,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: outerCircleColor, //_getColor(),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(circleRadius),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    4,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          circleRadius,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        step.ProgressStepWidgetIndex,
                        style: step.state == ProgressStepperWidgetState.SELECTED
                            ? context.highlight
                            : context.highlight.copyWith(
                                color: HealthMateColors.dullGrey,
                              ),
                      ),
                    ),
                  ),
                ),
              );
  }

  Color _getColor() {
    if (step.state == ProgressStepperWidgetState.SELECTED) {
      return outerCircleColor != null ? outerCircleColor : selectedColor;
    }
    return unSelectedColor;
  }
}
