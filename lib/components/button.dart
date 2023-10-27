import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(color: Color.fromARGB(255, 126, 85, 82), borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
    
            const SizedBox(width: 10,),
            // icon
            const Icon(Icons.arrow_forward, color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
