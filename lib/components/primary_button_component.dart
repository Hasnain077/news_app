import 'package:flutter/material.dart';
class PrimaryButtonComponent extends StatelessWidget {
final String? primaryText;
final Function()? onPrimaryClick;
final Color? color;
  const PrimaryButtonComponent({Key? key, this.color, this.onPrimaryClick, this.primaryText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
     onPressed: onPrimaryClick,
      style: ElevatedButton.styleFrom(
        backgroundColor: color?? Colors.deepOrange.shade500,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        )
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(primaryText?? 'NA'),
        ),
      ),

    );
  }
}
