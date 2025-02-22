import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      color: Colors.pink.shade50.withOpacity(0.7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Contact Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Contact Us:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 5),
              Text("+91 9876543210"),
              Text("Parel Bhoiwada, Damodar Hall"),
              Text("Near Parel Station - 400012"),
            ],
          ),
          // Social Media Icons
          Column(
            children: [
              Text(
                "Connect",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.envelope, color: Colors.red),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.blue),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.instagram,
                      color: Colors.purple,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          // Dance Class Name
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Nrutyachi Rangini",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.red.shade900,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
