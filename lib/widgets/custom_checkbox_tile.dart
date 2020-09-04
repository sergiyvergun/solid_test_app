import 'package:flutter/material.dart';

class CustomCheckboxTile extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool) onChanged;
  final Color activeColor;

  const CustomCheckboxTile(
      {Key key,
      @required this.value,
      @required this.onChanged,
      @required this.activeColor,
      @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      padding: EdgeInsets.only(left: 30, right: 10, top: 5, bottom: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.blueGrey[700],
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 10),
          Checkbox(
            activeColor: activeColor,
            value: value,
            onChanged: (bool newValue) {
              onChanged(newValue);
            },
          ),
        ],
      ),
    );
  }
}
