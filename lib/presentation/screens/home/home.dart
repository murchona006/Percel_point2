import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percel_point/data/remote/dashboard_api.dart';
import 'package:percel_point/presentation/controller/dashboard_controller.dart';
import 'package:percel_point/presentation/controller/internetchecker_controller.dart';
import 'package:percel_point/presentation/no_internet/internetchecker_view.dart';
import 'package:percel_point/presentation/screens/gb_widgets/data_loader.dart';
import 'package:percel_point/presentation/screens/gb_widgets/operation_card_row.dart';
import 'package:percel_point/presentation/screens/pickup%20request/pickup_popup.dart';
import 'package:percel_point/presentation/screens/resources/assets_manager.dart';
import 'package:percel_point/presentation/screens/resources/color_manager.dart';
import 'package:percel_point/presentation/screens/resources/string_manager.dart';
import 'package:percel_point/presentation/screens/resources/values_manager.dart';
import 'navigation.dart';
import 'package:http/http.dart' as http;

import '../resources/routes_manager.dart';

class HomeView extends GetView<DashboardController> {

   HomeView({super.key});

   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

   final TextEditingController _textController1 = TextEditingController();
   final TextEditingController _textController2 = TextEditingController();
   final TextEditingController _textController3 = TextEditingController();

   final TextEditingController _textController4 = TextEditingController();
   final TextEditingController _pickupAddressController = TextEditingController();
   final TextEditingController _noteController = TextEditingController();
   final TextEditingController _estimatedParcelController = TextEditingController();


   String? _selectedPaymentMethod; // Variable to store the selected payment method
   List<String> paymentTypes = ['Select Payment Type', 'Bkash', 'Rocket', 'Nagad', 'Bank'];



   Future<void> submitpaymethod(BuildContext context) async {
     // Define the data to be passed to the API
     final requestData = {
       'payment_method': _selectedPaymentMethod,
     };

     // Print the requestData before making the HTTP POST request
     print('Request Data: $requestData');

     // Make the HTTP POST request
     final response = await http.post(
       Uri.parse('https://system.parcelpointltd.com/api/payment-request'),
       headers: {
         'Accept': 'application/json',
         // 'Content-type': 'application/x-www-form-urlencoded',
         'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjczMWU0YzFkYzY4NDQ2ZTRjYWVmNjNiZmY5ZmYzN2I5ZjAxNWIxOTI2N2Q2MTMwNGE0MmFkMzExMGJkZjYyZDYyZGU5YjdhYzA4OWI4YjcxIn0.eyJhdWQiOiIxNCIsImp0aSI6IjczMWU0YzFkYzY4NDQ2ZTRjYWVmNjNiZmY5ZmYzN2I5ZjAxNWIxOTI2N2Q2MTMwNGE0MmFkMzExMGJkZjYyZDYyZGU5YjdhYzA4OWI4YjcxIiwiaWF0IjoxNzA4NzQ0OTk1LCJuYmYiOjE3MDg3NDQ5OTUsImV4cCI6MTc0MDM2NzM5NSwic3ViIjoiNzcwIiwic2NvcGVzIjpbXX0.ZmmMgixvMzkq9z7CdhMJtRyPrrR16hgs4mnoJIEcXtguecHBOLRBHyZI2lqOA4Uo_2niRfXoiD71bqwtXvOctZM1RVGvGQIWtmOx_Ei2hIVuuwULyLfHCdmlhN1L2FLq4effENXw1SiP45dH7vzFvXPsOdI4k98N0ZyH3bYfm7K2aupFG67n2avDisEtTqfIF6V6GkgkGbyjigwsZpyHRUFBDBobbz60VKo9KixgzFevAyUli0sKgntOWWi_1eRJht9KldVvfigI7gSSilqONR258bZj-MsfOlDS6pnXZcmNTDOdPjInDNQhprsZeiz4ALpdp0fxGGg2ogVlAhEBX5B9rrPTzbMWy3A6dUDe45Fx7U2XqGG_mVbqTG7eAEJvLdH3TubMilojCwWh_t00QSLD7trQFWk1tRwSI3GW-LU3Km4yur7qyxGTSlYT-ZC0F3Brt8Ye0dMIYaWizofxukf0pEJiobsnIpPSyd83Nf1WPw3Hpz5bVntsR6A5H543-XFxUYHdNO01I9Afj4vxdsVkvfdbpNauJWJ-iCtZyWgXESxWad5pU9RgK_KwfB90fB9vJ1k6WiWLiMJAANmrH_5QIcG5-Ezbl0lLnLhiu8Q1GssX3gKk4FL-tHQKHH133q4jbtF9QRCnMQA6IxqB7w0CkSW_ipRaKvH83xMKP24'
       },
       body: requestData,
     );


     // Handle the response
     if (response.statusCode == 200) {
       Navigator.of(context).pop();

       // Request successful, handle the response data10
       print('API request successful');
       print('Response data: ${response.body}');




       // Add logic to handle the response data as needed
     } else {
       // Request failed, handle the error
       print('API request failed with status code: ${response.statusCode}');
       print('${response.statusCode}');


       // Add logic to handle the error as needed
     }

     // Navigator.of(context).pop();

   }

