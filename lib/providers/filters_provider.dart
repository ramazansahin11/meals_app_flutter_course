import 'package:flutter_riverpod/flutter_riverpod.dart';

Map<Filter, bool> kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends Notifier<Map<Filter, bool>> {
  @override
  build() {
    return kInitialFilters;
  }

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    // state[filter] = isActive; // not allowed! => mutating state
    state = {...state, filter: isActive};
  }
}

final filtersProvider = NotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  () => FiltersNotifier(),
);
