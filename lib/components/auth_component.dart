import 'package:flutter/material.dart';
import 'package:news_app/components/primary_button_component.dart';
import 'package:news_app/components/text_component.dart';

class AuthComponent extends StatelessWidget {
  final String? secondaryText;
  final String? lintText;
  final Function()? onLinkTextClick;
  final String? primaryText;
  final Function()? onPrimaryClick;
  final String? orText;
  final Color? primaryButtonColor;

  const AuthComponent(
      {Key? key,
      this.secondaryText,
      this.primaryText,
      this.onPrimaryClick,
      this.lintText,
      this.onLinkTextClick,
      this.orText,
      this.primaryButtonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButtonComponent(
          onPrimaryClick: onPrimaryClick,
          primaryText: primaryText,
          color: primaryButtonColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
          child: Text(
            orText ?? 'OR',
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Facebook',
                        style: TextStyle(fontFamily: 'fb', fontSize: 18),
                      ),
                    ),
                  )),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Twitter',
                    style: TextStyle(fontFamily: 'twitter',fontSize: 18),
                  ),
                ),
              ),
            ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        TextComp(text: secondaryText ?? 'NA'),
        GestureDetector(
          onTap: onLinkTextClick,
          child: Align(
            child: Text( lintText ?? 'NA',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
            ),
          ),
        ),


      ],
    );
  }
}
