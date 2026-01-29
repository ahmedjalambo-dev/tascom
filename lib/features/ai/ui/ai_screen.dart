import 'package:flutter/material.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/ai/ui/widgets/a_iresponse_widget.dart';
import 'package:tascom/features/ai/ui/widgets/message_widget.dart';

class AiScreen extends StatefulWidget {
  const AiScreen({super.key});

  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  String? selectedMessage;
  Map<String, String> messages = {
    'How do I request help near me?':
        'To request help near you, simply open the app and navigate to the "Request Help" section. Fill out the form with your needs and location, and submit it. Nearby community members will be notified and can offer assistance.',
    'How can I offer a service and earn points?':
        'To offer a service, go to the "Offer Service" tab in the app. Describe the service you can provide, set your availability, and submit your offer. You will earn points based on the number of successful service exchanges you complete.',
    'Who needs help in my area right now?':
        'You can find out who needs help in your area by checking the "Help Requests" section of the app. This section lists all active requests from community members nearby, along with details about their needs and locations.',
  };
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            if (selectedMessage == null) ...[
              Image.asset(
                'assets/images/tascom_logo.png',
                width: 125,
                height: 120,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 24),
              Text(
                'Ask AI about help requests, tasks, and ',
                textAlign: TextAlign.center,
                style: MyTextStyle.body.body1.copyWith(
                  color: MyColors.text.primary,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
              ),
              Text(
                ' service exchanges in your',
                textAlign: TextAlign.center,
                style: MyTextStyle.body.body1.copyWith(
                  color: MyColors.text.primary,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
              ),
              Text(
                'neighborhood',
                textAlign: TextAlign.center,
                style: MyTextStyle.body.body1.copyWith(
                  color: MyColors.text.primary,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
            ],

            Container(
              padding: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                color: const Color(0xFFFAFAFA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (selectedMessage != null) ...[
                    const SizedBox(height: 24),
                    MessageWidget(selectedMessage: selectedMessage),
                    const SizedBox(height: 24),
                    AIresponseWidget(responseText: messages[selectedMessage]!),
                    const SizedBox(height: 24),
                  ],

                  if (selectedMessage == null) ...[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Suggested',
                          textAlign: TextAlign.center,
                          style: MyTextStyle.body.body2.copyWith(
                            color: MyColors.text.primary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        suggestedWidget(messages.keys.elementAt(0)),
                        const SizedBox(height: 8),
                        suggestedWidget(messages.keys.elementAt(1)),
                        const SizedBox(height: 8),
                        suggestedWidget(messages.keys.elementAt(2)),
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: MyColors.brand.purple,
                        ),
                        borderRadius: BorderRadius.circular(48),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.auto_awesome,
                          size: 18,
                          color: Color(0xFF6B39F4),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            cursorColor: Colors.transparent,
                            showCursor: false,
                            style: MyTextStyle.body.body2.copyWith(
                              color: MyColors.text.primary,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Ask AI anything..',
                              hintStyle: TextStyle(
                                color: MyColors.text.primary,
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              fillColor: Colors.transparent,
                              filled: true,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.link,
                          size: 18,
                          color: Color(0xFF6B39F4),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.send,
                          size: 18,
                          color: Color(0xFF6B39F4),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget suggestedWidget(String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMessage = text;
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFD1C2FC)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: MyTextStyle.body.body2.copyWith(
            color: MyColors.text.primary,
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
        ),
      ),
    );
  }
}
