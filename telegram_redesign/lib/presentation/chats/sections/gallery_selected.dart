import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:telegram_redesign/widgets/cus_checkbox.dart';

class GallerySelected extends StatefulWidget {
  const GallerySelected({super.key});

  @override
  State<GallerySelected> createState() => _GallerySelectedState();
}

class _GallerySelectedState extends State<GallerySelected> {
  List<AssetEntity> _assetsList = [];
  bool _isLoading = true;

  void _loadAssets() async {
    final PermissionState permissionState =
        await PhotoManager.requestPermissionExtend();
    if (!permissionState.isAuth) return;
    final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(
      type: RequestType.image,
    );
    _assetsList = await paths[0].getAssetListPaged(page: 0, size: 80);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _loadAssets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      itemCount: _assetsList.length,
      itemBuilder: (context, index) {
        final AssetEntity assetEntity = _assetsList[index];
        return FutureBuilder<Uint8List?>(
          future: assetEntity.thumbnailDataWithSize(
            const ThumbnailSize(200, 200),
          ),
          builder: (context, snapshot) {
            final bytes = snapshot.data;
            if (bytes == null) {
              return SizedBox.shrink();
            }
            return Stack(
              children: [
                Positioned.fill(child: Image.memory(bytes, fit: BoxFit.cover)),
                CusCheckbox(
                  value: false,
                  onChanged: (value) {},
                  label: "1",
                  size: 20,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
