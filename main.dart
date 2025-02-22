import 'package:flutter/material.dart';
import 'join_class_form.dart';
import 'footer.dart';
import 'package:flutter_application_2/choreographer_section.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(NrutyachiRanginiApp());
}

class NrutyachiRanginiApp extends StatelessWidget {
  const NrutyachiRanginiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nrutyachi Rangini',
      theme: ThemeData(
        primaryColor: Colors.red.shade900,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

// ✅ Ensure this file exists in the lib directory

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ChoreographersPage(), // Change this line
    AboutSection(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text(
          'Nrutyachi Rangini',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookTrialForm()),
              );
            },
            child: Text(
              'Book a Trial',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          SizedBox(width: 10),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JoinClassForm()),
              );
            },
            child: Text(
              'Join Class',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Footer(), // ✅ This adds your footer widget
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Choreographers',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber,
            onTap: _onItemTapped,
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Full-width Image
                Container(
                  width: double.infinity, // Adjust width as needed
                  height: 350, // Adjust height as needed
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/bharatanatyam.jpg"),
                      fit: BoxFit.cover, // Ensures the image fits well
                    ),
                  ),
                ),

                // Positioned Transparent Button at Bottom Right
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ), // Black border
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    onPressed: () {
                      // Show more info or navigate to another page
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: Text("More About Nrutyachi Rangini"),
                              content: Text(
                                "Founded in 2018, Nrutyachi Rangini has been a hub for passionate dancers, where tradition meets creativity. Over the years, we have trained countless students, helping them master the art of Bharatanatyam, Kathak, and Western dance. Our expert choreographers and dedicated team work closely with every student, ensuring they receive personalized attention and professional guidance.Located in the heart of Parel, our dance studio is designed to provide the best learning experience. With a fully air-conditioned space, a high-quality sound system, and a welcoming atmosphere, students feel comfortable and inspired to express themselves. We understand that everyone has a different schedule, so we offer flexible class timings to suit students of all ages.At Nrutyachi Rangini, we believe dance is more than just movement—it’s therapy, fitness, and joy. That’s why we also offer Zumba and Dance Therapy sessions every Sunday, along with Yoga classes every Saturday, open to all age groups. Whether you're looking to learn, stay fit, or simply enjoy the art of dance, our studio welcomes you with open arms.Join us and become part of a dance family where passion, creativity, and tradition come alive! ",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("Close"),
                                ),
                              ],
                            ),
                      );
                    },
                    child: Text(
                      "Learn More",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30), // Leaves space for scrolling
            _buildMainContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            "Welcome to Nrutyachi Rangini!",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "We offer Bharatanatyam, Western, and Kathak dance classes for all ages. Join us to explore the beauty of dance.",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildColoredContainer(
              context,
              "Our Journey",
              Colors.purple,
              "Founded in 2018, Nrutyachi Rangini is an institute with the intention of spreading the beauty of Indian classical dance. With years of experience, it continues its journey of imparting the knowledge of Bharatanatyam, nurturing students with discipline, grace, and artistry. Established by Shruti, the academy was started to bring balance to everyone's life through the power of dance. Over the years, the institute has faced its share of ups and downs, but with dedication and passion, it has grown into a renowned dance academy. Today, Nrutyachi Rangini is well-known for teaching three major dance forms – Bharatanatyam, Kathak, and Western dance. With a commitment to excellence and an ever-expanding dance family, the institute continues to inspire, teach, and spread the love for dance to students of all ages.",
            ),
            SizedBox(height: 10),
            _buildColoredContainer(
              context,
              "Our Achievements",
              Colors.pink.shade400,
              "At Nrutyachi Rangini, excellence in dance is our pride. Our founder and lead choreographer, Shruti, holds certifications in Bharatanatyam, Kathak, and Western dance, along with a prestigious Gold Medal in Bharatanatyam. Her dedication and expertise have shaped countless students into skilled dancers. Our students have also made us proud by winning state-level dance competitions, earning medals in dance exams, and showcasing their talent in school performances. Their hard work and passion for dance have brought numerous awards and recognitions to our academy. Adding to our success, Nrutyachi Rangini has been honored with the Best Dance Academy award by the esteemed Dr. Natraj Sir, a testament to our commitment to nurturing talent and promoting the art of dance.",
            ),
            SizedBox(height: 10),
            _buildColoredContainer(
              context,
              "Upcoming Events",
              Colors.pink.shade200,
              "At Nrutyachi Rangini, we believe in providing our students with opportunities to showcase their talent and hard work. Every year, we conduct an Annual Dance Day for our academy, where each student gets a chance to perform on stage. This grand event allows them to showcase their skills in Bharatanatyam, Kathak, and Western dance styles. This year, our Annual Dance Day will be held on 29th March, promising a spectacular evening of graceful performances. Additionally, for students pursuing Bharatanatyam and Kathak certifications, we have upcoming dance exams scheduled for 25th April. These exams serve as a significant milestone in their journey, helping them earn official recognition for their progress and expertise. We encourage all students to actively participate and make the most of these opportunities to learn, perform, and grow in their dance journey!",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColoredContainer(
    BuildContext context,
    String title,
    Color color,
    String content,
  ) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Text(title),
                content: Text(content),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Close"),
                  ),
                ],
              ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class BookTrialForm extends StatefulWidget {
  const BookTrialForm({super.key});

  @override
  _BookTrialFormState createState() => _BookTrialFormState();
}

class _BookTrialFormState extends State<BookTrialForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book a Trial')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null ||
                      value.length != 10 ||
                      !RegExp(r'^[0-9]{10}\$').hasMatch(value)) {
                    return 'Please enter a valid 10-digit phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDate = pickedDate;
                    });
                  }
                },
                child: Text(
                  _selectedDate == null
                      ? 'Choose Date'
                      : 'Selected: ${_selectedDate!.toLocal()}'.split(' ')[0],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      _selectedDate != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Successfully submitted! You will receive a call from +91-9876543210.',
                        ),
                        duration: Duration(seconds: 3),
                      ),
                    );
                    _formKey.currentState!.reset();
                    setState(() {
                      _selectedDate = null;
                    });
                  } else if (_selectedDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select a date')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
