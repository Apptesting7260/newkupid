// import
 
// 'package:flutter/material.dart';
// import
 
// 'package:flutter_stripe/flutter_stripe.dart';
// import
 
// 'package:shared_preferences/shared_preferences.dart';
// // ... import other packages, e.g., for notifications

// // ... other imports

// class
 
// SubscriptionScreen
 
// extends
 
// StatefulWidget
 
// {
//   const SubscriptionScreen({Key? key}) : super(key: key);

//   @override
//   State<SubscriptionScreen> createState() => _SubscriptionScreenState();
// }

// class
 
// _SubscriptionScreenState
 
// extends
 
// State<SubscriptionScreen> {
//   String _selectedDateRadioValue = ''; // Example for radio button selection

//   @override
//   void initState() {
//     super.initState();
//       Stripe.publishableKey = DotEnv.env['STRIPE_PUB_KEY'] ?? '';
//     Stripe.instance.initPaymentSheet(
//       paymentSheetParameters: SetupPaymentSheetParameters(
//         // ... your Stripe configuration
//       ),
//     );
//   }

//   // ... other state variables

//   Future<void> handleLaterPayment() async {
//     try {
//       // 1. Get user's selected payment date
//       DateTime selectedDate = getUserSelectedDate();

//       // 2. Create payment intent
//       // final paymentIntent = await PaymentIntent.
//       // create(
//       //   amount: 1000, // Replace with actual amount
//       //   currency: 'usd', // Replace with actual currency
//       //   paymentMethodTypes: ['later'],
//       //   payment_date: DateTime(selectedDate.year, selectedDate.month + 1, 16),
//       // );
//    final paymentIntent = await Stripe.instance.confirmPayment(
//      paymentIntentClientSecret: 'sk_test_51NGH7HHSfA8m4lcmcXNJNDkF8vFhWN8QmaXUisCnnMePnXy80gdve8WlHg93DybPXU3smqbHUJHWjphIfKyLyFiw00i4BqMyXW',
//       // PaymentIntent(
//       //   amount: 1000, // Replace with actual amount
//       //   currency: 'usd', // Replace with actual currency
//       //   paymentMethodTypes: ['later'],
//       //   payment_date: DateTime(selectedDate.year, selectedDate.month + 1, 16),
//       // ),
//     );
//       // 3. Store payment intent details for later charging
//       await storePaymentIntent(paymentIntent.id);

//       // 4. (Optional) Send reminders based on payment date
//       scheduleReminders(selectedDate);

//       // 5. Display success message to user
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Later payment scheduled successfully!')),
//       );
//     } catch (error) {
//       // Handle errors gracefully
//       print('Error creating payment intent: $error');
//       // Display an error message to the user
//     }
//   }

//   DateTime getUserSelectedDate() {
//     return _selectedDateRadioValue == '15thNextMonth'
//         ? DateTime(DateTime.now().year, DateTime.now().month + 1, 15)
//         : // Handle other date options or errors
//           DateTime.now(); // Default to current date if no valid selection
//   }

//   Future<void> storePaymentIntent(String paymentIntentId) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('paymentIntentId', paymentIntentId);
//   }

//   Future<void> scheduleReminders(DateTime paymentDate) async {
//     // ... create and schedule notifications or emails based on paymentDate
//   }

//   // ... other methods

//   @override
//   Widget build(BuildContext context) {
//     // ... build UI, including payment date selection and confirmation button

//     return ElevatedButton(
//       onPressed: handleLaterPayment,
//       child: const Text('Pay Later'),
//     );
//   }
// }import 'dart:convert';

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;

// class PaymentScreen extends StatefulWidget {
//   const PaymentScreen({Key? key}) : super(key: key);

//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stripe Example'),
//       ),
//       body: Center(
//         child: Container(
//           child: ElevatedButton(
//             onPressed: () {
//               saveCardAndSubscribe();
//             },
//             child: Text('Subscribe'),
//           ),
//         ),
//       ),
//     );
//   }

//   void _init() {
//     Stripe.publishableKey = 'pk_test_51NGH7HHSfA8m4lcm64SZwdqG7Y0ErANM2i86sWRTTft0rI4vOZ74EPq8sRCFro2a3BteJHjzKURpdGsaO7xvdj6e00nGvpZevV'; // Replace with your Stripe publishable key
//   }

