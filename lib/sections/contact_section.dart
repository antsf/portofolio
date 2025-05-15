// import 'package:flutter/material.dart';

// class ContactSection extends StatefulWidget {
//   const ContactSection({super.key});

//   @override
//   State<ContactSection> createState() => _ContactSectionState();
// }

// class _ContactSectionState extends State<ContactSection> {
//   final _formKey = GlobalKey<FormState>();
//   late TextEditingController _nameController;
//   late TextEditingController _emailController;
//   late TextEditingController _messageController;

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController();
//     _emailController = TextEditingController();
//     _messageController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _messageController.dispose();
//     super.dispose();
//   }

//   void _submitForm() {
//     if (_formKey.currentState?.validate() == true) {
//       // Simulate sending message
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Message sent successfully!")),
//       );
//       _formKey.currentState?.reset();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isMobile = MediaQuery.of(context).size.width < 600;

//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
//       color: Colors.white,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (!isMobile)
//             const Expanded(
//               flex: 1,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Let's Work Together",
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                       fontFamily: 'Poppins',
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     "Have a project or idea you'd like to discuss? Fill out the form and I'll get back to you as soon as possible.",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.black87,
//                       fontFamily: 'Poppins',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           const SizedBox(width: 40),
//           Expanded(
//             flex: 2,
//             child: Card(
//               elevation: 0,
//               shape: RoundedRectangleBorder(
//                 side: const BorderSide(color: Colors.black, width: 2),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               color: Colors.white,
//               child: Padding(
//                 padding: const EdgeInsets.all(30),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Send Me a Message",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontFamily: 'Poppins',
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       _buildInputField("Your Name", _nameController),
//                       const SizedBox(height: 15),
//                       _buildInputField("Your Email", _emailController),
//                       const SizedBox(height: 15),
//                       _buildMultiLineInput("Your Message", _messageController),
//                       const SizedBox(height: 25),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: ElevatedButton(
//                           onPressed: _submitForm,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.black,
//                             foregroundColor: Colors.white,
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 30, vertical: 15),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               side: const BorderSide(
//                                   color: Colors.black, width: 2),
//                             ),
//                             textStyle: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           child: const Text("Send Message"),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildInputField(String label, TextEditingController controller) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(
//           fontFamily: 'Poppins',
//           color: Colors.black,
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.black, width: 2),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.black, width: 2),
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter some text';
//         }
//         return null;
//       },
//     );
//   }

//   Widget _buildMultiLineInput(String label, TextEditingController controller) {
//     return TextFormField(
//       controller: controller,
//       maxLines: 5,
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(
//           fontFamily: 'Poppins',
//           color: Colors.black,
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.black, width: 2),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.black, width: 2),
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter your message';
//         }
//         return null;
//       },
//     );
//   }
// }
