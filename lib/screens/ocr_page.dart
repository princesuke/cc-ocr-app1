import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import '../routes/app_routes.dart';

class OcrPage extends StatefulWidget {
  const OcrPage({super.key});

  @override
  State<OcrPage> createState() => _OcrPageState();
}

class _OcrPageState extends State<OcrPage> {
  String? recognizedText;
  File? imageFile;
  bool isLoading = false;

  Future<void> pickAndRecognizeText(ImageSource source) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: source);
    if (picked == null) return;
    setState(() {
      imageFile = File(picked.path);
      isLoading = true;
      recognizedText = null;
    });

    final inputImage = InputImage.fromFile(imageFile!);
    final textRecognizer = TextRecognizer();
    final RecognizedText text = await textRecognizer.processImage(inputImage);

    setState(() {
      recognizedText = text.text;
      isLoading = false;
    });
    textRecognizer.close();

    Navigator.pushNamed(context, AppRoutes.autofillForm, arguments: text.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OCR ด้วย ML Kit')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageFile != null
                  ? Image.file(imageFile!, height: 200)
                  : const SizedBox.shrink(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => pickAndRecognizeText(ImageSource.gallery),
                child: const Text("เลือกรูปภาพเพื่อสแกนข้อความ"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => pickAndRecognizeText(ImageSource.camera),
                child: const Text("ถ่ายรูป"),
              ),
              const SizedBox(height: 20),
              if (isLoading)
                const CircularProgressIndicator()
              else if (recognizedText != null)
                SelectableText(recognizedText!, textAlign: TextAlign.center)
              else
                const Text('ยังไม่มีข้อความ', textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
