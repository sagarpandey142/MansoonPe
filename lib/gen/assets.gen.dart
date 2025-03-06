/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsCustomBottomNavigationGen {
  const $AssetsCustomBottomNavigationGen();

  /// File path: assets/custom_bottom_navigation/home.svg
  String get home => 'assets/custom_bottom_navigation/home.svg';

  /// File path: assets/custom_bottom_navigation/home_color.svg
  String get homeColor => 'assets/custom_bottom_navigation/home_color.svg';

  /// File path: assets/custom_bottom_navigation/order.svg
  String get order => 'assets/custom_bottom_navigation/order.svg';

  /// File path: assets/custom_bottom_navigation/order_color.svg
  String get orderColor => 'assets/custom_bottom_navigation/order_color.svg';

  /// File path: assets/custom_bottom_navigation/profile.svg
  String get profile => 'assets/custom_bottom_navigation/profile.svg';

  /// File path: assets/custom_bottom_navigation/profile_color.svg
  String get profileColor =>
      'assets/custom_bottom_navigation/profile_color.svg';

  /// File path: assets/custom_bottom_navigation/project.svg
  String get project => 'assets/custom_bottom_navigation/project.svg';

  /// File path: assets/custom_bottom_navigation/project_color.svg
  String get projectColor =>
      'assets/custom_bottom_navigation/project_color.svg';

  /// List of all assets
  List<String> get values => [
        home,
        homeColor,
        order,
        orderColor,
        profile,
        profileColor,
        project,
        projectColor
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Component 160.svg
  String get component160 => 'assets/images/Component 160.svg';

  /// File path: assets/images/background_screen.svg
  String get backgroundScreen => 'assets/images/background_screen.svg';

  /// File path: assets/images/box_arrow.svg
  String get boxArrow => 'assets/images/box_arrow.svg';

  /// File path: assets/images/constructor_img.svg
  String get constructorImg => 'assets/images/constructor_img.svg';

  /// File path: assets/images/date_image.svg
  String get dateImage => 'assets/images/date_image.svg';

  /// File path: assets/images/file_image.png
  AssetGenImage get fileImage =>
      const AssetGenImage('assets/images/file_image.png');

  /// File path: assets/images/home_background_image.png
  AssetGenImage get homeBackgroundImage =>
      const AssetGenImage('assets/images/home_background_image.png');

  /// File path: assets/images/home_regi_container.png
  AssetGenImage get homeRegiContainer =>
      const AssetGenImage('assets/images/home_regi_container.png');

  /// File path: assets/images/jj.png
  AssetGenImage get jj => const AssetGenImage('assets/images/jj.png');

  /// File path: assets/images/logout_icon.svg
  String get logoutIcon => 'assets/images/logout_icon.svg';

  /// File path: assets/images/menu_vector.svg
  String get menuVector => 'assets/images/menu_vector.svg';

  /// File path: assets/images/order_file.svg
  String get orderFile => 'assets/images/order_file.svg';

  /// File path: assets/images/profile_bank.svg
  String get profileBank => 'assets/images/profile_bank.svg';

  /// File path: assets/images/profile_log.svg
  String get profileLog => 'assets/images/profile_log.svg';

  /// File path: assets/images/profile_receipt.svg
  String get profileReceipt => 'assets/images/profile_receipt.svg';

  /// File path: assets/images/proj_img_1.png
  AssetGenImage get projImg1 =>
      const AssetGenImage('assets/images/proj_img_1.png');

  /// File path: assets/images/proj_img_2.png
  AssetGenImage get projImg2 =>
      const AssetGenImage('assets/images/proj_img_2.png');

  /// File path: assets/images/proj_img_3.png
  AssetGenImage get projImg3 =>
      const AssetGenImage('assets/images/proj_img_3.png');

  /// File path: assets/images/save_button.svg
  String get saveButton => 'assets/images/save_button.svg';

  /// File path: assets/images/splash screen logo.png
  AssetGenImage get splashScreenLogo =>
      const AssetGenImage('assets/images/splash screen logo.png');

  /// File path: assets/images/truck_splash_screen_logo1.svg
  String get truckSplashScreenLogo1 =>
      'assets/images/truck_splash_screen_logo1.svg';

  /// File path: assets/images/upload_attach.svg
  String get uploadAttach => 'assets/images/upload_attach.svg';

  /// List of all assets
  List<dynamic> get values => [
        component160,
        backgroundScreen,
        boxArrow,
        constructorImg,
        dateImage,
        fileImage,
        homeBackgroundImage,
        homeRegiContainer,
        jj,
        logoutIcon,
        menuVector,
        orderFile,
        profileBank,
        profileLog,
        profileReceipt,
        projImg1,
        projImg2,
        projImg3,
        saveButton,
        splashScreenLogo,
        truckSplashScreenLogo1,
        uploadAttach
      ];
}

class Assets {
  const Assets._();

  static const $AssetsCustomBottomNavigationGen customBottomNavigation =
      $AssetsCustomBottomNavigationGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
