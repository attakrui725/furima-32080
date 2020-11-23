# README
## users

|Column|Type|Options|
|nickname  |string|null: false|
|mail      |string|null: false|
|password  |string|null: false|
|name      |string|null: false|
|birthday  |string|null: false|
|name(kana)|string|null: false|

### Association
- has_many :items
- has_many :buyers

## items

|Column|Type|Options|
|item_name       |string     |null: false|
|item_description|text       |null: false|
|category        |string     |null: false|
|item_status     |string     |null: false|
|delivery_fee    |string     |null: false|
|shipment_source |string     |null: false|
|day_to_ship     |string     |null: false|
|price           |string     |null: false|
| user           |references | null: false,foreign_key: true|


### Association
- belongs_to :user
- has_one :buyer

## buyers

|Column|Type|Options|
| user           |references | null: false,foreign_key: true|



### Association
- has_many :shipping_addresses
- belongs_to :user
- has_one :item

## shipping_addresses

|Column|Type|Options|
|postal_code |string|null: false|
|prefecture  |string|null: false|
|cities      |string|null: false|
|address     |string|null: false|
|building    |string|null: false|
|phone number|string|null: false|


### Association
- belongs_to :buyer