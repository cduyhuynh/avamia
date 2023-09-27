# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Topic.create([{name: 'Blockchain', code: 'blockchain'}, 
              {name: 'Earnings', code: 'earnings'},
              {name: 'IPO', code: 'ipo'},
              {name: 'Mergers & Acquisitions', code: 'mergers_and_acquisitions'},
              {name: 'Financial Markets', code: 'financial_markets'},
              {name: 'Economy - Fiscal Policy', code: 'economy_fiscal'},
              {name: 'Economy - Monetary Policy', code: 'economy_monetary'},
              {name: 'Economy - Macro/Overall', code: 'economy_macro'},
              {name: 'Energy & Transportation', code: 'energy_transportation'},
              {name: 'Finance', code: 'finance'},
              {name: 'Life Sciences', code: 'life_sciences'},
              {name: 'Manufacturing', code: 'manufacturing'},
              {name: 'Real Estate & Construction', code: 'real_estate'},
              {name: 'Retail & Wholesale', code: 'retail_wholesale'},
              {name: 'Technology', code: 'technology'},
            ])