   Future<void> _submitPickupRequest(BuildContext context, String pickupAddress, String note, String estimatedParcel) async {
     try {
       print('pickupAddress: $pickupAddress, note: $note, estimatedParcel: $estimatedParcel');

       final requestData = {
         'pick_up_address': pickupAddress,
         'Note': note,
         'estimated_parcel': estimatedParcel,
       };
       print('Request Data: $requestData');
       final response = await http.post(
         Uri.parse('https://system.parcelpointltd.com/api/pick-up-request'),
         headers: {
           'Accept': 'application/json',
           // 'Content-Type': 'application/json',
           'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjczMWU0YzFkYzY4NDQ2ZTRjYWVmNjNiZmY5ZmYzN2I5ZjAxNWIxOTI2N2Q2MTMwNGE0MmFkMzExMGJkZjYyZDYyZGU5YjdhYzA4OWI4YjcxIn0.eyJhdWQiOiIxNCIsImp0aSI6IjczMWU0YzFkYzY4NDQ2ZTRjYWVmNjNiZmY5ZmYzN2I5ZjAxNWIxOTI2N2Q2MTMwNGE0MmFkMzExMGJkZjYyZDYyZGU5YjdhYzA4OWI4YjcxIiwiaWF0IjoxNzA4NzQ0OTk1LCJuYmYiOjE3MDg3NDQ5OTUsImV4cCI6MTc0MDM2NzM5NSwic3ViIjoiNzcwIiwic2NvcGVzIjpbXX0.ZmmMgixvMzkq9z7CdhMJtRyPrrR16hgs4mnoJIEcXtguecHBOLRBHyZI2lqOA4Uo_2niRfXoiD71bqwtXvOctZM1RVGvGQIWtmOx_Ei2hIVuuwULyLfHCdmlhN1L2FLq4effENXw1SiP45dH7vzFvXPsOdI4k98N0ZyH3bYfm7K2aupFG67n2avDisEtTqfIF6V6GkgkGbyjigwsZpyHRUFBDBobbz60VKo9KixgzFevAyUli0sKgntOWWi_1eRJht9KldVvfigI7gSSilqONR258bZj-MsfOlDS6pnXZcmNTDOdPjInDNQhprsZeiz4ALpdp0fxGGg2ogVlAhEBX5B9rrPTzbMWy3A6dUDe45Fx7U2XqGG_mVbqTG7eAEJvLdH3TubMilojCwWh_t00QSLD7trQFWk1tRwSI3GW-LU3Km4yur7qyxGTSlYT-ZC0F3Brt8Ye0dMIYaWizofxukf0pEJiobsnIpPSyd83Nf1WPw3Hpz5bVntsR6A5H543-XFxUYHdNO01I9Afj4vxdsVkvfdbpNauJWJ-iCtZyWgXESxWad5pU9RgK_KwfB90fB9vJ1k6WiWLiMJAANmrH_5QIcG5-Ezbl0lLnLhiu8Q1GssX3gKk4FL-tHQKHH133q4jbtF9QRCnMQA6IxqB7w0CkSW_ipRaKvH83xMKP24'
         },
         // body: jsonEncode(requestData),
         body: requestData,
       );
       print('Response body: ${response.body}'); // Print the response body


       if (response.statusCode == 200) {
         final responseData = jsonDecode(response.body);
         ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
             backgroundColor: Colors.lightBlue,
             content: Text(
               responseData['message'],
               style: TextStyle(color: Colors.white),
             ),
           ),
         );
       } else {
         throw Exception('Failed to submit pickup request');
       }
     } catch (error) {
       print('Error submitting pickup request: $error'); // Print the specific error
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
           backgroundColor: Colors.red,
           content: Text(
             'Failed to submit pickup request',
             style: TextStyle(color: Colors.white),
           ),
         ),
       );
     }
   }

   Future<String?> _fetchPickupAddress() async {
     // Make the API call to fetch the pickup address
     final response = await http.get(Uri.parse('http://system.parcelpointltd.com/api/get-merchant-info'),
     headers: {
       'Accept': 'application/json',
       'Content-Type': 'application/json',
       'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImY4ZjNlYzY1NmM4Yzc1MTQ3OTdhN2RjMzM0NmVmM2I5NTVkMDVhYTNlMGUyMmQ3YWUwZjVmZTFkMDI1OTQ3MzEwNDljOWRjZjJhMTgzNDJkIn0.eyJhdWQiOiIxNCIsImp0aSI6ImY4ZjNlYzY1NmM4Yzc1MTQ3OTdhN2RjMzM0NmVmM2I5NTVkMDVhYTNlMGUyMmQ3YWUwZjVmZTFkMDI1OTQ3MzEwNDljOWRjZjJhMTgzNDJkIiwiaWF0IjoxNzA4NzQ0NjQwLCJuYmYiOjE3MDg3NDQ2NDAsImV4cCI6MTc0MDM2NzA0MCwic3ViIjoiNzcwIiwic2NvcGVzIjpbXX0.Cq7XniYb5IW5CePPEyAstjDQCWeYdYX0lYjkf7GPNcEHAgdg-PkzlAyAG7aw7A7MBq9T3mHfZiw0VXvtQ6_aWONakt95l5PpPdPTlbb1qa0Toig81XdpUUKXLlUOu54wal6TPQn-HWAmJ7s4aMtjMghH54hoPcMkvH0gdUuD7PfWwwTtEVx2b8xoh7wcedxd86EqYkYaPqDsAaFK42eRo8AlB_9f85KtK4ULqfwZBlOXxkqLMLKOwVrwYq2VjWIoXkwrMCezGhsYJAkETRGL5STw8CdGOIwXDIZAWtsin26T2wn6_zEGhWKFuHfLX7CYect37C6WrzuUlncY6F9dSPAVNqkjypg_QcN4HW8b2Ytah1bLkIcEEbPuw3vVq6TRORu20IrKwl7Fa5yI6jsPziG41xnq3LszwVOPFytz7zzQFwvHAefNCKCktdu3TyVuAmmL1xYBfq7TcqGWdIY4ApGRWWYk-KTgjo9Rc52EllXgV4ExTQmuRcpkE8KQfJqYfT2ZJtuRkr9BB7CXei0Z5sr0JzxyU70kH2KzZcIWCvB6VhTjMiZDVT681INGHeT9Kd953yJPEsnRoqWlH8CAwDH7_HfTsZT5eDKLd2RlsubukVRJcNErRT1mU_dTfdzeJlU0XhVnM-gqaDfg-oiCU8mi0SxiJWGmZbZisZv3Nwc'

   },);

     if (response.statusCode == 200) {
       final responseData = jsonDecode(response.body);
       // return responseData['data']['pickup_address'];
       final pickupAddress = responseData['merchant_info'];

       print('Pickup address fetched successfully: $pickupAddress');
       return pickupAddress;
     } else {
       final errorMessage = jsonDecode(response.body)['message'];
       print('API error: $errorMessage');
       throw Exception('API error: $errorMessage');
     }
   }









   @override
  Widget build(BuildContext context) {
    Get.put(DashboardController(dashboardApi: DashboardApi()));

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(
            //   height: 20.0,
            // ),
            TopSection(scaffoldKey: scaffoldKey),
            Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await controller.getDashboardData();
                  },
                  child: Obx(
                        () => Get.find<InternetcheckerController>()
                        .connectionStatus
                        .value ==
                        1
                        ? controller.obx(
                          (response) => ListView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        shrinkWrap: true,
                        children: [
                          const SizedBox(
                            height: AppSize.s24,
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {

                                      _fetchPickupAddress().then((pickupAddress) {
                                        // Fill the pickup address TextField with the fetched address
                                        _pickupAddressController.text = pickupAddress ?? '';
                                      }).catchError((error) {
                                        print('Error fetching pickup address: $error');
                                      });


                                      return AlertDialog(
                                        key: _formKey,

                                        backgroundColor: Colors.white,
                                        title: Text('Enter Text'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text('Pickup Address'),
                                            TextField(
                                              readOnly: true,
                                              controller: _pickupAddressController,
                                              decoration: InputDecoration(
                                                  hintText: 'Pickup Address',
                                                  hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                            ),
                                            SizedBox(height: 15),
                                            Text('Note'),

                                            TextField(
                                              controller: _noteController,
                                              decoration: InputDecoration(labelText: 'Note'),
                                            ),
                                            SizedBox(height: 15),
                                            Text('Estimated Parcel'),

                                            TextField(
                                              controller: _estimatedParcelController,
                                              decoration: InputDecoration(labelText: 'Estimated Parcel'),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context); // Close the dialog
                                            },
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              // Do something with the entered text
                                              print('Text 1: ${_pickupAddressController.text}');
                                              print('Text 2: ${_noteController.text}');
                                              print('Text3: ${_estimatedParcelController.text}');

                                              String pickupAddress = _pickupAddressController.text;
                                              String note = _noteController.text;
                                              String estimatedParcel = _estimatedParcelController.text;

                                              // _submitPickupRequest(context, pickupAddress, note, estimatedParcel);
                                              _submitPickupRequest(context, _pickupAddressController.text, _noteController.text, _estimatedParcelController.text);


                                              // _submitPickupRequest();

                                              Navigator.pop(context); // Close the dialog
                                            },
                                            child: Text('Submit'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  height: MediaQuery.of(context).size.width / 4.8,
                                  width: MediaQuery.of(context).size.width / 2.3,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Pickup Request',
                                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),


                              SizedBox(width: 30,),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {



                                      return AlertDialog(
                                        backgroundColor: Colors.white,
                                        title: Text('Payment Request'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            // TextField(
                                            //   readOnly: true,
                                            //   controller: _textController4,
                                            //   decoration: InputDecoration(labelText: 'Current Payment Method'),
                                            //   onTap: () {
                                            //     print('tapped');
                                            //     String? _selectedPaymentMethod; // Variable to store the selected payment method
                                            //
                                            //     String _selectedOption = 'Option 1';
                                            //     // Initially set to the first option
                                            //     DropdownButtonFormField(
                                            //       value: _selectedPaymentMethod,
                                            //       items: paymentTypes.map((
                                            //           type) {
                                            //         return DropdownMenuItem(
                                            //           value: type,
                                            //           child: Text(type),
                                            //         );
                                            //       }).toList(),
                                            //       onChanged: (value) {
                                            //         _selectedPaymentMethod =
                                            //             value.toString();
                                            //         // selectedBank = 'Select Bank'; // Reset selected bank when payment type changes
                                            //         // selectedAccount = 'Select Account'; // Reset selected account when payment type changes
                                            //
                                            //       },
                                            //       decoration: InputDecoration(
                                            //         labelText: 'Payment Type',
                                            //         labelStyle: TextStyle(
                                            //             color: Colors.black),
                                            //       ),
                                            //     );
                                            //
                                            //
                                            //
                                            //
                                            //     },),


                                          DropdownButtonFormField(
                                          value: _selectedPaymentMethod,
                                          dropdownColor: Colors.white,
                                          items: paymentTypes.map((
                                              type) {
                                            return DropdownMenuItem(
                                              value: type,
                                              child: Text(type, style: TextStyle(color: Colors.black),),
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            _selectedPaymentMethod =
                                                value.toString();

                                          },

                                          decoration: InputDecoration(
                                            labelText: 'Payment Method',
                                            labelStyle: TextStyle(
                                                color: Colors.black),
                                          ),
                                        ),


                                        ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context); // Close the dialog
                                            },
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              // Do something with the entered text

                                              print('Text4: ${_textController4.text}');

                                              Navigator.pop(context); // Close the dialog
                                            },
                                            child: GestureDetector(
                                              onTap:(){
                                                submitpaymethod(context);

                                                // Navigator.pop(context); // Close the dialog after submit



                                              },

                                                child: Text('Submit')),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  height: MediaQuery.of(context).size.width / 4.8,
                                  width: MediaQuery.of(context).size.width / 2.3,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.all(Radius.circular(5)), // Replace ; with ,
                                  ),
                                    child:Center(child: Text('Payment Request',
                                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                                    ))

                                ),
                              ),

                            ],
                          ),
                          // const SizedBox(height: AppSize.s20),
                          // OperationCardRow(
                          //   title1: 'Pickup Request',//AppStrings.dComplete,
                          //   title2: 'Payment Request',//AppStrings.pCancel,
                          //   header: AppStrings.today,
                          //   icon1: ImageAssets.list,
                          //   press1: () {
                          //     Get.toNamed(Routes.historyOrder);
                          //   },
                          //   color1: Colormanager.primary,
                          //   color2: Colormanager.darkblue,
                          //   value1: response!.data!.tDalivery.toString(),
                          //   value2: response.data!.tCancel.toString(),
                          //   icon2: ImageAssets.list,
                          //   press2: () {
                          //     Get.toNamed(Routes.historyOrder);
                          //   },
                          // ),
                          const SizedBox(height: AppSize.s20),
                          OperationCardRow(
                            title1: AppStrings.dComplete,
                            title2: AppStrings.pRqst,
                            header: AppStrings.today,
                            icon1: ImageAssets.list,
                            press1: () {
                              Get.toNamed(Routes.historyOrder);
                            },
                            color1: Colors.purpleAccent,//Colormanager.d1,
                            color2: Colormanager.d3,
                            value1: response!.data!.tDalivery.toString(),
                            value2: response.data!.tCancel.toString(),
                            value3: '3',
                            value4: '4',
                            icon2: ImageAssets.list,
                            press2: () {
                              Get.toNamed(Routes.historyOrder);
                            },
                          ),
                          const SizedBox(
                            height: AppSize.s10,
                          ),
                          OperationCardRow(
                            title1: AppStrings.dreturn,
                            title2: AppStrings.transit,
                            header: AppStrings.today,
                            icon1: ImageAssets.list,
                            press1: () {
                              Get.toNamed(Routes.historyOrder);
                            },
                            color1: Colors.teal,//Colormanager.d3,
                            color2: Colormanager.d4,
                            value1: response.data!.tReturn.toString(),
                            value2: response.data!.tHoldReschedule.toString(),
                            value3: '3',
                            value4: '4',
                            icon2: ImageAssets.list,
                            press2: () {
                              Get.toNamed(Routes.historyOrder);
                            },
                          ),
                          const SizedBox(
                            height: AppSize.s24,
                          ),
                          OperationCardRow(
                            title1: 'Order',//AppStrings.dComplete,
                            title2: 'Delivery',//AppStrings.pRqst,
                            header: AppStrings.total,
                            icon1: ImageAssets.list,
                            press1: () {
                              Get.toNamed(Routes.historyOrder);
                            },
                            color1: Colors.lightGreen,//Colormanager.d4,
                            color2: Colormanager.d2,
                            value1: response.data!.toDalivery.toString(),
                            value2: response.data!.toCancel.toString(),
                            value3: '3',
                            value4: '4',
                            icon2: ImageAssets.list,
                            press2: () {
                              Get.toNamed(Routes.historyOrder);
                            },
                          ),
                          const SizedBox(
                            height: AppSize.s10,
                          ),
                          OperationCardRow(
                            title1: 'Unsuccessful Delivery Ratio',//AppStrings.dreturn,
                            title2: 'Total successful Delivery Ratio',//AppStrings.transit,
                            header: AppStrings.total,
                            icon1: ImageAssets.list,
                            press1: () {
                              Get.toNamed(Routes.historyOrder);
                            },
                            color1: Colormanager.d3,
                            color2: Colors.purple,
                            value1: response.data!.toReturn.toString(),
                            value2:
                            response.data!.toHoldReschedule.toString(),
                            value3: '3',
                            value4: '4',
                            icon2: ImageAssets.list,
                            press2: () {
                              Get.toNamed(Routes.historyOrder);
                            },
                          ),
                          const SizedBox(
                            height: AppSize.s10,
                          ),
                          OperationCardRow(
                            title1: AppStrings.pProcessing,
                            title2: AppStrings.pComplete,
                            header: AppStrings.total,
                            icon1: ImageAssets.list,
                            press1: () {},
                            color1: Colormanager.d1,
                            color2: Colormanager.d2,
                            value1: response.data!.paymentProcessing!.toStringAsFixed(3) +" TK",
                            value2:
                            response.data!.paymentComplete!.toStringAsFixed(3) +" TK",
                            value3: '3',
                            value4: '4',
                            icon2: ImageAssets.list,
                            press2: () {},
                          ),
                          const SizedBox(height: AppSize.s10),
                        ],
                      ),
                      onEmpty: EmptyFailureNoInternetView(
                        image: ImageAssets.noData,
                        title: AppStrings.noData,
                        description: AppStrings.noDataMsg,
                        buttonText: AppStrings.retry,
                        onPressed: () {
                          controller.getDashboardData();
                        },
                      ),
                      onLoading: const DataLoader(),
                      onError: (error) => SingleChildScrollView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        child: EmptyFailureNoInternetView(
                          image: ImageAssets.noData,
                          title: AppStrings.error,
                          description: error.toString(),
                          buttonText: AppStrings.retry,
                          onPressed: () {
                            controller.getDashboardData();
                          },
                        ),
                      ),
                    )
                        : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      child: EmptyFailureNoInternetView(
                        image: ImageAssets.noInternet,
                        title: AppStrings.noInternet,
                        description: AppStrings.checkConnection,
                        buttonText: AppStrings.retry,
                        onPressed: () {
                          controller.getDashboardData();
                        },
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
      drawer: const NavigationBarDrawer(),
    );
  }

  Future<String?> showAlertCuperutino(
    BuildContext context,
    String msg, [
    String? title,
  ]) async {
    final ok = CupertinoDialogAction(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text("OK"),
    );

    final alert = CupertinoAlertDialog(
      title: title != null ? Text(title) : null,
      content: Text(msg),
      actions: [ok],
    );

    return showDialog(
      context: context,
      builder: (BuildContext context) => alert,
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xffFF7C00),
      height: MediaQuery.of(context).size.width/6.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              if (scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.openEndDrawer();
              } else {
                scaffoldKey.currentState!.openDrawer();
              }
            },
            child: Container(
              margin: const EdgeInsets.all(AppPadding.p12),
              child: Icon(
                Icons.menu,
                color: Colormanager.darkblue,
                size: AppSize.s40,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.homeRoute);
            },
            // child: Image.asset(
            //   ImageAssets.splashLogo,
            //   height: AppSize.s100,
            // ),

            child: Container(
                height: AppSize.s100,
                child: Center(child: Text('Dashboard', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff013d6a)),))),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.createOrder);
            },
            child: Container(
              margin: const EdgeInsets.all(AppPadding.p12),
              child: Icon(
                Icons.add,
                color: Colormanager.darkblue,
                size: AppSize.s40,
              ),
            ),
          )
        ],
      ),
    );
  }
}