//   final client = http.Client();

//   static Map<String, String> headers = {
//     'Authorization': 'Bearer sk_test_51NGH7HHSfA8m4lcmcXNJNDkF8vFhWN8QmaXUisCnnMePnXy80gdve8WlHg93DybPXU3smqbHUJHWjphIfKyLyFiw00i4BqMyXW', // Replace with your Stripe secret key
//     'Content-Type': 'application/x-www-form-urlencoded'
//   };

//   Future<Map<String, dynamic>> _createCustomer() async {
//     final String url = 'https://api.stripe.com/v1/customers';
//     var response = await client.post(
//       Uri.parse(url),
//       headers: headers,
//       body: {
//         'description': 'new customer',
//       },
//     );
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       print(json.decode(response.body));
//       throw 'Failed to register as a customer.';
//     }
//   }

//   Future<Map<String, dynamic>> _createPaymentIntents() async {
//     final String url = 'https://api.stripe.com/v1/payment_intents';

//     Map<String, dynamic> body = {
//       'amount': '2000',
//       'currency': 'usd',
//       'payment_method_types[]': 'card'
//     };

//     var response = await client.post(Uri.parse(url), headers: headers, body: body);
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       print(json.decode(response.body));
//       throw 'Failed to create PaymentIntents.';
//     }
//   }
// Future<Map<String, dynamic>> _createPaymentMethod({
//   required String number,
//   required String expMonth,
//   required String expYear,
//   required String cvc,
// }) async {
//   final String url = 'https://api.stripe.com/v1/payment_methods';
//   var response = await client.post(
//     Uri.parse(url),
//     headers: headers,
//     body: {
//       'type': 'card',
//       'card[number]': '$number',
//       'card[exp_month]': '$expMonth',
//       'card[exp_year]': '20$expYear', // Assuming the year is in the format '23'
//       'card[cvc]': '$cvc',
//     },
//   );
//   print('Response status: ${response.statusCode}');
//   print('Response body: ${response.body}');
  
//   if (response.statusCode == 200) {
//     return json.decode(response.body);
//   } else {
//     print('Failed to create PaymentMethod. Check card details.');
//     throw 'Failed to create PaymentMethod.';
//   }
// }


//   Future<Map<String, dynamic>> _attachPaymentMethod(String paymentMethodId, String customerId) async {
//     final String url = 'https://api.stripe.com/v1/payment_methods/$paymentMethodId/attach';
//     var response = await client.post(
//       Uri.parse(url),
//       headers: headers,
//       body: {
//         'customer': customerId,
//       },
//     );
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       print(json.decode(response.body));
//       throw 'Failed to attach PaymentMethod.';
//     }
//   }

//   Future<Map<String, dynamic>> _updateCustomer(String paymentMethodId, String customerId) async {
//     final String url = 'https://api.stripe.com/v1/customers/$customerId';

//     var response = await client.post(
//       Uri.parse(url),
//       headers: headers,
//       body: {
//         'invoice_settings[default_payment_method]': paymentMethodId,
//       },
//     );
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       print(json.decode(response.body));
//       throw 'Failed to update Customer.';
//     }
//   }

//   Future<Map<String, dynamic>> _createSubscription(String customerId) async {
//     final String url = 'https://api.stripe.com/v1/subscriptions';

//     Map<String, dynamic> body = {
//       'customer': customerId,
//       'items[0][price]': 'price_id', // Replace with your price ID
//     };

//     var response = await client.post(Uri.parse(url), headers: headers, body: body);
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       print(json.decode(response.body));
//       throw 'Failed to register as a subscriber.';
//     }
//   }

//   Future<void> saveCardAndSubscribe() async {
//     _init();
//     final customer = await _createCustomer();
//     final paymentMethod = await _createPaymentMethod(
//       number: '4242424242424242',
//       expMonth: '03',
//       expYear: '23',
//       cvc: '123',
//     );
//     await _attachPaymentMethod(paymentMethod['id'], customer['id']);
//     await _updateCustomer(paymentMethod['id'], customer['id']);
//     await _createSubscription(customer['id']);
//   }
// // }
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// String ?customerid;
// class PaymentScreen extends StatefulWidget {
//   const PaymentScreen({Key? key}) : super(key: key);

