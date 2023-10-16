import 'package:bug_doctor/config.dart';
import 'package:dart_openai/dart_openai.dart';

Future<String> chatCompletion(String content) async {
  OpenAIChatCompletionModel chatCompletion = await OpenAI.instance.chat.create(
    model: gptModel,
    messages: [
      OpenAIChatCompletionChoiceMessageModel(
        content: content,
        role: OpenAIChatMessageRole.user,
      ),
    ],
  );

  return chatCompletion.choices[0].message.content;
}

Stream<OpenAIStreamChatCompletionModel> chatCompletionStream(String content) {
  return OpenAI.instance.chat.createStream(
    model: gptModel,
    messages: [
      OpenAIChatCompletionChoiceMessageModel(
        content: content,
        role: OpenAIChatMessageRole.user,
      )
    ],
  );
}
