// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $ImagesGen {
  const $ImagesGen();

  /// File path: images/add_employee_illus.svg
  String get addEmployeeIllus => 'images/add_employee_illus.svg';

  /// File path: images/auth_illus.svg
  String get authIllus => 'images/auth_illus.svg';

  /// File path: images/avatar.jpg
  AssetGenImage get avatar => const AssetGenImage('images/avatar.jpg');

  /// File path: images/calendar.svg
  String get calendar => 'images/calendar.svg';

  /// File path: images/dashboard.svg
  String get dashboard => 'images/dashboard.svg';

  /// File path: images/employees.svg
  String get employees => 'images/employees.svg';

  /// File path: images/logo.svg
  String get logo => 'images/logo.svg';

  /// File path: images/logo_blue.svg
  String get logoBlue => 'images/logo_blue.svg';

  /// File path: images/messenger.svg
  String get messenger => 'images/messenger.svg';

  /// File path: images/nav_illus.svg
  String get navIllus => 'images/nav_illus.svg';

  /// File path: images/portal.svg
  String get portal => 'images/portal.svg';

  /// File path: images/projectImage.svg
  String get projectImage => 'images/projectImage.svg';

  /// File path: images/projects.svg
  String get projects => 'images/projects.svg';

  /// File path: images/vacations.svg
  String get vacations => 'images/vacations.svg';

  /// List of all assets
  List<dynamic> get values => [
    addEmployeeIllus,
    authIllus,
    avatar,
    calendar,
    dashboard,
    employees,
    logo,
    logoBlue,
    messenger,
    navIllus,
    portal,
    projectImage,
    projects,
    vacations,
  ];
}

class Assets {
  const Assets._();

  static const $ImagesGen images = $ImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
