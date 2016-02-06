require 'wikidata/fetcher'
require 'pry'

names = {}

names[:en14] = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://en.wikipedia.org/wiki/List_of_members_of_the_Inatsisartut,_2014–18',
  after: '//h2/span[@id="List"]',
  before: '//h2/span[@id="References"]',
  xpath: '//table//td[1]//a[not(@class="new")]/@title',
) 

names[:en13] = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://en.wikipedia.org/wiki/List_of_members_of_the_Inatsisartut,_2013–14'  ,
  after: '//h2/span[@id="List"]',
  before: '//h2/span[@id="References"]',
  xpath: '//table//td[1]//a[not(@class="new")]/@title',
) 

names[:en09] = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://en.wikipedia.org/wiki/List_of_members_of_the_parliament_of_Greenland,_2009–13',
  after: '//h2/span[@id="List"]',
  xpath: '//table//td[1]//a[not(@class="new")]/@title',
) 

da_names = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://da.wikipedia.org/wiki/Medlemmer_af_Inatsisartut_valgt_i_2013',
  after: '//h2/span[@id="Liste"]',
  xpath: '//table//td[1]//a[not(@class="new")]/@title',
) 

EveryPolitician::Wikidata.scrape_wikidata(names: { en: names.values.flatten.uniq, da: da_names }, output: false)
warn EveryPolitician::Wikidata.notify_rebuilder
