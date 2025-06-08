//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:messengar/app/routes/app_pages.dart';
// import 'package:messengar/app/routes/app_routes.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Messenger App",
//       initialRoute: AppRoutes.HOME,
//       getPages: AppPages.routes,
//       theme: ThemeData(
//         fontFamily: "Markazi",
//         scaffoldBackgroundColor: Colors.white
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(GetMaterialApp(home: ChatPage()));
}

// --------------------- Controller ---------------------
class ChatController extends GetxController {
  final messageController = TextEditingController();
  final response = ''.obs;
  final isLoading = false.obs;
  StreamSubscription? _streamSub;

  final String apiKey = 'sk-c749f16a57214ada8254c3dc5df1a72c'; // ضع مفتاح DeepSeek هنا

  void sendMessage() async {
    final text = messageController.text.trim();

    if (text.isEmpty || text.length > 400) {
      Get.snackbar('خطأ', 'الرسالة فارغة أو تجاوزت 400 حرف');
      return;
    }

    isLoading.value = true;
    response.value = '';
    _streamSub?.cancel();

    final url = Uri.parse('https://api.deepseek.com/v1/chat/completions');

    final request = http.Request('POST', url)
      ..headers.addAll({
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      })
      ..body = jsonEncode({
        "model": "deepseek-chat",
        "messages": [
          {"role": "user", "content": text}
        ],
        "stream": true
      });

    final streamedResponse = await request.send();

    // التأكد أن السيرفر أرجع 200 OK
    if (streamedResponse.statusCode == 200) {
      _streamSub = streamedResponse.stream
          .transform(utf8.decoder)
          .transform(const LineSplitter())
          .listen((line) {
        if (line.startsWith('data:')) {
          final data = line.substring(5).trim();
          if (data == '[DONE]') {
            isLoading.value = false;
            return;
          }
          try {
            final jsonData = jsonDecode(data);
            final content = jsonData['choices'][0]['delta']['content'];
            if (content != null) {
              response.value += content;
            }
          } catch (e) {
            print("خطأ في فك JSON: $e");
          }
        }
      }, onDone: () {
        isLoading.value = false;
      }, onError: (err) {
        isLoading.value = false;
        Get.snackbar('خطأ', 'فشل في الاتصال بـ DeepSeek');
      });
    } else {
      print("error ===================00");
      print(streamedResponse.stream.bytesToString());
      print(streamedResponse);
      isLoading.value = false;
      Get.snackbar('خطأ', 'فشل الاتصال: ${streamedResponse.statusCode}');
    }
  }

  @override
  void onClose() {
    _streamSub?.cancel();
    messageController.dispose();
    super.onClose();
  }
}


// --------------------- واجهة المستخدم ---------------------
class ChatPage extends StatelessWidget {
  final ChatController c = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DeepSeek Chat')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // مربع النص وزر الإرسال
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: c.messageController,
                    maxLength: 400,
                    decoration: InputDecoration(
                      labelText: 'اكتب رسالتك',
                      border: OutlineInputBorder(),
                      counterText: '', // إزالة عداد الأحرف
                    ),
                    maxLines: null,
                  ),
                ),
                SizedBox(width: 10),
                Obx(() => IconButton(
                  icon: c.isLoading.value
                      ? CircularProgressIndicator()
                      : Icon(Icons.send),
                  onPressed: c.isLoading.value ? null : c.sendMessage,
                )),
              ],
            ),
            SizedBox(height: 20),
            // عرض الرد
            Obx(() => Expanded(
              child: SingleChildScrollView(
                child: Text(
                  c.response.value,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

