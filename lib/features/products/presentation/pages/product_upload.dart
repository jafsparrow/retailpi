import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:retailpi/features/products/presentation/providers/products_upload_notifier.dart';

class UploadProductsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadState = ref.watch(uploadProductsNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Upload Products')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (uploadState.isLoading) CircularProgressIndicator(),
            if (uploadState.success) Text('Upload Successful!'),
            if (uploadState.errorMessage != null)
              Text('Error: ${uploadState.errorMessage}'),
            ElevatedButton(
              onPressed: () async {
                // Use file_picker package to pick the Excel file
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['xlsx'],
                );

                if (result != null) {
                  final filePath = result.files.single.path;

                  // Trigger the upload process using the provider
                  if (filePath != null) {
                    ref
                        .read(uploadProductsNotifierProvider.notifier)
                        .uploadProducts(filePath);
                  }
                }
              },
              child: Text('Upload Products from Excel'),
            ),
          ],
        ),
      ),
    );
  }
}
