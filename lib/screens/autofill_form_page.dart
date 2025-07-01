import 'package:flutter/material.dart';

class AutofillFormPage extends StatefulWidget {
  const AutofillFormPage({super.key});

  @override
  State<AutofillFormPage> createState() => _AutofillFormPageState();
}

class _AutofillFormPageState extends State<AutofillFormPage> {
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final expirycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ฟอร์มจากข้อมูลบัตร')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: const InputDecoration(labelText: 'เลขบัตรประชาชน'),
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'ชื่อ'),
            ),
            TextField(
              controller: surnameController,
              decoration: const InputDecoration(labelText: 'นามสกุล'),
            ),
            TextField(
              controller: expirycontroller,
              decoration: const InputDecoration(labelText: 'ปีหมดอายุ'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (c) => AlertDialog(
                        content: const Text('บันทึกสำเร็จ'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.popUntil(context, (r) => r.isFirst);
                            },
                            child: const Text('กลับหน้าแรก'),
                          ),
                        ],
                      ),
                );
              },
              child: const Text('ยืนยัน'),
            ),
          ],
        ),
      ),
    );
  }
}
