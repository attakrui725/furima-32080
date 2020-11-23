# README
## users

|Column|Type|Options|
|nickname            |string|null: false|
|email               |string|null: false|
|encrypted_password  |string|null: false|
|last_name           |string|null: false|
|first_name          |string|null: false|
|birthday            |date  |null: false|
|last_name_kana      |string|null: false|
|first_name_kana     |string|null: false|

### Association
- has_many :items
- has_many :buyers

## items

|Column|Type|Options|
|name               |string     |null: false|
|description        |text       |null: false|
|category_id        |integer    |null: false|
|status_id          |integer    |null: false|
|delivery_fee_id    |integer    |null: false|
|shipment_source_id |integer    |null: false|
|day_to_ship_id     |integer    |null: false|
|price              |string     |null: false|
| user              |references | null: false,foreign_key: true|


### Association
- belongs_to :user
- has_one :buyer

## buyers

|Column          |Type       |Options|
| user           |references | null: false,foreign_key: true|
| item           |references | null: false,foreign_key: true|




### Association
- has_many :shipping_addresses
- belongs_to :user
- has_one :item

## shipping_addresses

|Column|Type|Options|
|postal_code_id |integer    |null: false|
|prefecture_id  |integer    |null: false|
|cities         |string     |null: false|
|address        |string     |null: false|
|building       |string     ||
|phone number   |string     |null: false|
|buyer          |references | null: false,foreign_key: true|



### Association
- belongs_to :buyer