import 'dart:convert';

GptModels gptModelsFromJson(String str) => GptModels.fromJson(json.decode(str));

String gptModelsToJson(GptModels data) => json.encode(data.toJson());

class GptModels {
  GptModels({
    this.id,
    this.object,
    this.created,
    this.model,
    this.choices,
    this.usage,
  });

  String? id;
  String? object;
  int? created;
  String? model;
  List<Choice>? choices;
  Usage? usage;

  factory GptModels.fromJson(Map<String, dynamic> json) => GptModels(
        id: json["id"],
        object: json["object"],
        created: json["created"],
        model: json["model"],
        choices: json["choices"] == null
            ? []
            : List<Choice>.from(
                json["choices"]!.map((x) => Choice.fromJson(x))),
        usage: json["usage"] == null ? null : Usage.fromJson(json["usage"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "created": created,
        "model": model,
        "choices": choices == null
            ? []
            : List<dynamic>.from(choices!.map((x) => x.toJson())),
        "usage": usage?.toJson(),
      };
}

class Choice {
  Choice({
    this.text,
    this.index,
    this.logprobs,
    this.finishReason,
  });

  String? text;
  int? index;
  dynamic logprobs;
  String? finishReason;

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        text: json["text"],
        index: json["index"],
        logprobs: json["logprobs"],
        finishReason: json["finish_reason"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "index": index,
        "logprobs": logprobs,
        "finish_reason": finishReason,
      };
}

class Usage {
  Usage({
    this.promptTokens,
    this.completionTokens,
    this.totalTokens,
  });

  int? promptTokens;
  int? completionTokens;
  int? totalTokens;

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
