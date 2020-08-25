import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectDate;

  void submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectDate == null) {
      return;
    }
    widget.addNewTransaction(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        _selectDate = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(_selectDate == null ? 'No date chodsen' : 'Picked Date : ' + DateFormat.yMMMEd().format(_selectDate)),
                ),
                FlatButton(
                  onPressed: _presentDatePicker,
                  child: Text('choose date', style: TextStyle(fontWeight: FontWeight.bold)),
                  textColor: Theme.of(context).primaryColor,
                )
              ],
            ),
            RaisedButton(
              onPressed: submitData,
              child: Text('Add Transaction'),
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
