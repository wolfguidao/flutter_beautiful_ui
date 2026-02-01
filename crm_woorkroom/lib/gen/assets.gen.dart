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

  /// File path: images/account.svg
  String get account => 'images/account.svg';

  /// File path: images/add_employee_illus.svg
  String get addEmployeeIllus => 'images/add_employee_illus.svg';

  /// File path: images/addlink.svg
  String get addlink => 'images/addlink.svg';

  /// File path: images/apps.svg
  String get apps => 'images/apps.svg';

  /// File path: images/attach.svg
  String get attach => 'images/attach.svg';

  /// File path: images/auth_illus.svg
  String get authIllus => 'images/auth_illus.svg';

  /// File path: images/avatar.jpg
  AssetGenImage get avatar => const AssetGenImage('images/avatar.jpg');

  /// File path: images/board.svg
  String get board => 'images/board.svg';

  /// File path: images/calendar.svg
  String get calendar => 'images/calendar.svg';

  /// File path: images/company.svg
  String get company => 'images/company.svg';

  /// File path: images/confidentiality.svg
  String get confidentiality => 'images/confidentiality.svg';

  /// File path: images/dashboard.svg
  String get dashboard => 'images/dashboard.svg';

  /// File path: images/emoji.svg
  String get emoji => 'images/emoji.svg';

  /// File path: images/employees.svg
  String get employees => 'images/employees.svg';

  /// File path: images/folder01.svg
  String get folder01 => 'images/folder01.svg';

  /// File path: images/folder02.svg
  String get folder02 => 'images/folder02.svg';

  /// File path: images/folder03.svg
  String get folder03 => 'images/folder03.svg';

  /// File path: images/folder04.svg
  String get folder04 => 'images/folder04.svg';

  /// File path: images/list.svg
  String get list => 'images/list.svg';

  /// File path: images/logo.svg
  String get logo => 'images/logo.svg';

  /// File path: images/logo_blue.svg
  String get logoBlue => 'images/logo_blue.svg';

  /// File path: images/mention.svg
  String get mention => 'images/mention.svg';

  /// File path: images/messenger.svg
  String get messenger => 'images/messenger.svg';

  /// File path: images/nav_illus.svg
  String get navIllus => 'images/nav_illus.svg';

  /// File path: images/notification.svg
  String get notification => 'images/notification.svg';

  /// File path: images/payment.svg
  String get payment => 'images/payment.svg';

  /// File path: images/portal.svg
  String get portal => 'images/portal.svg';

  /// File path: images/portal_illus.svg
  String get portalIllus => 'images/portal_illus.svg';

  /// File path: images/projectImage01.svg
  String get projectImage01 => 'images/projectImage01.svg';

  /// File path: images/projectImage02.svg
  String get projectImage02 => 'images/projectImage02.svg';

  /// File path: images/projectImage03.svg
  String get projectImage03 => 'images/projectImage03.svg';

  /// File path: images/projectImage04.svg
  String get projectImage04 => 'images/projectImage04.svg';

  /// File path: images/projectImage05.svg
  String get projectImage05 => 'images/projectImage05.svg';

  /// File path: images/projectImage06.svg
  String get projectImage06 => 'images/projectImage06.svg';

  /// File path: images/projectImage07.svg
  String get projectImage07 => 'images/projectImage07.svg';

  /// File path: images/projects.svg
  String get projects => 'images/projects.svg';

  /// File path: images/safety.svg
  String get safety => 'images/safety.svg';

  /// File path: images/send.svg
  String get send => 'images/send.svg';

  /// File path: images/task_file.png
  AssetGenImage get taskFile => const AssetGenImage('images/task_file.png');

  /// File path: images/time_tracking_illus.svg
  String get timeTrackingIllus => 'images/time_tracking_illus.svg';

  /// File path: images/timeline.svg
  String get timeline => 'images/timeline.svg';

  /// File path: images/uploadImage.svg
  String get uploadImage => 'images/uploadImage.svg';

  /// File path: images/vacations.svg
  String get vacations => 'images/vacations.svg';

  /// List of all assets
  List<dynamic> get values => [
    account,
    addEmployeeIllus,
    addlink,
    apps,
    attach,
    authIllus,
    avatar,
    board,
    calendar,
    company,
    confidentiality,
    dashboard,
    emoji,
    employees,
    folder01,
    folder02,
    folder03,
    folder04,
    list,
    logo,
    logoBlue,
    mention,
    messenger,
    navIllus,
    notification,
    payment,
    portal,
    portalIllus,
    projectImage01,
    projectImage02,
    projectImage03,
    projectImage04,
    projectImage05,
    projectImage06,
    projectImage07,
    projects,
    safety,
    send,
    taskFile,
    timeTrackingIllus,
    timeline,
    uploadImage,
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
