import 'package:tascom/features/get_tasks/data/models/all_tasks_response.dart';

import 'search_meta.dart';
import 'search_person_data.dart';

sealed class SearchResponse {
  final SearchMeta meta;
  const SearchResponse({required this.meta});

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String;
    final meta = SearchMeta.fromJson(json['meta'] as Map<String, dynamic>);
    final dataList = json['data'] as List<dynamic>;

    if (type == 'tasks') {
      final tasks = dataList
          .map((e) => TaskResponseData.fromJson(e as Map<String, dynamic>))
          .toList();
      return SearchTasksResponse(tasks: tasks, meta: meta);
    } else {
      final people = dataList
          .map((e) => SearchPersonData.fromJson(e as Map<String, dynamic>))
          .toList();
      return SearchPeopleResponse(people: people, meta: meta);
    }
  }
}

class SearchTasksResponse extends SearchResponse {
  final List<TaskResponseData> tasks;
  const SearchTasksResponse({required this.tasks, required super.meta});
}

class SearchPeopleResponse extends SearchResponse {
  final List<SearchPersonData> people;
  const SearchPeopleResponse({required this.people, required super.meta});
}
