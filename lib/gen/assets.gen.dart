/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsBottomNavigatorImagesGen {
  const $AssetsBottomNavigatorImagesGen();

  /// File path: assets/bottom_navigator_images/home_color.png
  AssetGenImage get homeColor =>
      const AssetGenImage('assets/bottom_navigator_images/home_color.png');

  /// File path: assets/bottom_navigator_images/home_image.png
  AssetGenImage get homeImage =>
      const AssetGenImage('assets/bottom_navigator_images/home_image.png');

  /// File path: assets/bottom_navigator_images/order_color.png
  AssetGenImage get orderColor =>
      const AssetGenImage('assets/bottom_navigator_images/order_color.png');

  /// File path: assets/bottom_navigator_images/orders_images.png
  AssetGenImage get ordersImages =>
      const AssetGenImage('assets/bottom_navigator_images/orders_images.png');

  /// File path: assets/bottom_navigator_images/profile_color.png
  AssetGenImage get profileColor =>
      const AssetGenImage('assets/bottom_navigator_images/profile_color.png');

  /// File path: assets/bottom_navigator_images/profile_image.png
  AssetGenImage get profileImage =>
      const AssetGenImage('assets/bottom_navigator_images/profile_image.png');

  /// File path: assets/bottom_navigator_images/projcet.png
  AssetGenImage get projcet =>
      const AssetGenImage('assets/bottom_navigator_images/projcet.png');

  /// File path: assets/bottom_navigator_images/projects_image.png
  AssetGenImage get projectsImage =>
      const AssetGenImage('assets/bottom_navigator_images/projects_image.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        homeColor,
        homeImage,
        orderColor,
        ordersImages,
        profileColor,
        profileImage,
        projcet,
        projectsImage
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/constructor_img.svg
  String get constructorImg => 'assets/images/constructor_img.svg';

  /// File path: assets/images/file_image.png
  AssetGenImage get fileImage =>
      const AssetGenImage('assets/images/file_image.png');

  /// File path: assets/images/home_background_image.png
  AssetGenImage get homeBackgroundImage =>
      const AssetGenImage('assets/images/home_background_image.png');

  /// File path: assets/images/img.png
  AssetGenImage get img => const AssetGenImage('assets/images/img.png');

  /// File path: assets/images/menu_bar.png
  AssetGenImage get menuBar =>
      const AssetGenImage('assets/images/menu_bar.png');

  /// File path: assets/images/menu_vector.svg
  String get menuVector => 'assets/images/menu_vector.svg';

  /// File path: assets/images/register-removebg-preview.png
  AssetGenImage get registerRemovebgPreview =>
      const AssetGenImage('assets/images/register-removebg-preview.png');

  /// File path: assets/images/register_construction.png
  AssetGenImage get registerConstruction =>
      const AssetGenImage('assets/images/register_construction.png');

  /// File path: assets/images/splash screen logo.png
  AssetGenImage get splashScreenLogo =>
      const AssetGenImage('assets/images/splash screen logo.png');

  /// List of all assets
  List<dynamic> get values => [
        constructorImg,
        fileImage,
        homeBackgroundImage,
        img,
        menuBar,
        menuVector,
        registerRemovebgPreview,
        registerConstruction,
        splashScreenLogo
      ];
}

class Assets {
  const Assets._();

  static const $AssetsBottomNavigatorImagesGen bottomNavigatorImages =
      $AssetsBottomNavigatorImagesGen();
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