//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stripe Example'),
//       ),
//       body: Center(
//         child: Container(
//           child: ElevatedButton(
//             onPressed: () {
//               saveCardAndSubscribe();
//             },
//             child: Text('Subscribe'),
//           ),
//         ),
//       ),
//     );
//   }

//   void _init() {
//     Stripe.publishableKey = 'pk_test_51NGH7HHSfA8m4lcm64SZwdqG7Y0ErANM2i86sWRTTft0rI4vOZ74EPq8sRCFro2a3BteJHjzKURpdGsaO7xvdj6e00nGvpZevV'; // Replace with your Stripe publishable key
//   }

//   // Future<void> _initiateCardInput() async {
//   //   _init();

//   //   try {
//   //     await Stripe.instance.initPaymentSheet(
//   //       paymentSheetParameters: SetupPaymentSheetParameters(
//   //         paymentIntentClientSecret: 'your_payment_intent_client_secret',
//   //       ),
//   //     );

//   //     await Stripe.instance.presentPaymentSheet();
//   //   } catch (e) {
//   //     print('Error initializing or presenting payment sheet: $e');
//   //   }
//   // }
// Future<void> _initiateCardInput() async {
//   _init();
// _createCustomer();
//   // try {
//   //   // Dynamically generate the client secret (replace with your actual logic)
//   //   final clientSecret = await _generatePaymentIntentClientSecret();

//   //   await Stripe.instance.initPaymentSheet(
//   //     paymentSheetParameters: SetupPaymentSheetParameters(
//   //       paymentIntentClientSecret: clientSecret,
//   //     ),
//   //   );

//   //   await Stripe.instance.presentPaymentSheet();
//   // } catch (e) {
//   //   print('Error initializing or presenting payment sheet: $e');
//   // }
// }

// Future<String> _generatePaymentIntentClientSecret() async {
//   // // Your logic to obtain or create a PaymentIntent and get its client secret
//   // // Replace this with your actual logic to get the PaymentIntent client secret
//   // final response = await http.post(
//   //   Uri.parse('https://your-backend-endpoint.com/create_payment_intent'),
//   //   // Add necessary headers and body parameters
//   // );

//   // if (response.statusCode == 200) {
//   //   final jsonResponse = json.decode(response.body);
//   //   final clientSecret = jsonResponse['client_secret'];
//   //   return clientSecret;
//   // } else {
//   //   throw 'Failed to generate PaymentIntent client secret.';
//   // }

//   var headers = {
//   'Content-Type': 'application/x-www-form-urlencoded',
//   'Authorization': 'Bearer sk_test_51NGH7HHSfA8m4lcmcXNJNDkF8vFhWN8QmaXUisCnnMePnXy80gdve8WlHg93DybPXU3smqbHUJHWjphIfKyLyFiw00i4BqMyXW'
// };
// var request = http.Request('POST', Uri.parse('https://api.stripe.com/v1/setup_intents'));
// request.bodyFields = {
//   'payment_method_types[]': 'card',
//   'customer': customerid.toString()
// };
// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }
// return response.stream.bytesToString();
// }

//   Future<Map<String, dynamic>> _createCustomer() async {
//     // Your existing code for creating a customer
//     final String url = 'https://api.stripe.com/v1/customers';
//     var response = await http.post(
//       Uri.parse(url),
//       headers: _headers,
//       body: {
//         'description': 'seeker03',
//       },
//     );
//     if (response.statusCode == 200) {
//       print(json.decode(response.body));
//       var result=json.decode(response.body);
//   customerid=result["id"];
//       return json.decode(response.body);
//     } else {
//       print(json.decode(response.body));
//       throw 'Failed to register as a customer.';
//     }
//   }

//   // Remove the unused function declaration
//   // Future<Map<String, dynamic>> _createPaymentIntents() {
//   //   // Your existing code for creating PaymentIntents
//   // }

