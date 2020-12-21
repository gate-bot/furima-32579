## users テーブル

| Column            | Type       | Options     |
| ----------------  | ---------- | ------------|
| nickname          | string     | null: false |
| email             | string     | null: false |
| password_password | string     | null: false |
| last_name         | string     | null: false |
| first_name        | string     | null: false |
| last_name_kana    | string     | null: false |
| first_name_kana   | string     | null: false |
| birth_day         | data       | null: false |


### Association

- has_many :items
- has_many :users_items


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
- has_one :users_items


## addresses テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | integer    | null: false       |
| prefecture_id | integer    | null: false       |
| municipality  | string     | null: false       |
| address_num   | string     | null: false       |
| building_name | string     | null: false       |
| phone_num     | integer    | null: false       |
| user          | references | foreign_key: true |
| prototype     | references | foreign_key: true |

### Association

- belongs_to :user_item


## user_items テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| user          | references | foreign_key: true |
| item          | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :items
