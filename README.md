# README

## Users

| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| email         | string | null: false,unique: true |
| encrypted_password | string | null: false |
| name          | string | null: false |
| first_name    | string | null: false |
| last_name     | string | null: false |
|first_name_kana| string | null: false |
|last_name_kana | string | null: false |
| birth         | date   | null: false |

### Association
has_many :items
has_many :purchases


## Items

| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| item_name       | string | null: false |
| item_info       | text   | null: false |
| price           | integer | null: false |
|  day_id         | integer | null: false |
|category_name_id | integer | null: false |
|freight_money_id | integer | null: false |
| states_id       | integer | null: false |
| area_id         | integer | null: false |
| user            | references | null: false,foreign_key: true |

### Association
has_one :purchase
belongs_to :user

## informations

| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| postcode      | string | null: false |
| city          | string | null: false |
|  block        | string | null: false |
|   building    | string |             |
| tell_num      | string | null: false |
| area_id       | integer | null: false |
| purchases     | references | null: false,foreign_key: true |

### Association
belongs_to :purchase

## Purchases

| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| user          | references | null: false,foreign_key: true |
| item          | references | null: false,foreign_key: true |

### Association
belongs_to :item
belongs_to :user
has_one :information