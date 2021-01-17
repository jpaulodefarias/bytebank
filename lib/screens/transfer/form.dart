import 'package:bytebank/components/text_editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextEditor(
                controller: _accountNumberController,
                label: 'Account number',
                hint: '0000'),
            TextEditor(
                controller: _amountController,
                label: 'Amount',
                hint: '0.00',
                icon: Icons.monetization_on),
            RaisedButton(
              onPressed: () => _createTransfer(context),
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_accountNumberController.text);
    final double amount = double.tryParse(_amountController.text);

    if (accountNumber != null && amount != null) {
      final newTransfer = Transfer(amount, accountNumber);
      Navigator.pop(context, newTransfer);
    }
  }
}
