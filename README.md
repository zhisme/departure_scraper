# DepartureScraper
Scrape data from airport departures

## Installation

`bin/setup`

`bin/run`

## More

Run `bin/run --help` to get more information

## Testing

ENV=test bundle exec rake db:create db:migrate
ENV=test bundle exec rspec

## Task

Create a web scraping pipeline that outputs the weather at destinations of flights leaving Vienna
airport.
1. Regularly (e.g. hourly) scrape the table of departing flight on Vienna airport webpage
(https://www.viennaairport.com/passagiere/ankunft__abflug/abfluege)

2. Use any global weather website (or API) to find the current temperature at every
destination

3. Create a note based on destination and temperature using some simple logic, e.g.
○ if >25 C in London, note = "Let's go for a pint"
○ if <5 C in Madrid, note = "!Que frio!"

4. Save destination, time, temperature and note into a database

5. Add caching to scraping requests. It should enable you to repeat the process with the
exact same inputs.

○ For example, imagine the logic for creating the note is way more complex. If the
logic breaks for certain input data, you want to fix it and re-run the process on the
exact same data.

6. Write some tests. Feel free to use a testing framework, but it's not required.

7. Stretch goal: Use some kind of web service as cache storage.
