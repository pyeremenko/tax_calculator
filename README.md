# Tax Calculator

Tax Calculator is a simple project which helps to calculate receipt details for specified goods.

## Running

This project was intended to be a simple API, so the main executable is just a test script and called
`test_run.rb`. Unfortunately, it looks like I need 2 more hours to build this API and deploy to Heroku.

To run the script, just call it and pass the name of a file with bill lines:

```
test_run.rb ./test_data/data1
```

The project already has three files inside `test_data` directory with the test cases from [the task](https://gist.github.com/safplatform/792314da6b54346594432f30d5868f36).

## Testing

Each class of the solution has associated specs and can be tested with `rspec`:

```
rspec spec
```

## TODO

I had expected to make this project as a simple Rails API, but caught a configuration issue. That's why I spent one hour
of given four fighting with Rails. I also spent some time understanding that **rounded up** is not a phrase verb, but 
a real instruction to round up to the **next** 0.05. 

Keeping this in mind, I would like to improve this project in the following ways:

* Make this a Rails app, create model for `bill_item` and introduce `bill` model
* Use `simple_command` gem for keeping the BL from `bill_item_tax_calculator.rb`, `item_classifier.rb`, and `bill_processor.rb` there.
* I used the simplest `DummyItemClassifier` that uses just a couple of keywords to detect the class of a good. The first TODO is just properly fill the data from online pharmacies and online stores.
* Another improvement could be training a classification NN which could be able to classify goods. Anyways, it's just about injecting a class with a different classifying algorithm.