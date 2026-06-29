import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'search_viewmodel.dart';

class SearchView extends StackedView<SearchViewModel> {
  const SearchView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SearchViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search City"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: viewModel.cityController,
              decoration: const InputDecoration(
                labelText: "City Name",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_city),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: viewModel.isBusy
                    ? null
                    : viewModel.search,
                child: const Text("Search"),
              ),
            ),

            const SizedBox(height: 20),

            if (viewModel.isBusy)
              const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  @override
  SearchViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SearchViewModel();
}