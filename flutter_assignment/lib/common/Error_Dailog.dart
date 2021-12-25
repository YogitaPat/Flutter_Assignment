import 'package:flutter/material.dart';

// Error message
class ErrorDialog extends StatefulWidget {
  const ErrorDialog({this.message});
  final String? message;
  @override
  _ErrorDialogState createState() => _ErrorDialogState();
}

class _ErrorDialogState extends State<ErrorDialog> {
  @override
  Widget build(BuildContext context) {
    return _NewDialog(widget: widget);
  }
}

class _NewDialog extends StatelessWidget {
  const _NewDialog({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ErrorDialog widget;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 30,
              ),
              child: Text(
                widget.message.toString(),
                style: Theme.of(context).textTheme.button,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 0.5,
              height: 1,
              color: Theme.of(context).iconTheme.color,
            ),
            MaterialButton(
              height: 40,
              minWidth: double.infinity,
              onPressed: () {

                Navigator.of(context).pop();

              },
              child: Text(
                  "Ok",
                  style: TextStyle(color: Colors.black)
              ),
            )
          ],
        ));
  }
}




