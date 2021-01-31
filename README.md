# README

# テーブル設計

## users テーブル

| Column                        | Type    | Options     |
| ------------------------------| ------- | ----------- |
| name                          | string  | null: false |
| email                         | string  | null: false |
| encrypted_password            | string  | null: false |
| first_name                    | string  | null: false |
| last_name                     | string  | null: false |
| first_name_paseudnym_readeing | string  | null: false |
| last_name_paseudnym_readeing  | string  | null: false |
| birthday                      | date    | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column              | Type        | Options           |
| ------------------- | ----------- | ----------------- |
| name                | string      | null: false       |
| detail              | text        | null: false       |
| category_id         | integer     | null: false       |
| item_state_id       | integer     | null: false       |
| shipping_fee_id     | integer     | null: false       |
| prefecture_id       | integer     | null: false       |
| shipping_days_id    | integer     | null: false       |
| price               | integer     | null: false       |
| user                | references  | foreign_key: true |

### Association

- belongs_to :user
- has_one    :buyer

## orders テーブル

| Column   |  Type       | Options           |
| ---------| ----------- | ----------------- |
| user     | references  | foreign_key: true |
| item     | references  | foreign_key: true |


### Association


- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| postal_code     | string     | null: false       |
| prefecture_id   | integer    | null: false       |
| city            | string     | null: false       |
| city_number     | string     | null: false       |
| building_name   | string     |                   |
| phone_number    | string     | null: false       |
| order           | references | foreign_key: true |

### Association

- belongs_to :order





