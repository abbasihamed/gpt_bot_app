// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
    ChatModel({
        this.id,
        this.object,
        this.created,
        this.model,
        this.usage,
        this.choices,
    });

    final String? id;
    final String? object;
    final int? created;
    final String? model;
    final Usage? usage;
    final List<Choice>? choices;

    factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        id: json["id"],
        object: json["object"],
        created: json["created"],
        model: json["model"],
        usage: json["usage"] == null ? null : Usage.fromJson(json["usage"]),
        choices: json["choices"] == null ? [] : List<Choice>.from(json["choices"]!.map((x) => Choice.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "created": created,
        "model": model,
        "usage": usage?.toJson(),
        "choices": choices == null ? [] : List<dynamic>.from(choices!.map((x) => x.toJson())),
    };
}

class Choice {
    Choice({
        this.message,
        this.finishReason,
        this.index,
    });

    final Message? message;
    final String? finishReason;
    final int? index;

    factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        message: json["message"] == null ? null : Message.fromJson(json["message"]),
        finishReason: json["finish_reason"],
        index: json["index"],
    );

    Map<String, dynamic> toJson() => {
        "message": message?.toJson(),
        "finish_reason": finishReason,
        "index": index,
    };
}

class Message {
    Message({
        this.role,
        this.content,
    });

    final String? role;
    final String? content;

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        role: json["role"],
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "role": role,
        "content": content,
    };
}

class Usage {
    Usage({
        this.promptTokens,
        this.completionTokens,
        this.totalTokens,
    });

    final int? promptTokens;
    final int? completionTokens;
    final int? totalTokens;

    factory Usage.fromJson(Map<String, dynamic> json) => Usage(
        promptTokens: json["prompt_tokens"],
        completionTokens: json["completion_tokens"],
        totalTokens: json["total_tokens"],
    );

    Map<String, dynamic> toJson() => {
        "prompt_tokens": promptTokens,
        "completion_tokens": completionTokens,
        "total_tokens": totalTokens,
    };
}
