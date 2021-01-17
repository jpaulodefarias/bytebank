import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

import 'package:bytebank/screens/transfer/form.dart';

class TransferList extends StatefulWidget {
  final List<Transfer> _transfers = [];

  @override
  State<StatefulWidget> createState() {
    return TransferListState();
  }
}

class TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfers'),
      ),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          final item = widget._transfers[index];
          return TransferItem(item);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTransfer = await Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
          }));
          _update(newTransfer);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _update(Transfer newTransfer) {
    if (newTransfer != null) {
      setState(() {
        widget._transfers.add(newTransfer);
      });
    }
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.amount.toString()),
        subtitle: Text(_transfer.accountNumber.toString()),
      ),
    );
  }
}
