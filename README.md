# README

## User

| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| email         | string | null: false |
| password      | string | null: false |
| name          | string | null: false |
| first_name    | string | null: false |
| last_name     | string | null: false |
|first_name_kana| string | null: false |
|last_name_kana | string | null: false |
| birth         | date   | null: false |

### Association
has_many :Item
has_many :information
has_many :Purchase


## Item

| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| item_name       | string | null: false |
| item_info       | text   | null: false |
| place           | string | null: false |
|  day            | date | null: false |
|category_name    | string | null: false |
|freight_money    | string | null: false |
| states_id       | string | null: false |
| area            | string | null: false |
|  image          | Activstrage | null: false |
| user_id         | references | null: false,foreign_key: true |

### Association
has_one :Purchase
has_one :information
belongs_to :User

## information

| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| postcode      | string | null: false |
| prefecture_id | text   | null: false |
| city          | string | null: false |
|  block        | string | null: false |
|   building    | string | null: false |
| item_id       | references | null: false,foreign_key: true |

### Association
belongs_to :Item

## Purchase

| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| user_id       | references | null: false,foreign_key: true |
| item_id       | references | null: false,foreign_key: true |

### Association
belongs_to :Item
belongs_to :User