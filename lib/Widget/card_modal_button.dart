import 'package:flutter/material.dart';

class ModalButton extends StatelessWidget {
  ModalButton({Key? key, required this.add_task}) : super(key: key);

  final Function add_task;
  TextEditingController controller = TextEditingController();
  void _handle_on_click(BuildContext context) {
    final name = controller.text;
    if (name.isEmpty) {
      return;
    }
    add_task(name);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your task',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => _handle_on_click(context),
                child: const Text('Add Task'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
