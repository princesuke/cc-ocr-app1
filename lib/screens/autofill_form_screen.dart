import 'package:flutter/material.dart';

class AutofillFormScreen extends StatefulWidget {
  const AutofillFormScreen({super.key});

  @override
  State<AutofillFormScreen> createState() => _AutofillFormScreenState();
}

class _AutofillFormScreenState extends State<AutofillFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ฟอร์มจากข้อมูลบัตร')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'เลขบัตรประชาชน'),
            ),
            TextField(decoration: const InputDecoration(labelText: 'ชื่อ')),
            TextField(decoration: const InputDecoration(labelText: 'นามสกุล')),
            TextField(
              decoration: const InputDecoration(labelText: 'ปีหมดอายุ'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: () {}, child: const Text('ยืนยัน')),
          ],
        ),
      ),
    );
  }
}