//   Future<Map<String, dynamic>> _createPaymentMethod({
//     required String number,
//     required String expMonth,
//     required String expYear,
//     required String cvc,
//   }) async {
//     // Your existing code for creating PaymentMethod
//     final String url = 'https://api.stripe.com/v1/payment_methods';
//     var response = await http.post(
//       Uri.parse(url),
//       headers: _headers,
//       body: {
//         'type': 'card',
//         'card[number]': '$number',
//         'card[exp_month]': '$expMonth',
//         'card[exp_year]': '20$expYear',
//         'card[cvc]': '$cvc',
//       },
//     );
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       print(json.decode(response.body));
//       throw 'Failed to create PaymentMethod.';
//     }
//   }

//   Future<Map<String, dynamic>> _attachPaymentMethod(String paymentMethodId, String customerId) async {
//     // Your existing code for attaching PaymentMethod
//     final String url = 'https://api.stripe.com/v1/payment_methods/$paymentMethodId/attach';
//     var response = await http.post(
//       Uri.parse(url),
//       headers: _headers,
//       body: {
//         'customer': customerId,
//       },
//     );
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       print(json.decode(response.body));
//       throw 'Failed to attach PaymentMethod.';
//     }
//   }

//   Future<Map<String, dynamic>> _updateCustomer(String paymentMethodId, String customerId) async {
//     // Your existing code for updating Customer
//     final String url = 'https://api.stripe.com/v1/customers/$customerId';

//     var response = await http.post(
//       Uri.parse(url),
//       headers: _headers,
//       body: {
//         'invoice_settings[default_payment_method]': paymentMethodId,
//       },
//     );
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       print(json.decode(response.body));
//       throw 'Failed to update Customer.';
//     }
//   }

//   Future<Map<String, dynamic>> _createSubscription(String customerId) async {
//     // Your existing code for creating Subscription
//     final String url = 'https://api.stripe.com/v1/subscriptions';

//     var response = await http.post(
//       Uri.parse(url),
//       headers: _headers,
//       body: {
//         'customer': customerId,
//         'items[0][price]': 'price_id',
//       },
//     );
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       print(json.decode(response.body));
//       throw 'Failed to register as a subscriber.';
//     }
//   }

//   Future<void> saveCardAndSubscribe() async {
//   _init();

//   // 1. Initialize Stripe
//   await _initiateCardInput();

//   // 2. Create a Customer
//   final customer = await _createCustomer();

//   // 3. Generate PaymentIntent Client Secret
//   final clientSecret = await _generatePaymentIntentClientSecret();

//   // 4. Create a PaymentMethod
//   final paymentMethod = await _createPaymentMethod(
//     number: '4242424242424242',
//     expMonth: '03',
//     expYear: '23',
//     cvc: '123',
//   );

//   // 5. Attach PaymentMethod to Customer
//   await _attachPaymentMethod(paymentMethod['id'], customer['id']);

//   // 6. Update Customer with Default PaymentMethod
//   await _updateCustomer(paymentMethod['id'], customer['id']);

//   // 7. Create a Subscription
//   await _createSubscription(customer['id']);
// }


  // static Map<String, String> get _headers => {
  //       'Authorization': 'Bearer sk_test_51NGH7HHSfA8m4lcmcXNJNDkF8vFhWN8QmaXUisCnnMePnXy80gdve8WlHg93DybPXU3smqbHUJHWjphIfKyLyFiw00i4BqMyXW',
  //       'Content-Type': 'application/x-www-form-urlencoded',
  //     };
// }


// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;

// String? customerid;

// class PaymentScreen extends StatefulWidget {
//   const PaymentScreen({Key? key}) : super(key: key);

//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stripe Example'),
//       ),
//       body: Center(
//         child: Container(
//           child: ElevatedButton(
//             onPressed: () {
//               saveCardAndSubscribe();
//             },
//             child: Text('Subscribe'),
//           ),
//         ),
//       ),
//     );
//   }

//   void _init() {
//     Stripe.publishableKey =
//         'pk_test_51NI6ZYEylqsUsFCd5W96DkBY2H13EZxW6I2XGLhMdEvfnHvahK5XCtmLxQyKOrK3zhMYMMqkL33jXCjt1M8GYNDl00NpIMNttL';
//   }

//   Future<void> _initiateCardInput() async {
//     _init();
//     _createCustomer();
//   }

