import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:math' as math show pow;
import 'kwg_theme.dart';

class PumpingHeart extends StatefulWidget {
  const PumpingHeart({
    Key? key,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 2400),
    this.controller,
  });

  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  _PumpingHeartState createState() => _PumpingHeartState();
}

class _PumpingHeartState extends State<PumpingHeart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..repeat();
    _animation = Tween(begin: 1.0, end: 1.25).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: SpinKitPumpCurve())));
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: _animation, child: _itemBuilder(0));
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : Image.asset('assets/images/color_logo.png', height: 60);
}

class SpinKitPumpCurve extends Curve {
  const SpinKitPumpCurve();

  static const magicNumber = 4.54545454;

  @override
  double transform(double t) {
    if (t >= 0.0 && t < 0.22) {
      return math.pow(t, 1.0) * magicNumber;
    } else if (t >= 0.22 && t < 0.44) {
      return 1.0 - (math.pow(t - 0.22, 1.0) * magicNumber);
    } else if (t >= 0.44 && t < 0.5) {
      return 0.0;
    } else if (t >= 0.5 && t < 0.72) {
      return math.pow(t - 0.5, 1.0) * (magicNumber / 2);
    } else if (t >= 0.72 && t < 0.94) {
      return 0.5 - (math.pow(t - 0.72, 1.0) * (magicNumber / 2));
    }
    return 0.0;
  }
}

Future<void> showSendingData(context, {text}) async {
  return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 0,
          contentPadding: EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          content: Card(
            // color: Colors.transparent,
            elevation: 0,
            child: Wrap(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 15, 20),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0,
                                    right: 15.0,
                                    bottom: 15.0,
                                    top: 20),
                                child: Center(child: spinkit)),
                            Text(text ?? 'Please wait...',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: PRIMARY_COLOR, fontSize: 14))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

final spinkit = SpinKitCircle(
  size: 30,
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? WHITE : PRIMARY_COLOR,
      ),
    );
  },
);

Widget buildShimmer(count) {
  return Shimmer.fromColors(
    baseColor: PRIMARY_COLOR.withOpacity(0.3),
    highlightColor: GREY.withOpacity(0.9),
    enabled: true,
    child: ListView.builder(
      padding: EdgeInsets.only(top: 10),
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: count,
      itemBuilder: (context, index) {
        return buildLoadingContainer();
      },
    ),
  );
}

Widget buildLoadingContainer() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: PRIMARY_COLOR.withOpacity(0.1),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(30, 15, 15, 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: PRIMARY_COLOR.withOpacity(0.1),
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: GREY.withOpacity(0.1),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Loading',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: GREY.withOpacity(0.1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
