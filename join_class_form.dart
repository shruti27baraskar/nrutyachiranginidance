import 'package:flutter/material.dart';

class JoinClassForm extends StatefulWidget {
  const JoinClassForm({super.key});

  @override
  _JoinClassFormState createState() => _JoinClassFormState();
}

class _JoinClassFormState extends State<JoinClassForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _guardianNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String? _selectedGender;
  String? _selectedDanceType;

  void _resetForm() {
    _formKey.currentState?.reset();
    _firstNameController.clear();
    _lastNameController.clear();
    _guardianNameController.clear();
    _ageController.clear();
    _phoneController.clear();
    setState(() {
      _selectedGender = null;
      _selectedDanceType = null;
      _selectedDate = null;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() &&
        _selectedDate != null &&
        _selectedGender != null &&
        _selectedDanceType != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '✅ Successfully submitted! You will receive a call soon.',
          ),
          duration: Duration(seconds: 3),
        ),
      );

      Future.delayed(Duration(seconds: 3), _resetForm);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('⚠️ Please fill all fields and select a date.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Join Dance Class')),
      backgroundColor: Colors.grey[300], // Light gray background
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextField(_firstNameController, 'First Name'),
                _buildTextField(_lastNameController, 'Last Name'),
                _buildTextField(_guardianNameController, 'Guardian Name'),
                _buildTextField(
                  _ageController,
                  'Age',
                  keyboardType: TextInputType.number,
                ),
                _buildDropdown('Gender', ['Male', 'Female', 'Other'], (value) {
                  setState(() => _selectedGender = value);
                }, _selectedGender),
                _buildDropdown(
                  'Dance Type',
                  ['Bharatanatyam', 'Western', 'Kathak'],
                  (value) {
                    setState(() => _selectedDanceType = value);
                  },
                  _selectedDanceType,
                ),
                _buildTextField(
                  _phoneController,
                  'Phone Number',
                  keyboardType: TextInputType.phone,
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
                      setState(() => _selectedDate = pickedDate);
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow, // Yellow Submit Button
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  ),
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          filled: true,
          fillColor:
              Colors.lightBlue[50], // Light blue background for input fields
        ),
        validator:
            (value) =>
                (value == null || value.isEmpty) ? 'Please enter $label' : null,
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    List<String> items,
    ValueChanged<String?> onChanged,
    String? selectedValue,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          filled: true,
          fillColor: Colors.lightBlue[50],
        ),
        items:
            items
                .map(
                  (String value) =>
                      DropdownMenuItem(value: value, child: Text(value)),
                )
                .toList(),
        onChanged: onChanged,
        validator: (value) => value == null ? 'Please select $label' : null,
      ),
    );
  }
}
