# Unified Search


## Description

Unified Search is a Ruby script that queries the endpoints of two University of Pennsylvania Libraries resources ([Colenda](https://colenda.library.upenn.edu/) and [Finding Aids](https://findingaids.library.upenn.edu/)) and aggregates the results. The script processes and combines the response data from both systems into a JSON response containing a list of records sorted by the most recent date.

## Getting Started

### Dependencies

* Ruby 3.1.2

### Installing

1. Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/) 
2. Install [Git](https://github.com/git-guides/install-git)
3. Clone repository. Run the following command in the terminal.
    ```
    git clone repository https://github.com/a-w-m/Unified-Search.git
    ```

### Using

1. Navigate to app folder. From the root directory, run the `cd` command in the terminal to navigate to the app folder.
```
cd app
```
2. Use the `ruby` command to run the `main.rb` script with the search query as an argument. In the example below, 'Pennsylvania' is the search query.
```
ruby main.rb Pennsylvania
```
3. View JSON response in the terminal

## Solution
- The script queries the resource endpoints using the argument supplied in the execution command. To process the results, the processor object uses Ruby's `dig` function in combination with a hash containing the path to each required field (represented as an array of keys). The script then combines the processed results from each response into a single array. The script selects and sorts the records with a normalized date value and appends those without at the end of the array. Finally, the script prints a JSON response of the sorted records to the terminal. 

## Ambiguities/Challenges/Opportunities
- Each resource used different data structures to represent data. I retrieved the required values and kept them in their original data type. This caused some issues because I had to handle data that could be represented in different ways. For example, the Colenda uses an array of strings for each field, while Finding Aids mostly uses strings. However, following the requirements, I normalized the date field into a string. With further time, I would normalize all the fields to take make consuming the data easier for the frontend. 

- Class composition, ensuring classes have single responsibilities. A future refactor would see the creation of more classes to relieve those doing a bit too much (looking at you processor).

- Missing fields. A Colenda record does not contain a link field, so I had to use a conditional to determine whether a record belonged to Colenda. I wanted the processor to remain abstract by using a format hash to determine the structure of the record, but the missing field made it difficult to maintain complete abstraction as the processor had to know specific information about a Colenda record. 

## License

This project is licensed under the MIT License 