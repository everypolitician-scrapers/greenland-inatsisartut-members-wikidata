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

names[:cat] = WikiData::Category.new( 'Category:Members of the Parliament of Greenland', 'en').member_titles


da_names = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://da.wikipedia.org/wiki/Medlemmer_af_Inatsisartut_valgt_i_2013',
  after: '//h2/span[@id="Liste"]',
  xpath: '//table//td[1]//a[not(@class="new")]/@title',
)

da_cat = WikiData::Category.new( 'Kategori:Medlemmer af Landstinget', 'da').member_titles |
         WikiData::Category.new( 'Kategori:Tidligere medlemmer af Landstinget', 'da').member_titles |
         WikiData::Category.new( 'Kategori:Medlemmer af Landsstyret', 'da').member_titles |
         WikiData::Category.new( 'Kategori:Inatsisartutmedlemmer', 'da').member_titles


sv_cat = WikiData::Category.new( 'Kategori:Grönländska politiker', 'sv').member_titles |
         WikiData::Category.new( 'Kategori:Grönländska politiker under 2000-talet', 'sv').member_titles |
         WikiData::Category.new( 'Kategori:Grönländska politiker under 1900-talet', 'sv').member_titles |
         WikiData::Category.new( 'Kategori:Grönlands ministrar', 'sv').member_titles


EveryPolitician::Wikidata.scrape_wikidata(names: { en: names.values.flatten.uniq, da: da_names | da_cat, sv: sv_cat })
