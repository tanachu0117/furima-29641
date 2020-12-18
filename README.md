# README

# テーブル設計

## users テーブル

| Column                        | Type    | Options     |
| ------------------------------| ------- | ----------- |
| user_name                     | string  | null: false |
| email                         | string  | null: false |
| password                      | string  | null: false |
| password_confimaition         | string  | null: false |
| first_name                    | string  | null: false |
| last_name                     | string  | null: false |
| first_name_paseudnym_readeing | string  | null: false |
| last_name_paseudnym_readeing  | string  | null: false |
| birthday_year                 | integer | null: false |
| birthday_manth                | integer | null: false |
| birthday_day                  | integer | null: false |

### Association

- has_many :itms

## items テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| items_name    | string  | null: false |
| derail        | text    | null: false |
| category      | string  | null: false |
| state         | string  | null: false |
| shipping_fee  | integer | null: false |
| shipping_days | integer | null: false |
| price         | integer | null: false |

### Association

- belongs_to :users
- has_one :buyers

## buyers テーブル

| Column | Type       | Options          |
| ---------| ---------- | ------------|
| user_id  | references | null: false |


### Association

- belongs_to :items
- has_one :shipping_adress

## shipping_adress テーブル

| Column | Type       | Options          |
| --------------- | ------- | ------------|
| postal_code     | integer | null: false |
| prefecture      | string  | null: false |
| city            | string  | null: false |
| city_number     | string  | null: false |
| building_name   | string  | null: false |
| phone_number    | integer | null: false |

### Association

- belongs_to :buyers


