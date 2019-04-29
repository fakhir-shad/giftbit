# giftbit-rails Gem

Wrapper for [Giftbit](https://www.giftbit.com/giftbitapi/) API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'giftbit-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install giftbit-rails

## Usage

Initialize Giftbit request in your app

    Giftbit::Request.new(your_api_key, your_api_url)
    
#### Ping

    response = Giftbit::Ping.ping
    
#### Brand

List all Brands

    response = Giftbit::Brand.all
    
Retrieve Brand

    response = Giftbit::Brand.show(id: 'brand_code')
    
#### Region

List all Regions

    response = Giftbit::Region.all
    
#### Campaign

Create Campaign (params can be found [here](https://www.giftbit.com/giftbitapi/#/reference/1/campaign/create-campaign))

    response = Giftbit::Campaign.create({
                                          "gift_template": "XDKHE",
                                          "contacts": [
                                            {
                                              "firstname": "Perry",
                                              "lastname": "Johnson",
                                              "email": "pjohnson@giftbit.com"
                                            },
                                            {
                                              "firstname": "Rita",
                                              "lastname": "Robson",
                                              "email": "rrobson@giftbit.com"
                                            }
                                          ],
                                          "price_in_cents": 5000,
                                          "brand_codes": [
                                            "itunesus",
                                            "amazonus"
                                          ],
                                          "expiry": "2018-11-01",
                                          "id": "clientProvidedGiftId_abc123"
                                        })
                                        
Retrieve Campaign by id or uuid

Using id

    response = Giftbit::Campaign.find(id: 'campaign_id')
    
Using uuid

    response = Giftbit::Campaign.find(uuid: 'campaign_uuid')
    
#### Embedded

Create Embedded Gift (params can be found [here](https://www.giftbit.com/giftbitapi/#/reference/1/embedded/create-embedded-gift))

    response = Giftbit::Embedded.create({
                                          
                                          "contact": {
                                                        "firstname": "Perry",
                                                        "lastname": "Johnson",
                                                        "email": "pjohnson@giftbit.com"
                                                      },
                                          "price_in_cents": 5000,
                                          "brand_code": "itunesus",
                                          "id": "clientProvidedGiftId_abc123"})

#### Funds

Retrieve funding information

    response = Giftbit::Fund.all
    
Add funds through Credit Card (params can be found [here](https://www.giftbit.com/giftbitapi/#/reference/1/funds/add-funds-through-credit-card))

    response = Giftbit::Fund.create({
                                      "currencyisocode": "USD",
                                      "fund_amount_in_cents": 25000,
                                      "id": "clientProvidedId_abc123"
                                    })
                                    
#### Gifts

List all Gifts (params can be found [here](https://www.giftbit.com/giftbitapi/#/reference/1/gifts/list-gifts))

    response = Giftbit::Gift.all

Retrieve a particular Gift                                    
                                    
    response = Giftbit::Gift.find(uuid: 'gift_uuid')
    
Resend Gift

    response = Giftbit::Gift.resend(uuid: 'gift_uuid', resend: true)
    
Cancel Gift

    response = Giftbit::Gift.cancel(uuid: 'gift_uuid')
    
#### Links

Retrieve shortlinks by id or uuid

Using id

    response = Giftbit::Link.find(id: 'link_id')
    
Using uuid

    response = Giftbit::Link.find(uuid: 'link_uuid')
    
#### Marketplace

    response = Giftbit::Marktetplace.all    

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fakhir-shad/giftbit-rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the giftbit-rails project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/fakhir-shad/giftbit-rails/blob/master/CODE_OF_CONDUCT.md).
