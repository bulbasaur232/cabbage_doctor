import 'package:bug_doctor/config.dart';
import 'package:dart_openai/dart_openai.dart';

void chatGptInit() async{
  OpenAI.apiKey = gptApiKey;
  OpenAIChatCompletionModel chatCompletion = await OpenAI.instance.chat.create(
    model: "gpt-3.5-turbo",
    messages: [
      const OpenAIChatCompletionChoiceMessageModel(
        content: '너는 한국어로 말하고 농사와 관련한 정보를 제공하는 조언자 역할을 해',
        role: OpenAIChatMessageRole.system,
      ),
    ],
  );
}

Future<String> chatCompletion(String content) async {
  OpenAIChatCompletionModel chatCompletion = await OpenAI.instance.chat.create(
    model: "gpt-3.5-turbo",
    messages: [
      OpenAIChatCompletionChoiceMessageModel(
        content: content,
        role: OpenAIChatMessageRole.user,
      ),
    ],
  );

  return chatCompletion.choices[0].message.content;
}
