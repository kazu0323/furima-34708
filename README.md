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
| place           | integer | null: false |
|  day            | date | null: false |
|category_name_id | integer | null: false |
|freight_money_id | integer | null: false |
| states_id       | integer | null: false |
| area_id         | integer | null: false |
|  image          | Activstrage | null: false |
| user_id         | references | null: false,foreign_key: true |

### Association
has_one :purchases
has_one :informations
belongs_to :users

## informations

| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| postcode      | string | null: false |
| prefecture_id | text   | null: false |
| city          | string | null: false |
|  block        | string | null: false |
|   building    | string |             |
| tell_num      | string | null: false |
| Purchases_id  | references | null: false,foreign_key: true |

### Association
belongs_to :purchases

## Purchases

| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| user_id       | references | null: false,foreign_key: true |
| item_id       | references | null: false,foreign_key: true |

### Association
belongs_to :items
belongs_to :users
has_one :informations