//   Future<String> _generatePaymentIntentClientSecret() async {
//   var headers = {
//     'Content-Type': 'application/x-www-form-urlencoded',
//     'Authorization':
//         'Bearer sk_test_51NGH7HHSfA8m4lcmcXNJNDkF8vFhWN8QmaXUisCnnMePnXy80gdve8WlHg93DybPXU3smqbHUJHWjphIfKyLyFiw00i4BqMyXW'
//   };
//   var request =
//       http.Request('POST', Uri.parse('https://api.stripe.com/v1/setup_intents'));
//   request.bodyFields = {
//     'payment_method_types[]': 'card',
//     'customer': customerid.toString()
//   };
//   request.headers.addAll(headers);

//   http.StreamedResponse response = await request.send();

//   if (response.statusCode == 200) {
//     final responseBody = await response.stream.bytesToString();
//     print(responseBody);
//     return responseBody;
//   } else {
//     print(response.reasonPhrase);
//     throw 'Failed to generate PaymentIntent client secret.';
//   }
// }
//   Future<Map<String, dynamic>> _createCustomer() async {
//     final String url = 'https://api.stripe.com/v1/customers';
//     var response = await http.post(
//       Uri.parse(url),
//       headers: _headers,
//       body: {
//         'description': 'masoom01',
//       },
//     );
//     if (response.statusCode == 200) {
//       print(json.decode(response.body));
//       var result = json.decode(response.body);
//       customerid = result["id"];
//       return json.decode(response.body);
//     } else {
//       print(json.decode(response.body));
//       throw 'Failed to register as a customer.';
//     }
//   }

//   Future<Map<String, dynamic>> _createPaymentMethod({
//     required String number,
//     required String expMonth,
//     required String expYear,
//     required String cvc,
//   }) async {
//     final String url = 'https://api.stripe.com/v1/payment_methods';
//     var response = await http.post(
//       Uri.parse(url),
//       headers: _headers,
//       body: {
//         'type': 'card',
//         'card[number]': '$number',
//         'card[exp_month]': '$expMonth',
//         'card[exp_year]': '20$expYear',
//         'card[cvc]': '$cvc',
//       },
//     );
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       print(json.decode(response.body));
//       throw 'Failed to create PaymentMethod.';
//     }
//   }

//   Future<Map<String, dynamic>> _attachPaymentMethod(
//       String paymentMethodId, String customerId) async {
//     final String url =
//         'https://api.stripe.com/v1/payment_methods/$paymentMethodId/attach';
//     var response = await http.post(
//       Uri.parse(url),
//       headers: _headers,
//       body: {
//         'customer': customerId,
//       },
//     );
//     if (response.statusCode == 200) {
//       print(json.decode(response.body));
//       print("done done done done");
//       return json.decode(response.body);
//     } else {
//       print(json.decode(response.body));
//       throw 'Failed to attach PaymentMethod.';
//     }
//   }

//   Future<Map<String, dynamic>> _updateCustomer(
//       String paymentMethodId, String customerId) async {
//     final String url = 'https://api.stripe.com/v1/customers/$customerId';

//     var response = await http.post(
//       Uri.parse(url),
//       headers: _headers,
//       body: {
//         'invoice_settings[default_payment_method]': paymentMethodId,
//       },
//     );
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       print(json.decode(response.body));
//       throw 'Failed to update Customer.';
//     }
//   }

//  Future<Map<String, dynamic>> _createSubscription(String customerId) async {
//   final String url = 'https://api.stripe.com/v1/subscriptions';

//   var response = await http.post(
//     Uri.parse(url),
//     headers: _headers,
//     body: {
//       'customer': customerId,
//       'items[0][price]': 'price_1OWuNxHSfA8m4lcm2nrLWwUJ', // Replace with the actual price ID
//     },
//   );

//   if (response.statusCode == 200) {
//     return json.decode(response.body);
//   } else {
//     print(json.decode(response.body));
//     throw 'Failed to register as a subscriber.';
//   }
// }

//   Future<void> saveCardAndSubscribe() async {
//     _init();
//     await _initiateCardInput();
//     final customer = await _createCustomer();
//     final clientSecret = await _generatePaymentIntentClientSecret();
//     final paymentMethod = await _createPaymentMethod(
//       number: '4242424242424242',
//       expMonth: '03',
//       expYear: '24',
//       cvc: '123',
//     );
//     await _attachPaymentMethod(paymentMethod['id'], customer['id']);
//     await _updateCustomer(paymentMethod['id'], customer['id']);
//     await _createSubscription(customer['id']);
//   }

