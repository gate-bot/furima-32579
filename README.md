## users テーブル

| Column             | Type       | Options                   |
| -----------------  | ---------- | ------------------------- |
| nickname           | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |
| last_name          | string     | null: false               |
| first_name         | string     | null: false               |
| last_name_kana     | string     | null: false               |
| first_name_kana    | string     | null: false               |
| birth_day          | date       | null: false               |


### Association

- has_many :items
- has_many :user_items


## items テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| product_name     | text       | null: false       |
| explanation      | text       | null: false       |
| category_id      | integer    | null: false       |
| state_id         | integer    | null: false       |
| bearer_id        | integer    | null: false       |
| prefecture_id    | integer    | null: false       |
| delivery_date_id | integer    | null: false       |
| price            | integer    | null: false       |
| user             | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :user_item


## addresses テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| municipality  | string     | null: false       |
| address_num   | string     | null: false       |
| building_name | string     |                   |
| phone_num     | string     | null: false       |
| user_item     | references | foreign_key: true |

### Association

- belongs_to :user_item


## user_items テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| user          | references | foreign_key: true |
| item          | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address