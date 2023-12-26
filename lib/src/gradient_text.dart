import 'package:flutter/material.dart';

part 'gradient_type.dart';

/// It makes a text widget with a linear gradient format based on provided color array
class GradientText extends StatelessWidget {
  /// The [Text] widget to display.
  final Text text;

  /// Gradient type to display
  final Type type;

  /// The colors the gradient should obtain at each of the stops.
  ///
  /// If [stops] is non-null, this list must have the same length as [stops].
  ///
  /// This list must have at least two colors in it (otherwise, it's not a
  /// gradient!).
  final List<Color> colors;

  /// A list of values from 0.0 to 1.0 that denote fractions along the gradient.
  ///
  /// If non-null, this list must have the same length as [colors].
  ///
  /// If the first value is not 0.0, then a stop with position 0.0 and a color
  /// equal to the first color in [colors] is implied.
  ///
  /// If the last value is not 1.0, then a stop with position 1.0 and a color
  /// equal to the last color in [colors] is implied.
  ///
  /// The values in the [stops] list must be in ascending order. If a value in
  /// the [stops] list is less than an earlier value in the list, then its value
  /// is assumed to equal the previous value.
  ///
  /// If stops is null, then a set of uniformly distributed stops is implied,
  /// with the first stop at 0.0 and the last stop at 1.0.
  final List<double>? stops;

  /// The transform, if any, to apply to the gradient.
  ///
  /// This transform is in addition to any other transformations applied to the
  /// canvas, but does not add any transformations to the canvas.
  final GradientTransform? transform;

  /// The center of the gradient, as an offset into the (-1.0, -1.0) x (1.0, 1.0)
  /// square describing the gradient which will be mapped onto the paint box.
  ///
  /// For example, an alignment of (0.0, 0.0) will place the radial
  /// gradient in the center of the box.
  ///
  /// If this is an [Alignment], then it is expressed as a vector from
  /// coordinate (0.0, 0.0), in a coordinate space that maps the center of the
  /// paint box at (0.0, 0.0) and the bottom right at (1.0, 1.0).
  ///
  /// It can also be an [AlignmentDirectional], where the start is the left in
  /// left-to-right contexts and the right in right-to-left contexts. If a
  /// text-direction-dependent value is provided here, then the [createShader]
  /// method will need to be given a [TextDirection].
  final AlignmentGeometry center;

  /// The radius of the gradient, as a fraction of the shortest side
  /// of the paint box.
  ///
  /// For example, if a radial gradient is painted on a box that is
  /// 100.0 pixels wide and 200.0 pixels tall, then a radius of 1.0
  /// will place the 1.0 stop at 100.0 pixels from the [center].
  final double radius;

  /// How this gradient should tile the plane beyond the outer ring at [radius]
  /// pixels from the [center].
  ///
  /// For details, see [TileMode].
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_clamp_radial.png)
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_decal_radial.png)
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_mirror_radial.png)
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_repeated_radial.png)
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_clamp_radialWithFocal.png)
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_decal_radialWithFocal.png)
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_mirror_radialWithFocal.png)
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_repeated_radialWithFocal.png)
  final TileMode tileMode;

  /// The offset at which stop 0.0 of the gradient is placed.
  ///
  /// If this is an [Alignment], then it is expressed as a vector from
  /// coordinate (0.0, 0.0), in a coordinate space that maps the center of the
  /// paint box at (0.0, 0.0) and the bottom right at (1.0, 1.0).
  ///
  /// For example, a begin offset of (-1.0, 0.0) is half way down the
  /// left side of the box.
  ///
  /// It can also be an [AlignmentDirectional], where the start is the
  /// left in left-to-right contexts and the right in right-to-left contexts. If
  /// a text-direction-dependent value is provided here, then the [createShader]
  /// method will need to be given a [TextDirection].
  final AlignmentGeometry begin;

  /// The offset at which stop 1.0 of the gradient is placed.
  ///
  /// If this is an [Alignment], then it is expressed as a vector from
  /// coordinate (0.0, 0.0), in a coordinate space that maps the center of the
  /// paint box at (0.0, 0.0) and the bottom right at (1.0, 1.0).
  ///
  /// For example, a begin offset of (1.0, 0.0) is half way down the
  /// right side of the box.
  ///
  /// It can also be an [AlignmentDirectional], where the start is the left in
  /// left-to-right contexts and the right in right-to-left contexts. If a
  /// text-direction-dependent value is provided here, then the [createShader]
  /// method will need to be given a [TextDirection].
  final AlignmentGeometry end;

  /// The radius of the focal point of gradient, as a fraction of the shortest
  /// side of the paint box.
  ///
  /// For example, if a radial gradient is painted on a box that is
  /// 100.0 pixels wide and 200.0 pixels tall, then a radius of 1.0
  /// will place the 1.0 stop at 100.0 pixels from the [focal] point.
  ///
  /// If this value is specified and is greater than 0.0, either [focal] or
  /// [center] must not resolve to [Offset.zero], which would fail to create
  /// a valid gradient.
  final double focalRadius;

  /// The focal point of the gradient. If specified, the gradient will appear
  /// to be focused along the vector from [center] to focal.
  ///
  /// See [center] for a description of how the coordinates are mapped.
  ///
  /// If this value is specified and [focalRadius] > 0.0, care should be taken
  /// to ensure that either this value or [center] will not both resolve to
  /// [Offset.zero], which would fail to create a valid gradient.
  final GradientTransform? focal;

  const GradientText(this.text,
      {super.key,
      required this.colors,
      this.type = Type.linear,
      this.stops,
      this.tileMode = TileMode.clamp,
      this.begin = Alignment.topLeft,
      this.center = Alignment.center,
      this.end = Alignment.bottomRight,
      this.radius = 0.5,
      this.transform,
      this.focalRadius = 0.0,
      this.focal});

  @override
  Widget build(BuildContext context) {
    var style = text.style;
    if (style == null) {
      style = const TextStyle(color: Colors.white);
    } else {
      style = style.copyWith(color: Colors.white);
    }
    return ShaderMask(
        shaderCallback: (Rect rect) {
          switch (type) {
            case Type.radial:
              return RadialGradient(
                      colors: colors,
                      center: center,
                      tileMode: tileMode,
                      focalRadius: focalRadius,
                      radius: radius,
                      transform: transform)
                  .createShader(rect);
            case Type.sweep:
              return SweepGradient(
                      colors: colors,
                      center: center,
                      tileMode: tileMode,
                      transform: transform)
                  .createShader(rect);
            default:
              return LinearGradient(
                colors: colors,
                begin: begin,
                stops: stops,
                end: end,
                tileMode: tileMode,
                transform: transform,
              ).createShader(rect);
          }
        },
        child: Text(
          text.data!,
          style: style,
          strutStyle: text.strutStyle,
          textAlign: text.textAlign,
          locale: text.locale,
          maxLines: text.maxLines,
          overflow: text.overflow,
          selectionColor: text.selectionColor,
          semanticsLabel: text.semanticsLabel,
          softWrap: text.softWrap,
          textDirection: text.textDirection,
          textHeightBehavior: text.textHeightBehavior,
          textScaler: text.textScaler,
          textWidthBasis: text.textWidthBasis,
        ));
  }
}