//   static Map<String, String> get _headers => {
//         'Authorization':
//             'Bearer sk_test_51NI6ZYEylqsUsFCdVNKyKZHSY8ACkpg1pd8ZOcx27doQyvaoEIOiNE2sDqYjtKlkmthqHsuCHZlxwyKN9YJrmEJs00X0d0CuCI',
//         'Content-Type': 'application/x-www-form-urlencoded',
//       };
// }

// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:flutter_stripe/flutter_stripe.dart';

// // class PaymentScreen extends StatefulWidget {
// //   const PaymentScreen({Key? key}) : super(key: key);

// //   @override
// //   State<PaymentScreen> createState() => _PaymentScreenState();
// // }

// // class _PaymentScreenState extends State<PaymentScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Stripe Example'),
// //       ),
// //       body: Center(
// //         child: Container(
// //           child: ElevatedButton(
// //             onPressed: () {
// //               _initiateCardInput();
// //             },
// //             child: Text('Save Card'),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   void _init() {
// //     Stripe.publishableKey =
// //         'pk_test_51NGH7HHSfA8m4lcm64SZwdqG7Y0ErANM2i86sWRTTft0rI4vOZ74EPq8sRCFro2a3BteJHjzKURpdGsaO7xvdj6e00nGvpZevV';
// //   }

// //   Future<void> _initiateCardInput() async {
// //     _init();

// //     try {
// //       // Initialize Stripe
// //       await Stripe.instance!.initPaymentSheet();

// //       // Present the payment sheet to save the card
// //       await Stripe.instance.presentPaymentSheet();

// //       // After the user interacts with the Payment Sheet, you can retrieve the Payment Method ID
// //       String paymentMethodId = await Stripe.instance.retrievePaymentSheetResult();

// //       // Now you can send this paymentMethodId to your server for further processing
// //       _sendPaymentMethodIdToServer(paymentMethodId);
// //     } catch (e) {
// //       print('Error initializing or presenting payment sheet: $e');
// //     }
// //   }

// //   void _sendPaymentMethodIdToServer(String paymentMethodId) {
// //     // Here, you would send the paymentMethodId to your server for further processing
// //     // On the server side, you would use this paymentMethodId to create a Customer or save the card
// //     print('Payment Method ID: $paymentMethodId');
// //     // Send the paymentMethodId to your server using your preferred networking method
// //   }
// // }

// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:flutter_stripe/flutter_stripe.dart';

// // class PaymentScreen extends StatefulWidget {
// //   const PaymentScreen({Key? key}) : super(key: key);

// //   @override
// //   State<PaymentScreen> createState() => _PaymentScreenState();
// // }

// // class _PaymentScreenState extends State<PaymentScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Stripe Example'),
// //       ),
// //       body: Center(
// //         child: Container(
// //           child: ElevatedButton(
// //             onPressed: () {
// //               _initiateCardInput();
// //             },
// //             child: Text('Subscribe'),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   void _init() {
// //     Stripe.publishableKey =
// //         'pk_test_51NGH7HHSfA8m4lcm64SZwdqG7Y0ErANM2i86sWRTTft0rI4vOZ74EPq8sRCFro2a3BteJHjzKURpdGsaO7xvdj6e00nGvpZevV';
// //   }

// //   Future<void> _initiateCardInput() async {
// //     _init();

// //     try {
// //       // Use your test client secret directly (not recommended for production)
// //       String testClientSecret = 'sk_test_51NGH7HHSfA8m4lcmcXNJNDkF8vFhWN8QmaXUisCnnMePnXy80gdve8WlHg93DybPXU3smqbHUJHWjphIfKyLyFiw00i4BqMyXW';

// //       await Stripe.instance.initPaymentSheet(
// //         paymentSheetParameters: SetupPaymentSheetParameters(
// //           paymentIntentClientSecret: testClientSecret,
// //         ),
// //       );

// //       await Stripe.instance.presentPaymentSheet();
// //     } catch (e) {
// //       print('Error initializing or presenting payment sheet: $e');
// //     }
// //   }
// // }
